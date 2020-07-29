var sql = $.mysql_admin('stock', __dirname);
sql.setConfig($.config.mysql);
sql.open();

var table_name = "stock_market_";
var table_indexs = [0, 3, 6];
// 获取年份
var year = 2020;

/**
 * 新建模型
 * @param {Object} o 对象
 */
function model(o) {
	// datetime日期, 开盘价open, 当前价close, 最高价height, 最低价low, 成交量vol, 涨跌幅CHG
	// "20200701", 12.79, 12.83, 12.84, 12.74, 35241875, 0.23
	return {
		DATETIME: o[0],
		HIGH: o[3],
		LOW: o[4],
		OPEN: o[1],
		CLOSE: o[2],
		CHG: o[6],
		VOL: o[5],
		LCLOSE: o[7]
	}
}

/**
 * 获取行情
 * @param {String} code 代码
 * @param {String} date_start 开始日期
 */
async function get_market(code, date_start, db) {
	if (!date_start) {
		var time = new Date();
		date_start = time.addDays(-730);
	} else {
		date_start = new Date(date_start);
	}
	var codeH = code.indexOf('6') === 0 ? 0 : 1;

	var url = `http://img1.money.126.net/data/hs/kline/day/history/${year}/${codeH}${code}.json`;
	var hp = new $.Http();
	var res = await hp.get(url);
	var list = [];
	var body = res.body;
	if (body) {
		var json = body.toJson();
		var arr = json.data.reverse();
		var code = json.symbol;
		var list = [];
		var len = arr.length;
		for (var i = 0; i < len; i++) {
			var o = arr[i];
			o[0] = o[0].replace(/^(\d{4})(\d{2})(\d{2})$/, "$1-$2-$3");
			var t = o[0].toTime();
			if (t >= date_start) {
				if (i + 1 < len) {
					o.push(arr[i + 1][2]);
				}
				else {
					o.push(0);
				}
				list.push(o);
			} else {
				break;
			}
		}
		var lt = list.reverse();
		len = lt.length;
		for (var i = 0; i < len; i++) {
			var o = lt[i];
			var m = model(o);
			m.code = code;
			var bl = await db.add(m);
			if(!bl){
				db.set({code: m.code, DATETIME: o.DATETIME}, m);
			}
			// break;
		}
	}
}

/**
 * 获取股票代码
 * @param {Number} index 表索引
 * @return {Array} 返回股票代码
 */
async function get_stock_code(index) {
	var db = sql.db();
	db.table = "stock_info";
	var codes = await db.getSql("`code` LIKE '" + index + "%'", "`create_time` DESC", "code");
	var table = table_name + index;
	db.table = table;
	var list = await db.run("SELECT `code`,MAX(`DATETIME`) date FROM `" + table + "` GROUP BY `code`;");
	for (var i = 0; i < codes.length; i++) {
		var code = codes[i].code;
		var obj = list.getObj({
			code
		});
		if (obj) {
			codes[i].date = obj.date;
		}
	}
	return codes;
}

/**
 * 添加数据
 * @param {Array} list 列表
 * @param {String} table 表
 */
async function add(list, table) {
	var db = sql.db();
	db.table = table;
	await db.addList(list, false);
}

async function run_sub(index) {
	var table = table_name + index;
	var arr = await get_stock_code(index);
	var len = arr.length;
	var time_1 = Date.now();
	console.log(table + "股票共计" + len + "个");
	var db = sql.db();
	db.table = table;
	for (var i = 0; i < len; i++) {
		var o = arr[i];
		await get_market(o.code, o.date, db);
	}
	var time_2 = Date.now();
	var s = (time_2 - time_1) / 1000;
	console.log(table + "抓取完成, 共耗时" + s + "s");
}

async function run() {
	for (var n = 0; n < table_indexs.length; n++) {
		var index = table_indexs[n];
		run_sub(index);
	}
}

module.exports = {
	get_stock_code,
	get_market,
	run
};

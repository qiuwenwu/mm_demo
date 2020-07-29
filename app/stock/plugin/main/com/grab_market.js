var sql = $.mysql_admin('stock', __dirname);
sql.setConfig($.config.mysql);
sql.open();

/**
 * 接口主函数
 * @return {Object} 执行结果
 */
async function run() {
	var db_info = sql.db();
	var lists = [];
	db_info.table = "stock_info";
	db_info.size = 24;
	for (var i = 1; i < i + 1; i++) {
		db_info.page = i;
		var lt = db_info.getSql("`code` like '0%' || '3%' || '6%'", "", "code");
		if (lt.length > 0) {
			var codes = lt.map((o) => {
				var code = o.code;
				if (/(0|3)\d{5}/.test(code)) {
					code = "sz" + code;
				} else if (/(6)\d{5}/.test(code)) {
					code = "sh" + code;
				}
				return code;
			})
			var url = "http://hq.sinajs.cn/list=" + codes.join(",");
			var http = new $.Http();
			var ret = await http.get(url);
			var arr = ret.body.match(/".*"/g);
			var n = 0;
			var ar = arr.map((o) => {
				var list = o.replace(/"/g, "").split(',');
				var CHG = Math.ceil((list[3] - list[2]) / list[2] * 100000) / 100;
				var obj = {
					code: codes[n].replace(/[a-z]+/, ""), //股票代码
					DATETIME: list[30], //交易日期：
					HIGH: list[4], //最高价：
					LOW: list[5], //最低价：
					OPEN: list[1], //开盘价：
					CLOSE: list[3], //收盘价：
					LCLOSE: list[2], //上个收盘价：
					CHG: CHG, //涨跌幅：
					TOTAL: list[9], //总成交额：
					VOL: list[8] //成交量
				};
				n++;
				return obj;
			});
			lists.push(...ar);
		} else {
			break;
		}
	}
	var shares = {
		"0": [],
		"3": [],
		"6": []
	};
	lists.map((n) => {
		if (/0\d{5}/.test(n.code)) {
			shares["0"].push(n);
		} else if (/3\d{5}/.test(n.code)) {
			shares["3"].push(n);
		} else if (/6\d{5}/.test(n.code)) {
			shares["6"].push(n);
		}
	})
	for (var k in shares) {
		var db = sql.db();
		db.table = "stock_market_" + k;
		for (var i = 0; i < shares[k].length; i++) {
			var share = shares[k][i];
			db.add(share);
		}
	}
	return "添加成功";
};

exports.run = run;

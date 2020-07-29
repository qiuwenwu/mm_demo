const Maths = require("mm_maths");

var sql = $.mysql_admin('stock', __dirname);
sql.setConfig($.config.mysql);
sql.open();

/**
 * 股票分析类
 * @class
 */
class Stock {
	/**
	 * 构造函数
	 * @param {Object} config, 配置参数
	 */
	constructor(config) {
		var maths = new Maths();
		maths.update(null, "stock");

		this.maths = maths;

		this.list = [];
	}
}
var vm = {
	// 最高价
	H: "HIGH",
	// 最低价
	L: "LOW",
	// 开盘价
	O: "OPEN",
	// 收盘价
	C: "CLOSE",
	// 昨日收盘价
	LC: "LCLOSE",
	// 成交量
	V: "VOL",
	// 涨跌幅
	CHG: "CHG",
	// 日期
	DATE: "DATE",
	// 时间
	TIME: "TIME",
	// 日期和时间
	DATETIME: "DATETIME"
};

/**
 * 设置常量
 * @param {Array} arr 股票数据数组
 * @param {Object} vm 视图模型用户取数据
 */
Stock.prototype.set_const = function(arr) {
	// 最高价
	var H = [];
	// 最低价
	var L = [];
	// 开盘价
	var O = [];
	// 收盘价
	var C = [];
	// 成交量
	var V = [];
	// 涨跌幅
	var CHG = [];
	// 日期
	var DATE = [];
	// 时间
	var TIME = [];
	// 日期和时间
	var DATETIME = [];

	arr.map(function(o) {
		H.push(Number(o[vm.H]));
		L.push(Number(o[vm.L]));
		O.push(Number(o[vm.O]));
		C.push(Number(o[vm.C]));
		V.push(Number(o[vm.V]));
		CHG.push(Number(o[vm.CHG]));
		var dt = o[vm.DATETIME];
		var dateTime;
		if (typeof(dt) == 'number') {
			dateTime = new Date(dt * 1000);
		} else if (/[0-9]+/.test(dt)) {
			dateTime = new Date(Number(dt) * 1000);
		} else {
			dateTime = dt.toTime();
		}
		DATETIME.push(dateTime.toStr('yyyy-MM-dd hh:mm:ss'));
		DATE.push(dateTime.toStr('yyyy-MM-dd'));
		TIME.push(dateTime.toStr('hh:mm:ss'));
	});

	this.maths.const = {
		H: H,
		HIGH: H,
		L: L,
		LOW: L,
		O: O,
		OPEN: O,
		C: C,
		CLOSE: C,
		V: V,
		VOL: V,
		CHG: CHG,
		DATETIME: DATETIME
	};
};

/**
 * 过滤结果
 * @param {Object} ret 结果对象
 * @return {Object} 返回最终结果
 */
Stock.prototype.filter = function(ret) {
	if (ret.tip) {
		var tip = " " + ret.tip + " ";
		var score = ret.score;
		var lt = this.list;
		var len = lt.length;
		for (var i = 0; i < len; i++) {
			var o = lt[i];
			if (o.filter) {
				var arr = o.filter.split(' ');
				var count = arr.length;
				if (tip.indexOf(" " + o.name + " ") !== -1) {
					for (var n = 0; n < count; n++) {
						var name = arr[n];
						var key = " " + name + " ";
						if (tip.indexOf(key) !== -1) {
							tip = tip.replace(key, " ");
							score -= lt.getVal('score', {
								name: name
							});
						}
					}
				}
			}
		}
		ret.tip = tip.trim();
		ret.score = score;
	}
	return ret;
};

Stock.prototype.action = function(o){
	var score = o.score;
	var weight_1 = o.weight_1;
	var weight_4 = o.weight_4;
	var weight_7 = o.weight_7;
	if(weight_1 > 3 && weight_4 > 3){
		o.action_day = '买'
	}
	else if(weight_1 < -3 && weight_4 > 3){
		o.action_day = '卖'
	}
	else {
		o.action_day = '留'
	}
	
	if(weight_4 > 3 && weight_7 > 3){
		o.action_week = '买'
	}
	else if(weight_4 < -3 && weight_7 < -3){
		o.action_week = '卖'
	}
	else {
		o.action_week = '留'
	}
	
	if(o.action_day > '买' && o.action_week == '买'){
		o.action = '买'
	}
	else if(o.action_day > '卖' && o.action_week == '卖'){
		o.action = '卖'
	}
	else {
		if(score > 2){
			o.action = '买'
		}
		else if(score < -2){
			o.action = '卖'
		}
		else {
			o.action = '留'
		}
	}
}

/**
 * 执行股票分析
 * @param {Array} arr 股票数据数组
 * @param {Object} vm 视图模型用户取数据
 * @return {Object} 返回分析结果
 */
Stock.prototype.run_sub = function(code, arr) {
	var datetime = arr[arr.length - 1].DATETIME;
	var obj = {
		code: code, //股票代码：[0,16]
		datetime: datetime, //当日时间：指股票当天
		score: 0, //人工得分：
		weight_1: 0, //1日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。负5分以上大跌，负3-4分看跌，负1-2分看淡，0分未知，1-2分看好，3-4分看涨，5分以上大涨
		weight_4: 0, //4日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。
		weight_7: 0, //7日权重：[-99,99]由各技术分析累加获得，正分看涨，负分看跌。
		extent_1: 0, //1日涨跌：[-100,100]取当日所有涨跌之和的平均值
		extent_4: 0, //4日涨跌：[-100,100]取第4日所有涨跌之和的平均值
		extent_7: 0, //7日涨跌：[-100,100]取第7日所有涨跌之和的平均值
		action_day: "", //做T建议：[0,16]买、卖、留
		action_week: "", //长线建议：[0,16]买、卖、留
		action: "", //综合建议：[0,16]买、卖、留
		tip: "", //分析提示：[0,255]技术分析，公式的名称集合
		predict: "" //预言：[0,255]告知今日、近日和后市发展情况
	}
	this.set_const(arr);
	var lt = this.list;
	var len = lt.length;
	for (var i = 0; i < len; i++) {
		var o = lt[i];
		if (o.express) {
			try {
				var bl = this.maths.run_code(o.express);
				if (bl) {
					obj.tip += " " + o.name;
					obj.score += o.score;
					obj.weight_1 += o.weight_1;
					obj.weight_4 += o.weight_4;
					obj.weight_7 += o.weight_7;
					obj.extent_1 = obj.extent_1 / 2 + o.extent_1 / 2;
					obj.extent_4 = obj.extent_4 / 2 + o.extent_4 / 2;
					obj.extent_7 = obj.extent_7 / 2 + o.extent_7 / 2;
				}
			} catch (e) {
				console.log(e);
			}
		}
	}
	obj.extent_1 = Math.ceil(obj.extent_1 * 100) / 100;
	obj.extent_4 = Math.ceil(obj.extent_4 * 100) / 100;
	obj.extent_7 = Math.ceil(obj.extent_7 * 100) / 100;
	
	this.action(obj);
	return obj;
};

	
/**
 * 循环执行
 * @return {Array} 返回执行结果集合
 */
Stock.prototype.run = function(arr, func) {
	var code = arr[0].code;
	if (func) {
		for (var i = 59; i < arr.length; i++) {
			if (arr[i].ok === 1) {
				var ret = this.run_sub(code, arr.slice(0, i + 1));
				func(this.filter(ret));
			}
		}
	} else {
		var rets = [];
		for (var i = 59; i < arr.length; i++) {
			if (arr[i].ok === 1) {
				var ret = this.run_sub(code, arr.slice(0, i + 1));
				rets.push(this.filter(ret));
			}
		}
		return rets;
	}
};


/**
 * 接口主函数
 * @return {Object} 执行结果
 */
async function run() {
	var flist = await get_formula();
	var stock = new Stock();
	stock.list = flist;
	var k = [0, 3, 6];
	for (var i = 0; i < k.length; i++) {
		run_sub(k[i], stock);
		// break;
	}
};

/**
 * @param {Object} db 数据管理器,如: { next: async function{}, ret: {} }
 */
async function get_formula() {
	var db = sql.db();
	db.table = "stock_formula"; // 选择表
	var flist = db.getSql("", "",
		"`score`,`weight_1`,`weight_4`,`weight_7`,`extent_1`,`extent_4`,`extent_7`,`name`,`filter`,`express`"); // 获取公式
	return flist;
}

async function run_sub(k, stock) {
	var db = sql.db();
	var list = await get_info(k, db);
	var ret = [];
	db.table = "stock_market_" + k;
	// db.table = "stock_market_0";
	for (var i = 0; i < list.length; i++) {
		var code = list[i].code;
		var market = await get_market(k, code);
		// var market = await get_market(0, '002750');
		
		if (market.length > 59) {
			console.log(code);
			stock.run(market, (o) => {
				o.ok = 2;
				o.datetime = o.datetime.toStr('yyyy-MM-dd');
				db.set({
					code: o.code,
					DATETIME: o.datetime
				}, o);
			});
		}
		// break;
	}
}

/**
 * @param {Object} n 分表标识, 如: "0","3","6"
 * @return {Array} 返回查询结果
 */
async function get_market(n, code) {
	var db = sql.db();
	db.table = "stock_market_" + n; // 选择表
	var arr = await db.get({
		code
	}, "`DATETIME` DESC", "`code`,`DATETIME`,`HIGH`,`LOW`,`OPEN`,`CLOSE`,`LCLOSE`,`CHG`,`TOTAL`,`VOL`,`ok`"); // 获取股票
	return arr;
}

/**
 * 获取股票信息
 * @param {Number} n 代码code前缀
 * @return {Array} 返回查询结果
 */
async function get_info(n) {
	var db = sql.db();
	db.table = "stock_info";
	var arr = await db.getSql("`code` like '" + n + "%';", "", "`code`");
	return arr;
}

module.exports = {
	run_sub,
	get_market,
	run
}

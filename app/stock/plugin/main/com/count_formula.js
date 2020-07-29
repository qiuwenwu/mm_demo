var sql = $.mysql_admin('stock', __dirname);
sql.setConfig($.config.mysql);
sql.open();

var ks = [0, 3, 6];


/**
 * 1. 重置统计结果
 */
async function reset_count() {
	var db = sql.db();
	db.table = "stock_formula";
	var sql_str = db.toSetSql(null, {
		weight_1: 0,
		weight_4: 0,
		weight_7: 0,
		extent_1: 0,
		extent_4: 0,
		extent_7: 0,
		num_up_1: 0,
		num_up_4: 0,
		num_up_7: 0,
		num_down_1: 0,
		num_down_4: 0,
		num_down_7: 0
	});
	await db.exec(sql_str.replace('WHERE ;', ';'));
}

/**
 * 2. 获取股票公式
 * @return {Array} 返回公式列表
 */
async function get_formula() {
	var db = sql.db();
	db.table = "stock_formula";
	var list = await db.getSql("", "",
		"`formula_id`,`score`,`extent_1`,`extent_4`,`extent_7`,`num_up_1`,`num_up_4`,`num_up_7`,`num_down_1`,`num_down_4`,`num_down_7`,`name`,`weight_1`,`weight_4`,`weight_7`"
	);
	return list.map((o)=> {
		o.extent_up_1 = 0;
		o.extent_up_4 = 0;
		o.extent_up_7 = 0;
		o.extent_down_1 = 0;
		o.extent_down_4 = 0;
		o.extent_down_7 = 0;
		return o;
	});
}

/**
 * 3. 获取股票代码
 * @param {Number} 分表标识
 * @return {Array} 返回股票代码集合
 */
async function get_stock(k) {
	var db = sql.db();
	var list = await db.run("SELECT `code` FROM `stock_market_" + k + "` GROUP BY `code`;");
	return list;
}

/**
 * 4. 获取股票行情
 * @param {Number} 分表标识
 * @param {String} code 股票代码
 * @return {Array} 返回行情
 */
async function get_market(k, code) {
	var db = sql.db();
	db.table = "stock_market_" + k;
	var list = await db.get({
		code
	}, "`DATETIME` ASC", "`code`,`datetime`,`lclose`,`tip`");
	return list;
}

/**
 * 5. 统计公式
 * @param {Array} fma 公式集合
 * @param {Array} lt 个股行情
 * @param {Object} n 当前日行情索引
 */
async function count(fma, lt, n) {
	var o = lt[n];
	if (o.tip) {
		var arr_tip = o.tip.split(' ');
		var c0 = o.lclose;
		// 后1日收盘价
		var c1 = lt[n + 1].lclose;
		// 后4日收盘价
		var c4 = lt[n + 4].lclose;
		// 后7日收盘价
		var c7 = lt[n + 7].lclose;

		var up1 = c1 > c0 ? 1 : 0;
		var up4 = c4 > c0 ? 1 : 0;
		var up7 = c7 > c0 ? 1 : 0;
		var down1 = c1 < c0 ? 1 : 0;
		var down4 = c4 < c0 ? 1 : 0;
		var down7 = c7 < c0 ? 1 : 0;

		var ext_1 = (c1 - c0) / c0;
		var ext_4 = (c4 - c0) / c0;
		var ext_7 = (c7 - c0) / c0;
		for (var i = 0; i < fma.length; i++) {
			var o = fma[i];
			var name = o.name;
			if (arr_tip.indexOf(name) !== -1) {
				o.extent_up_1 = up1 ? o.extent_up_1 / 2 + ext_1 / 2 : o.extent_up_1;
				o.extent_up_4 = up4 ? o.extent_up_4 / 2 + ext_4 / 2 : o.extent_up_4;
				o.extent_up_7 = up7 ? o.extent_up_7 / 2 + ext_7 / 2 : o.extent_up_7;
				o.extent_down_1 = down1 ? o.extent_down_1 / 2 + ext_1 / 2 : o.extent_down_1;
				o.extent_down_4 = down4 ? o.extent_down_4 / 2 + ext_4 / 2 : o.extent_down_4;
				o.extent_down_7 = down7 ? o.extent_down_7 / 2 + ext_7 / 2 : o.extent_down_7;
				o.num_up_1 += up1;
				o.num_up_4 += up4;
				o.num_up_7 += up7;
				o.num_down_1 += down1;
				o.num_down_4 += down4;
				o.num_down_7 += down7;
			}
		}
		// console.log(fma);
	}
};

/**
 * 6. 提交公式统计结果
 * @return {Array} 返回
 */
async function set_formula(list) {
	var db = sql.db();
	db.table = "stock_formula";
	for (var i = 0; i < list.length; i++) {
		var o = list[i];
		o.weight_1 = Math.ceil((o.num_up_1 - o.num_down_1) / (o.num_up_1 + o.num_down_1) * 10);
		o.weight_4 = Math.ceil((o.num_up_4 - o.num_down_4) / (o.num_up_4 + o.num_down_4) * 10);
		o.weight_7 = Math.ceil((o.num_up_7 - o.num_down_7) / (o.num_up_7 + o.num_down_7) * 10);
		
		o.extent_1 = o.weight_1 > 0 ? Math.ceil(o.extent_up_1 * 10000) / 100 : Math.ceil(o.extent_down_1 * 10000) / 100;
		o.extent_4 = o.weight_4 > 0 ? Math.ceil(o.extent_up_4 * 10000) / 100 : Math.ceil(o.extent_down_4 * 10000) / 100;
		o.extent_7 = o.weight_7 > 0 ? Math.ceil(o.extent_up_7 * 10000) / 100 : Math.ceil(o.extent_down_7 * 10000) / 100;

		delete o.extent_up_1;
		delete o.extent_up_4;
		delete o.extent_up_7;
		delete o.extent_down_1;
		delete o.extent_down_4;
		delete o.extent_down_7;
		db.set({
			formula_id: o.formula_id
		}, o);
	}
}


/**
 * 运行统计（子函数）
 * @param {Array} fma 公式集合
 * @param {String} k 分表标识
 */
async function run_sub(fma, k) {
	// 3. 获取股票代码
	var list = await get_stock(k);
	for (var i = 0; i < list.length; i++) {
		// 4. 获取股票行情
		var lt = await get_market(k, list[i].code);
		for (var n = 0; n < lt.length - 7; n++) {
			// 5. 统计公式
			await count(fma, lt, n);
		}
	}
}


/**
 * 运行统计
 */
async function run() {
	// 1. 重置统计结果
	await reset_count();
	// 2. 获取股票公式
	var fma = await get_formula();
	for (var i = 0; i < ks.length; i++) {
		await run_sub(fma, ks[i]);
	}
	// 6. 提交统计结果
	await set_formula(fma);
}

module.exports = {
	get_formula,
	get_stock,
	get_market,
	run
};

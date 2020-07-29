const com = require('../../com/count_formula.js');

async function main() {
	$.log.info('计算股票技术分析准确率');
	var t1 = Date.now();
	await com.run();
	var t2 = Date.now();
	var s = Math.ceil((t2 - t1) / 100000) * 100;
	$.log.info('更新技术分析', '总耗时:' + s + '秒');
};

// main();

/**
 * @description 定时任务函数
 */
exports.main = main;
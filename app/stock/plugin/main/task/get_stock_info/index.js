const com = require('../../com/get_info.js');

async function main() {
	$.log.info('更新股票信息');
	// var t1 = Date.now();
	await com.run();
	// var t2 = Date.now();
	// var s = Math.ceil((t2 - t1) / 100000) * 100;
	// $.log.info('更新股票信息', '总耗时:' + s + '秒');
};

// main();

/**
 * @description 定时任务函数
 */
exports.main = main;
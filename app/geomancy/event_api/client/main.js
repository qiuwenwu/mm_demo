var api = $.api_admin('geomancy_client', '风水客户端');
// 首次启动更新api接口;
api.update('geomancy');

var sql = $.mysql_admin('sys', __dirname);
sql.setConfig($.config.mysql);
sql.open();

/**
 * @description 接口主函数
 * @param {Object} ctx HTTP上下文
 * @param {Object} db 数据管理器,如: { next: async function{}, ret: {} }
 * @return {Object} 执行结果
 */
async function main(ctx, db) {
	$.push(db, sql.db(), true);
	return api.run(ctx, db);
};
exports.main = main;
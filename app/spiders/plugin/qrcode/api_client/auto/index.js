const fs = require("fs");
const path = require("path");
var config = {
	"host": "http://www.jinnianduoda.com",
	"path": "/group/",
	"pager": ".page",
	"list": ".listPerson p",
	"img": ".shiftcode .p1",
	"title": ".article_intro .f16",
	"name": ".article_author_name .f16",
	"wechat": ".article_author_name em",
	"indstry": ".article_other_info",
	"indstry_index": 0,
	"area": ".article_other_info",
	"area_index": 1,
	"time":".article_other_info",
	"time_index":2,
	"tag": ".article_other_info",
	"tag_index":3,
	"page_index": 2,
	"save_way": "db",
	"save_dir": "./",
	"keywords": "微商|创业|兼职|股票|职业|人脉|交友|优惠|家政|租房|二手|营销|推广|编程|设计|开发|策划|货币|区块链"
};

/**
 * 接口主函数
 * @param {Object} ctx HTTP上下文
 * @param {Object} db 数据管理器,如: { next: async function{}, ret: {} }
 * @return {Object} 执行结果
 */
async function main(ctx, db) {
	// 获取请求参数
	var req = ctx.request;
	var q = req.query;
	
	var pm = null;
	var cg = q['config'];
	if(cg){
		var list = './config.json'.fullname(__dirname).loadJson();
		if(!list){
			list = [];
		}
		for(var i = 0; i < list.length; i++){
			var o = list[i];
			if(cg == o.config)
			{
				// console.log('入了');
				pm = o;
				break;
			}
		}
		if(!pm)
		{
			/// 请求参数拼接
			pm = Object.assign({}, config, q);
			list.add(pm);
			'./config.json'.fullname(__dirname).saveText($.toJson(list));
		}
	}
	else {
		/// 请求参数拼接
		pm = Object.assign({}, config, q);
	}
	
	pm.keys = pm.keywords.split("|");
	// console.log(pm);
	db.table = "spiders_qrcode";
	nav(pm.host + pm.path, pm, db);

	/// 抓取网站内容
	return "hello world" + JSON.stringify(q);
};

async function get_url(pm, arr, db) {
	for (var i = 0; i < arr.length; i++) {
		var href = arr[i].href;
		var http = new $.Http();
		http.get(pm.host + href).then(async (res) => {
			if (res.body) {
				var jq = new $.Html(res.body);
				var title = jq(pm.title).eq(0).text();
				var wechat = jq(pm.wechat).eq(0).text();
				var indstry = jq(pm.indstry).eq(pm.indstry_index).text().replace('行业：', '');
				var area = jq(pm.area).eq(pm.area_index).text().replace('地区：', '');
				var tag = jq(pm.tag).eq(pm.tag_index).text().replace('标签：', '');
				var time = jq(pm.time).eq(pm.time_index).text().replace('时间：', '');
				
				// console.log(title);
				pm.keys.map(async (o) => {
					var dir = "./img/" + o;
					dir.addDir();
					pm.dir = dir + "/" + pm.host.between(".", ".")
					if (title.indexOf(o) !== -1) {
						var url_img = jq(pm.img + " img").eq(0).attr("src");
						// console.log(url_img);
						var path = pm.dir + "_" + /\/\w+\.\w+$/.exec(url_img)[0].replace("/","");
						
						var file = await http.download(url_img, path);
						db.addOrSet({file},{
							title,
							file,
							keyword: o,
							indstry,
							area,
							tag,
							time
						});
						// console.log(bl,db.error);
					}
				})
			}
		});
	}
}

async function nav(host, pm, db) {
	var http = new $.Http();
	var res = await http.get(host);
	if (res.body) {
		// './test.Html'.saveText(res.body)
		var jq = new $.Html(res.body);
		var list_a = jq(pm.list + " a");
		get_url(pm, list_a, db);
		var a = jq(pm.pager + " a").eq(pm.page_index);
		if (a) {
			console.log(pm.host + a.attr("href"));
			nav(pm.host + a.attr("href"), pm, Object.assign({}, db));
		} 
	}
}

exports.main = main;
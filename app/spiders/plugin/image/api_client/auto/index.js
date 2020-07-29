const fs = require("fs");
const path = require("path");
var config = {
	"host": "https://90tu.com",
	"path": "/xingganmeinv/",
	"pager": ".page1",
	"pager_index": -2,
	"list": ".all_lanmu",
	"img": ".spanlr",
	"img_page": ".page1",
	"img_index": -2,
	"name": ".content h1",
	"save_way": "db",
	"save_dir": "./",
	"keywords": "美女|裸露"
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
	if (cg) {
		var list = './config.json'.fullname(__dirname).loadJson();
		if (!list) {
			list = [];
		}
		for (var i = 0; i < list.length; i++) {
			var o = list[i];
			if (cg == o.config) {
				// console.log('入了');
				pm = o;
				break;
			}
		}
		if (!pm) {
			/// 请求参数拼接
			pm = Object.assign({}, config, q);
			list.add(pm);
			'./config.json'.fullname(__dirname).saveText($.toJson(list));
		}
	} else {
		/// 请求参数拼接
		pm = Object.assign({}, config, q);
	}

	pm.keys = pm.keywords.split("|");
	// console.log(pm);
	db.table = "spiders_image";
	nav(pm.host + pm.path, pm, db);

	/// 抓取网站内容
	return "hello world" + JSON.stringify(q);
};

async function get_url(pm, arr, db) {
	for (var i = 0; i < arr.length; i++) {
		var href = arr[i].href;
		download(pm.host + href, db, pm);
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
		var a = jq(pm.pager + " a").eq(pm.pager_index);
		if (a) {
			// console.log(pm.host + a.attr("href"));
			$.sleep(2000);
			nav(pm.host + a.attr("href"), pm, Object.assign({}, db));
		}
	}
}

function download(href, db, pm) {
	var http = new $.Http();
	http.get(href).then(async (res) => {
		if (res.body) {
			var jq = new $.Html(res.body);
			var name = jq(pm.name).eq(0).text();
			var a = jq(pm.img_page + " a").eq(pm.img_index);
			if (a) {
				download(pm.host + a.attr("href"), db, pm);
			}
			// './img.html'.saveText(res.body);
			pm.keys.map(async (o) => {
				if (name.indexOf(o) !== -1) {
					var dir = "/img/" + o + "/";
					dir = dir.replace("//", "/");
					if (name) {
						name = name.replace(/\[\d*\/\d*\]/, "");
						dir += name + "/";
					}
					dir = dir.fullname();
					await dir.addDir();
					var url_img = jq(pm.img + " img").eq(0).attr("src");
					if (url_img) {
						var path = dir + /\/\w+\.\w+$/.exec(url_img)[0].replace("/", "");
						console.log(path, url_img);
						var hp = new $.Http();
						var file = await hp.download(url_img, path);
						db.addOrSet({
							file
						}, {
							name,
							file,
							keyword: o
						});
					}
					// console.log(bl,db.error);
				}
			})
		}
	});
}

exports.main = main;

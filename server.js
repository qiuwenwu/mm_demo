const MM = require('mm_os');

// 修改程序运行目录
$.runPath = __dirname.fullname();
// console.log($.runPath);
var env = process.NODE_ENV || 'local';
var config_path = `./config/${env}.json`;
var config = config_path.loadJson();
var app = new MM(config);

// 临时缓存结果
var ret_cache;

// 添加请求前事件
app.before('/te*', async (ctx, db) => {
	if (ret_cache) {
		body = ret_cache;
		ret_cache = null;
		return body;
	}
});

// 添加请求后事件
app.after('/te*', async (ctx, db) => {
	if (db.ret) {
		ret_cache = db.ret;
	}
});

// 添加Get请求
app.get('/te*', async (ctx, db) => {
	var qy = ctx.request.query;
	console.log(qy);
	return "te";
});

// 添加Post请求
app.post('/te*', async (ctx, db) => {
	var qy = ctx.request.query;
	var by = ctx.request.body;
	console.log(qy, by);
	return "te";
});

var i = 0;

// 添加Get请求
app.get('/test', async (ctx, db) => {
	i++;
	ctx.body = "test" + i;
	// ctx.redirect("https://www.baidu.com");
});


app.get('/ws/tt', async (ctx, db) => {
	ctx.body = "子函数";
});


app.use(async (ctx, next) => {
	// await next();
	if (!ctx.body && ctx.path.has('/t*')) {
		ctx.body = "Hello World!";
	} else {
		next();
	}
});
// console.log($.toJson(app.routes, true));
// console.log($.toJson(app.events, true));
app.run();

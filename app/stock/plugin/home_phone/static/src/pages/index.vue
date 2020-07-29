<template>
	<main id="stock_analyse">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow">
						<h5>股票分析</h5>
					</header>
					<mm_body style="padding: 1.5rem 1rem 0;">
						<mm_group class="mb pb">
							<button :class="{active: db == '0'}" @click="set_db('0');">深证</button>
							<button :class="{active: db == '6'}" @click="set_db('6');">上证</button>
							<button :class="{active: db == '3'}" @click="set_db('3');">创业板</button>
						</mm_group>
						<mm_form>
							<h5><span>筛选条件</span></h5>
							<dl class="mn">
								<dt><span>关键词</span></dt>
								<dd>
									<mm_input v-model="query.keyword" desc="股票名称 / 股票代码" @blur="search()" />
								</dd>
								<dt><span>技术分析</span></dt>
								<dd>
									<mm_select v-model="query.tip" :options="list_formula" @change="search()" />
									<mm_select v-model="query.tip_2" :options="list_formula" @change="search()" />
								</dd>
								<dt><span>综合操作</span></dt>
								<dd>
									<mm_select v-model="query.action" :options="list_action" @change="search()" />
								</dd>
								<!-- 	<dt><span>日期</span></dt>
								<dd>
									<mm_time type="date" v-model="query.DATETIME" desc="日期" @change.native="search()" />
								</dd> -->
							</dl>
						</mm_form>

						<div v-for="(o, idx) in list" :key="idx" :class="{ active: select == idx }" @click="selected(idx)" class="mt bb ptb">
							<div>
								<h5>
									{{ get_name(list_stock, o.code, 'code', 'name') }}
									<span>( {{ o.code }} )</span>
									<span class="time fr font_grey">{{ $to_time(o.DATETIME, 'yyyy-MM-dd') }}</span> </h5>
							</div>
							<div class="ptb">
								<span class="font_default">技术分析：</span>
								<span>{{ o.tip }}</span>
								<span class="font_grey" v-if="!o.tip">（无）</span>
							</div>
							<div class="mm_grid font_default">
								<div class="mm_col_33">
									<div>
										<span>综合:</span>
										<strong :class="{ font_default: o.action == '留', font_red: o.action == '卖', font_green: o.action == '买' }">{{ o.action }}</strong>

									</div>
								</div>
								<div class="mm_col_33">
									<div>
										<span>做T:</span>
										<strong :class="{ font_default: o.action_day == '留', font_red: o.action_day == '卖', font_green: o.action_day == '买' }">{{ o.action_day }}</strong>
										<small v-if="o.action_day != '留'">({{ o.extent_4 }})</small>
									</div>
								</div>
								<div class="mm_col_33">
									<div>
										<span>波段:</span>
										<strong :class="{ font_default: o.action_week == '留', font_red: o.action_week == '卖', font_green: o.action_week == '买' }">{{ o.action_week }}</strong>
										<small v-if="o.action_week != '留'">({{ o.extent_7 }})</small>
									</div>
								</div>
							</div>
							<div></div>
							<div class="mm_group mtb">
								<button type="button" class="mm_btn btn_primary-x" @click="nav(o.code)">
									<i class="fa fa-file"></i>
									<span class="bg_no bn">详情</span>
								</button>
								<button type="button" class="mm_btn btn_danger-x" @click="collect_stock(o)">
									<i class="fa" :class="{ 'fa-star': has(o), 'fa-star-o': !has(o) }"></i>
									<span class="bg_no bn">{{ has(o) ? '取消收藏' : '收藏' }}</span>
								</button>
							</div>
						</div>
					</mm_body>
					<footer>
						<mm_grid class="mm_data_count">
							<mm_col width="100" style="min-width: initial;">
								<mm_pager display="1" v-model="query.page" :count="count / query.size" :func="goTo"></mm_pager>
							</mm_col>
							<mm_col width="100">
								<div class="right plr">
									<mm_select class="fl" v-model="query.size" :options="$to_size()" @change="search()" />
									<span>当前</span>
									<input class="pager_now" v-model.number="page_now" @blur="goTo(page_now)" @change="page_change" />
									<span>/{{ page_count }}页</span>
								</div>
							</mm_col>
						</mm_grid>
					</footer>
				</mm_view>
			</mm_col>
		</mm_grid>
		<mm_modal v-model="show" mask="true" :display="'default'">
			<mm_view class="card ma" style="max-height: calc(100vh - 2rem); overflow-y: auto;">
				<header class="center"><span>收藏</span></header>
				<div v-for="(o, idx) in list_collect" :key="idx" :class="{ active: select == idx }" @click="selected(idx)" class="mt bb pa"
				 v-show="list_collect.length">
					<div>
						<h5>
							{{ get_name(list_stock, o.code, 'code', 'name') }}
							<span>( {{ o.code }} )</span>
							<span class="time fr font_grey">{{ $to_time(o.DATETIME, 'yyyy-MM-dd') }}</span>
						</h5>
					</div>
					<div class="ptb">
						<span class="font_default">技术分析：</span>
						<span>{{ o.tip }}</span>
						<span class="font_grey" v-if="!o.tip">（无）</span>
					</div>
					<div class="mm_grid font_default">
						<div class="mm_col_33">
							<div>
								<span>综合:</span>
								<strong :class="{ font_blue: o.action == '留', font_red: o.action == '卖', font_green: o.action == '买' }">{{ o.action }}</strong>
							</div>
						</div>
						<div class="mm_col_33">
							<div>
								<span>做T:</span>
								<strong :class="{ font_blue: o.action_day == '留', font_red: o.action_day == '卖', font_green: o.action_day == '买' }">{{ o.action_day }}</strong>
								<small v-if="o.action_day != '留'">({{ o.extent_4 }})</small>
							</div>
						</div>
						<div class="mm_col_33">
							<div>
								<span>长线:</span>
								<strong :class="{ font_blue: o.action_week == '留', font_red: o.action_week == '卖', font_green: o.action_week == '买' }">{{ o.action_week }}</strong>
								<small v-if="o.action_week != '留'">({{ o.extent_7 }})</small>
							</div>
						</div>
					</div>
					<div></div>
					<div class="mm_group mtb">
						<button type="button" class="mm_btn btn_primary-x" @click="nav(o.code)">
							<i class="fa fa-file"></i>
							<span class="bg_no bn">详情</span>
						</button>
						<button type="button" class="mm_btn btn_danger-x" @click="collect_stock(o)">
							<i class="fa" :class="{ 'fa-star': has(o), 'fa-star-o': !has(o) }"></i>
							<span class="bg_no bn">{{ has(o) ? '取消收藏' : '收藏' }}</span>
						</button>
					</div>
				</div>
				<div v-show="list_collect.length == 0" class="center ma pa"><span>没有收藏任何股票</span></div>
				<mm_foot>
					<button class="mm_btn btn_default" style="width: 100%;" @click="show = false">关闭</button>
				</mm_foot>
			</mm_view>
		</mm_modal>
		<div class="float">
			<button type="button" class="mm_btn btn_default" @click="toTop()"><i class="fa fa-chevron-up"></i></button>
			<button type="button" class="mm_btn btn_default" @click="show = !show"><i class="fa fa-star"></i></button>
		</div>
		<mm_loading v-show="loading > 0 && loading < 100" style="position: fixed;left: 50%; top:50%; transform: translate(-50%, -50%); background: rgba(0,0,0,0.35); padding: .5rem; color: #fff;border-radius: .5rem;"></mm_loading>
	</main>
</template>

<script>
	import mixin from '/src/mixins/page.js';

	export default {
		mixins: [mixin],
		data() {
			return {
				db: "0",
				show: false,
				// 列表请求地址
				url_get_list: '/api/stock/market_0',
				url_del: '/api/stock/market_0?method=del&',
				url_set: '/api/stock/market_0?method=set&',
				field: 'code',
				query_set: {
					code: ''
				},
				// 查询条件
				query: {
					//页码
					page: 1,
					//页面大小
					size: 10,
					// 当日时间——开始时间
					DATETIME_min: '',
					// 当日时间——结束时间
					DATETIME_max: '',
					// 人工得分——最小值
					score_min: 0,
					// 人工得分——最大值
					score_max: 0,
					// 1日权重——最小值
					weight_1_min: 0,
					// 1日权重——最大值
					weight_1_max: 0,
					// 4日权重——最小值
					weight_4_min: 0,
					// 4日权重——最大值
					weight_4_max: 0,
					// 7日权重——最小值
					weight_7_min: 0,
					// 7日权重——最大值
					weight_7_max: 0,
					// 1日涨跌——最小值
					extent_1_min: 0,
					// 1日涨跌——最大值
					extent_1_max: 0,
					// 4日涨跌——最小值
					extent_4_min: 0,
					// 4日涨跌——最大值
					extent_4_max: 0,
					// 7日涨跌——最小值
					extent_7_min: 0,
					// 7日涨跌——最大值
					extent_7_max: 0,
					// 创建时间——开始时间
					create_time_min: '',
					// 创建时间——结束时间
					create_time_max: '',
					// 更新时间——开始时间
					update_time_min: '',
					// 更新时间——结束时间
					update_time_max: '',
					//排序
					orderby: '`datetime` desc',
					keyword: '',
					tip_2: ''
				},
				form: {},
				list_stock: [],
				list_collect: [],
				list_formula: [],
				list_action: [{
					name: "",
					value: ""
				}, {
					name: "买",
					value: "买"
				}, {
					name: "卖",
					value: "卖"
				}, {
					name: "留",
					value: "留"
				}],
				//颜色
				arr_color: ['', '', 'font_yellow', 'font_success', 'font_warning', 'font_primary', 'font_info', 'font_default'],
				// 视图模型
				vm: {}
			};
		},
		methods: {
			nav(code) {
				var codeH = code.indexOf('6') === 0 ? 1 : 0;
				window.open("https://wap.eastmoney.com/quote/stock/" + codeH + "." + code + ".html", "_blank");
			},
			toTop() {
				$('body').scrollTop(0);
			},
			get_list_before(param) {
				var pm = Object.assign({}, param);
				delete pm.db;
				return pm;
			},
			set_db(db) {
				this.db = db;
				this.url_get_list = this.url_get_list.replace(/market_[0-9]/, 'market_' + this.db);
				this.url_del = this.url_del.replace(/market_[0-9]/, 'market_' + this.db);
				this.url_set = this.url_set.replace(/market_[0-9]/, 'market_' + this.db);
				this.reset();
				this.search();
			},
			get_stock(query) {
				var _this = this;
				if (!query) {
					query = {
						field: 'code,name'
					};
				}
				this.$get('~/api/stock/info?size=0&', query, function(json) {
					if (json.result) {
						_this.list_stock.clear();
						_this.list_stock.addList(json.result.list);
					}
				});
			},
			get_formula(query) {
				var _this = this;
				if (!query) {
					query = {
						field: 'name'
					};
				}
				this.$get('~/api/stock/formula?size=0&', query, function(json) {
					if (json.result) {
						_this.list_formula = json.result.list.map(function(o) {
							return {
								name: o.name,
								value: o.name
							}
						});
						_this.list_formula.unshift({
							name: '',
							value: ''
						});
					}
				});
			},
			collect_stock(o) {
				var arr = this.list_collect;
				if (arr.getObj(o)) {
					arr.del(o);
				} else {
					arr.push(o);
				}
				$.db.set('collect_stock', arr, 60 * 24 * 30);
			},
			has(o) {
				var arr = this.list_collect;
				var bl = arr.getObj(o);
				return bl;
			}
		},
		created() {
			this.get_stock();
			var arr = $.db.get('collect_stock');
			if (!arr) {
				arr = [];
			}
			this.list_collect = arr;

			this.get_formula();
		}
	};
</script>

<style>
	.float {
		position: fixed;
		bottom: 3rem;
		right: 1rem;
		z-index: 2;
		opacity: 0.5;
		width: 2rem;
	}

	.float button {
		height: 2rem;
		width: 2rem;
		padding: 0;
		text-align: center;
		border-radius: 50%;
		margin-top: .5rem;
	}

	.mm_group .active {
		color: #38f;
	}

	main .mm_col>*,
	main [class*=mm_col_]>* {
		margin-left: 0;
		margin-right: 0;
	}
</style>

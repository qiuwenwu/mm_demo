<template>
	<main id="stock_market">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow">
						<h5>股票行情</h5>
					</header>
					<mm_body>
						<mm_form class="mm_filter">
							<h5><span>筛选条件</span></h5>
							<mm_list col="3">
								<mm_col>
									<mm_select v-model="query.ok" title="阶段" :options="$to_kv(list_, 'ok', 'name')"
									 @change="search()" />
								</mm_col>
								<mm_col>
									<mm_btn class="btn_primary-x" type="reset" @click.native="reset();search()">重置</mm_btn>
								</mm_col>
							</mm_list>
						</mm_form>
						<div class="mm_action">
							<h5><span>操作</span></h5>
							<div class="">
								<mm_btn class="btn_primary-x" url="./market_form">添加</mm_btn>
								<mm_btn @click.native="show = true" class="btn_primary-x" v-bind:class="{ 'disabled': !selects }">批量修改</mm_btn>
							</div>
						</div>
						<mm_table type="2">
							<thead>
								<tr>
									<th scope="col" class="th_selected"><input type="checkbox" :checked="select_state" @click="select_all()" /></th>
									<th scope="col" class="th_id"><span>#</span></th>
									<th scope="col">
										<mm_reverse title="交易日期" v-model="query.orderby" field="DATETIME" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="最高价" v-model="query.orderby" field="HIGH" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="最低价" v-model="query.orderby" field="LOW" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="开盘价" v-model="query.orderby" field="OPEN" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="收盘价" v-model="query.orderby" field="CLOSE" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="上个收盘价" v-model="query.orderby" field="LCLOSE" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="涨跌幅" v-model="query.orderby" field="CHG" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="总成交额" v-model="query.orderby" field="TOTAL" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="成交量" v-model="query.orderby" field="VOL" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="人工得分" v-model="query.orderby" field="score" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="1日权重" v-model="query.orderby" field="weight_1" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="4日权重" v-model="query.orderby" field="weight_4" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="7日权重" v-model="query.orderby" field="weight_7" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="1日涨跌" v-model="query.orderby" field="extent_1" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="4日涨跌" v-model="query.orderby" field="extent_4" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="7日涨跌" v-model="query.orderby" field="extent_7" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="做T建议" v-model="query.orderby" field="action_day" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="长线建议" v-model="query.orderby" field="action_week" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="综合建议" v-model="query.orderby" field="action" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="分析提示" v-model="query.orderby" field="tip" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="预言" v-model="query.orderby" field="predict" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="阶段" v-model="query.orderby" field="ok" :func="search"></mm_reverse>
									</th>
									<th scope="col" class="th_handle"><span>操作</span></th>
								</tr>
							</thead>
							<draggable v-model="list" tag="tbody" @change="sort_change">
								<tr v-for="(o, idx) in list" :key="idx" :class="{'active': select == idx}" @click="selected(idx)">
									<th scope="row"><input type="checkbox" :checked="select_has(o[field])" @click="select_change(o[field])" /></th>
									<td>
										<span>{{ o.code }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.DATETIME, 'yyyy-MM-dd') }}</span>
									</td>
									<td>
										<span>{{ o.HIGH }}</span>
									</td>
									<td>
										<span>{{ o.LOW }}</span>
									</td>
									<td>
										<span>{{ o.OPEN }}</span>
									</td>
									<td>
										<span>{{ o.CLOSE }}</span>
									</td>
									<td>
										<span>{{ o.LCLOSE }}</span>
									</td>
									<td>
										<span>{{ o.CHG }}</span>
									</td>
									<td>
										<span>{{ o.TOTAL }}</span>
									</td>
									<td>
										<span>{{ o.VOL }}</span>
									</td>
									<td>
										<span>{{ o.score }}</span>
									</td>
									<td>
										<span>{{ o.weight_1 }}</span>
									</td>
									<td>
										<span>{{ o.weight_4 }}</span>
									</td>
									<td>
										<span>{{ o.weight_7 }}</span>
									</td>
									<td>
										<span>{{ o.extent_1 }}</span>
									</td>
									<td>
										<span>{{ o.extent_4 }}</span>
									</td>
									<td>
										<span>{{ o.extent_7 }}</span>
									</td>
									<td>
										<span>{{ o.action_day }}</span>
									</td>
									<td>
										<span>{{ o.action_week }}</span>
									</td>
									<td>
										<span>{{ o.action }}</span>
									</td>
									<td>
										<span>{{ o.tip }}</span>
									</td>
									<td>
										<span>{{ o.predict }}</span>
									</td>
									<td>
										<span>{{ get_name(list_, o.ok, 'ok', 'name') }}</span>
									</td>
									<td>
										<mm_btn class="btn_primary" :url="'./market_form?code=' + o[field]">修改</mm_btn>
										<mm_btn class="btn_warning" @click.native="del_show(o, field)">删除</mm_btn>
									</td>
								</tr>
							</draggable>
						</mm_table>
					</mm_body>
					<footer>
						<mm_grid class="mm_data_count">
							<mm_col>
								<mm_select v-model="query.size" :options="$to_size()" @change="search()" />
							</mm_col>
							<mm_col width="50" style="min-width: 22.5rem;">
								<mm_pager display="2" v-model="query.page" :count="count / query.size" :func="goTo" :icons="['首页', '上一页', '下一页', '尾页']"></mm_pager>
							</mm_col>
							<mm_col>
								<div class="right plr">
									<span class="mr">共 {{ count }} 条</span>
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
		<mm_modal v-model="show" mask="true">
			<mm_view class="card bg_no">
				<header class="bg_white">
					<h5>批量修改</h5>
				</header>
				<mm_body>
					<dl>
						<dt>阶段</dt>
						<dd>
							<mm_select v-model="form.ok" :options="$to_kv(list_, 'ok', 'name')" />
						</dd>
					</dl>
				</mm_body>
				<footer>
					<div class="mm_group">
						<button class="btn_default" type="reset" @click="show = false">取消</button>
						<button class="btn_primary" type="button" @click="batchSet()">提交</button>
					</div>
				</footer>
			</mm_view>
		</mm_modal>
	</main>
</template>

<script>
	import mixin from '/src/mixins/page.js';

	export default {
		mixins: [mixin],
		data() {
			return {
				// 列表请求地址
				url_get_list: "/apis/stock/market",
				url_del: "/apis/stock/market?method=del&",
				url_set: "/apis/stock/market?method=set&",
				field: "code",
				query_set: {
					"code": ""
				},
				// 查询条件
				query: {
					//页码
					page: 1,
					//页面大小
					size: 10,
					// 交易日期——开始时间
					'DATETIME_min': '',
					// 交易日期——结束时间
					'DATETIME_max': '',
					// 最高价——最小值
					'HIGH_min': 0,
					// 最高价——最大值
					'HIGH_max': 0,
					// 最低价——最小值
					'LOW_min': 0,
					// 最低价——最大值
					'LOW_max': 0,
					// 开盘价——最小值
					'OPEN_min': 0,
					// 开盘价——最大值
					'OPEN_max': 0,
					// 收盘价——最小值
					'CLOSE_min': 0,
					// 收盘价——最大值
					'CLOSE_max': 0,
					// 上个收盘价——最小值
					'LCLOSE_min': 0,
					// 上个收盘价——最大值
					'LCLOSE_max': 0,
					// 涨跌幅——最小值
					'CHG_min': 0,
					// 涨跌幅——最大值
					'CHG_max': 0,
					// 总成交额——最小值
					'TOTAL_min': 0,
					// 总成交额——最大值
					'TOTAL_max': 0,
					// 成交量——最小值
					'VOL_min': 0,
					// 成交量——最大值
					'VOL_max': 0,
					// 人工得分——最小值
					'score_min': 0,
					// 人工得分——最大值
					'score_max': 0,
					// 1日权重——最小值
					'weight_1_min': 0,
					// 1日权重——最大值
					'weight_1_max': 0,
					// 4日权重——最小值
					'weight_4_min': 0,
					// 4日权重——最大值
					'weight_4_max': 0,
					// 7日权重——最小值
					'weight_7_min': 0,
					// 7日权重——最大值
					'weight_7_max': 0,
					// 1日涨跌——最小值
					'extent_1_min': 0,
					// 1日涨跌——最大值
					'extent_1_max': 0,
					// 4日涨跌——最小值
					'extent_4_min': 0,
					// 4日涨跌——最大值
					'extent_4_max': 0,
					// 7日涨跌——最小值
					'extent_7_min': 0,
					// 7日涨跌——最大值
					'extent_7_max': 0,
					// 阶段——最小值
					'ok_min': '',
					// 阶段——最大值
					'ok_max': '',
					//排序
					orderby: ""
				},
				form: {},
				//颜色
				arr_color: ['', '', 'font_yellow', 'font_success', 'font_warning', 'font_primary', 'font_info', 'font_default'],
				// 阶段
				'list_': [ ],
				// 视图模型
				vm: {}
			}
		},
		methods: {
			/**
			 * 获取阶段
			 * @param {query} 查询条件
			 */
			get_(query) {
				var _this = this;
				if (!query) {
					query = {
						field: "ok,name"
					};
				}
				this.$get('~/apis/1已抓取，2已分析，3已计算?size=0', query, function(json) {
					if (json.result) {
						_this.list_ .clear();
						_this.list_ .addList(json.result.list)
					}
				});
			},
		},
		created() {
			// 获取阶段
			this.get_();
		}
	}
</script>

<style>
</style>

<template>
	<main id="stock_info">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow">
						<h5>股票信息</h5>
					</header>
					<mm_body>
						<mm_form class="mm_filter">
							<h5><span>筛选条件</span></h5>
							<mm_list col="3">
								<mm_col>
									<mm_input v-model="query.keyword" title="关键词" desc="股票名称 / 股票简介" @blur="search()" />
								</mm_col>
								<mm_col>
									<mm_btn class="btn_primary-x" type="reset" @click.native="reset();search()">重置</mm_btn>
								</mm_col>
							</mm_list>
						</mm_form>
						<div class="mm_action">
							<h5><span>操作</span></h5>
							<div class="">
								<mm_btn class="btn_primary-x" url="./info_form">添加</mm_btn>
								<mm_btn @click.native="show = true" class="btn_primary-x" v-bind:class="{ 'disabled': !selects }">批量修改</mm_btn>
							</div>
						</div>
						<mm_table type="2">
							<thead>
								<tr>
									<th scope="col" class="th_selected"><input type="checkbox" :checked="select_state" @click="select_all()" /></th>
									<th scope="col" class="th_id"><span>#</span></th>
									<th scope="col">
										<mm_reverse title="股票名称" v-model="query.orderby" field="name" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="公司名称" v-model="query.orderby" field="company" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="股票简介" v-model="query.orderby" field="description" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="分红频率" v-model="query.orderby" field="bonus" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="发行价格" v-model="query.orderby" field="issue_price" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="市盈率" v-model="query.orderby" field="pe" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="市净率" v-model="query.orderby" field="pb" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="公司利润" v-model="query.orderby" field="profit" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="发行量" v-model="query.orderby" field="num" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="上市时间" v-model="query.orderby" field="time_to_market" :func="search"></mm_reverse>
									</th>
									<th scope="col" class="th_handle"><span>操作</span></th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(o, idx) in list" :key="idx" :class="{'active': select == idx}" @click="selected(idx)">
									<th scope="row"><input type="checkbox" :checked="select_has(o[field])" @click="select_change(o[field])" /></th>
									<td>
										<span>{{ o.code }}</span>
									</td>
									<td>
										<span>{{ o.name }}</span>
									</td>
									<td>
										<span>{{ o.company }}</span>
									</td>
									<td>
										<span>{{ o.description }}</span>
									</td>
									<td>
										<span>{{ o.bonus }}</span>
									</td>
									<td>
										<span>{{ o.issue_price }}</span>
									</td>
									<td>
										<span>{{ o.pe }}</span>
									</td>
									<td>
										<span>{{ o.pb }}</span>
									</td>
									<td>
										<span>{{ o.profit }}</span>
									</td>
									<td>
										<span>{{ o.num }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.time_to_market, 'yyyy-MM-dd') }}</span>
									</td>
									<td>
										<mm_btn class="btn_primary" :url="'./info_form?code=' + o[field]">修改</mm_btn>
										<mm_btn class="btn_warning" @click.native="del_show(o, field)">删除</mm_btn>
									</td>
								</tr>
							</tbody>
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
				url_get_list: "/apis/stock/info",
				url_del: "/apis/stock/info?method=del&",
				url_set: "/apis/stock/info?method=set&",
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
					// 股票名称
					'name': '',
					// 股票简介
					'description': '',
					// 分红频率——最小值
					'bonus_min': 0,
					// 分红频率——最大值
					'bonus_max': 0,
					// 发行价格——最小值
					'issue_price_min': 0,
					// 发行价格——最大值
					'issue_price_max': 0,
					// 市盈率——最小值
					'pe_min': 0,
					// 市盈率——最大值
					'pe_max': 0,
					// 市净率——最小值
					'pb_min': 0,
					// 市净率——最大值
					'pb_max': 0,
					// 公司利润——最小值
					'profit_min': 0,
					// 公司利润——最大值
					'profit_max': 0,
					// 发行量——最小值
					'num_min': 0,
					// 发行量——最大值
					'num_max': 0,
					// 上市时间——开始时间
					'time_to_market_min': '',
					// 上市时间——结束时间
					'time_to_market_max': '',
					// 关键词
					'keyword': '',
					//排序
					orderby: ""
				},
				form: {},
				//颜色
				arr_color: ['', '', 'font_yellow', 'font_success', 'font_warning', 'font_primary', 'font_info', 'font_default'],
				// 视图模型
				vm: {}
			}
		},
		methods: {
		},
		created() {
		}
	}
</script>

<style>
</style>

<template>
	<main id="stock_formula">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow">
						<h5>股票公式</h5>
					</header>
					<mm_body>
						<mm_form class="mm_filter">
							<h5><span>筛选条件</span></h5>
							<mm_list col="3">
								<mm_col>
									<mm_input v-model="query.keyword" title="关键词" desc="公式名称 / 公式简介"
									 @blur="search()" />
								</mm_col>
								<mm_col>
									<mm_btn class="btn_primary-x" type="reset" @click.native="reset();search()">重置</mm_btn>
								</mm_col>
							</mm_list>
						</mm_form>
						<div class="mm_action">
							<h5><span>操作</span></h5>
							<div class="">
								<mm_btn class="btn_primary-x" url="./formula_form">添加</mm_btn>
								<mm_btn @click.native="show = true" class="btn_primary-x" v-bind:class="{ 'disabled': !selects }">批量修改</mm_btn>
							</div>
						</div>
						<mm_table type="2">
							<thead>
								<tr>
									<th scope="col" class="th_selected"><input type="checkbox" :checked="select_state" @click="select_all()" /></th>
									<th scope="col" class="th_id"><span>#</span></th>
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
										<mm_reverse title="1日涨跌幅度" v-model="query.orderby" field="extent_1" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="4日涨跌幅度" v-model="query.orderby" field="extent_4" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="7日涨跌幅度" v-model="query.orderby" field="extent_7" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="1日上涨数" v-model="query.orderby" field="num_up_1" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="4日上涨数" v-model="query.orderby" field="num_up_4" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="7日上涨数" v-model="query.orderby" field="num_up_7" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="1日下跌数" v-model="query.orderby" field="num_down_1" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="4日下跌数" v-model="query.orderby" field="num_down_4" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="7日下跌数" v-model="query.orderby" field="num_down_7" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="创建时间" v-model="query.orderby" field="create_time" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="更新时间" v-model="query.orderby" field="update_time" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="公式名称" v-model="query.orderby" field="name" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="过滤" v-model="query.orderby" field="filter" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="公式简介" v-model="query.orderby" field="description" :func="search"></mm_reverse>
									</th>
									<th scope="col" class="th_handle"><span>操作</span></th>
								</tr>
							</thead>
							<draggable v-model="list" tag="tbody" @change="sort_change">
								<tr v-for="(o, idx) in list" :key="idx" :class="{'active': select == idx}" @click="selected(idx)">
									<th scope="row"><input type="checkbox" :checked="select_has(o[field])" @click="select_change(o[field])" /></th>
									<td>
										<span>{{ o.formula_id }}</span>
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
										<span>{{ o.num_up_1 }}</span>
									</td>
									<td>
										<span>{{ o.num_up_4 }}</span>
									</td>
									<td>
										<span>{{ o.num_up_7 }}</span>
									</td>
									<td>
										<span>{{ o.num_down_1 }}</span>
									</td>
									<td>
										<span>{{ o.num_down_4 }}</span>
									</td>
									<td>
										<span>{{ o.num_down_7 }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.create_time, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.update_time, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ o.name }}</span>
									</td>
									<td>
										<span>{{ o.filter }}</span>
									</td>
									<td>
										<span>{{ o.description }}</span>
									</td>
									<td>
										<mm_btn class="btn_primary" :url="'./formula_form?formula_id=' + o[field]">修改</mm_btn>
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
				url_get_list: "/apis/stock/formula",
				url_del: "/apis/stock/formula?method=del&",
				url_set: "/apis/stock/formula?method=set&",
				field: "formula_id",
				query_set: {
					"formula_id": ""
				},
				// 查询条件
				query: {
					//页码
					page: 1,
					//页面大小
					size: 10,
					// 公式ID
					'formula_id': 0,
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
					// 1日涨跌幅度——最小值
					'extent_1_min': 0,
					// 1日涨跌幅度——最大值
					'extent_1_max': 0,
					// 4日涨跌幅度——最小值
					'extent_4_min': 0,
					// 4日涨跌幅度——最大值
					'extent_4_max': 0,
					// 7日涨跌幅度——最小值
					'extent_7_min': 0,
					// 7日涨跌幅度——最大值
					'extent_7_max': 0,
					// 1日上涨数——最小值
					'num_up_1_min': 0,
					// 1日上涨数——最大值
					'num_up_1_max': 0,
					// 4日上涨数——最小值
					'num_up_4_min': 0,
					// 4日上涨数——最大值
					'num_up_4_max': 0,
					// 7日上涨数——最小值
					'num_up_7_min': 0,
					// 7日上涨数——最大值
					'num_up_7_max': 0,
					// 1日下跌数——最小值
					'num_down_1_min': 0,
					// 1日下跌数——最大值
					'num_down_1_max': 0,
					// 4日下跌数——最小值
					'num_down_4_min': 0,
					// 4日下跌数——最大值
					'num_down_4_max': 0,
					// 7日下跌数——最小值
					'num_down_7_min': 0,
					// 7日下跌数——最大值
					'num_down_7_max': 0,
					// 创建时间——开始时间
					'create_time_min': '',
					// 创建时间——结束时间
					'create_time_max': '',
					// 更新时间——开始时间
					'update_time_min': '',
					// 更新时间——结束时间
					'update_time_max': '',
					// 公式名称
					'name': '',
					// 公式简介
					'description': '',
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

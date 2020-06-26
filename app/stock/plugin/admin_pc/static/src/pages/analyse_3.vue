<template>
	<main id="stock_analyse_3">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow">
						<h5>创业板股票分析</h5>
					</header>
					<mm_body>
						<mm_form class="mm_filter">
							<h5><span>筛选条件</span></h5>
							<mm_list col="3">
								<mm_col>
									<mm_btn class="btn_primary-x" type="reset" @click.native="reset();search()">重置</mm_btn>
								</mm_col>
							</mm_list>
						</mm_form>
						<div class="mm_action">
							<h5><span>操作</span></h5>
							<div class="">
								<mm_btn class="btn_primary-x" url="./analyse_3_form">添加</mm_btn>
								<mm_btn @click.native="show = true" class="btn_primary-x" v-bind:class="{ 'disabled': !selects }">批量修改</mm_btn>
							</div>
						</div>
						<mm_table type="2">
							<thead>
								<tr>
									<th scope="col" class="th_selected"><input type="checkbox" :checked="select_state" @click="select_all()" /></th>
									<th scope="col" class="th_id"><span>#</span></th>
									<th scope="col">
										<mm_reverse title="当日时间" v-model="query.orderby" field="datetime" :func="search"></mm_reverse>
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
										<mm_reverse title="创建时间" v-model="query.orderby" field="create_time" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="更新时间" v-model="query.orderby" field="update_time" :func="search"></mm_reverse>
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
										<span>{{ $to_time(o.datetime, 'yyyy-MM-dd hh:mm') }}</span>
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
										<span>{{ $to_time(o.create_time, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.update_time, 'yyyy-MM-dd hh:mm') }}</span>
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
										<mm_btn class="btn_primary" :url="'./analyse_3_form?code=' + o[field]">修改</mm_btn>
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
				url_get_list: "/apis/stock/analyse_3",
				url_del: "/apis/stock/analyse_3?method=del&",
				url_set: "/apis/stock/analyse_3?method=set&",
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
					// 当日时间——开始时间
					'datetime_min': '',
					// 当日时间——结束时间
					'datetime_max': '',
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
					// 创建时间——开始时间
					'create_time_min': '',
					// 创建时间——结束时间
					'create_time_max': '',
					// 更新时间——开始时间
					'update_time_min': '',
					// 更新时间——结束时间
					'update_time_max': '',
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

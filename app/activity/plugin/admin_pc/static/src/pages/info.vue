<template>
	<main id="activity_info">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow">
						<h5>活动信息</h5>
					</header>
					<mm_body>
						<mm_form class="mm_filter">
							<h5><span>筛选条件</span></h5>
							<mm_list col="3">
								<mm_col>
									<mm_input v-model="query.keyword" title="关键词" desc="活动名称 / 活动标题 / 活动详情"
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
										<mm_reverse title="活动周期数" v-model="query.orderby" field="period_num" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="活动周期单位" v-model="query.orderby" field="period_unit" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="一等奖" v-model="query.orderby" field="prize_1" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="二等奖" v-model="query.orderby" field="prize_2" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="三等奖" v-model="query.orderby" field="prize_3" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="特等奖" v-model="query.orderby" field="prize_t" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="参与人数" v-model="query.orderby" field="num_people" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="中奖人数" v-model="query.orderby" field="num_winner" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="创建时间" v-model="query.orderby" field="time_create" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="更新时间" v-model="query.orderby" field="time_update" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="开始时间" v-model="query.orderby" field="time_start" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="结束时间" v-model="query.orderby" field="time_end" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="活动名称" v-model="query.orderby" field="name" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="活动类型" v-model="query.orderby" field="type" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="创建者uin" v-model="query.orderby" field="uin_creator" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="活动标题" v-model="query.orderby" field="title" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="活动描述" v-model="query.orderby" field="descrtption" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="申请次数统计" v-model="query.orderby" field="num_applicant" :func="search"></mm_reverse>
									</th>
									<th scope="col" class="th_handle"><span>操作</span></th>
								</tr>
							</thead>
							<draggable v-model="list" tag="tbody" @change="sort_change">
								<tr v-for="(o, idx) in list" :key="idx" :class="{'active': select == idx}" @click="selected(idx)">
									<th scope="row"><input type="checkbox" :checked="select_has(o[field])" @click="select_change(o[field])" /></th>
									<td>
										<span>{{ o.activity_id }}</span>
									</td>
									<td>
										<span>{{ o.period_num }}</span>
									</td>
									<td>
										<span>{{ o.period_unit }}</span>
									</td>
									<td>
										<span>{{ o.prize_1 }}</span>
									</td>
									<td>
										<span>{{ o.prize_2 }}</span>
									</td>
									<td>
										<span>{{ o.prize_3 }}</span>
									</td>
									<td>
										<span>{{ o.prize_t }}</span>
									</td>
									<td>
										<span>{{ o.num_people }}</span>
									</td>
									<td>
										<span>{{ o.num_winner }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.time_create, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.time_update, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.time_start, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.time_end, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ o.name }}</span>
									</td>
									<td>
										<span>{{ o.type }}</span>
									</td>
									<td>
										<span>{{ o.uin_creator }}</span>
									</td>
									<td>
										<span>{{ o.title }}</span>
									</td>
									<td>
										<span>{{ o.descrtption }}</span>
									</td>
									<td>
										<span>{{ o.num_applicant }}</span>
									</td>
									<td>
										<mm_btn class="btn_primary" :url="'./info_form?activity_id=' + o[field]">修改</mm_btn>
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
				url_get_list: "/apis/activity/info",
				url_del: "/apis/activity/info?method=del&",
				url_set: "/apis/activity/info?method=set&",
				field: "activity_id",
				query_set: {
					"activity_id": ""
				},
				// 查询条件
				query: {
					//页码
					page: 1,
					//页面大小
					size: 10,
					// 活动ID
					'activity_id': 0,
					// 活动周期数——最小值
					'period_num_min': 0,
					// 活动周期数——最大值
					'period_num_max': 0,
					// 活动周期单位——最小值
					'period_unit_min': 0,
					// 活动周期单位——最大值
					'period_unit_max': 0,
					// 一等奖——最小值
					'prize_1_min': 0,
					// 一等奖——最大值
					'prize_1_max': 0,
					// 二等奖——最小值
					'prize_2_min': 0,
					// 二等奖——最大值
					'prize_2_max': 0,
					// 三等奖——最小值
					'prize_3_min': 0,
					// 三等奖——最大值
					'prize_3_max': 0,
					// 特等奖——最小值
					'prize_t_min': 0,
					// 特等奖——最大值
					'prize_t_max': 0,
					// 参与人数——最小值
					'num_people_min': 0,
					// 参与人数——最大值
					'num_people_max': 0,
					// 中奖人数——最小值
					'num_winner_min': 0,
					// 中奖人数——最大值
					'num_winner_max': 0,
					// 创建时间——开始时间
					'time_create_min': '',
					// 创建时间——结束时间
					'time_create_max': '',
					// 更新时间——开始时间
					'time_update_min': '',
					// 更新时间——结束时间
					'time_update_max': '',
					// 开始时间——开始时间
					'time_start_min': '',
					// 开始时间——结束时间
					'time_start_max': '',
					// 结束时间——开始时间
					'time_end_min': '',
					// 结束时间——结束时间
					'time_end_max': '',
					// 活动名称
					'name': '',
					// 活动标题
					'title': '',
					// 活动详情
					'content': '',
					// 申请次数统计——最小值
					'num_applicant_min': 0,
					// 申请次数统计——最大值
					'num_applicant_max': 0,
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

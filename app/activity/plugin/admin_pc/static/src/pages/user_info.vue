<template>
	<main id="activity_user_info">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow">
						<h5>参与者信息</h5>
					</header>
					<mm_body>
						<mm_form class="mm_filter">
							<h5><span>筛选条件</span></h5>
							<mm_list col="3">
								<mm_col>
									<mm_input v-model="query.keyword" title="关键词" desc="参与人姓名 / 紧急联系人姓名"
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
								<mm_btn class="btn_primary-x" url="./user_info_form">添加</mm_btn>
								<mm_btn @click.native="show = true" class="btn_primary-x" v-bind:class="{ 'disabled': !selects }">批量修改</mm_btn>
							</div>
						</div>
						<mm_table type="2">
							<thead>
								<tr>
									<th scope="col" class="th_selected"><input type="checkbox" :checked="select_state" @click="select_all()" /></th>
									<th scope="col" class="th_id"><span>#</span></th>
									<th scope="col">
										<mm_reverse title="用户验证状态" v-model="query.orderby" field="state" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="手机号码" v-model="query.orderby" field="phone" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="紧急联系人号码" v-model="query.orderby" field="liaison_phone" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="参与人姓名" v-model="query.orderby" field="name" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="身份证号" v-model="query.orderby" field="idcard" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="紧急联系人姓名" v-model="query.orderby" field="liaison_name" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="用户唯一标识" v-model="query.orderby" field="uin_user" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="审核人uin" v-model="query.orderby" field="uin_checker" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="所在位置" v-model="query.orderby" field="location" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="详细地址" v-model="query.orderby" field="address" :func="search"></mm_reverse>
									</th>
									<th scope="col" class="th_handle"><span>操作</span></th>
								</tr>
							</thead>
							<draggable v-model="list" tag="tbody" @change="sort_change">
								<tr v-for="(o, idx) in list" :key="idx" :class="{'active': select == idx}" @click="selected(idx)">
									<th scope="row"><input type="checkbox" :checked="select_has(o[field])" @click="select_change(o[field])" /></th>
									<td>
										<span>{{ o.info_id }}</span>
									</td>
									<td>
										<span>{{ o.state }}</span>
									</td>
									<td>
										<span>{{ o.phone }}</span>
									</td>
									<td>
										<span>{{ o.liaison_phone }}</span>
									</td>
									<td>
										<span>{{ o.name }}</span>
									</td>
									<td>
										<span>{{ o.idcard }}</span>
									</td>
									<td>
										<span>{{ o.liaison_name }}</span>
									</td>
									<td>
										<span>{{ o.uin_user }}</span>
									</td>
									<td>
										<span>{{ o.uin_checker }}</span>
									</td>
									<td>
										<span>{{ o.location }}</span>
									</td>
									<td>
										<span>{{ o.address }}</span>
									</td>
									<td>
										<mm_btn class="btn_primary" :url="'./user_info_form?info_id=' + o[field]">修改</mm_btn>
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
				url_get_list: "/apis/activity/user_info",
				url_del: "/apis/activity/user_info?method=del&",
				url_set: "/apis/activity/user_info?method=set&",
				field: "info_id",
				query_set: {
					"info_id": ""
				},
				// 查询条件
				query: {
					//页码
					page: 1,
					//页面大小
					size: 10,
					// 表单ID
					'info_id': 0,
					// 用户验证状态——最小值
					'state_min': 0,
					// 用户验证状态——最大值
					'state_max': 0,
					// 参与人姓名
					'name': '',
					// 紧急联系人姓名
					'liaison_name': '',
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

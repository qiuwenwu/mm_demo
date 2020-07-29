<template>
	<main id="spiders_qrcode">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow">
						<h5>抓取二维码</h5>
					</header>
					<mm_body>
						<mm_form class="mm_filter">
							<h5><span>筛选条件</span></h5>
							<mm_list col="3">
								<mm_col>
									<mm_input v-model="query.keyword" title="关键词" desc=""
									 @blur="search()" />
								</mm_col>
								<mm_col>
									<mm_input v-model="query.keyword" title="关键词" desc="标签 / 标题"
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
								<mm_btn class="btn_primary-x" url="./qrcode_form">添加</mm_btn>
								<mm_btn @click.native="show = true" class="btn_primary-x" v-bind:class="{ 'disabled': !selects }">批量修改</mm_btn>
							</div>
						</div>
						<mm_table type="2">
							<thead>
								<tr>
									<th scope="col" class="th_selected"><input type="checkbox" :checked="select_state" @click="select_all()" /></th>
									<th scope="col" class="th_id"><span>#</span></th>
									<th scope="col">
										<mm_reverse title="关键词" v-model="query.orderby" field="keyword" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="行业" v-model="query.orderby" field="indstry" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="地区" v-model="query.orderby" field="area" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="标签" v-model="query.orderby" field="tag" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="发布时间" v-model="query.orderby" field="time" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="文件路径" v-model="query.orderby" field="file" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="标题" v-model="query.orderby" field="title" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="创建时间" v-model="query.orderby" field="time_create" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="更新时间" v-model="query.orderby" field="time_update" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="关键词" v-model="query.orderby" field="keyword" :func="search"></mm_reverse>
									</th>
									<th scope="col" class="th_handle"><span>操作</span></th>
								</tr>
							</thead>
							<draggable v-model="list" tag="tbody" @change="sort_change">
								<tr v-for="(o, idx) in list" :key="idx" :class="{'active': select == idx}" @click="selected(idx)">
									<th scope="row"><input type="checkbox" :checked="select_has(o[field])" @click="select_change(o[field])" /></th>
									<td>
										<span>{{ o.qid }}</span>
									</td>
									<td>
										<span>{{ o.keyword }}</span>
									</td>
									<td>
										<span>{{ o.indstry }}</span>
									</td>
									<td>
										<span>{{ o.area }}</span>
									</td>
									<td>
										<span>{{ o.tag }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.time, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ o.file }}</span>
									</td>
									<td>
										<span>{{ o.title }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.time_create, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.time_update, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ o.keyword }}</span>
									</td>
									<td>
										<mm_btn class="btn_primary" :url="'./qrcode_form?qid=' + o[field]">修改</mm_btn>
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
				url_get_list: "/apis/spiders/qrcode",
				url_del: "/apis/spiders/qrcode?method=del&",
				url_set: "/apis/spiders/qrcode?method=set&",
				field: "qid",
				query_set: {
					"qid": ""
				},
				// 查询条件
				query: {
					//页码
					page: 1,
					//页面大小
					size: 10,
					// 二维码编号
					'qid': 0,
					// 标签
					'tag': '',
					// 发布时间——开始时间
					'time_min': '',
					// 发布时间——结束时间
					'time_max': '',
					// 标题
					'title': '',
					// 创建时间——开始时间
					'time_create_min': '',
					// 创建时间——结束时间
					'time_create_max': '',
					// 更新时间——开始时间
					'time_update_min': '',
					// 更新时间——结束时间
					'time_update_max': '',
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

<template>
	<main id="spiders_qrcode_rule">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow">
						<h5>抓取二维码规则</h5>
					</header>
					<mm_body>
						<mm_form class="mm_filter">
							<h5><span>筛选条件</span></h5>
							<mm_list col="3">
								<mm_col>
									<mm_input v-model="query.keyword" title="关键词" desc="标题位置 / 名称位置 / 标签位置"
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
								<mm_btn class="btn_primary-x" url="./qrcode_rule_form">添加</mm_btn>
								<mm_btn @click.native="show = true" class="btn_primary-x" v-bind:class="{ 'disabled': !selects }">批量修改</mm_btn>
							</div>
						</div>
						<mm_table type="2">
							<thead>
								<tr>
									<th scope="col" class="th_selected"><input type="checkbox" :checked="select_state" @click="select_all()" /></th>
									<th scope="col" class="th_id"><span>#</span></th>
									<th scope="col">
										<mm_reverse title="列表页" v-model="query.orderby" field="path" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="页数位置" v-model="query.orderby" field="pager" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="页数位数" v-model="query.orderby" field="pager_index" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="列表位置" v-model="query.orderby" field="list" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="图片位置" v-model="query.orderby" field="pic" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="标题位置" v-model="query.orderby" field="title" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="名称位置" v-model="query.orderby" field="name" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="微信位置" v-model="query.orderby" field="wechat" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="行业位置" v-model="query.orderby" field="indstry" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="行业位数" v-model="query.orderby" field="indstry_index" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="地区位置" v-model="query.orderby" field="area" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="地区位数" v-model="query.orderby" field="area_index" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="时间位置" v-model="query.orderby" field="time" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="时间位数" v-model="query.orderby" field="time_index" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="标签位置" v-model="query.orderby" field="tag" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="标签位数" v-model="query.orderby" field="tag_index" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="保存数据库" v-model="query.orderby" field="save_way" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="保存路径" v-model="query.orderby" field="save_dir" :func="search"></mm_reverse>
									</th>
									<th scope="col" class="th_handle"><span>操作</span></th>
								</tr>
							</thead>
							<draggable v-model="list" tag="tbody" @change="sort_change">
								<tr v-for="(o, idx) in list" :key="idx" :class="{'active': select == idx}" @click="selected(idx)">
									<th scope="row"><input type="checkbox" :checked="select_has(o[field])" @click="select_change(o[field])" /></th>
									<td>
										<span>{{ o.rid }}</span>
									</td>
									<td>
										<span>{{ o.path }}</span>
									</td>
									<td>
										<span>{{ o.pager }}</span>
									</td>
									<td>
										<span>{{ o.pager_index }}</span>
									</td>
									<td>
										<span>{{ o.list }}</span>
									</td>
									<td>
										<span>{{ o.pic }}</span>
									</td>
									<td>
										<span>{{ o.title }}</span>
									</td>
									<td>
										<span>{{ o.name }}</span>
									</td>
									<td>
										<span>{{ o.wechat }}</span>
									</td>
									<td>
										<span>{{ o.indstry }}</span>
									</td>
									<td>
										<span>{{ o.indstry_index }}</span>
									</td>
									<td>
										<span>{{ o.area }}</span>
									</td>
									<td>
										<span>{{ o.area_index }}</span>
									</td>
									<td>
										<span>{{ o.time }}</span>
									</td>
									<td>
										<span>{{ o.time_index }}</span>
									</td>
									<td>
										<span>{{ o.tag }}</span>
									</td>
									<td>
										<span>{{ o.tag_index }}</span>
									</td>
									<td>
										<span>{{ o.save_way }}</span>
									</td>
									<td>
										<span>{{ o.save_dir }}</span>
									</td>
									<td>
										<mm_btn class="btn_primary" :url="'./qrcode_rule_form?rid=' + o[field]">修改</mm_btn>
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
				url_get_list: "/apis/spiders/qrcode_rule",
				url_del: "/apis/spiders/qrcode_rule?method=del&",
				url_set: "/apis/spiders/qrcode_rule?method=set&",
				field: "rid",
				query_set: {
					"rid": ""
				},
				// 查询条件
				query: {
					//页码
					page: 1,
					//页面大小
					size: 10,
					// 二维码规则编号
					'rid': 0,
					// 页数位数——最小值
					'pager_index_min': 0,
					// 页数位数——最大值
					'pager_index_max': 0,
					// 标题位置
					'title': '',
					// 名称位置
					'name': '',
					// 行业位数——最小值
					'indstry_index_min': 0,
					// 行业位数——最大值
					'indstry_index_max': 0,
					// 地区位数——最小值
					'area_index_min': 0,
					// 地区位数——最大值
					'area_index_max': 0,
					// 时间位数——最小值
					'time_index_min': 0,
					// 时间位数——最大值
					'time_index_max': 0,
					// 标签位置
					'tag': '',
					// 标签位数——最小值
					'tag_index_min': 0,
					// 标签位数——最大值
					'tag_index_max': 0,
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

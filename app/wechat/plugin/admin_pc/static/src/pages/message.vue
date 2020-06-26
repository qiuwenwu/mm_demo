<template>
	<main id="wechat_message">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow">
						<h5>微信消息</h5>
					</header>
					<mm_body>
						<mm_form class="mm_filter">
							<h5><span>筛选条件</span></h5>
							<mm_list col="3">
								<mm_col>
									<mm_input v-model="query.keyword" title="关键词句" desc="除指令外，过滤 / 抽取后的词句" @blur="search()" />
								</mm_col>
								<mm_col>
									<mm_input v-model="query.keyword" title="关键词" desc="发信人名称 / 最后会话 / 会话正文" @blur="search()" />
								</mm_col>
								<mm_col>
									<mm_select v-model="query.end" title="结束会话" :options="$to_kv(arr_end)" @change="search()" />
								</mm_col>
								<mm_col>
									<mm_btn class="btn_primary-x" type="reset" @click.native="reset();search()">重置</mm_btn>
								</mm_col>
							</mm_list>
						</mm_form>
						<div class="mm_action">
							<h5><span>操作</span></h5>
							<div class="">
								<mm_btn class="btn_primary-x" url="./message_form">添加</mm_btn>
								<mm_btn @click.native="show = true" class="btn_primary-x" v-bind:class="{ 'disabled': !selects }">批量修改</mm_btn>
							</div>
						</div>
						<mm_table type="2">
							<thead>
								<tr>
									<th scope="col" class="th_selected"><input type="checkbox" :checked="select_state" @click="select_all()" /></th>
									<th scope="col" class="th_id"><span>#</span></th>
									<th scope="col">
										<mm_reverse title="结束会话" v-model="query.orderby" field="end" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="阶段" v-model="query.orderby" field="stage" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="微信消息ID" v-model="query.orderby" field="msgid" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="会话更新时间" v-model="query.orderby" field="update_time" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="会话创建时间" v-model="query.orderby" field="create_time" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="用户群组" v-model="query.orderby" field="group" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="消息类型" v-model="query.orderby" field="msg_type" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="发信人名称" v-model="query.orderby" field="name" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="会话类型" v-model="query.orderby" field="type" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="所使用的指令" v-model="query.orderby" field="cmd" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="应用ID" v-model="query.orderby" field="appid" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="会话发起人" v-model="query.orderby" field="from_user" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="会话接收人" v-model="query.orderby" field="to_user" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="服务的机器人" v-model="query.orderby" field="robot" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="聊天ID" v-model="query.orderby" field="chatid" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="发信人头像" v-model="query.orderby" field="avatar" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="复查指令" v-model="query.orderby" field="check" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="关键词句" v-model="query.orderby" field="keyword" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="关键词" v-model="query.orderby" field="keyword" :func="search"></mm_reverse>
									</th>
									<th scope="col" class="th_handle"><span>操作</span></th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(o, idx) in list" :key="idx" :class="{'active': select == idx}" @click="selected(idx)">
									<th scope="row"><input type="checkbox" :checked="select_has(o[field])" @click="select_change(o[field])" /></th>
									<td>
										<span>{{ o.message_id }}</span>
									</td>
									<td>
										<mm_switch v-model="o.end" @click.native="set(o)" />
									</td>
									<td>
										<span>{{ o.stage }}</span>
									</td>
									<td>
										<span>{{ o.msgid }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.update_time, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.create_time, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ o.group }}</span>
									</td>
									<td>
										<span>{{ o.msg_type }}</span>
									</td>
									<td>
										<span>{{ o.name }}</span>
									</td>
									<td>
										<span>{{ o.type }}</span>
									</td>
									<td>
										<span>{{ o.cmd }}</span>
									</td>
									<td>
										<span>{{ o.appid }}</span>
									</td>
									<td>
										<span>{{ o.from_user }}</span>
									</td>
									<td>
										<span>{{ o.to_user }}</span>
									</td>
									<td>
										<span>{{ o.robot }}</span>
									</td>
									<td>
										<span>{{ o.chatid }}</span>
									</td>
									<td>
										<img class="avatar" :src="o.avatar" alt="发信人头像" />
									</td>
									<td>
										<span>{{ o.check }}</span>
									</td>
									<td>
										<span>{{ o.keyword }}</span>
									</td>
									<td>
										<span>{{ o.keyword }}</span>
									</td>
									<td>
										<mm_btn class="btn_primary" :url="'./message_form?message_id=' + o[field]">修改</mm_btn>
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
						<dt>结束会话</dt>
						<dd>
							<mm_select v-model="form.end" :options="$to_kv(arr_end)" />
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
				url_get_list: "/apis/wechat/message",
				url_del: "/apis/wechat/message?method=del&",
				url_set: "/apis/wechat/message?method=set&",
				field: "message_id",
				query_set: {
					"message_id": ""
				},
				// 查询条件
				query: {
					//页码
					page: 1,
					//页面大小
					size: 10,
					// 消息ID
					'message_id': 0,
					// 结束会话
					'end': '',
					// 阶段——最小值
					'stage_min': 0,
					// 阶段——最大值
					'stage_max': 0,
					// 会话更新时间——开始时间
					'update_time_min': '',
					// 会话更新时间——结束时间
					'update_time_max': '',
					// 会话创建时间——开始时间
					'create_time_min': '',
					// 会话创建时间——结束时间
					'create_time_max': '',
					// 发信人名称
					'name': '',
					// 最后会话
					'content_last': '',
					// 会话正文
					'content': '',
					// 关键词句
					'keyword': '',
					//排序
					orderby: ""
				},
				form: {},
				//颜色
				arr_color: ['', '', 'font_yellow', 'font_success', 'font_warning', 'font_primary', 'font_info', 'font_default'],
				// 结束会话
				'arr_end': ['未结束','已结束'],
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

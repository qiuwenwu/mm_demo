<template>
	<main id="bbs_thread_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}社区主题</h5>
					</div>
					<div class="body">
						<dl>
							<dt>是否启用</dt>
							<dd>
								<mm_switch v-model="form.available" />
							</dd>
							<dt>状态</dt>
							<dd>
								<mm_select v-model="form.state" :options="$to_kv(arr_state)" />
							</dd>
							<dt>主题分类</dt>
							<dd>
								<mm_select v-model="form.type_id" :options="$to_kv(list_thread_type, 'type_id', 'name')" />
							</dd>
							<dt>频道</dt>
							<dd>
								<mm_select v-model="form.channel_id" :options="$to_kv(list_thread_channel, 'channel_id', 'name')" />
							</dd>
							<dt>所属城市</dt>
							<dd>
								<mm_select v-model="form.city_id" :options="$to_kv(list_address_city, 'city_id', 'name')" />
							</dd>
							<dt>用户</dt>
							<dd>
								<mm_select v-model="form.user_id" :options="$to_kv(list_account, 'user_id', 'nickname')" />
							</dd>
							<dt>热度</dt>
							<dd>
								<mm_number v-model="form.hot" :min="0" :max="1000000000" />
							</dd>
							<dt>点赞次数</dt>
							<dd>
								<mm_number v-model="form.praise" :min="0" :max="1000000000" />
							</dd>
							<dt>采集规则ID</dt>
							<dd>
								<mm_input v-model="form.collect_id" :minlength="0" :maxlength="0" placeholder="如果主题是通过采集的方式获得，那么具有采集ID" />
							</dd>
							<dt class="required">标题</dt>
							<dd>
								<mm_input v-model="form.title" :minlength="0" :maxlength="0" placeholder="用于主题和html的&#60;title&#62;标签中"
								 :required="true" />
							</dd>
							<dt>关键词</dt>
							<dd>
								<mm_input v-model="form.keywords" :minlength="0" :maxlength="0" placeholder="引擎收录" />
							</dd>
							<dt>描述</dt>
							<dd>
								<mm_input v-model="form.description" :minlength="0" :maxlength="0" placeholder="用于主题提纲和搜索引擎收录" />
							</dd>
							<dt>来源地址</dt>
							<dd>
								<mm_input v-model="form.url" :minlength="0" :maxlength="0" placeholder="用于跳转到发布该主题的网站" />
							</dd>
							<dt>标签</dt>
							<dd>
								<mm_input v-model="form.tag" :minlength="0" :maxlength="0" placeholder="用于标注主题所属相关内容，多个标签用空格隔开" />
							</dd>
							<dt>封面图</dt>
							<dd>
								<mm_upload_img width="10rem" height="10rem" name="img" type="text" v-model="form.img" />
							</dd>
							<dt>正文</dt>
							<dd>
								<mm_textarea v-model="form.content" type="text" placeholder="主题的主体内容" />
							</dd>
							<dt>收藏者</dt>
							<dd>
								<mm_textarea v-model="form.collecter" type="text" placeholder="多个收藏者用”,“分隔" />
							</dd>
						</dl>
					</div>
					<div class="foot">
						<div class="mm_group">
							<button class="btn_default" type="button" @click="cancel">取消</button>
							<button class="btn_primary" type="button" @click="submit()">提交</button>
						</div>
					</div>
				</mm_form>
			</mm_col>
		</mm_grid>
	</main>
</template>


<script>
	import mixin from '/src/mixins/page.js';

	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_submit: "/apis/bbs/thread?",
				url_get_obj: "/apis/bbs/thread?method=get_obj",
				field: "thread_id",
				query: {
					"thread_id": 0
				},
				form: {
					"thread_id": 0,
					"available": 0,
					"state": 0,
					"type_id": 0,
					"channel_id": 0,
					"city_id": 0,
					"user_id": 0,
					"hot": 0,
					"praise": 0,
					"collect_id": 0,
					"title": '',
					"keywords": '',
					"description": '',
					"url": '',
					"tag": '',
					"img": '',
					"content": '',
					"collecter": '',
				},
				// 是否启用
				'arr_available': [ '否' , '是' ],
				// 状态
				'arr_state': [ '' , '正常' , '推荐' , '认证' , '违规' , '官方' ],
				// 主题分类
				'list_thread_type': [ ],
				// 频道
				'list_thread_channel': [ ],
				// 所属城市
				'list_address_city': [ ],
				// 用户
				'list_account': [ ],
			}
		},
		methods: {
			/**
			 * 获取主题分类
			 * @param {query} 查询条件
			 */
			get_thread_type(query) {
				var _this = this;
				if (!query) {
					query = {
						field: "type_id,name"
					};
				}
				this.$get('~/apis/bbs/thread_type?size=0', query, function(json) {
					if (json.result) {
						_this.list_thread_type .clear();
						_this.list_thread_type .addList(json.result.list)
					}
				});
			},
			/**
			 * 获取频道
			 * @param {query} 查询条件
			 */
			get_thread_channel(query) {
				var _this = this;
				if (!query) {
					query = {
						field: "channel_id,name"
					};
				}
				this.$get('~/apis/bbs/thread_channel?size=0', query, function(json) {
					if (json.result) {
						_this.list_thread_channel .clear();
						_this.list_thread_channel .addList(json.result.list)
					}
				});
			},
			/**
			 * 获取所属城市
			 * @param {query} 查询条件
			 */
			get_address_city(query) {
				var _this = this;
				if (!query) {
					query = {
						field: "city_id,name"
					};
				}
				this.$get('~/apis/sys/address_city?size=0', query, function(json) {
					if (json.result) {
						_this.list_address_city .clear();
						_this.list_address_city .addList(json.result.list)
					}
				});
			},
			/**
			 * 获取用户
			 * @param {query} 查询条件
			 */
			get_account(query) {
				var _this = this;
				if (!query) {
					query = {
						field: "user_id,nickname"
					};
				}
				this.$get('~/apis/user/account?size=0', query, function(json) {
					if (json.result) {
						_this.list_account .clear();
						_this.list_account .addList(json.result.list)
					}
				});
			},
		},
		created() {
			// 获取主题分类
			this.get_thread_type();
			// 获取频道
			this.get_thread_channel();
			// 获取所属城市
			this.get_address_city();
			// 获取用户
			this.get_account();
		}
	}
</script>

<style>
</style>

<template>
	<main id="bbs_thread_comment_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<header class="arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}主题评论</h5>
					</header>
					<dl>
						<dt>是否启用</dt>
						<dd>
							<mm_switch v-model="form.available" />
						</dd>
						<dt>评分</dt>
						<dd>
							<mm_number v-model="form.score" :min="0" :max="5" />
						</dd>
						<dt>所属主题</dt>
						<dd>
							<mm_select v-model="form.thread_id" :options="$to_kv(list_thread, 'thread_id', 'title')" />
						</dd>
						<dt>用户</dt>
						<dd>
							<mm_select v-model="form.user_id" :options="$to_kv(list_account, 'user_id', 'nickname')" />
						</dd>
						<dt>标签</dt>
						<dd>
							<mm_input v-model="form.tag" :minlength="0" :maxlength="0" placeholder="评论人给的标签，多个标签用空格隔开" />
						</dd>
						<dt>评论回复</dt>
						<dd>
							<mm_textarea v-model="form.reply" type="text" placeholder="对评论人的评论做出的回复。通过form-url格式保存，多个人的回复用换行分隔" />
						</dd>
						<dt>正文</dt>
						<dd>
							<mm_textarea v-model="form.content" type="text" placeholder="评论内容" />
						</dd>
					</dl>
					<footer>
						<div class="mm_group">
							<button class="btn_default" type="button" @click="cancel">取消</button>
							<button class="btn_primary" type="button" @click="submit()">提交</button>
						</div>
					</footer>
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
				url_submit: "/apis/bbs/thread_comment?",
				url_get_obj: "/apis/bbs/thread_comment?method=get_obj",
				field: "comment_id",
				query: {
					"comment_id": 0
				},
				form: {
						"comment_id": 0,
						"available": 0,
						"score": 0,
						"thread_id": 0,
						"user_id": 0,
						"tag": '',
						"reply": '',
						"content": '',
				},
				// 是否启用
				'arr_available': ['否','是'],
				// 所属主题
				'list_thread': [],
				// 用户
				'list_account': [],
			}
		},
		methods: {
				/**
				 * 获取所属主题
				 * @param {query} 查询条件
				 */
				get_thread(query){
					var _this = this;
					if(!query){
						query = {
							field: "thread_id,title"
						};
					}
					this.$get('~/apis/bbs/thread?size=0', query, function(json) {
						if (json.result) {
							_this.list_thread.clear();
							_this.list_thread.addList(json.result.list)
						}
					});
				},
				/**
				 * 获取用户
				 * @param {query} 查询条件
				 */
				get_account(query){
					var _this = this;
					if(!query){
						query = {
							field: "user_id,nickname"
						};
					}
					this.$get('~/apis/user/account?size=0', query, function(json) {
						if (json.result) {
							_this.list_account.clear();
							_this.list_account.addList(json.result.list)
						}
					});
				},
		},
		created() {
			// 获取所属主题
			this.get_thread();
			// 获取用户
			this.get_account();
		}
	}
</script>

<style>
</style>

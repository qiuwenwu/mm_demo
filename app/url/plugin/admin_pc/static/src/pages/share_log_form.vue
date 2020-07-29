<template>
	<main id="url_share_log_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}链接分享日志</h5>
					</div>
					<div class="body">
						<dl>
							<dt>网址键</dt>
							<dd>
								<mm_input v-model="form.key" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>分享者</dt>
							<dd>
								<mm_select v-model="form.user_id" :options="$to_kv(list_account, 'user_id', 'nickname')" />
							</dd>
							<dt>查询参数</dt>
							<dd>
								<mm_input v-model="form.query" :minlength="0" :maxlength="0" placeholder="用来校验推广者身份，平台等" />
							</dd>
							<dt>访问源IP</dt>
							<dd>
								<mm_input v-model="form.ip" :minlength="0" :maxlength="0" placeholder="用来判断是否刷的流量" />
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
				url_submit: "/apis/url/share_log?",
				url_get_obj: "/apis/url/share_log?method=get_obj",
				field: "log_id",
				query: {
					"log_id": 0
				},
				form: {
					"log_id": 0,
					"key": '',
					"user_id": 0,
					"query": '',
					"ip": '',
				},
				// 分享者
				'list_account': [ ],
			}
		},
		methods: {
			/**
			 * 获取分享者
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
			// 获取分享者
			this.get_account();
		}
	}
</script>

<style>
</style>

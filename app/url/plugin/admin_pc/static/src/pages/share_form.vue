<template>
	<main id="url_share_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<header class="arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}链接分享</h5>
					</header>
					<dl>
						<dt>创建者</dt>
						<dd>
							<mm_select v-model="form.user_id" :options="$to_kv(list_account, 'user_id', 'nickname')" />
						</dd>
						<dt>路由键</dt>
						<dd>
							<mm_input v-model="form.key" :minlength="0" :maxlength="0" placeholder="用于匹配路由做跳转" />
						</dd>
						<dt>转发网址</dt>
						<dd>
							<mm_input v-model="form.url_redirect" :minlength="0" :maxlength="0" placeholder="" />
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
				url_submit: "/apis/url/share?",
				url_get_obj: "/apis/url/share?method=get_obj",
				field: "share_id",
				query: {
					"share_id": 0
				},
				form: {
						"share_id": 0,
						"user_id": 0,
						"key": '',
						"url_redirect": '',
				},
				// 创建者
				'list_account': [],
			}
		},
		methods: {
				/**
				 * 获取创建者
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
			// 获取创建者
			this.get_account();
		}
	}
</script>

<style>
</style>

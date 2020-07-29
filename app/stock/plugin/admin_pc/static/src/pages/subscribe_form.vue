<template>
	<main id="stock_subscribe_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}股票订阅</h5>
					</div>
					<div class="body">
						<dl>
							<dt>订阅用户</dt>
							<dd>
								<mm_select v-model="form.user_id" :options="$to_kv(list_account, 'user_id', 'nickname')" />
							</dd>
							<dt>通知时段1</dt>
							<dd>
								<mm_time v-model="form.time1" type="time" />
							</dd>
							<dt>通知时段2</dt>
							<dd>
								<mm_time v-model="form.time2" type="time" />
							</dd>
							<dt>通知时段3</dt>
							<dd>
								<mm_time v-model="form.time3" type="time" />
							</dd>
							<dt class="required">订阅方式</dt>
							<dd>
								<mm_input v-model="form.way" :minlength="0" :maxlength="0" placeholder="phone手机短信 / email邮箱 / wechat微信公众号 / app应用端"
								 :required="true" />
							</dd>
							<dt>订阅的股票</dt>
							<dd>
								<mm_input v-model="form.stocks" :minlength="0" :maxlength="0" placeholder="" />
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
				url_submit: "/apis/stock/subscribe?",
				url_get_obj: "/apis/stock/subscribe?method=get_obj",
				field: "subscribe_id",
				query: {
					"subscribe_id": 0
				},
				form: {
					"subscribe_id": 0,
					"user_id": 0,
					"time1": '',
					"time2": '',
					"time3": '',
					"way": '',
					"stocks": '',
				},
				// 订阅用户
				'list_account': [ ],
			}
		},
		methods: {
			/**
			 * 获取订阅用户
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
			// 获取订阅用户
			this.get_account();
		}
	}
</script>

<style>
</style>

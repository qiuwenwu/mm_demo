<template>
	<main id="wechat_contact_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}</h5>
					</div>
					<div class="body">
						<dl>
							<dt>应用ID</dt>
							<dd>
								<mm_input v-model="form.appid" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>联系人账户</dt>
							<dd>
								<mm_input v-model="form.account" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>联系人昵称</dt>
							<dd>
								<mm_input v-model="form.nickname" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>联系人头像</dt>
							<dd>
								<mm_input v-model="form.avatar" :minlength="0" :maxlength="0" placeholder="" />
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
				url_submit: "/apis/wechat/contact?",
				url_get_obj: "/apis/wechat/contact?method=get_obj",
				field: "contact_id",
				query: {
					"contact_id": 0
				},
				form: {
					"contact_id": 0,
					"appid": '',
					"account": '',
					"nickname": '',
					"avatar": '',
				},
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

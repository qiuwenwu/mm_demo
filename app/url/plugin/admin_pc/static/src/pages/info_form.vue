<template>
	<main id="url_info_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}链接信息</h5>
					</div>
					<div class="body">
						<dl>
							<dt>网址键</dt>
							<dd>
								<mm_input v-model="form.key" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>重定向地址</dt>
							<dd>
								<mm_input v-model="form.url_redirect" :minlength="0" :maxlength="0" placeholder="" />
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
				url_submit: "/apis/url/info?",
				url_get_obj: "/apis/url/info?method=get_obj",
				field: "url_id",
				query: {
					"url_id": 0
				},
				form: {
					"url_id": 0,
					"key": '',
					"url_redirect": '',
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

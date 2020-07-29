<template>
	<main id="url_log_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}链接访问日志</h5>
					</div>
					<div class="body">
						<dl>
							<dt>网址键</dt>
							<dd>
								<mm_input v-model="form.key" :minlength="0" :maxlength="0" placeholder="" />
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
				url_submit: "/apis/url/log?",
				url_get_obj: "/apis/url/log?method=get_obj",
				field: "log_id",
				query: {
					"log_id": 0
				},
				form: {
					"log_id": 0,
					"key": '',
					"query": '',
					"ip": '',
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

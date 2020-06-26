<template>
	<main id="activity_action_log_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<header class="arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}活动操作日志</h5>
					</header>
					<dl>
						<dt>参操函数名</dt>
						<dd>
							<mm_input v-model="form.func_name" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>操作者uin</dt>
						<dd>
							<mm_input v-model="form.uin_action" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>操作方法</dt>
						<dd>
							<mm_input v-model="form.method" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>操作记录</dt>
						<dd>
							<mm_textarea v-model="form.log" type="text" placeholder="" />
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
				url_submit: "/apis/activity/action_log?",
				url_get_obj: "/apis/activity/action_log?method=get_obj",
				field: "action_id",
				query: {
					"action_id": 0
				},
				form: {
						"action_id": 0,
						"func_name": '',
						"uin_action": '',
						"method": '',
						"log": '',
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

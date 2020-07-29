<template>
	<main id="activity_user_log_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}活动参与记录</h5>
					</div>
					<div class="body">
						<dl>
							<dt>领取状态</dt>
							<dd>
								<mm_number v-model="form.state" :min="0" :max="9" />
							</dd>
							<dt>一等奖</dt>
							<dd>
								<mm_number v-model="form.prize_1" :min="0" :max="32767" />
							</dd>
							<dt>二等奖</dt>
							<dd>
								<mm_number v-model="form.prize_2" :min="0" :max="32767" />
							</dd>
							<dt>三等奖</dt>
							<dd>
								<mm_number v-model="form.prize_3" :min="0" :max="32767" />
							</dd>
							<dt>特等奖</dt>
							<dd>
								<mm_number v-model="form.prize_t" :min="0" :max="32767" />
							</dd>
							<dt>活动ID</dt>
							<dd>
								<mm_input v-model="form.activity_id" :minlength="0" :maxlength="0" placeholder="用来识别是那个活动" />
							</dd>
							<dt>用户唯一标识</dt>
							<dd>
								<mm_input v-model="form.uin_user" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>颁奖者uin</dt>
							<dd>
								<mm_input v-model="form.uin_prize_winners" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>活动证明</dt>
							<dd>
								<mm_upload_img width="10rem" height="10rem" name="img_prove" type="text" v-model="form.img_prove" />
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
				url_submit: "/apis/activity/user_log?",
				url_get_obj: "/apis/activity/user_log?method=get_obj",
				field: "log_id",
				query: {
					"log_id": 0
				},
				form: {
					"log_id": 0,
					"state": 0,
					"prize_1": 0,
					"prize_2": 0,
					"prize_3": 0,
					"prize_t": 0,
					"activity_id": 0,
					"uin_user": '',
					"uin_prize_winners": '',
					"img_prove": '',
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

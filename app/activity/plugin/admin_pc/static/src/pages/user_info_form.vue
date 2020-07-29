<template>
	<main id="activity_user_info_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}参与者信息</h5>
					</div>
					<div class="body">
						<dl>
							<dt>用户验证状态</dt>
							<dd>
								<mm_number v-model="form.state" :min="0" :max="9" />
							</dd>
							<dt class="required">手机号码</dt>
							<dd>
								<mm_input v-model="form.phone" :minlength="0" :maxlength="0" placeholder=""
								 :required="true" />
							</dd>
							<dt>紧急联系人号码</dt>
							<dd>
								<mm_input v-model="form.liaison_phone" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt class="required">参与人姓名</dt>
							<dd>
								<mm_input v-model="form.name" :minlength="0" :maxlength="0" placeholder=""
								 :required="true" />
							</dd>
							<dt class="required">身份证号</dt>
							<dd>
								<mm_input v-model="form.idcard" :minlength="0" :maxlength="0" placeholder=""
								 :required="true" />
							</dd>
							<dt>紧急联系人姓名</dt>
							<dd>
								<mm_input v-model="form.liaison_name" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>用户唯一标识</dt>
							<dd>
								<mm_input v-model="form.uin_user" :minlength="0" :maxlength="0" placeholder="用来识别用户" />
							</dd>
							<dt>审核人uin</dt>
							<dd>
								<mm_input v-model="form.uin_checker" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>所在位置</dt>
							<dd>
								<mm_input v-model="form.location" :minlength="0" :maxlength="0" placeholder="用户所在位置，同时用来接收快递，传省市区" />
							</dd>
							<dt>详细地址</dt>
							<dd>
								<mm_input v-model="form.address" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>身份证正面照</dt>
							<dd>
								<mm_upload_img width="10rem" height="10rem" name="idcard_img_a" type="text" v-model="form.idcard_img_a" />
							</dd>
							<dt>身份证反面照</dt>
							<dd>
								<mm_upload_img width="10rem" height="10rem" name="idcard_img_b" type="text" v-model="form.idcard_img_b" />
							</dd>
							<dt>其他补充信息</dt>
							<dd>
								<mm_textarea v-model="form.note" type="text" placeholder="" />
							</dd>
							<dt>出院证明</dt>
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
				url_submit: "/apis/activity/user_info?",
				url_get_obj: "/apis/activity/user_info?method=get_obj",
				field: "info_id",
				query: {
					"info_id": 0
				},
				form: {
					"info_id": 0,
					"state": 0,
					"phone": '',
					"liaison_phone": '',
					"name": '',
					"idcard": '',
					"liaison_name": '',
					"uin_user": '',
					"uin_checker": '',
					"location": '',
					"address": '',
					"idcard_img_a": '',
					"idcard_img_b": '',
					"note": '',
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

<template>
	<main id="activity_info_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}活动信息</h5>
					</div>
					<div class="body">
						<dl>
							<dt>活动周期数</dt>
							<dd>
								<mm_number v-model="form.period_num" :min="0" :max="999" />
							</dd>
							<dt>活动周期单位</dt>
							<dd>
								<mm_number v-model="form.period_unit" :min="0" :max="16" />
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
							<dt>参与人数</dt>
							<dd>
								<mm_number v-model="form.num_people" :min="0" :max="2147483647" />
							</dd>
							<dt>中奖人数</dt>
							<dd>
								<mm_number v-model="form.num_winner" :min="0" :max="2147483647" />
							</dd>
							<dt>开始时间</dt>
							<dd>
								<mm_time v-model="form.time_start" type="datetime-local" />
							</dd>
							<dt>结束时间</dt>
							<dd>
								<mm_time v-model="form.time_end" type="datetime-local" />
							</dd>
							<dt class="required">活动名称</dt>
							<dd>
								<mm_input v-model="form.name" :minlength="0" :maxlength="0" placeholder=""
								 :required="true" />
							</dd>
							<dt>活动类型</dt>
							<dd>
								<mm_input v-model="form.type" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>创建者uin</dt>
							<dd>
								<mm_input v-model="form.uin_creator" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>活动标题</dt>
							<dd>
								<mm_input v-model="form.title" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>活动描述</dt>
							<dd>
								<mm_input v-model="form.descrtption" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>活动详情</dt>
							<dd>
								<mm_textarea v-model="form.content" type="text" placeholder="" />
							</dd>
							<dt>申请次数统计</dt>
							<dd>
								<mm_number v-model="form.num_applicant" :min="0" :max="2147483647" />
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
				url_submit: "/apis/activity/info?",
				url_get_obj: "/apis/activity/info?method=get_obj",
				field: "activity_id",
				query: {
					"activity_id": 0
				},
				form: {
					"activity_id": 0,
					"period_num": 0,
					"period_unit": 0,
					"prize_1": 0,
					"prize_2": 0,
					"prize_3": 0,
					"prize_t": 0,
					"num_people": 0,
					"num_winner": 0,
					"time_start": '',
					"time_end": '',
					"name": '',
					"type": '',
					"uin_creator": '',
					"title": '',
					"descrtption": '',
					"content": '',
					"num_applicant": 0,
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

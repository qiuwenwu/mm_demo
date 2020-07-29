<template>
	<main id="spiders_qrcode_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}抓取二维码</h5>
					</div>
					<div class="body">
						<dl>
							<dt>关键词</dt>
							<dd>
								<mm_input v-model="form.keyword" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>行业</dt>
							<dd>
								<mm_input v-model="form.indstry" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>地区</dt>
							<dd>
								<mm_input v-model="form.area" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>标签</dt>
							<dd>
								<mm_input v-model="form.tag" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>发布时间</dt>
							<dd>
								<mm_time v-model="form.time" type="datetime-local" />
							</dd>
							<dt>文件路径</dt>
							<dd>
								<mm_input v-model="form.file" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>标题</dt>
							<dd>
								<mm_input v-model="form.title" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>关键词</dt>
							<dd>
								<mm_input v-model="form.keyword" :minlength="0" :maxlength="0" placeholder="标签 / 标题" />
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
				url_submit: "/apis/spiders/qrcode?",
				url_get_obj: "/apis/spiders/qrcode?method=get_obj",
				field: "qid",
				query: {
					"qid": 0
				},
				form: {
					"qid": 0,
					"keyword": '',
					"indstry": '',
					"area": '',
					"tag": '',
					"time": '',
					"file": '',
					"title": '',
					"keyword": '',
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

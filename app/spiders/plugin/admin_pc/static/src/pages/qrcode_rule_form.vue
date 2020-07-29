<template>
	<main id="spiders_qrcode_rule_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}抓取二维码规则</h5>
					</div>
					<div class="body">
						<dl>
							<dt>抓包网址</dt>
							<dd>
								<mm_textarea v-model="form.host" type="text" placeholder="" />
							</dd>
							<dt>列表页</dt>
							<dd>
								<mm_input v-model="form.path" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>页数位置</dt>
							<dd>
								<mm_input v-model="form.pager" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>页数位数</dt>
							<dd>
								<mm_number v-model="form.pager_index" :min="0" :max="2147483647" />
							</dd>
							<dt>列表位置</dt>
							<dd>
								<mm_input v-model="form.list" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>图片位置</dt>
							<dd>
								<mm_input v-model="form.pic" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>标题位置</dt>
							<dd>
								<mm_input v-model="form.title" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>名称位置</dt>
							<dd>
								<mm_input v-model="form.name" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>微信位置</dt>
							<dd>
								<mm_input v-model="form.wechat" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>行业位置</dt>
							<dd>
								<mm_input v-model="form.indstry" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>行业位数</dt>
							<dd>
								<mm_number v-model="form.indstry_index" :min="0" :max="2147483647" />
							</dd>
							<dt>地区位置</dt>
							<dd>
								<mm_input v-model="form.area" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>地区位数</dt>
							<dd>
								<mm_number v-model="form.area_index" :min="0" :max="2147483647" />
							</dd>
							<dt>时间位置</dt>
							<dd>
								<mm_input v-model="form.time" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>时间位数</dt>
							<dd>
								<mm_number v-model="form.time_index" :min="0" :max="2147483647" />
							</dd>
							<dt>标签位置</dt>
							<dd>
								<mm_input v-model="form.tag" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>标签位数</dt>
							<dd>
								<mm_number v-model="form.tag_index" :min="0" :max="2147483647" />
							</dd>
							<dt>保存数据库</dt>
							<dd>
								<mm_input v-model="form.save_way" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>保存路径</dt>
							<dd>
								<mm_input v-model="form.save_dir" :minlength="0" :maxlength="0" placeholder="" />
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
				url_submit: "/apis/spiders/qrcode_rule?",
				url_get_obj: "/apis/spiders/qrcode_rule?method=get_obj",
				field: "rid",
				query: {
					"rid": 0
				},
				form: {
					"rid": 0,
					"host": '',
					"path": '',
					"pager": '',
					"pager_index": 0,
					"list": '',
					"pic": '',
					"title": '',
					"name": '',
					"wechat": '',
					"indstry": '',
					"indstry_index": 0,
					"area": '',
					"area_index": 0,
					"time": '',
					"time_index": 0,
					"tag": '',
					"tag_index": 0,
					"save_way": '',
					"save_dir": '',
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

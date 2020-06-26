<template>
	<main id="activity_item_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<header class="arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}活动奖品</h5>
					</header>
					<dl>
						<dt>物品价值</dt>
						<dd>
							<mm_number v-model="form.price" :min="0" :max="0" />
						</dd>
						<dt>物品剩余数量</dt>
						<dd>
							<mm_number v-model="form.num" :min="0" :max="2147483647" />
						</dd>
						<dt class="required">物品名称</dt>
						<dd>
							<mm_input v-model="form.name" :minlength="0" :maxlength="0" placeholder="" :required="true"/>
						</dd>
						<dt>物品类型</dt>
						<dd>
							<mm_input v-model="form.type" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>创建者uin</dt>
						<dd>
							<mm_input v-model="form.creator_uin" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>物品标题</dt>
						<dd>
							<mm_input v-model="form.title" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>物品描述</dt>
						<dd>
							<mm_input v-model="form.descrtption" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>封面图</dt>
						<dd>
							<mm_upload_img width="10rem" height="10rem" name="img_cover" type="text" v-model="form.img_cover" />
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
				url_submit: "/apis/activity/item?",
				url_get_obj: "/apis/activity/item?method=get_obj",
				field: "item_id",
				query: {
					"item_id": 0
				},
				form: {
						"item_id": 0,
						"price": 0,
						"num": 0,
						"name": '',
						"type": '',
						"creator_uin": '',
						"title": '',
						"descrtption": '',
						"img_cover": '',
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

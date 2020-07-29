<template>
	<main id="mall_product_property_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}商品属性</h5>
					</div>
					<div class="body">
						<dl>
							<dt>分类名称</dt>
							<dd>
								<mm_input v-model="form.name" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>分类图标</dt>
							<dd>
								<mm_upload_img width="10rem" height="10rem" name="icon" type="text" v-model="form.icon" />
							</dd>
							<dt>分类描述</dt>
							<dd>
								<mm_input v-model="form.description" :minlength="0" :maxlength="0" placeholder="" />
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
				url_submit: "/apis/mall/product_property?",
				url_get_obj: "/apis/mall/product_property?method=get_obj",
				field: "property_id",
				query: {
					"property_id": 0
				},
				form: {
					"property_id": 0,
					"name": '',
					"icon": '',
					"description": '',
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

<template>
	<main id="mall_product_type_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}商品分类</h5>
					</div>
					<div class="body">
						<dl>
							<dt>上级分类</dt>
							<dd>
								<mm_select v-model="form.father_id" :options="$to_kv(list_product_type, 'type_id', 'name')" />
							</dd>
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
				url_submit: "/apis/mall/product_type?",
				url_get_obj: "/apis/mall/product_type?method=get_obj",
				field: "type_id",
				query: {
					"type_id": 0
				},
				form: {
					"type_id": 0,
					"father_id": 0,
					"name": '',
					"icon": '',
					"description": '',
				},
				// 上级分类
				'list_product_type': [ ],
			}
		},
		methods: {
			/**
			 * 获取上级分类
			 * @param {query} 查询条件
			 */
			get_product_type(query) {
				var _this = this;
				if (!query) {
					query = {
						field: "type_id,name"
					};
				}
				this.$get('~/apis/mall/product_type?size=0', query, function(json) {
					if (json.result) {
						_this.list_product_type .clear();
						_this.list_product_type .addList(json.result.list)
					}
				});
			},
		},
		created() {
			// 获取上级分类
			this.get_product_type();
		}
	}
</script>

<style>
</style>

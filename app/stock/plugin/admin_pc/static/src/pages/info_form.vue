<template>
	<main id="stock_info_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}股票信息</h5>
					</div>
					<div class="body">
						<dl>
							<dt class="required">股票名称</dt>
							<dd>
								<mm_input v-model="form.name" :minlength="0" :maxlength="0" placeholder=""
								 :required="true" />
							</dd>
							<dt>分红频率</dt>
							<dd>
								<mm_number v-model="form.bonus" :min="0" :max="0" />
							</dd>
							<dt>市盈率</dt>
							<dd>
								<mm_number v-model="form.pe" :min="0" :max="0" />
							</dd>
							<dt>市净率</dt>
							<dd>
								<mm_number v-model="form.pb" :min="0" :max="0" />
							</dd>
							<dt>发行价格</dt>
							<dd>
								<mm_number v-model="form.issue_price" :min="0" :max="0" />
							</dd>
							<dt>公司利润</dt>
							<dd>
								<mm_number v-model="form.profit" :min="0" :max="0" />
							</dd>
							<dt>发行量</dt>
							<dd>
								<mm_number v-model="form.num" :min="0" :max="2147483647" />
							</dd>
							<dt>上市时间</dt>
							<dd>
								<mm_time v-model="form.time_to_market" type="date" />
							</dd>
							<dt>公司名称</dt>
							<dd>
								<mm_input v-model="form.company" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>股票简介</dt>
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
				url_submit: "/apis/stock/info?",
				url_get_obj: "/apis/stock/info?method=get_obj",
				field: "code",
				query: {
					"code": 0
				},
				form: {
					"code": '',
					"name": '',
					"bonus": 0,
					"pe": 0,
					"pb": 0,
					"issue_price": 0,
					"profit": 0,
					"num": 0,
					"time_to_market": '',
					"company": '',
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

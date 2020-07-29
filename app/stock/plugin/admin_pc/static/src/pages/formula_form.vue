<template>
	<main id="stock_formula_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}股票公式</h5>
					</div>
					<div class="body">
						<dl>
							<dt>人工得分</dt>
							<dd>
								<mm_number v-model="form.score" :min="-10" :max="10" />
							</dd>
							<dt>1日权重</dt>
							<dd>
								<mm_number v-model="form.weight_1" :min="-10" :max="10" />
							</dd>
							<dt>4日权重</dt>
							<dd>
								<mm_number v-model="form.weight_4" :min="-10" :max="10" />
							</dd>
							<dt>7日权重</dt>
							<dd>
								<mm_number v-model="form.weight_7" :min="-10" :max="10" />
							</dd>
							<dt>1日涨跌幅度</dt>
							<dd>
								<mm_number v-model="form.extent_1" :min="-100" :max="100" />
							</dd>
							<dt>4日涨跌幅度</dt>
							<dd>
								<mm_number v-model="form.extent_4" :min="-100" :max="100" />
							</dd>
							<dt>7日涨跌幅度</dt>
							<dd>
								<mm_number v-model="form.extent_7" :min="-100" :max="100" />
							</dd>
							<dt>1日上涨数</dt>
							<dd>
								<mm_number v-model="form.num_up_1" :min="0" :max="2147483647" />
							</dd>
							<dt>4日上涨数</dt>
							<dd>
								<mm_number v-model="form.num_up_4" :min="0" :max="2147483647" />
							</dd>
							<dt>7日上涨数</dt>
							<dd>
								<mm_number v-model="form.num_up_7" :min="0" :max="2147483647" />
							</dd>
							<dt>1日下跌数</dt>
							<dd>
								<mm_number v-model="form.num_down_1" :min="0" :max="2147483647" />
							</dd>
							<dt>4日下跌数</dt>
							<dd>
								<mm_number v-model="form.num_down_4" :min="0" :max="2147483647" />
							</dd>
							<dt>7日下跌数</dt>
							<dd>
								<mm_number v-model="form.num_down_7" :min="0" :max="2147483647" />
							</dd>
							<dt class="required">公式名称</dt>
							<dd>
								<mm_input v-model="form.name" :minlength="0" :maxlength="0" placeholder="技术分析名称"
								 :required="true" />
							</dd>
							<dt>过滤</dt>
							<dd>
								<mm_input v-model="form.filter" :minlength="0" :maxlength="0" placeholder="当出现该技术分析时结果时，其他某个分析结果将无效，所以将其过滤调" />
							</dd>
							<dt>公式简介</dt>
							<dd>
								<mm_input v-model="form.description" :minlength="0" :maxlength="0" placeholder="介绍该公式是什么技术分析的" />
							</dd>
							<dt>股票公式</dt>
							<dd>
								<mm_textarea v-model="form.express" type="text" placeholder="用于分析走势，返回逻辑值" />
							</dd>
							<dt>预兆</dt>
							<dd>
								<mm_textarea v-model="form.presage" type="text" placeholder="今日 / 近日 / 后市走势情况" />
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
				url_submit: "/apis/stock/formula?",
				url_get_obj: "/apis/stock/formula?method=get_obj",
				field: "formula_id",
				query: {
					"formula_id": 0
				},
				form: {
					"formula_id": 0,
					"score": 0,
					"weight_1": 0,
					"weight_4": 0,
					"weight_7": 0,
					"extent_1": 0,
					"extent_4": 0,
					"extent_7": 0,
					"num_up_1": 0,
					"num_up_4": 0,
					"num_up_7": 0,
					"num_down_1": 0,
					"num_down_4": 0,
					"num_down_7": 0,
					"name": '',
					"filter": '',
					"description": '',
					"express": '',
					"presage": '',
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

<template>
	<main id="stock_analyse_6_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<header class="arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}上证股票分析</h5>
					</header>
					<dl>
						<dt>当日时间</dt>
						<dd>
							<mm_time v-model="form.datetime" type="datetime-local" />
						</dd>
						<dt>人工得分</dt>
						<dd>
							<mm_number v-model="form.score" :min="0" :max="99" />
						</dd>
						<dt>1日权重</dt>
						<dd>
							<mm_number v-model="form.weight_1" :min="-99" :max="99" />
						</dd>
						<dt>4日权重</dt>
						<dd>
							<mm_number v-model="form.weight_4" :min="-99" :max="99" />
						</dd>
						<dt>7日权重</dt>
						<dd>
							<mm_number v-model="form.weight_7" :min="-99" :max="99" />
						</dd>
						<dt>1日涨跌</dt>
						<dd>
							<mm_number v-model="form.extent_1" :min="-100" :max="100" />
						</dd>
						<dt>4日涨跌</dt>
						<dd>
							<mm_number v-model="form.extent_4" :min="-100" :max="100" />
						</dd>
						<dt>7日涨跌</dt>
						<dd>
							<mm_number v-model="form.extent_7" :min="-100" :max="100" />
						</dd>
						<dt>做T建议</dt>
						<dd>
							<mm_input v-model="form.action_day" :minlength="0" :maxlength="0" placeholder="买 / 卖 / 留" />
						</dd>
						<dt>长线建议</dt>
						<dd>
							<mm_input v-model="form.action_week" :minlength="0" :maxlength="0" placeholder="买 / 卖 / 留" />
						</dd>
						<dt>综合建议</dt>
						<dd>
							<mm_input v-model="form.action" :minlength="0" :maxlength="0" placeholder="买 / 卖 / 留" />
						</dd>
						<dt>分析提示</dt>
						<dd>
							<mm_input v-model="form.tip" :minlength="0" :maxlength="0" placeholder="技术分析，公式的名称集合" />
						</dd>
						<dt>预言</dt>
						<dd>
							<mm_input v-model="form.predict" :minlength="0" :maxlength="0" placeholder="告知今日 / 近日和后市发展情况" />
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
				url_submit: "/apis/stock/analyse_6?",
				url_get_obj: "/apis/stock/analyse_6?method=get_obj",
				field: "code",
				query: {
					"code": 0
				},
				form: {
						"code": '',
						"datetime": '',
						"score": 0,
						"weight_1": 0,
						"weight_4": 0,
						"weight_7": 0,
						"extent_1": 0,
						"extent_4": 0,
						"extent_7": 0,
						"action_day": '',
						"action_week": '',
						"action": '',
						"tip": '',
						"predict": '',
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

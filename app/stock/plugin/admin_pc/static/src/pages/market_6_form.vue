<template>
	<main id="stock_market_6_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<header class="arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}上证行情</h5>
					</header>
					<dl>
						<dt>交易日期</dt>
						<dd>
							<mm_time v-model="form.DATETIME" type="date" />
						</dd>
						<dt>最高价</dt>
						<dd>
							<mm_number v-model="form.HIGH" :min="0" :max="0" />
						</dd>
						<dt>最低价</dt>
						<dd>
							<mm_number v-model="form.LOW" :min="0" :max="0" />
						</dd>
						<dt>开盘价</dt>
						<dd>
							<mm_number v-model="form.OPEN" :min="0" :max="0" />
						</dd>
						<dt>收盘价</dt>
						<dd>
							<mm_number v-model="form.CLOSE" :min="0" :max="0" />
						</dd>
						<dt>上个收盘价</dt>
						<dd>
							<mm_number v-model="form.LCLOSE" :min="0" :max="0" />
						</dd>
						<dt>涨跌幅</dt>
						<dd>
							<mm_number v-model="form.CHG" :min="0" :max="0" />
						</dd>
						<dt>总成交额</dt>
						<dd>
							<mm_number v-model="form.TOTAL" :min="0" :max="0" />
						</dd>
						<dt>成交量</dt>
						<dd>
							<mm_number v-model="form.VOL" :min="0" :max="2147483647" />
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
				url_submit: "/apis/stock/market_6?",
				url_get_obj: "/apis/stock/market_6?method=get_obj",
				field: "code",
				query: {
					"code": 0
				},
				form: {
						"code": '',
						"DATETIME": '',
						"HIGH": 0,
						"LOW": 0,
						"OPEN": 0,
						"CLOSE": 0,
						"LCLOSE": 0,
						"CHG": 0,
						"TOTAL": 0,
						"VOL": 0,
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

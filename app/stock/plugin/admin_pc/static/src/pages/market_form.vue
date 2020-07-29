<template>
	<main id="stock_market_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}股票行情</h5>
					</div>
					<div class="body">
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
							<dt>阶段</dt>
							<dd>
								<mm_select v-model="form.ok" :options="$to_kv(list_, 'ok', 'name')" />
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
				url_submit: "/apis/stock/market?",
				url_get_obj: "/apis/stock/market?method=get_obj",
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
					"ok": 0,
				},
				// 阶段
				'list_': [ ],
			}
		},
		methods: {
			/**
			 * 获取阶段
			 * @param {query} 查询条件
			 */
			get_(query) {
				var _this = this;
				if (!query) {
					query = {
						field: "ok,name"
					};
				}
				this.$get('~/apis/1已抓取，2已分析，3已计算?size=0', query, function(json) {
					if (json.result) {
						_this.list_ .clear();
						_this.list_ .addList(json.result.list)
					}
				});
			},
		},
		created() {
			// 获取阶段
			this.get_();
		}
	}
</script>

<style>
</style>

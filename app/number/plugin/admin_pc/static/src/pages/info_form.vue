<template>
	<main id="number_info_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<header class="arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}号码信息</h5>
					</header>
					<dl>
						<dt>是否私有</dt>
						<dd>
							<mm_switch v-model="form.private" />
						</dd>
						<dt>是否合约号</dt>
						<dd>
							<mm_switch v-model="form.heYue" />
						</dd>
						<dt>是否隐藏</dt>
						<dd>
							<mm_switch v-model="form.hide" />
						</dd>
						<dt>号码种类</dt>
						<dd>
							<mm_select v-model="form.kid" :options="$to_kv(arr_kid)" />
						</dd>
						<dt>寓意</dt>
						<dd>
							<mm_input v-model="form.yid" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>套餐ID</dt>
						<dd>
							<mm_input v-model="form.tid" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>城市ID</dt>
						<dd>
							<mm_number v-model="form.cityID" :min="0" :max="8388607" />
						</dd>
						<dt>供应商ID</dt>
						<dd>
							<mm_input v-model="form.gid" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>制式</dt>
						<dd>
							<mm_select v-model="form.sid" :options="$to_kv(arr_sid)" />
						</dd>
						<dt>处理人</dt>
						<dd>
							<mm_select v-model="form.user_id" :options="$to_kv(list_account, 'user_id', 'nickname')" />
						</dd>
						<dt>每日推荐ID</dt>
						<dd>
							<mm_input v-model="form.rid" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>均价</dt>
						<dd>
							<mm_number v-model="form.average" :min="0" :max="2147483647" />
						</dd>
						<dt>质量得分</dt>
						<dd>
							<mm_number v-model="form.score" :min="0" :max="2147483647" />
						</dd>
						<dt>话费</dt>
						<dd>
							<mm_number v-model="form.huaFei" :min="0" :max="2147483647" />
						</dd>
						<dt>卖价</dt>
						<dd>
							<mm_number v-model="form.maiJia" :min="0" :max="2147483647" />
						</dd>
						<dt>代理价</dt>
						<dd>
							<mm_number v-model="form.daiLiJia" :min="0" :max="2147483647" />
						</dd>
						<dt>底价</dt>
						<dd>
							<mm_number v-model="form.diJia" :min="0" :max="2147483647" />
						</dd>
						<dt>订单状态</dt>
						<dd>
							<mm_select v-model="form.order" :options="$to_kv(arr_order)" />
						</dd>
						<dt>热度</dt>
						<dd>
							<mm_number v-model="form.hot" :min="0" :max="2147483647" />
						</dd>
						<dt>收藏</dt>
						<dd>
							<mm_number v-model="form.collection" :min="0" :max="2147483647" />
						</dd>
						<dt>创建时间</dt>
						<dd>
							<mm_time v-model="form.createTime" type="datetime-local" />
						</dd>
						<dt>置顶时间</dt>
						<dd>
							<mm_time v-model="form.topTime" type="datetime-local" />
						</dd>
						<dt>更新时间</dt>
						<dd>
							<mm_time v-model="form.updateTime" type="datetime-local" />
						</dd>
						<dt class="required">号码</dt>
						<dd>
							<mm_input v-model="form.number" :minlength="0" :maxlength="0" placeholder="" :required="true"/>
						</dd>
						<dt>格式</dt>
						<dd>
							<mm_input v-model="form.format" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>活动</dt>
						<dd>
							<mm_input v-model="form.activity" :minlength="0" :maxlength="0" placeholder="有推荐 / 特价 / 包邮等" />
						</dd>
						<dt>分组</dt>
						<dd>
							<mm_input v-model="form.group" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>描述</dt>
						<dd>
							<mm_input v-model="form.desc" :minlength="0" :maxlength="0" placeholder="" />
						</dd>
						<dt>最低消费</dt>
						<dd>
							<mm_input v-model="form.diXiao" :minlength="0" :maxlength="0" placeholder="0为无最低消费" />
						</dd>
						<dt>操作日志</dt>
						<dd>
							<mm_textarea v-model="form.log" type="text" placeholder="" />
						</dd>
						<dt>备注</dt>
						<dd>
							<mm_textarea v-model="form.note" type="text" placeholder="" />
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
				url_submit: "/apis/number/info?",
				url_get_obj: "/apis/number/info?method=get_obj",
				field: "number_id",
				query: {
					"number_id": 0
				},
				form: {
						"number_id": 0,
						"private": 0,
						"heYue": 0,
						"hide": 0,
						"kid": 0,
						"yid": 0,
						"tid": 0,
						"cityID": 0,
						"gid": 0,
						"sid": 0,
						"user_id": 0,
						"rid": 0,
						"average": 0,
						"score": 0,
						"huaFei": 0,
						"maiJia": 0,
						"daiLiJia": 0,
						"diJia": 0,
						"order": 0,
						"hot": 0,
						"collection": 0,
						"createTime": '',
						"topTime": '',
						"updateTime": '',
						"number": '',
						"format": '',
						"activity": '',
						"group": '',
						"desc": '',
						"diXiao": '',
						"log": '',
						"note": '',
				},
				// 是否私有
				'arr_private': ['否','是'],
				// 是否合约号
				'arr_heYue': ['否','是'],
				// 是否隐藏
				'arr_hide': ['否','是'],
				// 号码种类
				'arr_kid': ['','手机号码','固定电话号码','企业电话号码','QQ号码','车牌号码'],
				// 制式
				'arr_sid': ['','移动','联通','电信'],
				// 处理人
				'list_account': [],
				// 订单状态
				'arr_order': ['','待售中','已预约','已售出','已下架','已删除'],
			}
		},
		methods: {
				/**
				 * 获取处理人
				 * @param {query} 查询条件
				 */
				get_account(query){
					var _this = this;
					if(!query){
						query = {
							field: "user_id,nickname"
						};
					}
					this.$get('~/apis/user/account?size=0', query, function(json) {
						if (json.result) {
							_this.list_account.clear();
							_this.list_account.addList(json.result.list)
						}
					});
				},
		},
		created() {
			// 获取处理人
			this.get_account();
		}
	}
</script>

<style>
</style>

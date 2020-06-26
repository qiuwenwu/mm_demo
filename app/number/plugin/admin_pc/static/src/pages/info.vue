<template>
	<main id="number_info">
		<mm_grid>
			<mm_col>
				<mm_view>
					<header class="arrow">
						<h5>号码信息</h5>
					</header>
					<mm_body>
						<mm_form class="mm_filter">
							<h5><span>筛选条件</span></h5>
							<mm_list col="3">
								<mm_col>
									<mm_select v-model="query.private" title="是否私有" :options="$to_kv(arr_private)" @change="search()" />
								</mm_col>
								<mm_col>
									<mm_select v-model="query.heYue" title="是否合约号" :options="$to_kv(arr_heYue)" @change="search()" />
								</mm_col>
								<mm_col>
									<mm_select v-model="query.hide" title="是否隐藏" :options="$to_kv(arr_hide)" @change="search()" />
								</mm_col>
								<mm_col>
									<mm_select v-model="query.kid" title="号码种类" :options="$to_kv(arr_kid)" @change="search()" />
								</mm_col>
								<mm_col>
									<mm_select v-model="query.sid" title="制式" :options="$to_kv(arr_sid)" @change="search()" />
								</mm_col>
								<mm_col>
									<mm_select v-model="query.user_id" title="处理人" :options="$to_kv(list_account, 'user_id', 'nickname')" @change="search()" />
								</mm_col>
								<mm_col>
									<mm_select v-model="query.order" title="订单状态" :options="$to_kv(arr_order)" @change="search()" />
								</mm_col>
								<mm_col>
									<mm_btn class="btn_primary-x" type="reset" @click.native="reset();search()">重置</mm_btn>
								</mm_col>
							</mm_list>
						</mm_form>
						<div class="mm_action">
							<h5><span>操作</span></h5>
							<div class="">
								<mm_btn class="btn_primary-x" url="./info_form">添加</mm_btn>
								<mm_btn @click.native="show = true" class="btn_primary-x" v-bind:class="{ 'disabled': !selects }">批量修改</mm_btn>
							</div>
						</div>
						<mm_table type="2">
							<thead>
								<tr>
									<th scope="col" class="th_selected"><input type="checkbox" :checked="select_state" @click="select_all()" /></th>
									<th scope="col" class="th_id"><span>#</span></th>
									<th scope="col">
										<mm_reverse title="是否私有" v-model="query.orderby" field="private" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="是否合约号" v-model="query.orderby" field="heYue" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="是否隐藏" v-model="query.orderby" field="hide" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="号码种类" v-model="query.orderby" field="kid" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="寓意" v-model="query.orderby" field="yid" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="套餐ID" v-model="query.orderby" field="tid" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="城市ID" v-model="query.orderby" field="cityID" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="供应商ID" v-model="query.orderby" field="gid" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="制式" v-model="query.orderby" field="sid" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="处理人" v-model="query.orderby" field="user_id" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="每日推荐ID" v-model="query.orderby" field="rid" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="均价" v-model="query.orderby" field="average" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="质量得分" v-model="query.orderby" field="score" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="话费" v-model="query.orderby" field="huaFei" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="卖价" v-model="query.orderby" field="maiJia" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="代理价" v-model="query.orderby" field="daiLiJia" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="底价" v-model="query.orderby" field="diJia" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="订单状态" v-model="query.orderby" field="order" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="热度" v-model="query.orderby" field="hot" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="收藏" v-model="query.orderby" field="collection" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="排序" v-model="query.orderby" field="display" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="创建时间" v-model="query.orderby" field="createTime" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="置顶时间" v-model="query.orderby" field="topTime" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="更新时间" v-model="query.orderby" field="updateTime" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="号码" v-model="query.orderby" field="number" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="格式" v-model="query.orderby" field="format" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="活动" v-model="query.orderby" field="activity" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="分组" v-model="query.orderby" field="group" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="描述" v-model="query.orderby" field="desc" :func="search"></mm_reverse>
									</th>
									<th scope="col">
										<mm_reverse title="最低消费" v-model="query.orderby" field="diXiao" :func="search"></mm_reverse>
									</th>
									<th scope="col" class="th_handle"><span>操作</span></th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(o, idx) in list" :key="idx" :class="{'active': select == idx}" @click="selected(idx)">
									<th scope="row"><input type="checkbox" :checked="select_has(o[field])" @click="select_change(o[field])" /></th>
									<td>
										<span>{{ o.number_id }}</span>
									</td>
									<td>
										<mm_switch v-model="o.private" @click.native="set(o)" />
									</td>
									<td>
										<mm_switch v-model="o.heYue" @click.native="set(o)" />
									</td>
									<td>
										<mm_switch v-model="o.hide" @click.native="set(o)" />
									</td>
									<td>
										<span>{{arr_kid[o.kid] }}</span>
									</td>
									<td>
										<span>{{ o.yid }}</span>
									</td>
									<td>
										<span>{{ o.tid }}</span>
									</td>
									<td>
										<span>{{ o.cityID }}</span>
									</td>
									<td>
										<span>{{ o.gid }}</span>
									</td>
									<td>
										<span>{{arr_sid[o.sid] }}</span>
									</td>
									<td>
										<span>{{ get_name(list_account, o.user_id, 'user_id', 'nickname') }}</span>
									</td>
									<td>
										<span>{{ o.rid }}</span>
									</td>
									<td>
										<span>{{ o.average }}</span>
									</td>
									<td>
										<span>{{ o.score }}</span>
									</td>
									<td>
										<span>{{ o.huaFei }}</span>
									</td>
									<td>
										<span>{{ o.maiJia }}</span>
									</td>
									<td>
										<span>{{ o.daiLiJia }}</span>
									</td>
									<td>
										<span>{{ o.diJia }}</span>
									</td>
									<td>
										<span>{{arr_order[o.order] }}</span>
									</td>
									<td>
										<span>{{ o.hot }}</span>
									</td>
									<td>
										<span>{{ o.collection }}</span>
									</td>
									<td>
										<input class="td_display" v-model.number="o.display" @blur="set(o)" min="0" max="1000" />
									</td>
									<td>
										<span>{{ $to_time(o.createTime, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.topTime, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ $to_time(o.updateTime, 'yyyy-MM-dd hh:mm') }}</span>
									</td>
									<td>
										<span>{{ o.number }}</span>
									</td>
									<td>
										<span>{{ o.format }}</span>
									</td>
									<td>
										<span>{{ o.activity }}</span>
									</td>
									<td>
										<span>{{ o.group }}</span>
									</td>
									<td>
										<span>{{ o.desc }}</span>
									</td>
									<td>
										<span>{{ o.diXiao }}</span>
									</td>
									<td>
										<mm_btn class="btn_primary" :url="'./info_form?number_id=' + o[field]">修改</mm_btn>
										<mm_btn class="btn_warning" @click.native="del_show(o, field)">删除</mm_btn>
									</td>
								</tr>
							</tbody>
						</mm_table>
					</mm_body>
					<footer>
						<mm_grid class="mm_data_count">
							<mm_col>
								<mm_select v-model="query.size" :options="$to_size()" @change="search()" />
							</mm_col>
							<mm_col width="50" style="min-width: 22.5rem;">
								<mm_pager display="2" v-model="query.page" :count="count / query.size" :func="goTo" :icons="['首页', '上一页', '下一页', '尾页']"></mm_pager>
							</mm_col>
							<mm_col>
								<div class="right plr">
									<span class="mr">共 {{ count }} 条</span>
									<span>当前</span>
									<input class="pager_now" v-model.number="page_now" @blur="goTo(page_now)" @change="page_change" />
									<span>/{{ page_count }}页</span>
								</div>
							</mm_col>
						</mm_grid>
					</footer>
				</mm_view>
			</mm_col>
		</mm_grid>
		<mm_modal v-model="show" mask="true">
			<mm_view class="card bg_no">
				<header class="bg_white">
					<h5>批量修改</h5>
				</header>
				<mm_body>
					<dl>
						<dt>是否私有</dt>
						<dd>
							<mm_select v-model="form.private" :options="$to_kv(arr_private)" />
						</dd>
						<dt>是否合约号</dt>
						<dd>
							<mm_select v-model="form.heYue" :options="$to_kv(arr_heYue)" />
						</dd>
						<dt>是否隐藏</dt>
						<dd>
							<mm_select v-model="form.hide" :options="$to_kv(arr_hide)" />
						</dd>
						<dt>号码种类</dt>
						<dd>
							<mm_select v-model="form.kid" :options="$to_kv(arr_kid)" />
						</dd>
						<dt>制式</dt>
						<dd>
							<mm_select v-model="form.sid" :options="$to_kv(arr_sid)" />
						</dd>
						<dt>处理人</dt>
						<dd>
							<mm_select v-model="form.user_id" :options="$to_kv(list_account, 'user_id', 'nickname')" />
						</dd>
						<dt>订单状态</dt>
						<dd>
							<mm_select v-model="form.order" :options="$to_kv(arr_order)" />
						</dd>
					</dl>
				</mm_body>
				<footer>
					<div class="mm_group">
						<button class="btn_default" type="reset" @click="show = false">取消</button>
						<button class="btn_primary" type="button" @click="batchSet()">提交</button>
					</div>
				</footer>
			</mm_view>
		</mm_modal>
	</main>
</template>

<script>
	import mixin from '/src/mixins/page.js';

	export default {
		mixins: [mixin],
		data() {
			return {
				// 列表请求地址
				url_get_list: "/apis/number/info",
				url_del: "/apis/number/info?method=del&",
				url_set: "/apis/number/info?method=set&",
				field: "number_id",
				query_set: {
					"number_id": ""
				},
				// 查询条件
				query: {
					//页码
					page: 1,
					//页面大小
					size: 10,
					// 号码ID
					'number_id': 0,
					// 是否私有
					'private': '',
					// 是否合约号
					'heYue': '',
					// 是否隐藏
					'hide': '',
					// 城市ID——最小值
					'cityID_min': 0,
					// 城市ID——最大值
					'cityID_max': 0,
					// 均价——最小值
					'average_min': 0,
					// 均价——最大值
					'average_max': 0,
					// 质量得分——最小值
					'score_min': 0,
					// 质量得分——最大值
					'score_max': 0,
					// 话费——最小值
					'huaFei_min': 0,
					// 话费——最大值
					'huaFei_max': 0,
					// 卖价——最小值
					'maiJia_min': 0,
					// 卖价——最大值
					'maiJia_max': 0,
					// 代理价——最小值
					'daiLiJia_min': 0,
					// 代理价——最大值
					'daiLiJia_max': 0,
					// 底价——最小值
					'diJia_min': 0,
					// 底价——最大值
					'diJia_max': 0,
					// 订单状态——最小值
					'order_min': '',
					// 订单状态——最大值
					'order_max': '',
					// 热度——最小值
					'hot_min': 0,
					// 热度——最大值
					'hot_max': 0,
					// 收藏——最小值
					'collection_min': 0,
					// 收藏——最大值
					'collection_max': 0,
					// 排序——最小值
					'display_min': 0,
					// 排序——最大值
					'display_max': 0,
					// 创建时间——开始时间
					'createTime_min': '',
					// 创建时间——结束时间
					'createTime_max': '',
					// 置顶时间——开始时间
					'topTime_min': '',
					// 置顶时间——结束时间
					'topTime_max': '',
					// 更新时间——开始时间
					'updateTime_min': '',
					// 更新时间——结束时间
					'updateTime_max': '',
					//排序
					orderby: ""
				},
				form: {},
				//颜色
				arr_color: ['', '', 'font_yellow', 'font_success', 'font_warning', 'font_primary', 'font_info', 'font_default'],
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
				// 视图模型
				vm: {}
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

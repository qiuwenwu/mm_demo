<template>
	<div>
		<span>
			关键词
		</span>
		
		<input type="text" v-model="keyword" />
		<button @click="">
			下载
		</button>
	</div>
</template>

<script>
	import mixin from '/src/mixins/page.js';
	
	export default {
		mixins: [mixin],
		data() {
			return {
				// 列表请求地址
				url_get_list: "/apis/spiders/qrcode",
				url_del: "/apis/spiders/qrcode?method=del&",
				url_set: "/apis/spiders/qrcode?method=set&",
				field: "qid",
				query_set: {
					"qid": ""
				},
				// 查询条件
				query: {
					//页码
					page: 1,
					//页面大小
					size: 10,
					// 二维码编号
					'qid': 0,
					// 标签
					'tag': '',
					// 发布时间——开始时间
					'time_min': '',
					// 发布时间——结束时间
					'time_max': '',
					// 标题
					'title': '',
					// 创建时间——开始时间
					'time_create_min': '',
					// 创建时间——结束时间
					'time_create_max': '',
					// 更新时间——开始时间
					'time_update_min': '',
					// 更新时间——结束时间
					'time_update_max': '',
					// 关键词
					'keyword': '',
					//排序
					orderby: ""
				},
				form: {},
				keyword:"",
				//颜色
				arr_color: ['', '', 'font_yellow', 'font_success', 'font_warning', 'font_primary', 'font_info', 'font_default'],
				// 视图模型
				vm: {}
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

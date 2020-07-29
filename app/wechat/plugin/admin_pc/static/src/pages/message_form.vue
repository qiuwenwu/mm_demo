<template>
	<main id="wechat_message_form">
		<mm_grid>
			<mm_col width="33">
				<mm_form class="card">
					<div class="head arrow">
						<h5>{{ form[field] ? '修改' : '创建' }}微信消息</h5>
					</div>
					<div class="body">
						<dl>
							<dt>结束会话</dt>
							<dd>
								<mm_switch v-model="form.end" />
							</dd>
							<dt>阶段</dt>
							<dd>
								<mm_number v-model="form.stage" :min="0" :max="9" />
							</dd>
							<dt>微信消息ID</dt>
							<dd>
								<mm_input v-model="form.msgid" :minlength="0" :maxlength="0" placeholder="来自微信公众号的消息ID" />
							</dd>
							<dt>用户群组</dt>
							<dd>
								<mm_input v-model="form.group" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>消息类型</dt>
							<dd>
								<mm_input v-model="form.msg_type" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>发信人名称</dt>
							<dd>
								<mm_input v-model="form.name" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>会话类型</dt>
							<dd>
								<mm_input v-model="form.type" :minlength="0" :maxlength="0" placeholder="一般情况下，1永久会话/群 / 2临时会话/群" />
							</dd>
							<dt>所使用的指令</dt>
							<dd>
								<mm_input v-model="form.cmd" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>应用ID</dt>
							<dd>
								<mm_input v-model="form.appid" :minlength="0" :maxlength="0" placeholder="绑定到该服务下的应用" />
							</dd>
							<dt>会话发起人</dt>
							<dd>
								<mm_input v-model="form.from_user" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>会话接收人</dt>
							<dd>
								<mm_input v-model="form.to_user" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>服务的机器人</dt>
							<dd>
								<mm_input v-model="form.robot" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>聊天ID</dt>
							<dd>
								<mm_input v-model="form.chatid" :minlength="0" :maxlength="0" placeholder="用于消息回复和推送消息" />
							</dd>
							<dt>发信人头像</dt>
							<dd>
								<mm_input v-model="form.avatar" :minlength="0" :maxlength="0" placeholder="" />
							</dd>
							<dt>复查指令</dt>
							<dd>
								<mm_input v-model="form.check" :minlength="0" :maxlength="0" placeholder="当用户再驱动指令而缺少参数时，执行该语句" />
							</dd>
							<dt>关键词句</dt>
							<dd>
								<mm_input v-model="form.keyword" :minlength="0" :maxlength="0" placeholder="除指令外，过滤 / 抽取后的词句" />
							</dd>
							<dt>表单</dt>
							<dd>
								<mm_textarea v-model="form.form" type="text" placeholder="用于记录用户已填参数" />
							</dd>
							<dt>最后会话</dt>
							<dd>
								<mm_textarea v-model="form.content_last" type="text" placeholder="记录用户最后一次会话内容" />
							</dd>
							<dt>会话正文</dt>
							<dd>
								<mm_textarea v-model="form.content" type="text" placeholder="" />
							</dd>
							<dt>备注信息</dt>
							<dd>
								<mm_textarea v-model="form.note" type="text" placeholder="" />
							</dd>
							<dt>关键词</dt>
							<dd>
								<mm_input v-model="form.keyword" :minlength="0" :maxlength="0" placeholder="发信人名称 / 最后会话 / 会话正文" />
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
				url_submit: "/apis/wechat/message?",
				url_get_obj: "/apis/wechat/message?method=get_obj",
				field: "message_id",
				query: {
					"message_id": 0
				},
				form: {
					"message_id": 0,
					"end": 0,
					"stage": 0,
					"msgid": 0,
					"group": '',
					"msg_type": '',
					"name": '',
					"type": '',
					"cmd": '',
					"appid": '',
					"from_user": '',
					"to_user": '',
					"robot": '',
					"chatid": '',
					"avatar": '',
					"check": '',
					"keyword": '',
					"form": '',
					"content_last": '',
					"content": '',
					"note": '',
					"keyword": '',
				},
				// 结束会话
				'arr_end': [ '未结束' , '已结束' ],
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

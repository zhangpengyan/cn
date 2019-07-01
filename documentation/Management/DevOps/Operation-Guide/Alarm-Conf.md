# 报警配置

用户不可能时时刻刻关注每一个监控项的数据变化情况，因此需通过配置有效、合理的报警策略，在机器、服务等发生异常、错误时，让系统自动给用户发送报警通知。

功能特性：

•      监控数据分两路发送至报警和存储，存储不影响报警速度

•      有效的报警收敛手段，防止报警风暴

•      丰富的异常检测算法，支持值改变报警、阈值报警、突升突降报警、无数据报警

•      支持报警回调，可自动化处理简单故障

•      数据延迟的解决：如发生延时，被认定为异常报警

## 操作指南


选中产品线或产品线以下的服务树节点，菜单选择【智能监控】-【监控配置】，在“报警配置”页，点击右侧“新建”按钮，打开如图所示的报警配置窗口。

支持通过表单或JSON的方式配置。

名称：设置该条报警配置的名称，

范围&节点：选择报警配置的范围和具体节点

报警级别：共设四个级别，分别是P0（FATAL)、P1（CRITICAL)、P2（WARNING)、P3(NOTICE),严重程度依次减轻。

描述：为报警添加中文描述

**报警规则**：在此配置报警策略，包括监控项、生效分组，和具体的规则。表单支持配置阈值和无数据报警。可添加多个报警规则，设置且（同时满足才报警）、或（满足其一即报警）的依赖关系。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide47.jpg)

报警间隔：两次报警通知之间的间隔时间

报警回调：报警回调，可用于配置触发一些操作, 目前支持HTTP的GET和POST方式请求。帮助用户在故障发生时，通过访问回调url, 自动处理故障，快速止损。

最大报警次数：触发报警后最多发送几次报警通知。

生效时间：报警开启时间。

开启报警：设置是否开启报警配置。

开启报警合并：有效的报警收敛方式，监控项的ns类型为HOST/INSTANCE时才可进行合并。方式包括BY\_APP、BY\_GROUP，当多个ns同时触发报警时，第一条报警通知里包含一个ns，其后的报警通知将合并发送，展示一个ns，其余用N台NS报警合并>）的方式告知。

接收恢复通知：报警事件恢复时，是否发送通知。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide48.jpg)

报警方式：选择报警通知的方式，可多选，其中语音报警默认绑定发送短信。

报警组：这里的报警组可选节点报警组和全局报警组，接收除语音外其他方式的报警通知。

值班组：值班组主要接收语音报警，同时发送短信

语音生效时间：配置语音报警的生效时间段。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide49.jpg)

## JSON配置用例


**（1）JSON配置字段说明**

```json
{
	"JUDGE": {
		"alarmInterval": [
			5
		],  ---【配置报警时间间隔，可设置为数组（20,2,5…触发时间点为第一次，20为第一次与第二次的时间间隔）】
		"switchConfig": {
			"enableTime": {
				"beginTime": "00:00",
				"endTime": "23:59"
			},
			"on": true
		},  ---【报警开关，是否开启；开启时间段】
		"level": "WARNING",  ---【报警级别】
		"conditionTagEqual": false,
		"conditionOperator": "&&",  ---【报警依赖关系，||或者&&，或关系，且关系】
		"conditionList": [  ---【报警规则（可添加多个依赖规则）】
			{
				"formula": "必填cpu.idle < 80",  ---【监控项报警的判断规则】
				"metricDataFilter": {  ---【筛选监控项统计值类型、tag匹配结果为true的监控项】
					"tags": "",  ---【监控项tags，支持包含与不包含的关系。HasTag（1个参数）、NotHasTag、TagValueIn、TagValueNotIn(\"core\", \"1,2,3\")指 tag value不在此范围内才满足。tag字段为空时，匹配不含tag的监控项】
					"valueType": "STATISTIC",  ---【支持STRING、STATISTIC】
					"valueKey": "AVG"  ---【MAX|AVG等，valueType=STATISTIC时生效】
				},
				"parameter": {
					"simple": [
						5,
						3
					]  ---【代表采集到的数据m次中n次满足报警阈值，使用突升突降报警时，此规则失效】
				},
				"nsFilter": "",  ---【筛选ns，具体筛选方式见下表】
				"nsType": "HOST",  ---【HOST（机器、死机、agent）|INSTANCE（进程、端口、ssh、日志、自定义）|APP（聚合监控）|DOMAIN（域名监控）】
				"ns": ""
			}
		]
	}
}
```

nsFilter支持的函数：

| 函数名称       | 参数个数 | 函数说明                    | 举例                                         |
| -------------- | -------- | --------------------------- | -------------------------------------------- |
| GroupIn        | 1        | 分组在此范围内              | GroupIn(\\"pre,online\\"\)                   |
| HasHostTag     | 1        | 包含此HostTag返回true       | HasHostTag(\\"backup\\")                     |
| HostTagValueIn | 2        | 指定HostTag的值在指定范围内 | HostTagValueIn(\\"version\\", \\"1.0,2.0\\") |
| NsContain      | 1        | ns里包含指定的字符串        | NsContain(\\"judge-hawkeye-ark\\")          |
| HasTag         | 1        | 包含tag                     | HasTag(\\"lang\\")                           |
| TagValueIn     | 2        | 指定tag的值在指定范围内     | TagValueIn(\\"priority\\",\\"0,1\\")         |



```json
{
	"ALERT": {
		"tagTransDict": [
			{
				"dict": [
					""
				],
				"tag": ""
			}
		],  ---【说明tag的value的中文解释。tag中填key，dict中填转义】
		"noticer": "$sys_op$,$app_dev$",  ---【报警组】
		"callNoticer": "$product_onCall$",  ---【值班组】
		"callEnableTime": {
			"beginTime": "21:00",
			"endTime": "09:00"
		},  ---【值班组接收报警时间】
		"note": "",---【添加报警配置的中文描述】
		"merge": {
			"on": true,
			"method": "BY_APP"
		}, ---【报警合并，前提，监控项的ns类型为HOST/INSTANCE时才可进行合并。方式：BY_APP、BY_GROUP(第一条报警放一个ns，后面的合并发送，<{{.N}}台NS报警合并>）】
		"sendFlag": 7, ---【sendFlag：数值。1只发邮件，2只发短信，4只发咚咚，8只发语音；多种通知                            方式组合，值是对应多个通知方式的数值之和】
		"maxAlarmTime": 3,  ---【设置报警恢复之前，发送报警通知的最大次数】
		"sendRecoveryNotice": true,  ---【报警事件恢复时，是否接收恢复通知】
		"callback": {  ---【报警回调】
			"timing": {
				"whenNoticeComes": true,  ---【触发报警时即回调】
				"atFirstTime": false,  ---【默认每次触发报警回调，true，第一次触发报警时回调】
				"whenEventEnds": true  ---【事件恢复时回调】
			},
			"parameter": {
				"url": "",  ---【回调地址】
				"requestMethod": "POST",  ---【请求方式，支持POST和GET两种方式】
				"header": {
					"Content-Type": "application/x-www-form-urlencoded"
				},  ---【请求头，可在此填入请求头中的字段值对】
				"postData": ""  ---【请求体】
			},
			"type": "CURL",  ---【回调方式，curL命令】
			"on": false  ---【设置是否开启回调】
		}
	}
}
```

**（2）监控项值变化报警**      

监控项值变化报警: formula字段配置ValueChange(metricname)函数，括号中填入监控项名称。

**（3）监控项无数据报警**      

无数据报警： formula字段配置Nodata(metricname,n或t)函数

•       Nodata(cpu.idle, 3)3表示3个周期

•       Nodata(cpu.idle, "1h45m"), 表示cpu.idle缺失1小时45分钟以上为 true

**（4）流量等突升突降报警**      

```json
"parameter": {
"advanced": {
  "param": [
    [
      0.1, 0.1
    ],
    [
      0.05, 0.07
    ],
    [
      0.07, 0.15
    ],
    [
      0.05, 0.2
    ]
  ],  ---【4组参数分别代表工作日忙时/工作日闲时/周末忙时/周末闲时配置,每组配置的两个参数为上升百分比阈值,下降百分比阈值】
"disableSwitch": {
  "on": false,
  "disableTime": [
    {
      "beginTime": "00:15",
      "endTime": "00:31",
    }
  ],
  "minActiveValue": 5000
},
}
```

>`
disableSwitch配置说明:
`

>`disableTime: 时间段是闭开区间的, 也就是想屏蔽0点15-0点30的突升突降,endTime需要写00:31,小时位和分钟位都必须为2位的字符串,小时位为24小时制,  beginTime必须小于endTime`

>` minActiveValue: 用来设置一个进行判断突升突降变化的最小值，避免一些无谓的报警.当且仅当两个窗口均值都大于此值时，才会进行异常判断. 设置此值的同时请注意设置on为true
`

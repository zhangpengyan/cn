# Tags使用说明

tag可以理解为标签，或属性，比如微信里给微信好友添加标签的功能。使用tag可以非常方便地标识一个或一类对象，从而在操作过程中将具有某一特征或某一标签的对象筛选出来。

在智能监控平台，tag主要分为两类：

（1）监控对象的tag：主要指应用、分组、实例、机器的tag，分组和实例的tag可用于标记生产环境、所属区域等，为机器打tag可以标记机器的服务器类型等。

（2）监控项的tag：监控项tag包括平台默认添加的，和日志监控、自定义监控中用户自定义的，作为监控项的属性，便于用户区分不同属性下监控项的值。使用方式为，在监控项后加“/key=value”的形式表示，key为tag的关键字，value为tag的值。[key的命名支持 英文字母、数字、"、_"（下划线）、 "."(英文句号）和"-"(英文中划线)。]

平台默认添加tag的监控项有：

- cpu.idle/core=0，1..、表示具体某核的cpu空闲率；
- disk使用情况监控项， mount=/，表示具体挂载点的磁盘使用情况
- disk.io的，/device=sda,..tag表示具体某个分区的io情况
- net.in/out的,  /iface=eth0,tag表示具体某网络接口的网络流入流出情况
- 域名监控项的tag，sidc，sisp分别表示机房、运营商。

## 使用指南


**（一）为监控对象添加tag**

需要明确的一点是，tag是可以向下继承的，应用的tag可以继承给分组，分组的可以继承给实例，继承的tag如果在上层节点删除了，下层节点也会同步删除。

（1）在使用tag之前，首先需要为应用、分组、实例、机器添加tag，具体操作如下。

​    a. 为应用添加tag：左侧服务树选中应用节点，菜单选择【配置管理】-【服务树】，进入如图所示的编辑应用页面，在Tags字段后，点击添加按钮，以key:value的形式添加tag，点击最下方的”确定“按钮保存。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide52.jpg)

 b. 为分组添加tag：同样地，左侧服务树选中应用节点，菜单选择【配置管理】-【服务树】，进入如图所示的编辑应用页面，点击“编辑分组”tab“，在如图所示页面，可以添加、编辑分组的tag。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide53.jpg)

 c. 为实例添加tag：同样地，进入如图所示的编辑应用页面，点击“编辑实例”tab“，可以添加、编辑实例的tag。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide54.jpg)

 d. 为机器添加tag：打开编辑应用页面，点击“主机列表”tab“，选中机器后，点击列表上方的“批量打tag",为机器添加tag。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide55.jpg)

（二）监控项tag的配置

（1）如上所述，平台默认添加tag的监控项有：

- ​      cpu.idle/core=0，1..、表示具体某核的cpu空闲率；
- ​      disk使用情况监控项， mount=/，表示具体挂载点的磁盘使用情况
- ​      disk.io的，/device=sda,..tag表示具体某个分区的io情况
- ​      net.in/out的,  /iface=eth0,tag表示具体某网络接口的网络流入流出情况
- ​      域名监控项的tag，sidc，sisp分别表示机房、运营商。

（2）日志监控可根据日志内容配置监控项的tag，如图所示为获取不同status的响应时间。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide56.JPG)

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide57.jpg)

（3）自定义监控，可在脚本中定义输出的监控项及其tag，具体配置方式可参考自定义监控的采集配置。

（三）tag的使用

（1）在一次聚合配置中使用tag

在一次聚合中，选择带tag的监控项，如图所示选择磁盘可用率，在聚合时即可在tag维度聚合，汇总不同磁盘挂载点的磁盘可用率。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide58.jpg)

（2）在二次聚合配置中使用tag

在二次聚合中，对参与计算的监控项，使用filterTags字段筛选tag，格式为：key=[value1|value2|value3]，如：isp=[dx|lt|yd],\_group=[mjq|langfang]。表示筛选出所选运营商，所选分组的数据参与聚合。

（3）在报警配置中使用tag

在表单化报警配置中，对带tag的监控项配置报警时，可以通过tag值进行筛选，如图为域名监控的监控项，选择sidc=mjq表示只对该机房配置该条报警。方便用户灵活配置报警。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide59.jpg)

在JSON报警配置中，tags字段用于配置监控项tag，nsFilter字段可对监控对象（应用、实例、机器等）进行筛选，实现对部分分组、部分机器等的报警。

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


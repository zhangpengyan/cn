# describeAlarmHistory


## 描述
查询报警历史

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v2/groupAlarmsHistory


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Long|False| |当前所在页，默认为1|
|**pageSize**|Long|False| |页面大小，默认为20；取值范围[1, 100]|
|**serviceCode**|String|False| |产品线标识，同一个产品线下可能存在多个product，如(redis下有redis2.8cluster、redis4.0)|
|**product**|String|False| |产品标识,默认返回该product下所有dimension的数据。eg:product=redis2.8cluster（redis2.8cluster产品下包含redis2.8-shard与redis2.8-proxy、redis2.8-instance多个维度)。|
|**dimension**|String|False| |维度标识、指定该参数时，查询只返回该维度的数据。如redis2.8cluster下存在实例、分片等多个维度|
|**isAlarming**|Long|False| |正在报警, 取值为1|
|**status**|Long|False| |报警的状态,1为报警恢复、2为报警、4为报警恢复无数据|
|**startTime**|String|False| |开始时间|
|**endTime**|String|False| |结束时间|
|**ruleType**|Long|False| |规则类型,默认查询1， 1表示资源监控，6表示站点监控,7表示可用性监控|
|**ruleName**|String|False| |规则名称模糊搜索|
|**filters**|Filter[]|False| |serviceCodes - 产品线servicecode，精确匹配，支持多个<br>resourceIds - 资源Id，精确匹配，支持多个（必须指定serviceCode才会在该serviceCode下根据resourceIds过滤，否则该参数不生效）<br>alarmIds - 规则Id，精确匹配，支持多个|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| | |
|**values**|String[]|False| | |

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**alarmHistoryList**|DescribedAlarmHistory[]|告警历史列表|
|**numberPages**|Long|总页数|
|**numberRecords**|Long|总记录数|
|**pageNumber**|Long|当前页码|
|**pageSize**|Long|分页大小|
### DescribedAlarmHistory
|名称|类型|描述|
|---|---|---|
|**alarmId**|String|报警规则ID|
|**dimension**|String|资源维度|
|**dimensionName**|String|资源维度名称|
|**durationTimes**|Long|告警持续次数|
|**noticeDurationTime**|Long|告警持续时间，单位分钟|
|**noticeLevel**|String|用于前端显示的‘触发告警级别’。从低到高分别为‘普通’, ‘紧急’, ‘严重’|
|**noticeLevelTriggered**|String|触发的告警级别。从低到高分别为‘common’, ‘critical’, ‘fatal’|
|**noticeTime**|String|告警时间|
|**product**|String|资源类型|
|**productName**|String|资源类型名称|
|**receivers**|NoticeReceiver[]|告警通知人|
|**resourceId**|String|资源Id|
|**rule**|BasicRuleDetail| |
|**ruleType**|String|规则类型|
|**status**|Long|告警类型  1-告警恢复  2-告警 4-数据不足|
|**tags**|Object|资源tags|
|**value**|Double|告警值|
### BasicRuleDetail
|名称|类型|描述|
|---|---|---|
|**calculateUnit**|String|指标的计算单位，比如bit/s、%、k等|
|**calculation**|String|统计方法，必须与定义的metric一致，可选值列表：avg,sum,max,min|
|**downSample**|String|降采样函数|
|**metric**|String|监控项唯一标识，可根据DescribeMetricsForCreateAlarm接口查询各产品线可用的监控项（创建规则时使用Metric字段）。格式：metric:downsample|
|**metricName**|String|监控项名称|
|**noticeLevel**|NoticeLevel| |
|**operation**|String|报警比较符，只能为以下几种lte(<=),lt(<),gt(>),gte(>=),eq(==),ne(!=)|
|**period**|Long|查询指标的周期，单位为分钟,目前支持的取值：1,2，5，10,15，30，60|
|**threshold**|Double|报警阈值，目前只开放数值类型功能|
|**times**|Long|连续探测几次都满足阈值条件时报警，可选值:1,2,3,5,10,15,30,60|
### NoticeLevel
|名称|类型|描述|
|---|---|---|
|**custom**|Boolean|是否为用户自己定义的级别，自定义(true) or 固定(false)|
|**levels**|Object|报警级别以及对应的阈值，是一个map[string]float64对象。key:common(一般)、critical(严重)、 fatal(紧急),value:各报警级别对应的阀值，要符合operation参数对应的递进关系。 eg: "levels":{"common":1000,"critical":10000,"fatal":15000}|
### NoticeReceiver
|名称|类型|描述|
|---|---|---|
|**email**|String| |
|**mobile**|String| |
|**personId**|Long| |
|**pin**|String| |
|**userName**|String| |

## 返回码
|返回码|描述|
|---|---|
|**200**|查询告警历史|

# updateAlarm


## 描述
修改已创建的报警规则

## 请求方式
PATCH

## 请求地址
https://monitor.jdcloud-api.com/v1/regions/{regionId}/alarms/{alarmId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**alarmId**|String|True| |规则id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**contacts**|BaseContact[]|False| |通知联系人|
|**rule**|BaseRule|True| | |
|**webHookContent**|String|False| |回调content 注：仅webHookUrl和webHookContent均不为空时，才会创建webHook|
|**webHookProtocol**|String|False| |webHook协议|
|**webHookSecret**|String|False| |回调secret，用户请求签名，防伪造|
|**webHookUrl**|String|False| |回调url|

### BaseRule
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**autoScalingPolicyId**|String|False| |弹性伸缩组ID|
|**calculateUnit**|String|True| |单位|
|**calculation**|String|True| |统计方法，必须与定义的metric一致，可选值列表：avg,sum,max,min|
|**downSample**|String|True| |降采样函数|
|**metric**|String|True| |监控项|
|**noticeLevel**|NoticeLevel|False| | |
|**noticePeriod**|Long|True| |通知周期，单位：小时|
|**operation**|String|True| |报警比较符，只能为以下几种lte(<=),lt(<),gt(>),gte(>=),eq(==),ne(!=)|
|**period**|Long|True| |查询指标的周期，单位为分钟,目前支持的取值：1,2，5，15，30，60|
|**ruleType**|Long|False| |规则类型, 1云监控的规则， 6站点监控。默认为1|
|**tags**|Object|False| |多值标签|
|**threshold**|Double|True| |报警阈值，目前只开放数值类型功能|
|**times**|Long|True| |连续探测几次都满足阈值条件时报警，可选值:1,2,3,5,10,15,30,60|
### NoticeLevel
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**custom**|Boolean|True| |是否为用户自己定义的级别，自定义(true) or 固定(false)|
|**levels**|Object|True| |报警级别以及对应的阈值，是一个map[string]float64对象。key:common(一般)、critical(严重)、 fatal(紧急),value:各报警级别对应的阀值，要符合operation参数对应的递进关系。 eg: "levels":{"common":1000,"critical":10000,"fatal":15000}|
### BaseContact
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**referenceId**|Long|True| |联系人id|
|**referenceType**|Long|True| |联系人id类型：0,联系人分组id;1,联系人id|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Object| |
|**requestId**|String|请求的标识id|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|

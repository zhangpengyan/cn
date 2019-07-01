# createAlarm


## 描述
创建报警规则，可以为某一个实例创建报警规则，也可以为多个实例同时创建报警规则。

## 请求方式
POST

## 请求地址
https://monitor.jdcloud-api.com/v1/regions/{regionId}/alarms

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**clientToken**|String|True| |幂等性校验参数,最长36位,若两个请求clientToken相等，则返回第一次创建的规则id，只创建一次规则|
|**createAlarmSpec**|CreateAlarmParam|True| | |

### CreateAlarmParam
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**calculateUnit**|String|True| |单位|
|**calculation**|String|True| |统计方法，必须与定义的metric一致，可选值列表：avg,sum,max,min|
|**contactGroups**|String[]|False| |报警规则通知的联系组，必须在控制台上已创建，例如" ['联系组1','联系组2']"|
|**contactPersons**|String[]|False| |报警规则通知的联系人，必须在控制台上已创建，例如 [“联系人1”,”联系人2”]|
|**downSample**|String|True| |降采样函数|
|**metric**|String|True| |根据产品线查询可用监控项列表 接口 返回的Metric字段|
|**noticeLevel**|NoticeLevel|False| | |
|**noticePeriod**|Long|False| |通知周期 单位：小时|
|**operation**|String|True| |报警比较符，只能为以下几种lte(<=),lt(<),gt(>),gte(>=),eq(==),ne(!=)|
|**period**|Long|True| |查询指标的周期，单位为分钟,目前支持的取值：1，2，5，15，30，60|
|**resourceIds**|String[]|True| |报警规则对应实例列表，每次最多100个，例如"['resourceId1','resourceId2']"|
|**serviceCode**|String|True| |产品名称|
|**tags**|Object|False| |多值标签|
|**threshold**|Double|True| |报警阈值，目前只开放数值类型功能|
|**times**|Long|True| |连续探测几次都满足阈值条件时报警，可选值:1,2,3,5,10,15,30,60|
|**webHookContent**|String|False| |回调content 注：仅webHookUrl和webHookContent均不为空时，才会创建webHook|
|**webHookProtocol**|String|False| |webHook协议|
|**webHookSecret**|String|False| |回调secret，用户请求签名，防伪造|
|**webHookUrl**|String|False| |回调url|
### NoticeLevel
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**custom**|Boolean|True| |是否为用户自己定义的级别，自定义(true) or 固定(false)|
|**levels**|Object|True| |报警级别以及对应的阈值，是一个map[string]float64对象。key:common(一般)、critical(严重)、 fatal(紧急),value:各报警级别对应的阀值，要符合operation参数对应的递进关系。 eg: "levels":{"common":1000,"critical":10000,"fatal":15000}|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**alarmIdList**|String[]|创建成功的规则id列表|

## 返回码
|返回码|描述|
|---|---|
|**200**|创建规则|

# describeAlarmHistory


## 描述
查询报警历史
检索条件组合优先级从高到低为
1. alarmId
2. serviceCode
2.1 serviceCode + resourceId
2.2 serviceCode + resourceIds
3. serviceCodes
4. 用户所有规则

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v1/regions/{regionId}/alarmHistory

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Long|False| |当前所在页，默认为1|
|**pageSize**|Long|False| |页面大小，默认为20；取值范围[1, 100]|
|**serviceCode**|String|False| |产品线|
|**resourceId**|String|False| |资源Id|
|**resourceIdList**|String[]|False| |resourceId列表|
|**alarmId**|String|False| |规则Id|
|**alarming**|Long|False| |正在报警, 取值为1|
|**serviceCodeList**|String[]|False| |产品线列表|
|**startTime**|String|False| |开始时间|
|**endTime**|String|False| |结束时间|
|**ruleType**|Long|False| |规则类型,默认查询1， 1表示资源监控，6表示站点监控,7表示可用性监控|
|**filters**|Filter[]|False| |服务码或资源Id列表<br>filter name 为serviceCodes表示查询多个产品线的规则<br>filter name 为resourceIds表示查询多个资源的规则|

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
|**total**|Long|总数|
### DescribedAlarmHistory
|名称|类型|描述|
|---|---|---|
|**alarm**|DescribedAlarm| |
|**contacts**|DescribedNoticeContacts[]|告警联系人|
|**noticeLevelTriggered**|String|触发的告警级别。从低到高分别为‘common’, ‘critical’, ‘fatal’|
|**noticeTime**|String|告警时间|
|**value**|Double|告警值|
### DescribedNoticeContacts
|名称|类型|描述|
|---|---|---|
|**referenceId**|Long|联系人ID|
|**referenceType**|Long|联系人类型。 0 - 联系人分组id， 1 - 联系人id|
### DescribedAlarm
|名称|类型|描述|
|---|---|---|
|**calculateUnit**|String|计算单位|
|**calculation**|String|统计方法：平均值=avg、最大值=max、最小值=min|
|**createTime**|String|创建时间|
|**downSample**|String|降采样方法|
|**enabled**|Long|是否启用|
|**id**|String|报警规则ID|
|**metric**|String|监控项|
|**metricName**|String|监控项名称|
|**noticeLevel**|NoticeLevel| |
|**noticePeriod**|Long|告警周期|
|**operation**|String|gt, gte, lt, lte, eq, ne|
|**period**|Long|统计周期（单位：分钟）|
|**region**|String|地域信息|
|**resourceId**|String|资源id|
|**serviceCode**|String|产品线编码|
|**status**|Long|监控项状态：1正常，2告警，4数据不足|
|**tags**|Object|标签|
|**threshold**|Double|告警阈值|
|**times**|Long|告警次数|
### NoticeLevel
|名称|类型|描述|
|---|---|---|
|**custom**|Boolean|是否为用户自己定义的级别，自定义(true) or 固定(false)|
|**levels**|Object|报警级别以及对应的阈值，是一个map[string]float64对象。key:common(一般)、critical(严重)、 fatal(紧急),value:各报警级别对应的阀值，要符合operation参数对应的递进关系。 eg: "levels":{"common":1000,"critical":10000,"fatal":15000}|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询报警历史|

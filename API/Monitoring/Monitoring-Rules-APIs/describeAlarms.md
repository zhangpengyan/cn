# describeAlarms


## 描述
查询规则, 查询参数组合及优先级从高到低为：
1：alarmId不为空
2：serviceCode不为空
2.1：serviceCode + resourceId
2.2: serviceCode + resourceIds
3：serviceCodes不为空
4: 所有规则

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v1/regions/{regionId}/alarms

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Long|False| |当前所在页，默认为1|
|**pageSize**|Long|False| |页面大小，默认为20；取值范围[1, 100]|
|**serviceCode**|String|False| |产品名称|
|**resourceId**|String|False| |资源ID|
|**ruleType**|Long|False| |规则类型, 1表示资源监控，6表示站点监控,7表示可用性监控|
|**status**|Long|False| |规则报警状态, 1：正常, 2：报警，4：数据不足|
|**enabled**|Long|False| |规则状态：1为启用，0为禁用|
|**isAlarming**|Long|False| |是否为正在报警的规则，0为忽略，1为是，与 status 同时只能生效一个,isAlarming 优先生效|
|**alarmId**|String|False| |规则的id|
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
|**alarmList**|DescribedAlarm[]|规则列表|
|**total**|Long|规则总数|
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
|**200**|查询监控规则结果|

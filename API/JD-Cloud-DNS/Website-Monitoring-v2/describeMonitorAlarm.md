# describeMonitorAlarm


## 描述
主域名的监控项的报警信息

## 请求方式
GET

## 请求地址
https://domainservice.jdcloud-api.com/v2/regions/{regionId}/domain/{domainId}/monitorAlarm

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|
|**domainId**|String|True| |域名ID，请使用describeDomains接口获取。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageIndex**|Integer|False| |当前页数，起始值为1，默认为1|
|**pageSize**|Integer|False| |分页查询时设置的每页行数|
|**searchValue**|String|False| |关键字|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|此次请求的ID|

### Result
|名称|类型|描述|
|---|---|---|
|**currentCount**|Integer|当前页面报警信息的个数|
|**totalCount**|Integer|所有报警信息的个数|
|**totalPage**|Integer|所有报警信息的页数|
|**dataList**|MonitorAlarmInfo[]|当前页面的报警信息的数组|
### MonitorAlarmInfo
|名称|类型|描述|
|---|---|---|
|**domainId**|Integer|域名ID|
|**subDomainName**|String|子域名|
|**host**|String|故障IP/域名|
|**id**|Integer| |
|**startTime**|Long|故障开始时间，格式Unix timestamp，时间单位：毫秒|
|**endTime**|Long|故障结束时间，格式Unix timestamp，时间单位：毫秒|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|

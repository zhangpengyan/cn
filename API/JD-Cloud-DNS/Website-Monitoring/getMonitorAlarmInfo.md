# getMonitorAlarmInfo


## 描述
主域名的监控项的报警信息

## 请求方式
GET

## 请求地址
https://clouddnsservice.jdcloud-api.com/v1/regions/{regionId}/domain/{domainId}/monitor/alarminfo

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|String|True| |域名ID，请使用getDomains接口获取。|
|**regionId**|String|True| |实例所属的地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageIndex**|Integer|False| |当前页数，起始值为1，默认为1|
|**pageSize**|Integer|False| |分页查询时设置的每页行数|
|**searchValue**|String|False| |关键字|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|此次请求的ID|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**currentCount**|Integer|当前页面报警信息的个数|
|**dataList**|MonitorAlarmInfo[]|当前页面的报警信息的数组|
|**totalCount**|Integer|所有报警信息的个数|
|**totalPage**|Integer|所有报警信息的页数|
### MonitorAlarmInfo
|名称|类型|描述|
|---|---|---|
|**domainId**|Integer|域名ID|
|**endTime**|Long|故障结束时间，格式Unix timestamp，时间单位：毫秒|
|**host**|String|故障IP/域名|
|**id**|Integer| |
|**startTime**|Long|故障开始时间，格式Unix timestamp，时间单位：毫秒|
|**subDomainName**|String|子域名|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|

# getActionLog


## 描述
查看用户在云解析服务下的操作记录

## 请求方式
GET

## 请求地址
https://clouddnsservice.jdcloud-api.com/v1/regions/{regionId}/log/actionLog

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**endTime**|String|True| |记录的终止时间，格式：UTC时间例如2017-11-10T23:00:00Z|
|**keyWord**|String|False| |日志需要匹配的关键词|
|**pageNumber**|Integer|True| |分页参数，页的序号，默认是1|
|**pageSize**|Integer|True| |分页参数，每页含有的结果的数目，默认是10|
|**startTime**|String|True| |记录的起始时间，格式：UTC时间例如2017-11-10T23:00:00Z|
|**success**|Boolean|False| |日志里面的结果是成功还是失败|
|**type**|Integer|False| |日志的类型|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**currentCount**|Integer|当前页的操作记录列表里的个数|
|**dataList**|Actionlog[]|操作记录列表|
|**totalCount**|Integer|所有操作记录的个数|
|**totalPage**|Integer|操作记录列表按照分页参数一共的页数|
### Actionlog
|名称|类型|描述|
|---|---|---|
|**clientIp**|String|操作者的IP|
|**detail**|String|操作的详细情况|
|**domain**|String|操作的域名|
|**failReason**|String|操作失败的原因|
|**id**|Integer|操作记录的ID|
|**success**|Boolean|操作的结果，成功true, 失败false|
|**time**|Long|操作发生的时间|
|**type**|Integer|操作类型：1新增 2修改 3删除|
|**userPin**|String|用户名|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|

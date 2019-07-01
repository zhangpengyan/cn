# describeAuditResult


## 描述
仅支持查看MySQL实例的审计内容

## 请求方式
GET

## 请求地址
https://rds.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/audit:describeAuditResult

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码，取值范围参见[《各地域及可用区对照表》](../Enum-Definitions/Regions-AZ.md)|
|**instanceId**|String|True| |RDS 实例ID，唯一标识一个RDS实例|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**startTime**|String|True| |查询开始时间，格式为：YYYY-MM-DD HH:mm:ss，开始时间不能早于当前时间30天|
|**endTime**|String|True| |查询截止时间，格式为：YYYY-MM-DD HH:mm:ss，开始时间到结束时间不能超过3天|
|**dbName**|String|False| |数据库名|
|**accountName**|String|False| |账号名|
|**pageNumber**|Integer|False| |显示数据的页码，默认为1，取值范围：[-1,∞)|
|**pageSize**|Integer|False| |每页显示的数据条数，默认为10，取值范围：10、20、50|
|**filters**|Filter[]|False| |过滤参数，多个过滤参数之间的关系为“与”(and)<br>支持以下属性的过滤：<br>operation<br>|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**auditResult**|AuditResult[]| |
|**totalCount**|Integer| |
### AuditResult
|名称|类型|描述|
|---|---|---|
|**startTime**|String|SQL开始执行时间|
|**ip**|String|源IP|
|**accountName**|String|账号名|
|**operation**|String|操作类型|
|**threadId**|String|线程ID|
|**dbName**|String|数据库名|
|**sql**|String|sql语句|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|

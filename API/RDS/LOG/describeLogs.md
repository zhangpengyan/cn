# describeLogs


## 描述
获取 PostgreSQL 的日志文件列表

## 请求方式
GET

## 请求地址
https://rds.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/log:describeLogs

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码，取值范围参见[《各地域及可用区对照表》](../Enum-Definitions/Regions-AZ.md)|
|**instanceId**|String|True| |RDS 实例ID，唯一标识一个RDS实例|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False| |显示数据的页码，默认为1，取值范围：[-1,∞)。pageNumber为-1时，返回所有数据页码；超过总页数时，显示最后一页;|
|**pageSize**|Integer|False| |每页显示的数据条数，默认为100，取值范围：[10,100]，用于查询列表的接口|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**dbInstances**|Log[]| |
|**totalCount**|Integer| |
### Log
|名称|类型|描述|
|---|---|---|
|**id**|Integer|日志文件id|
|**name**|String|日志文件名称|
|**sizeByte**|Integer|日志文件大小，单位Byte|
|**lastModified**|String|日志最后更改时间|
|**publicURL**|String|公网下载链接|
|**internalURL**|String|内网下载链接|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|

# describeOperationRecords


## 描述
查询操作日志

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/operationRecords


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码|
|**pageSize**|Integer|False|10|分页大小|
|**startTime**|String|True| |开始时间, UTC 时间, 格式：yyyy-MM-dd'T'HH:mm:ssZ|
|**endTime**|String|True| |结束时间, UTC 时间, 格式：yyyy-MM-dd'T'HH:mm:ssZ|
|**action**|Integer|False| |操作类型, 默认查全部.<br>- 0: 全部<br>- 1: 套餐变更<br>- 2: 防护规则变更<br>- 3: 防护对象变更<br>- 4: IP 地址变更<br>- 5: 防护包名称变更<br>|
|**name**|String|False| |防护包名称, 支持模糊匹配|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |
|**error**|Error| |

### Error
|名称|类型|描述|
|---|---|---|
|**err**|Err| |
### Err
|名称|类型|描述|
|---|---|---|
|**code**|Long|同http code|
|**details**|Object| |
|**message**|String| |
|**status**|String|具体错误|
### Result
|名称|类型|描述|
|---|---|---|
|**dataList**|OperationRecord[]| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|实例总数|
|**totalPage**|Integer|总页数|
### OperationRecord
|名称|类型|描述|
|---|---|---|
|**time**|String|操作时间|
|**name**|String|防护包名称|
|**action**|Integer|操作类型:  1：套餐变更, 2：防护规则变更, 3：防护对象变更, 4：IP 地址变更, 5：防护包名称变更|
|**info**|String|操作详情|
|**operator**|String|操作人|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|

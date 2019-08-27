# describeCCAttackLogDetails


## 描述
查询 CC 攻击日志详情.
- 参数 attackId 优先级高于 instanceId, attackId 不为空时, 忽略 instanceId


## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/attacklog:describeCCAttackLogDetails

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False| |页码, 默认为1|
|**pageSize**|Integer|False| |分页大小, 默认为10, 取值范围[10, 100]|
|**startTime**|String|True| |开始时间, 只能查询最近 90 天以内的数据, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**endTime**|String|True| |查询的结束时间, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**instanceId**|String|False| |高防实例 ID|
|**subDomain**|String[]|False| |查询的子域名, 只有选中某一个实例后才能多选子域名|
|**attackId**|String|False| |CC 攻击记录Id|


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
|**dataList**|CCAttackLogDetail[]| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|实例总数|
|**totalPage**|Integer|总页数|
### CCAttackLogDetail
|名称|类型|描述|
|---|---|---|
|**key**|String|特征key|
|**num**|Integer|攻击次数|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|

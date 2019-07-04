# describePermission


## 描述
查看当前topic授予了哪些用户哪些权限

## 请求方式
GET

## 请求地址
https://jcq.jdcloud-api.com/v1/regions/{regionId}/topics/{topicName}/iam

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |所在区域的Region ID|
|**topicName**|String|True| |topic 名称|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**permissions**|Permission[]| |
### Permission
|名称|类型|描述|
|---|---|---|
|**permission**|String|permission, [SUB, PUB, PUBSUB]|
|**userId**|String|userId|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|

# describeUserQuota


## 描述
查询账户的缓存Redis配额信息

## 请求方式
GET

## 请求地址
https://redis.jdcloud-api.com/v1/regions/{regionId}/quota

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |缓存Redis实例所在区域的Region ID。目前有华北-北京、华南-广州、华东-上海三个区域，Region ID分别为cn-north-1、cn-south-1、cn-east-2|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**quota**|Quota| |
### Quota
|名称|类型|描述|
|---|---|---|
|**name**|String|配额项的名称|
|**max**|Integer|配额|
|**used**|Integer|已使用的数目|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|

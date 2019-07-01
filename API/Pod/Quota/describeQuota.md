# describeQuota


## 描述
查询资源的配额，支持：原生容器 pod 和 secret.


## 请求方式
GET

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/quotas

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**resourceType**|String|True| |resourceType - 资源类型，支持 [container, pod, secret]<br>|


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
|**resourceType**|String|类型|
|**limit**|Integer|配额|
|**used**|Integer|已使用的数目|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

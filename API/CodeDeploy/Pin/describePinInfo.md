# describePinInfo


## 描述
查询一个pin的信息

## 请求方式
GET

## 请求地址
https://deploy.jdcloud-api.com/v1/regions/{regionId}/pinInfo

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

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
|**pinInfo**|PinInfo| |
### PinInfo
|名称|类型|描述|
|---|---|---|
|**pin**|String|pin|
|**appMax**|Integer|应用数量限制|
|**appCount**|Integer|当前应用数量|
|**groupMax**|Integer|部署组数量限制|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

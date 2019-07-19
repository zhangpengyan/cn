# describeApp


## 描述
查询一个应用的信息

## 请求方式
GET

## 请求地址
https://deploy.jdcloud-api.com/v1/regions/{regionId}/app/{appId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**appId**|String|True| |App Id|

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
|**app**|App| |
### App
|名称|类型|描述|
|---|---|---|
|**appId**|String|应用ID|
|**appName**|String|应用名称|
|**regionId**|String|地域|
|**platform**|Integer|部署平台：1云主机，2原生容器|
|**jdsfEnabled**|Integer|使用分布式服务框架：0不使用，1使用|
|**desc**|String|描述|
|**lastDeployTime**|Integer|上次部署时间|
|**createTime**|Integer|创建时间|
|**updateTime**|Integer|更新时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

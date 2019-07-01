# releaseAuthorizationToken


## 描述
释放用户 registry 的 token。


## 请求方式
POST

## 请求地址
https://containerregistry.jdcloud-api.com/v1/regions/{regionId}/registries/{registryName}:releaseAuthorizationToken

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**registryName**|String|True| |注册表名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**authorizationToken**|String|False| |准备释放的 token ID，功能为指定token释放。|
|**forceAll**|Boolean|False| |true 表示强制删除用户当前registry下所有有效token的标志；false 表示删除所有有效token。|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求 ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

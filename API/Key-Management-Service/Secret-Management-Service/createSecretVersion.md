# createSecretVersion


## 描述
创建机密新的版本，默认为已启用状态

## 请求方式
POST

## 请求地址
https://kms.jdcloud-api.com/v1/secret/{secretId}:createSecretVersion

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**secretId**|String|True| |机密ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**secretVersionCfg**|SecretVersionCfg|True| | |

### SecretVersionCfg
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**secretData**|String|True| |secret内容|
|**secretTimeCfg**|SecretTimeCfg|True| |机密数据有效时间段配置|
### SecretTimeCfg
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**expireTime**|String|True| |到期时间，默认为永久不到期，采用ISO8601标准，格式为: YYYY-MM-DDTHH:mm:ssZ|
|**startTime**|String|True| |激活时间，默认为当前时间，采用ISO8601标准，格式为: YYYY-MM-DDTHH:mm:ssZ|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|Not found|

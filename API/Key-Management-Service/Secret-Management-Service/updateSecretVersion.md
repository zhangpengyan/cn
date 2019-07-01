# updateSecretVersion


## 描述
修改机密指定版本配置

## 请求方式
PATCH

## 请求地址
https://kms.jdcloud-api.com/v1/secret/{secretId}/version/{version}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**secretId**|String|True| |机密ID|
|**version**|String|True| |机密版本|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**secretTimeCfg**|SecretTimeCfg|True| | |

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

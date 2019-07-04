# updateSecret


## 描述
修改机密描述

## 请求方式
PATCH

## 请求地址
https://kms.jdcloud-api.com/v1/secret/{secretId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**secretId**|String|True| |机密ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**secretDescCfg**|SecretDescCfg|True| | |

### SecretDescCfg
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**secretDesc**|String|True| |secret描述，默认为""|
|**secretName**|String|True| |secret名称，默认为""|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|Not found|

# describeSecretList


## 描述
获取机密列表

## 请求方式
GET

## 请求地址
https://kms.jdcloud-api.com/v1/secret


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码；默认为1|
|**pageSize**|Integer|False|10|分页大小；默认为10；取值范围[10, 100]|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**secretList**|SecretInfo[]|Secret列表|
|**totalCount**|Integer|Secret的数量|
### SecretInfo
|名称|类型|描述|
|---|---|---|
|**createTime**|String|Secret创建时间，采用ISO8601标准，格式为: YYYY-MM-DDTHH:mm:ssZ|
|**secretDesc**|String|Secret用途描述|
|**secretId**|String|SecretID|
|**secretName**|String|Secret名称|
|**secretStatus**|Integer|Secret当前状态: 0: 已启用、1: 已禁用|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|

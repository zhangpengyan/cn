# createAg


## 描述
创建一个高可用组

## 请求方式
POST

## 请求地址
https://ag.jdcloud-api.com/v1/regions/{regionId}/availabilityGroups

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**azs**|String[]|True| |支持的可用区，最少一个|
|**agName**|String|True| |高可用组名称，只支持中文、数字、大小写字母、英文下划线 “_” 及中划线 “-”，且不能超过 32 字符|
|**agType**|String|False| |高可用组类型，支持vm|
|**instanceTemplateId**|String|True| |实例模板的Id|
|**description**|String|False| |描述，长度不超过 256 字符|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**agId**|String|创建成功的高可用组 id|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

# describeStackTemplate


## 描述
查询资源栈使用的模板

## 请求方式
GET

## 请求地址
https://jdro.jdcloud-api.com/v1/regions/{regionId}/stacks/{stackId}/template

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**stackId**|String|True| |资源栈 ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**template**|String|模板信息|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询资源栈中的模板信息|

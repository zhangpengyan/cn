# listVersion


## 描述
查询版本列表

## 请求方式
GET

## 请求地址
https://function.jdcloud-api.com/v1/regions/{regionId}/functions/{functionName}/versions

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**functionName**|String|True| |函数名称|
|**regionId**|String|True| |Region ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询版本列表返回值|
|**requestId**|String|本次请求Id|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|FunctionSpec[]| |
### FunctionSpec
|名称|类型|描述|
|---|---|---|
|**functionId**|String|函数Id|
|**name**|String|函数名称|
|**description**|String|函数描述|
|**runtime**|String|函数运行环境，目前有python3|
|**createTime**|String|函数创建时间|
|**updateTime**|String|函数最后更新时间|
|**version**|String|函数版本名称|
|**downloadUrl**|String|代码包下载的url地址|

## 返回码
|返回码|描述|
|---|---|
|**200**|A successful response.|

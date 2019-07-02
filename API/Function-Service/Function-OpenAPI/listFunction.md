# listFunction


## 描述
查询函数列表

## 请求方式
GET

## 请求地址
https://function.jdcloud-api.com/v1/regions/{regionId}/functions

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**listAll**|Boolean|True| |是否返回所有函数|
|**pageNumber**|Integer|False| |页码|
|**pageSize**|Integer|False| |分页大小|
|**filters**|Filter[]|False| |functionId -函数ID，精确匹配，支持多个<br>functionName  - 函数名称，模糊匹配，支持单个<br>|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|查询函数列表返回值|
|**requestId**|String|本次请求Id|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|ListFunctionResult| |
### ListFunctionResult
|名称|类型|描述|
|---|---|---|
|**functions**|FunctionSpec[]|函数列表|
|**totalCount**|Integer|函数总数|
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

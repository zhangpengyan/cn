# startJob


## 描述
根据id启动一个编译任务

## 请求方式
POST

## 请求地址
https://compile.jdcloud-api.com/v1/regions/{regionId}/jobs/{id}:start

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |Job uuid|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**category**|String|False| |类型branch/commit/tag|
|**branch**|String|False| |类型对应的值|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**commitresult**|Boolean|提交任务是否成功|
|**buildUuid**|String|提交运行的构建任务的uuid|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|

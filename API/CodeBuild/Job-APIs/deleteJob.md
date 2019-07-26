# deleteJob


## 描述
删除一个编译任务

## 请求方式
DELETE

## 请求地址
https://compile.jdcloud-api.com/v1/regions/{regionId}/jobs/{id}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |编译任务uuid|
|**regionId**|String|True| |Region ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**commitresult**|Boolean|提交任务是否成功|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|

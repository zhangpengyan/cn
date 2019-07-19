# deleteJobs


## 描述
批量删除编译任务

## 请求方式
DELETE

## 请求地址
https://compile.jdcloud-api.com/v1/regions/{regionId}/jobs

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**jobIds**|String[]|True| |待删除job的UUID列表|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**result**|Boolean|true表示删除成功，false表示删除失败|
|**ids**|String[]| |

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|

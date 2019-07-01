# createTopic


## 描述
创建一个指定名称的topic

## 请求方式
POST

## 请求地址
https://jcq.jdcloud-api.com/v1/regions/{regionId}/topics

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |所在区域的Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**description**|String|False| |描述，长度不大于255|
|**topicName**|String|True| |topic名称|
|**type**|String|True| |类型，[normal,global_order]|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|

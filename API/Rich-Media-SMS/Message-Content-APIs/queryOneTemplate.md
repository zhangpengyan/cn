# queryOneTemplate


## 描述
查询一个富媒体短信内容接口

## 请求方式
POST

## 请求地址
https://rms.jdcloud-api.com/v1/regions/{regionId}/queryOneTemplate

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**templateId**|String|False| |短信Id|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求Id|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|RespQueryOneTemplateResourceList[]| |
|**description**|String|短信描述|
|**mediaLength**|String|短信内容大小|
|**type**|String|短信类型|
|**title**|String|短信标题|
|**isTuiding**|String|是否支持退订:0 不支持;1 支持|
|**message**|String|响应消息|
|**status**|String|请求状态|
### RespQueryOneTemplateResourceList
|名称|类型|描述|
|---|---|---|
|**size**|String|本项内容的字节长度|
|**name**|String|本项内容的名字|
|**type**|String|本项内容的类型,只能为txt/jpg/png/gif/mp3/mp4格式|
|**url**|String|类型为非txt时候的访问链接|
|**content**|String|类型为txt时候的具体内容|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|INVALID_ARGUMENT|
|**500**|INTERNAL|

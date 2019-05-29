# addTemplate


## 描述
增加富媒体短信内容接口

## 请求方式
POST

## 请求地址
https://rms.jdcloud-api.com/v1/regions/{regionId}/addTemplate

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**appId**|String|False| |应用Id|
|**signType**|String|False| |签名类型:0 公司;1 app;2 网站;3 公众号;4 商标;5 政府机关|
|**purpose**|String|False| |用途:0 自用;1 他用|
|**signCardType**|String|False| |资质证明类型:0 三证合一;1 企业营业执照;2组织机构代码证书;3 社会信用代码证书|
|**aptitudes**|String|False| |资质证明图片,必须是jpg图片的base64编码，只支持jpg图片|
|**title**|String|False| |短信标题|
|**description**|String|False| |描述信息|
|**isTuiding**|String|False| |是否支持退订:0 不支持退订;1 支持退订|
|**content**|QueryAddTemplateContent[]|False| |模板内容|

### QueryAddTemplateContent
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**type**|String|False| |类型,只能为txt/jpg/png/gif/mp3/mp4|
|**txt**|String|False| |类型为txt时候，这里需要填写具体内容|
|**file**|String|False| |类型为非txt时候，这里需要填写文件对应的base64编码|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求Id|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|RespAddTemplateData[]| |
|**message**|String|响应消息|
|**status**|String|请求状态|
### RespAddTemplateData
|名称|类型|描述|
|---|---|---|
|**templateId**|String|短信Id|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|INVALID_ARGUMENT|
|**500**|INTERNAL|

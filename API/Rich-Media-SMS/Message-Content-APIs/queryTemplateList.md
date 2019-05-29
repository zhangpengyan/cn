# queryTemplateList


## 描述
查询富媒体短信内容列表接口

## 请求方式
POST

## 请求地址
https://rms.jdcloud-api.com/v1/regions/{regionId}/queryTemplateList

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**appId**|String|False| |应用Id|
|**searchKey**|String|False| |搜索短信标题，可不填|
|**pageNum**|String|False| |第几页|
|**pageLimit**|String|False| |每页多少条数据|
|**status**|String|False| |短信审核状态|
|**startTime**|String|False| |开始时间，格式YYYY-MM-DD|
|**endTime**|String|False| |结束时间，格式YYYY-MM-DD|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求Id|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|RespQueryTemplateListData[]| |
|**message**|String|响应消息|
|**totalElements**|String|总条数|
|**status**|String|请求状态|
### RespQueryTemplateListData
|名称|类型|描述|
|---|---|---|
|**reason**|String|审核未通过原因|
|**createTime**|String|短信创建时间|
|**contentSize**|String|短信内容大小|
|**description**|String|短信描述|
|**templateId**|String|短信Id|
|**title**|String|短信标题|
|**status**|String|短信审核状态|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|INVALID_ARGUMENT|
|**500**|INTERNAL|

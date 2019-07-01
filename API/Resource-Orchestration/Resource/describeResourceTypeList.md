# describeResourceTypeList


## 描述
查询支持的资源列表

## 请求方式
GET

## 请求地址
https://jdro.jdcloud-api.com/v1/regions/{regionId}/resourcetypes

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Long|False| |当前所在页，默认为1|
|**pageSize**|Long|False| |页面大小，默认为20；取值范围[1, 100]|
|**product**|String|False| |产品线类型，比如 VM|
|**search**|String|False| |搜索的内容|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**resourceTypeList**|DescribeResourceTypeListItem[]| |
|**totalCount**|Long| |
### DescribeResourceTypeListItem
|名称|类型|描述|
|---|---|---|
|**describe**|String| |
|**type**|String|资源类型|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询支持的资源列表结果|

# describeResourceTypeSpecification


## 描述
查询支持的资源结构详情

## 请求方式
GET

## 请求地址
https://jdro.jdcloud-api.com/v1/regions/{regionId}/resourcetypes/{resourceType}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**resourceType**|String|True| |资源类型|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**propertyTypes**|Object| |
|**resourceTypes**|ResourceTypes| |
### ResourceTypes
|名称|类型|描述|
|---|---|---|
|**attributes**|Object|资源输出参数定义|
|**description**|String|资源描述|
|**documentation**|String|文档链接|
|**properties**|Object|资源属性定义|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询支持的资源列表结果|

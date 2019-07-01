# getUserViewIP


## 描述
查询域名的自定义解析线路的IP段

## 请求方式
GET

## 请求地址
https://clouddnsservice.jdcloud-api.com/v1/regions/{regionId}/userview/getUserViewIP

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domainId**|Integer|True| |主域名ID|
|**pageNumber**|Integer|True| |分页参数，页的序号, 默认为1|
|**pageSize**|Integer|True| |分页参数，每页含有的结果的数目，默认为10|
|**viewId**|Integer|True| |自定义线路ID|
|**viewName**|Integer|False| |自定义线路名称, 最多64个字符|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|此次请求的ID|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**currentCount**|Integer|当前页的IP列表里的个数|
|**dataList**|String[]|自定义线路包含的IP段列表|
|**totalCount**|Integer|IP列表里的IP段的个数|
|**totalPage**|Integer|IP列表按照分页参数一共的页数|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|BAD_REQUEST|

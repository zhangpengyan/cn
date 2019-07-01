# getJobs


## 描述
查询获取编译任务列表，并显示最后一次编译的一些信息
/v2/regions/cn-south-1/jobs/?sorts.1.name=status&sorts.1.direction=asc&pageNumber=1&pageSize=10&filters.1.name=name&filters.1.values.1=我的job


## 请求方式
GET

## 请求地址
https://compile.jdcloud-api.com/v1/regions/{regionId}/jobs

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**sorts**|Sort[]|False| |对某一列排序|
|**pageNumber**|Integer|False| |页码；默认为1|
|**pageSize**|Integer|False| |分页大小；默认为10；取值范围[10, 100]|
|**filters**|Filter[]|False| |编译任务名|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|
### Sort
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |排序条件的名称|
|**direction**|String|False| |排序条件的方向|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |

### Result
|名称|类型|描述|
|---|---|---|
|**totalCount**|Integer| |
|**jobs**|SimpleJob[]| |
|**requestId**|String| |
### SimpleJob
|名称|类型|描述|
|---|---|---|
|**uuid**|String|构建任务uuid|
|**name**|String|构建名称|
|**buildStartAt**|Integer|构建开始时间|
|**compilerType**|String|构建类型|
|**buildStatus**|String|构建状态|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|

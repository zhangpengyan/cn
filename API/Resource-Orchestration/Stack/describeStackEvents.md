# describeStackEvents


## 描述
查询资源栈事件列表

## 请求方式
GET

## 请求地址
https://jdro.jdcloud-api.com/v1/regions/{regionId}/stacks/{stackId}/events

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**stackId**|String|True| |资源栈 ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Long|False| |当前所在页，默认为1|
|**pageSize**|Long|False| |页面大小，默认为20；取值范围[1, 100]|
|**startTime**|String|False| |事件开始时间|
|**endTime**|String|False| |事件结束时间|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**list**|EventOut[]| |
|**totalCount**|Long| |
### EventOut
|名称|类型|描述|
|---|---|---|
|**createTime**|String|创建时间|
|**physicalId**|String|资源ID|
|**resourceAction**|String|资源运行操作|
|**resourceName**|String|资源名称|
|**resourceStatus**|String|资源运行状态|
|**resourceStatusReason**|String|资源运行状态原因|
|**resourceType**|String|资源类型|
|**stackId**|String|资源栈ID|
|**uuid**|String|唯一标识|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询资源栈事件列表|

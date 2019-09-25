# describeCollectResources


## 描述
查询采集配置的实例列表

## 请求方式
GET

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/collectinfos/{collectInfoUID}/resources

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**collectInfoUID**|String|True| |采集配置 UID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Long|False| |当前所在页，默认为1|
|**pageSize**|Long|False| |页面大小，默认为20；取值范围[1, 100]|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|ResourceEnd[]|资源列表|
|**numberPages**|Long|总页数|
|**numberRecords**|Long|总记录数|
|**pageNumber**|Long|当前页码|
|**pageSize**|Long|分页大小|
### ResourceEnd
|名称|类型|描述|
|---|---|---|
|**agentStatus**|Long|agent 状态: 0-异常，1-正常|
|**name**|String|资源名称|
|**region**|String|资源所属地域|
|**resourceId**|String|资源ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询采集配置资源列表结果|

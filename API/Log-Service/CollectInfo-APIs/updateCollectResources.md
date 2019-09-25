# updateCollectResources


## 描述
增量更新采集实例列表。更新的动作支持 add 、 remove

## 请求方式
POST

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/collectinfos/{collectInfoUID}:updateResources

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**collectInfoUID**|String|True| |采集配置 UID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**action**|String|True| |action|
|**resources**|Resource[]|False| |采集实例列表（系统日志存在上限限制20）|

### Resource
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**region**|String|True| |资源所属地域|
|**resourceId**|String|True| |资源ID|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求的标识id|


## 返回码
|返回码|描述|
|---|---|
|**200**|更新采集配置资源结果|

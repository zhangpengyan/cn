# tagResources


## 描述
你可以使用该接口绑定资源标签<br/>



## 请求方式
POST

## 请求地址
https://resource-tag.jdcloud-api.com/v1/regions/{regionId}/tags:tagResources

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

说明：绑定cdn的资源时，url中regionId需指定为cn-all

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**tagResources**|TagResourcesReqVo|True| |绑定标签参数|

### TagResourcesReqVo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**resources**|ResourcesMap[]|True| |对指定产品线指定资源打标签, 目前只支持同一产品线的资源绑定标签|
|**tags**|Tag[]|True| |标签集合|
### Tag
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**key**|String|True| |标签键|
|**value**|String|True| |标签值|
### ResourcesMap
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**serviceCode**|String|True| |产品线名称列表<br>标签系统支持的产品线名称如下<br>- vm               disk        sqlserver  es          mongodb               ip<br>- memcached        redis       drds       rds         database              db_ro<br>- percona          percona_ro  mariadb    mariadb_ro  pg                    cdn<br>- nativecontainer  pod         zfs        jqs         kubernetesNodegroup   jcq<br>|
|**resourceId**|String[]|True| |资源id列表|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|响应结果对象|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|TagResourcesResVo|资源标签绑定结果详情|
### TagResourcesResVo
|名称|类型|描述|
|---|---|---|
|**pin**|String|用户pin|
|**region**|String|地域名称|
|**failedResourcesMap**|FailedResourcesMap[]|打标失败列表|
|**successCount**|Integer|资源与标签绑定成功的次数|
### FailedResourcesMap
|名称|类型|描述|
|---|---|---|
|**resourceId**|String|资源id|
|**msg**|String|资源与标签绑定或解绑失败的原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

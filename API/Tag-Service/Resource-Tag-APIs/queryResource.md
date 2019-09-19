# queryResource


## 描述
你可以使用该接口按标签查询对应的资源id <br/>


## 请求方式
POST

## 请求地址
https://resource-tag.jdcloud-api.com/v1/regions/{regionId}/queryResource

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

说明：查询cdn的资源时，url中regionId需指定为cn-all

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**queryResource**|QueryResourceReqVo|True| |查找资源id的参数对象|

### QueryResourceReqVo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**serviceCode**|String|True| |产品线名称列表<br>标签系统支持的产品线名称如下<br>- vm               disk        sqlserver  es          mongodb               ip<br>- memcached        redis       drds       rds         database              db_ro<br>- percona          percona_ro  mariadb    mariadb_ro  pg                    cdn<br>- nativecontainer  pod         zfs        jqs         kubernetesNodegroup   jcq<br>|
|**tagFilters**|TagFilter[]|False| |标签过滤列表|
|**operator**|String|False|and|操作项(多个tagFilter之间支持and或or关系, 默认and关系)|
### TagFilter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**key**|String|False| |标签键|
|**values**|String[]|False| |标签值列表|
|**operator**|String|False|eq|操作选项, 默认为eq, 表示精确匹配|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|响应结果对象|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**resourceIds**|String[]|资源id集合|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

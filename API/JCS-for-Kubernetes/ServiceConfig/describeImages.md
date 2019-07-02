# describeImages


## 描述
查询服务配置信息，提供详细的 master 和 node 镜像信息。

## 请求方式
GET

## 请求地址
https://kubernetes.jdcloud-api.com/v1/regions/{regionId}/images

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**masterVersion**|String|False| |集群的大版本，如 1.8.12|
|**masterImageCode**|String|False| |master 的镜像编码，如 1.8.12-jke|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**masterImages**|MasterImage[]| |
### MasterImage
|名称|类型|描述|
|---|---|---|
|**code**|String|镜像编码|
|**imageId**|String|虚机镜像id|
|**mainVersion**|String|主版本号|
|**innerVersion**|String|内部版本号|
|**isDefault**|Boolean|是否默认镜像|
|**visibility**|Integer|可见度:0：所有人可见；1：授权用户可见；2：只有白名单用户可见|
|**defaultNodeImageCode**|String|默认ndoe镜像编码|
|**nodeImages**|NodeImage[]|node 节点的配置|
### NodeImage
|名称|类型|描述|
|---|---|---|
|**code**|String|镜像编码|
|**imageId**|String|虚机镜像id|
|**imageOs**|String|镜像操作系统|
|**mainVersion**|String|主版本号|
|**innerVersion**|String|内部版本号|
|**visibility**|Integer|可见度|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

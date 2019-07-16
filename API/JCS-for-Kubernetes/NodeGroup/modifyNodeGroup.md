# modifyNodeGroup


## 描述
修改节点组的 名称 和 描述

## 请求方式
PATCH

## 请求地址
https://kubernetes.jdcloud-api.com/v1/regions/{regionId}/nodeGroups/{nodeGroupId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**nodeGroupId**|String|True| |节点组 ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |节点组名称|
|**description**|String|False| |集群 name 和 description 必须要指定一个|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

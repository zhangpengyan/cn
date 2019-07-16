# detachDiskToVmInstanceByDiskId


## 描述
从虚拟机卸载云硬盘

## 请求方式
PUT

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/disk_disks/{id}:detach

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |云硬盘 ID|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-fusion-cloudid**|String|True| |云注册信息ID|
|**x-jdcloud-nonce**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-date**|String|True| |获取方式请参考签名算法指导文档|
|**authorization**|String|True| |获取方式请参考签名算法指导文档|
|**detach**|DetachDataDisk|True| |从虚拟机卸载云硬盘|

### DetachDataDisk
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instanceId**|String|True| |虚拟机 id|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**204**|OK|
|**404**|disk not found|

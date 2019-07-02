# getDisks


## 描述
根据云提供商查询对应的云硬盘资源信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/disk_disks

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-nonce**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-date**|String|True| |获取方式请参考签名算法指导文档|
|**authorization**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|
|**vmId**|String|False| |云主机id|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**disks**|CloudDataDisk[]| |
### CloudDataDisk
|名称|类型|描述|
|---|---|---|
|**cloudID**|String|云注册信息ID|
|**id**|String|云硬盘ID|
|**name**|String|云硬盘名称|
|**description**|String|云硬盘描述|
|**diskSizeGB**|Integer|磁盘大小,单位为 GiB|
|**attachments**|ArrayDiskAttachment[]|挂载信息|
|**az**|String|云硬盘所属AZ|
|**diskType**|String|磁盘类型,取值为 ssd 或 premium-hdd|
|**snapshotId**|String|创建该云硬盘的快照ID|
|**status**|String|云硬盘状态|
|**tags**|Tag[]| |
|**createdTime**|String|创建时间|
### Tag
|名称|类型|描述|
|---|---|---|
|**tagKey**|String|标签KEY值|
|**tagValue**|String|标签Value值|
### ArrayDiskAttachment
|名称|类型|描述|
|---|---|---|
|**instanceId**|String|挂载实例的ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|

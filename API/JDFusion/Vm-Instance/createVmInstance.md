# createVmInstance


## 描述
根据云提供商创建虚拟机

## 请求方式
POST

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vm_instances

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-nonce**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-date**|String|True| |获取方式请参考签名算法指导文档|
|**authorization**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-fusion-cloudid**|String|True| |云注册信息ID|
|**vm**|CreateVm|True| |创建VM|

### CreateVm
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|False| |资源ID，如果为空，则执行创建操作，否则执行修改操作|
|**region**|String|False| |可用区,根据各云平台规范填写|
|**az**|String|False| |云主机所属的可用区|
|**name**|String|True| |云主机名称|
|**hostName**|String|False| |云主机|
|**imageType**|ImageType|False| | |
|**instanceType**|InstanceType|False| | |
|**description**|String|False| |云主机描述|
|**subnetId**|String|True| |子网ID|
|**tags**|Tag[]|False| | |
|**cloudID**|String|False| |所属云提供商ID|
|**keyNames**|String[]|False| |密钥对名称,jd当前只支持传入一个|
|**elasticIpAddress**|String|False| |主网卡主IP绑定弹性IP的地址|
|**privateIpAddress**|String|False| |私有ip地址|
|**status**|String|False| |云主机状态|
|**createdTime**|String|False| |创建时间|
|**imageId**|String|True| |镜像文件ID，启动实例时选择的镜像资源|
|**instanceFlavorType**|String|True| |规格类型|
|**securityGroupId**|String|False| |指定新创建实例所属于的安全组代码，同一个安全组内的实例之间可以互相访问|
|**internetMaxBandwidthIn**|Integer|False| |否  公网入带宽最大值，单位为Mbit/s|
|**internetMaxBandwidthOut**|Integer|False| |否  公网出带宽最大值，单位为Mbit/s|
|**password**|String|False| |否  实例的密码|
|**passwordInherit**|Boolean|False| |否  是否使用镜像预设的密码|
|**userData**|String|False| |否  实例自定义数据，需要以Base64方式编码，原始数据最多为16KB|
|**keyPairName**|String|False| |否  密钥对名称|
|**systemDisk**|SystemDisk|False| | |
### SystemDisk
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**category**|String|False| |否  系统盘的磁盘种类|
|**diskSize**|Integer|False| |系统盘大小|
|**description**|String|False| |系统盘描述|
### Tag
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**tagKey**|String|False| |标签KEY值|
|**tagValue**|String|False| |标签Value值|
### InstanceType
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |实例配置类型名称|
|**cpu**|Integer|False| |处理器核数，单位为C|
|**memory**|Integer|False| |内存大小，单位为M|
### ImageType
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|False| |镜像ID|
|**desc**|String|False| |镜像描述|
|**imageSource**|String|False| |镜像来源|
|**name**|String|False| |镜像名称|
|**osType**|String|False| |镜像的操作系统类型|
|**osVersion**|String|False| |镜像的操作系统版本|
|**platform**|String|False| |镜像的操作系统发行版|
|**region**|String|False| |镜像所属区域|
|**cloudID**|String|False| |所属云提供商ID|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**task**|ResourceTFInfo| |
### ResourceTFInfo
|名称|类型|描述|
|---|---|---|
|**uuid**|String|uuid|
|**body**|String|请求体|
|**status**|String|状态|
|**result**|String|执行结果|
|**createdTime**|String|创建时间|
|**updateTime**|String|更新时间|
|**provider**|String|cloud provider|
|**cloudId**|String|cloud ID|
|**userId**|String|user ID|

## 返回码
|返回码|描述|
|---|---|
|**201**|CREATED|

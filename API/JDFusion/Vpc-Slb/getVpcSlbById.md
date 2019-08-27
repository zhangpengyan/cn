# getVpcSlbById


## 描述
根据云提供商查询对应的SLB资源信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_slbs/{id}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |LB ID|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-nonce**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-date**|String|True| |获取方式请参考签名算法指导文档|
|**authorization**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**slb**|SlbInfoDetail| |
### SlbInfoDetail
|名称|类型|描述|
|---|---|---|
|**cloudID**|String|所属云ID|
|**id**|String|负载均衡实例ID。|
|**name**|String|负载均衡实例的名称。|
|**status**|String|负载均衡实例状态|
|**ipAddress**|String|负载均衡实例的服务地址。|
|**addressType**|String|负载均衡实例的网络类型。|
|**subnetId**|String|私网负载均衡实例的交换机ID。|
|**vpc**|String|私网负载均衡实例的专有网络ID。|
|**networkType**|String|私网负载均衡实例的网络类型|
|**masterAz**|String|实例的主可用区ID。|
|**slaveAz**|String|实例的备可用区ID。|
|**createdTime**|String|创建时间|
|**listenerPortsAndProtocol**|ListenerPortsAndProtocol[]|负载均衡实例前端使用的端口和协议列表。|
|**backendServers**|BackendServer2[]|负载均衡实例的后端服务器列表。|
|**loadBalancerSpec**|String|负载均衡实例的的性能规格。取值：slb.s1.small、slb.s2.small、slb.s2.medium、slb.s3.small、slb.s3.medium、slb.s3.large|
### BackendServer2
|名称|类型|描述|
|---|---|---|
|**serverId**|String|后端服务器名（ECS实例）ID。|
|**weight**|Integer|后端服务器的权重。|
|**type**|String|后端服务器类型。|
### ListenerPortsAndProtocol
|名称|类型|描述|
|---|---|---|
|**listenerPort**|Integer|负载均衡实例前端使用的端口。|
|**listenerProtocol**|String|负载均衡实例前端使用的协议。|
|**listenerForward**|String|是否启用监听转发。|
|**forwardPort**|Integer|转发到的目的监听端口，必须是已经存在的HTTPS监听端口。|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
|**404**|not found|

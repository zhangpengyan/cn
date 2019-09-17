# describeInstances


## 描述
查询iotcloudgateway实例列表

## 请求方式
GET

## 请求地址
https://iotcloudgateway.jdcloud-api.com/v1/regions/{regionId}/instances

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |regionId|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False| |页码|
|**pageSize**|Integer|False| |分页大小|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**instances**|Instance[]|iotcloudgateway实例相关信息|
|**totalCount**|Integer|iotcloudgateway实例总数|
### Instance
|名称|类型|描述|
|---|---|---|
|**instanceId**|String|实例ID|
|**instanceName**|String|实例名称|
|**instanceVersion**|String|实例版本|
|**instanceRegion**|String|所在地域|
|**instanceStatus**|String|实例状态，running：运行，error：错误，creating：创建中，changing：变配中|
|**instanceFlavor**|String|实例硬件配置规格 例如:2C4G20G|
|**azId**|String|az信息|
|**vpcId**|String|所属VPC的ID|
|**subnetId**|String|所属子网的ID|
|**exposedDomain**|String|下行控制管理域名和设备上行链接的外网域名|
|**replica**|Integer|节点个数|
|**cloudstorage**|Integer|云硬盘大小|
|**serviceConfig**|String|实例服务配置|
|**createTime**|String|创建时间|
|**gw_dev_id**|String|网关设备ID|
|**gw_dev_num**|Integer|网关子设备数|
|**chargeType**|Integer|计费类型|
|**chargeExpired**|String|计费过期时间|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|

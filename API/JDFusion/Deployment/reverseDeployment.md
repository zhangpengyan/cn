# reverseDeployment


## 描述
根据已有资源反向生成deployment

## 请求方式
POST

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/deployments:reverse

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**reverse**|ReverseDeploymentInfo|True| |根据已有资源反向生成deployment|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|

### ReverseDeploymentInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |模板名称|
|**description**|String|False| |描述|
|**version**|String|False| |版本|
|**readOnly**|Integer|False| |是否只读 0：否 1：是|
|**resources**|ReverseDeploymentResourcesInfo|False| | |
### ReverseDeploymentResourcesInfo
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**vmIds**|Object|False| | |
|**eipIds**|Object|False| | |
|**subnetIds**|Object|False| | |
|**networkInterfaceIds**|Object|False| | |
|**slbIds**|Object|False| | |
|**securityGroupIds**|Object|False| | |
|**keypairIds**|Object|False| | |
|**diskIds**|Object|False| | |
|**vpcIds**|Object|False| | |
|**vserverGroupIds**|Object|False| | |
|**httpListenerIds**|Object|False| | |
|**diskAttachmentIds**|Object|False| | |
|**netInterfaceAttachmentIds**|Object|False| | |
|**eipAssociateIds**|Object|False| | |

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**deployment**|DeploymentInfo| |
### DeploymentInfo
|名称|类型|描述|
|---|---|---|
|**info**|DeploymentBaseInfo| |
|**content**|DeploymentResourcesInfo| |
### DeploymentResourcesInfo
|名称|类型|描述|
|---|---|---|
|**vms**|Object| |
|**eips**|Object| |
|**subnets**|Object| |
|**networkInterfaces**|Object| |
|**slbs**|Object| |
|**securityGroups**|Object| |
|**securityGroupRules**|Object| |
|**keypairs**|Object| |
|**disks**|Object| |
|**vpcs**|Object| |
|**vserverGroups**|Object| |
|**httpListeners**|Object| |
|**diskAttachment**|Object| |
|**netInterfaceAttachment**|Object| |
|**eipAssociate**|Object| |
|**rds**|Object| |
|**rdsDatabase**|Object| |
|**rdsAccount**|Object| |
|**rdsAccountGrant**|Object| |
|**bucket**|Object| |
|**variables**|Object| |
### DeploymentBaseInfo
|名称|类型|描述|
|---|---|---|
|**cloudId**|String|云ID|
|**version**|String|版本|
|**readOnly**|Integer|是否只读 0：否 1：是|
|**id**|String|ID|
|**name**|String|名称|
|**description**|String|描述|
|**userId**|String|用户ID|
|**createdTime**|String|创建时间|
|**updatedTime**|String|更新时间|
|**lastOperation**|String|最近一次操作|

## 返回码
|返回码|描述|
|---|---|
|**201**|CREATED|

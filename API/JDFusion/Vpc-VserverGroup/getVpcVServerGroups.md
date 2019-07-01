# getVpcVServerGroups


## 描述
根据过滤条件，取得服务器组的信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vpc_vserverGroups

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
|**slbid**|String|False| |负载均衡id|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**vserverGroups**|VserverGroupInfo[]| |
### VserverGroupInfo
|名称|类型|描述|
|---|---|---|
|**cloudID**|String|所属云ID|
|**vserverGroupId**|String|服务器组ID|
|**vserverGroupName**|String|服务器组名称|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|

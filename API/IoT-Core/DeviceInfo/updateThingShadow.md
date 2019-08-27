# updateThingShadow


## 描述
更新设备影子的期望值

## 请求方式
PATCH

## 请求地址
https://iotcore.jdcloud-api.com/v2/regions/{regionId}/instances/{instanceId}/products/{productKey}/devices/{identifier}/shadow

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instanceId**|String|True| |设备归属的实例ID|
|**regionId**|String|True| |设备归属的实例所在区域|
|**identifier**|String|True| |设备唯一标识|
|**productKey**|String|True| |产品Key|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**state**|Object|False| |运行状态|
|**version**|Integer|False| |设备影子版本,当前版本加1，当前版本默认其实版本为-1<br>用户主动更新版本号时，设备影子会检查请求中的主动更新版本号是否大于当前版本号。<br>如果大于当前版本号，则更新设备影子，并将影子版本值更新到请求的版本中，反之则会拒绝更新设备影子。<br>影子版本参数为Integer型<br>取值范围：0到2147483647(2的31次方-1)<br>当取值达到最大值2147483647(2的31次方-1)时，请求中的主动更新版本号应为-1<br>|


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

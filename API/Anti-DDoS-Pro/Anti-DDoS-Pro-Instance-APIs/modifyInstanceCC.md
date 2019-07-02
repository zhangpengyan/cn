# modifyInstanceCC


## 描述
设置实例 CC 防护

## 请求方式
POST

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:setCC

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**instanceId**|Long|True| |实例 ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**cCSpec**|CCSpec|True| |CC 参数|

### CCSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ccProtectMode**|Integer|False| |cc防护模式：0正常 1宽松 2紧急 3自定义|
|**ccThreshold**|Long|False| |cc阈值大小|
|**hostQps**|Long|False| |ccProtectMode为自定义模式时，指定每个Host的防护阈值|
|**hostUrlQps**|Long|False| |ccProtectMode为自定义模式时，指定每个Host+URI的防护阈值|
|**ipHostQps**|Long|False| |ccProtectMode为自定义模式时，指定每个源IP对Host的防护阈值|
|**ipHostUrlQps**|Long|False| |ccProtectMode为自定义模式时，指定每个源IP对Host+URI的防护阈值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |
|**error**|Error| |

### Error
|名称|类型|描述|
|---|---|---|
|**code**|Integer|请求错误状态码|
|**status**|String|请求错误状态码|
|**message**|String|请求错误提示|
### Result
|名称|类型|描述|
|---|---|---|
|**code**|Integer|0: 设置失败, 1: 设置成功|
|**message**|String|设置失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|

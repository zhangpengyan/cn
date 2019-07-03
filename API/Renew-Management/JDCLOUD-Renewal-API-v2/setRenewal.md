# setRenewal


## 描述
开通、取消实例自动续费

## 请求方式
PUT

## 请求地址
https://renewal.jdcloud-api.com/v2/regions/{regionId}/instances:autoRenewStatus

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**setRenewalParam**|SetRenewalParam|True| | |

### SetRenewalParam
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instanceIds**|String|True| |资源id列表,英文逗号分隔|
|**autoRenewStatus**|Integer|True| |自动续费状态 0-关闭自动续费,1-开通或修改自动续费|
|**appCode**|String|True| |业务线|
|**serviceCode**|String|True| |产品线|
|**timeSpan**|Integer|False| |续费周期（autoRenewStatus=1时必传）|
|**timeUnit**|Integer|False| |时间单位 3-月 4-年（autoRenewStatus=1时必传）|
|**allAutoPay**|Integer|False| |是否绑定关联资源一并续费 0-不绑定,1-绑定（autoRenewStatus=1时必传）|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**stringResult**|String|更新成功条数|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|Not found|
|**500**|Internal server error|

# renewInstance


## 描述
实例续费

## 请求方式
POST

## 请求地址
https://renewal.jdcloud-api.com/v2/regions/{regionId}/instances:renew

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**renewInstanceParam**|RenewInstanceParam|True| | |

### RenewInstanceParam
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**appCode**|String|True| |业务线|
|**serviceCode**|String|True| |产品线|
|**timeUnit**|Integer|True| |时间单位 3:月 4:年|
|**timeSpan**|Integer|True| |时长|
|**sign**|String|True| |签名 md5(pin+serviceCode+key)|
|**instanceIds**|String|True| |待续费资源id列表,英文逗号分隔|
|**unifyDate**|Integer|False| |是否统一续费到期日续费 1-是 0-否（默认为0）|
|**returnURL**|String|False| |回调地址|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**orderNumber**|String|创建成功的订单id|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|Not found|
|**500**|Internal server error|

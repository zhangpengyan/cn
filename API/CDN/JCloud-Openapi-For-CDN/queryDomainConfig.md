# queryDomainConfig


## 描述
查询域名配置信息

## 请求方式
GET

## 请求地址
https://cdn.jdcloud-api.com/v1/domain/{domain}/config

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domain**|String|True| |用户域名|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**ignoreQueryString**|String|忽略参数[on,off]|
|**range**|String|range参数[on,off]|
|**httpType**|String|httpType参数[on,off]|
|**httpsCertificate**|String|https证书|
|**httpsRsaKey**|String|rsa秘钥|
|**httpsJumpType**|String|跳转类型[default,http,https]|
|**videoDraft**|String|是否支持视频拖拽[on,off]|
|**groupName**|String|group|
|**shareId**|Long| |
|**shareName**|String| |
|**jcdnTimeAnti**|String| |
|**shareCache**|String| |
|**isShareOpen**|String| |
|**cacheRules**|CacheRule[]| |
### CacheRule
|名称|类型|描述|
|---|---|---|
|**weight**|Integer| |
|**ttl**|Long| |
|**contents**|String| |
|**createTime**|String| |
|**updateTime**|String| |
|**cacheType**|String| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|

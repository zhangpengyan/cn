# describeCert


## 描述
查看证书详情

## 请求方式
GET

## 请求地址
https://ssl.jdcloud-api.com/v1/sslCert/{certId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**certId**|String|True| |证书 Id|

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
|**certDescDetail**|CertDescDetail| |
### CertDescDetail
|名称|类型|描述|
|---|---|---|
|**certId**|String|证书Id|
|**certName**|String|证书名称|
|**commonName**|String|绑定域名|
|**certType**|String|证书类型|
|**issuer**|String|签发者|
|**startTime**|String|开始时间|
|**endTime**|String|结束时间|
|**dnsNames**|String[]|域名|
|**digest**|String|对私钥文件使用sha256算法计算的摘要信息|
|**usedBy**|CertBindInfo[]|证书关联信息|
### CertBindInfo
|名称|类型|描述|
|---|---|---|
|**bindFrom**|String|绑定名称|
|**bindId**|String|绑定Id|
|**bindRegion**|String|绑定资源所在的Region|
|**bindZone**|String|绑定资源所在的可用区|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

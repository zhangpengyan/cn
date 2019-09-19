# 计费规则

### 流量流入及流出关系 ###

    API 网关的流出流量指的是相对 API 网关来说的流出，例如如果后端服务为 HTTP 调用，从 API 网关到 HTTP 服务的流量和 API 网关响应前端客户端的流量，皆称为流出流量。
    
HTTP类型|源|目的|流量类型
:---|:---|:---|:---
x-jdcloud-algorithm | String | 是 | 用于创建请求签名的哈希算法，目前只支持 `JDCLOUD2-HMAC-SHA256`
x-jdcloud-date | String | 是 | 签名请求的日期和时间，遵循ISO8601标准，使用UTC时间，格式为YYYYMMDDTHHmmssZ。日期必须与`authorization`请求头中使用的日期相匹配。例如： `20180707T150456Z`
x-jdcloud-nonce | String | 是 | 随机生成的字符串，需要保证一段时间内的唯一性
x-jdcloud-security-token | String | 否 | 如果用户开启了mfa操作保护，该API接口又是需要保护的接口，调用时需要传此参数



更多详情请参见：


* [后付费计费说明](../../../Finance/Billing/Billing-method/Postpay.md)。

* [消费总览](../../../Finance/Billing/Bill/Purchases-overview.md)。	


	


	


# 计费规则

### 1.流量流入及流出关系 ###

   API网关的流出流量指的是相对 API 网关来说的流出，例如如果后端服务为 HTTP 调用，从 API 网关到 HTTP 服务的流量和 API 网关响应前端客户端的流量，皆称为流出流量。


    
HTTP类型|源|目的|流量类型
:---|:---|:---|:---
HTTP请求 | 客户端、浏览器、SDK | API网关 | 流入流量
HTTP请求 | API网关 | 后端服务 | 流出流量
HTTP请求 | 后端服务 | API网关 | 流入流量
HTTP请求 | API网关 | 客户端、浏览器、SDK | 流出流量


### 2.计费方式 ###



更多详情请参见：


* [后付费计费说明](../../../Finance/Billing/Billing-method/Postpay.md)。

* [消费总览](../../../Finance/Billing/Bill/Purchases-overview.md)。	


	


	


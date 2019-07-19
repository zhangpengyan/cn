## 产品概述 

京东云应用安全网关（VPC-WAF）是对网站或APP服务进行可视化安全分析和应用层威胁防护的产品。通过提供WAF、用户访问审计、业务安全可视和合规性检查等功能，保障业务稳定可持续运行，提升用户体验，为网络服务提供者解决HTTP/HTTPS业务因攻击导致的异常或合规性问题。

应用安全网关通过绑定[应用负载均衡](https://docs.jdcloud.com/cn/application-load-balancer/product-overview)，对所有通过应用负载均衡HTTP/HTTPs(含Websocket)的流量进行防护。

京东云应用安全网关（VPC-WAF）的逻辑部署示意图如下：

 ![](../../../../image/AppliAcation-Security-Gateway/01-overview.png)

京东云应用安全网关（VPC-WAF）基于京东云高性能负载均衡集群，只需要在控制台创建VPC-WAF防护实例绑定负载均衡即可对所有经过负载均衡的HTTP/HTTPs流量，无域名也可实现防护，不需要对网站进行任何修改。

京东云应用安全网关（VPC-WAF）综合使用规则防护引擎、语义解析引擎、AI分析平台和威胁情报等多种安全技术，实现京东云VPC东西向和南北向Web安全防护。有效抵御OWASP Top 10等各类Web安全威胁，CC攻击和BOT管理，满足法律法规合规性要求，提供便捷的部署、使用体验和丰富的可视化图表，保护京东云用户的Web应用或API免遭当前和未来的安全威胁，保障用户安全上云。

#### 常用操作

- 快速上手
  - [创建实例](../Operation-Guide/Instance-Management/Create-Application-Security-Gateway.md)
- 套餐介绍
  - [套餐介绍](../Introduction/Specifications.md)

## 计费

应用安全网关按照包年包月计费进行计费。详细说明请参见“[计费规则](../Pricing/Price-Overview.md)”。

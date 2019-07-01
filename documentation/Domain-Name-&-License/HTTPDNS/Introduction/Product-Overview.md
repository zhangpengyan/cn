## 什么是HTTP DNS?

  HTTP DNS采用HTTP协议，替代基于UDP DNS协议的域名解析，直接从权威DNS/可靠Local DNS获取解析数据，从而绕过传统Local DNS，能够有效避免Local DNS不可靠导致的域名劫持、生效缓慢、来源IP不准确等问题。

## HTTP DNS的作用?

  HTTP DNS目的在于解决移动互联网中DNS解析异常、域名劫持的问题：运营商LocalDNS出口根据权威DNS目标IP地址进行NAT，或将解析请求转发到其他DNS服务器，导致权威DNS无法正确识别运营商的LocalDNS IP，引发域名解析错误、流量跨网。
  域名被劫持后，会使网站无法访问（无法连接服务器）或访问到钓鱼网站等。
  解析结果跨域、跨省、跨运营商、国家的后果：网站访问缓慢甚至无法访问。

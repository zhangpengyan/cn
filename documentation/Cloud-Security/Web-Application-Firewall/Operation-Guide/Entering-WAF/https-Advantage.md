## **HTTPS**高级配置

WAF提供灵活的HTTPS配置功能，帮助您在不改造源站的情况下，强制客户端使用HTTPS访问网站。

**操作步骤**

1. 登录[京东云Web应用防火墙控制台](https://cloudwaf-console.jdcloud.com)。

2. 前往 **网站配置**页面。

3. 选择要操作的域名，单击其操作列下的**编辑**。

4. 在**协议类型**下勾选**HTTPS**。![image.png](../../../../../image/waf-img/https%E9%AB%98%E7%BA%A7%E9%85%8D%E7%BD%AE.png)

5. **开启HTTPS的强制跳转**

开启后,HTTP请求将显示为HTTPS，默认跳转到443端口

![image.png](../../../../../image/waf-img/https%E9%AB%98%E7%BA%A7%E9%85%8D%E7%BD%AE-2.png)

**说明：** 开启跳转后，因为浏览器的缓存特性，继续访问http服务还是会跳转到https，开启HTTPS强制跳转前必须先取消HTTP协议。

**开启HTTP回源**

如果您的网站不支持HTTPS回源，请**开启HTTP回源**（默认回源端口是80端口），通过WAF实现HTTPS访问。使用该设置后，客户端可以通过HTTP和HTTPS方式访问站点。

**说明：** 使用HTTP回源，无需在源站服务器上做任何改动，也不需要配置HTTPS。但是，该配置的前提是在WAF的证书管理中上传正确的证书和私钥。

![image.png](../../../../../image/waf-img/https%E9%AB%98%E7%BA%A7%E9%85%8D%E7%BD%AE-3.png)

 

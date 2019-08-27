
# 设置Https

点击域名进入配置页面，“资源信息”设置“通信协议”

**SSL数字证书**

首先到SSL数字证书服务平台上传管理证书，在CDN控制台可根据证书名称选择域名对应的证书。

![image.png](https://github.com/jdcloudcom/cn/blob/cdn-new/image/CDN/ssl%E8%AF%81%E4%B9%A6%E7%AE%A1%E7%90%86.png)

**自定义证书**

未在ssl数字证书服务平台上管理证书的，可在CDN控制台添加证书内容和秘钥，同时也可以同步到SSL数字证书服务管理平台，同步时必须对该证书设置名称。

![image.png](https://github.com/jdcloudcom/cn/blob/cdn-new/image/CDN/https.png)

**跳转类型**

1、默认表示：客户端协议是HTTP，则到CDN节点的请求协议为HTTP，HTTPS同理；

2、HTTPS-->HTTP表示：客户端协议是HTTPS，则到CDN节点的请求协议为HTTP；

3、HTTP-->HTTPS表示：客户端协议是HTTP，则到CDN节点的请求协议为HTTP

 



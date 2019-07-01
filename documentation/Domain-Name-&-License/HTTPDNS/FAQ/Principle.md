## HTTP DNS的原理

客户端直接访问HTTP DNS接口，获取域名的最优IP。

客户端获取到业务IP后，就直接往此IP发送业务协议请求。以HTTP请求为例，通过在header中指定host字段，向HTTP DNS返回的IP发送标准的Http请求即可。

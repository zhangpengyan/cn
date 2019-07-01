# 回源跟随302

当用户请求资源，CDN节点未缓存的，节点回源请求且源站返回 302 状态码以及跳转地址，CDN 节点会直接向跳转地址请求资源而不返回 302 给用户

![image.png](https://github.com/jdcloudcom/cn/blob/cdn-new/image/CDN/%E5%9B%9E%E6%BA%90%E8%B7%9F%E9%9A%8F302.jpg)    

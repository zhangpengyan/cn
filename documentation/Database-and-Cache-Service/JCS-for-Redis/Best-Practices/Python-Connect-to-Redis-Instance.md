# Python连接
- step1：下载redis python客户端

 ```git clone https://github.com/andymccurdy/redis-py```
 
- step2：编写测试用例

```
#!/usr/bin/env python
#-*- coding: utf-8 -*-
import redis

#这里替换为连接的实例host和port
host = 'jredis-cn-north-1-prod-redis-xxxxxxxxxx.jdcloud.com'
port = 6379

#这里配置password
password = '*******'

#连接时通过password参数指定AUTH信息
r = redis.StrictRedis(host=host, port=port, password=password)

#连接建立后就可以进行数据库操作，详情文档参考https://github.com/andymccurdy/redis-py
r.set('foo', 'bar');
print r.get('foo')
```

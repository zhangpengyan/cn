# Node.js连接

- step1：下载安装Node.js的Redis客户端

```
git clone https://github.com/NodeRedis/node_redisnpm install redis
```

- step2：调用示例代码

```
//连接redis
var redis = require("redis"),
  port = 6379,
  host = 'jredis-cn-north-1-prod-redis-xxxxxxxxxx.jdcloud.com',
  password = '********',
  opts = {no_ready_check:true},//设置项：由于ready_check打开会发送info命令检查redis是否可用，Jmiss AP暂不支持info命令，请配置该项为true，否则AP会关闭该连接
  client = redis.createClient(port, host, opts);

// AUTH
client.auth(password, redis.print)

// 写入数据
client.set("key", "OK");

// 获取数据，返回String
client.get("key", function (err, reply) {
    console.log(reply.toString());
});

// 如果传入一个Buffer，返回也是一个Buffer
client.get(new Buffer("key"), function (err, reply) {
    console.log(reply.toString());
});
client.quit();
```

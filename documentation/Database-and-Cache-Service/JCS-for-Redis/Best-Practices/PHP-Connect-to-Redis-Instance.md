# PHP连接
- step1：下载php redis客户端 参考地址：https://github.com/phpredis/phpredis

- step2：编写测试用例

```
<?php
  /* 这里替换为连接的实例host和port */
  $host = "jredis-cn-north-1-prod-redis-xxxxxxxxxx.jdcloud.com";
  $port = 6379;
  /* 这里替换为集群的password */
  $password = "********";

  $redis = new Redis();
  if ($redis->connect($host, $port) == false) {
    die($redis->getLastError());
  }
  /* 使用password作为AUTH的密码 */
  if ($redis->auth($password) == false) {
    die($redis->getLastError());
  }
  /* 认证后就可以进行数据库操作，详情文档参考https://github.com/phpredis/phpredis */
  if ($redis->set("foo", "bar") == false) {
    die($redis->getLastError());
  }
  $value = $redis->get("foo");
  echo $value;
?>
```

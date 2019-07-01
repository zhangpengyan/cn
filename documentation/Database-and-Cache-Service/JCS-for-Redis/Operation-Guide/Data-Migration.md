# 数据迁移

## 1.数据迁移概述

- 迁移工具redis-migrate-tool目前支持公网自建、云主机自建、专线接入、VPN接入、云缓存Redis实例的迁移。

- 迁移工具redis-migrate-tool暂只支持源实例版本为Redis2.8、Redis3.2实例的数据迁移，迁移目标实例版本为Redis2.8，后续我们将更新支持更多的版本。

## 2.迁移术语

术语|解释
:--|:--
源实例source|迁移的源实例
目标实例target|迁移的目标实例，即用户购买的京东云 Redis
云主机自建|用户在京东云服务器上部署的Redis 服务迁移至京东云Redis
公网自建|用户在外网环境下部署的 Redis 服务迁移至京东云Redis

## 3.数据迁移说明

云缓存Redis提供数据导入工具(linux 版本) redis-migration-tool，工具支持迁移 Redis 2.8和Redis3.2版本的 AOF数据，数据迁移说明如下：

- 先清空目标实例，如果不清空目标实例，数据导入会覆盖原来数据；
- redis-migration-tool 配置文件rmt.conf参数说明：

[source]：源实例/[target]：目标实例

type：类型，有single和aof file两种

redis_auth：redis实例访问密码

servers：服务器地址和端口或者AOF存放路径
 
实时迁移数据配置示例：
```
[source]
type: single  
# redis_auth: 无密码时注释掉
servers:
 - 127.0.0.1:6379
[target]
type: single
redis_auth: password
servers:
 - jredis-cn-north-1-prod-redis-i02bbe91or.jdcloud.com:6379
```

 AOF迁移配置示例：
 ```
[source]
type: aof file
servers:
  -  /root/redis-2.8.3/src/appendonly.aof
[target]
type: single
redis_auth: password
servers:
 - jredis-cn-north-1-prod-redis-i02bbe91or.jdcloud.com:6379
```

## 4.使用方式：

1.下载解压[redis-migrate-tool.tar.gz](https://img1.jcloudcs.com/cms/4c5a2fc3-1dc5-468c-89d5-7d38dbc1a5c720180910162509.gz)，内容为迁移工具redis-migrate-tool和配置文件rmt.conf

2.修改配置文件，配置source和target端redis信息(建议配置从节点同步数据)

3.运行工具迁移数据，”./redis-migrate-tool -c rmt.conf”(server配置为服务器地址和端口时支持实时同步数据，配置为AOF存放路径时单次同步数据)
 
- 注：如果用户key值大的话会发生failover

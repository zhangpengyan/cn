# Redis命令支持

京东云缓存Redis基于2.8和4.0版本，命令请参见：[http://redis.io/commands](http://redis.io/commands)

## 支持的命令操作

|Key(键)|String(字符串)|Hash（哈希表）|List（列表）|Set（集合）|SortedSet（有序集合）| 
|:--:|:--:|:--:|:--:|:--:|:--:|
|DEL|APPEND|HDEL|LINDEX|SADD|ZADD|            
|DUMP|BITCOUNT|HEXISTS|LINSERT|SCARD|ZCARD|            
|EXISTS|BITPOS|HGET|LLEN|SISMEMBER|ZCOUNT|            
|EXPIRE| DECR |HGETALL| LPOP|SMEMBERS|ZINCRBY|            
|EXPIREAT|DECRBY|HINCRBY|LPUSH|SPOP| ZRANGE|            
|KEYS*|GET|HINCRBYFLOAT|LPUSHX|SRANDMEMBER|ZRANGEBYSCORE|           
|PERSIST|GETBIT|HKEYS|LRANGE       |     	SREM     |ZRANK  |          
|PEXPIRE|GETRANGE|HLEN|    	LREM        |    	SSCAN      | ZREM|            
|PEXPIREAT|GETSET|HMGET|     	LSET         |   	|ZREMRANGEBYRANK|            
|PTTL|INCR|HMSET|LTRIM | |        	ZREMRANGEBYSCORE |           
|RESTORE|INCRBY|HSET|RPOP      | |      	ZREVRANGE |           
|SORT|INCRBYFLOAT|HSETNX|RPUSH  | |          	ZREVRANGEBYSCORE |           
|TTL|MGET|HVALS|RPUSHX     | |       	ZREVRANK|            
|TYPE|MSET|HSCAN| | |       	       	ZSCORE|            
|SCAN|PSETEX| | | |ZSCAN            
| |SET   | |  |       	|ZRANGEBYLEX  |          
| |SETBIT      | | |   |   	ZLEXCOUNT|            
| |SETEX       | | |    | 	ZREMRANGEBYLEX   |         
| |SETNX| | | | |             	
| |SETRANGE   | | | | |        	
| |STRLEN    | | | |  |      	

以及

| Connection（连接） | Server（服务器） |
|--------------------|------------------|
| AUTH               | INFO*            |
| PING               | CONFIG GET*      |
| QUIT               | FLUSHDB          |
| ECHO               | FLUSHALL         |
| SELECT             |                  |         

说明：

- KEYS命令，只能在VPC网络下使用，属于危险的命令，可能造成性能问题，请确保在key很少的情况下使用。如果需要从一个大数据集中查找特定的 key ，推荐使用 Redis 的集合结构(set)

- INFO 命令，支持server，clients，memory，persistence，stats，replication，cpu，commandstats，cluster，keyspace

1.如果是集群版，replication，server展示的是某一分片的信息，其余子命令则是统计之后的信息。

2.特别说明，cluster子命令，显示db_count表示数据库的数量，shard_count表示当前redis版本的分片个数。

- CONFIG 命令，只支持CONFIG GET [parameter]子命令，并且如果是集群版Redis，返回的是某一个分片的信息。
- SORT命令使用方法：SORT key [BY pattern] [LIMIT offset count] [GET pattern [GET pattern ...]] [ASC|DESC] [ALPHA] [STORE destination]

1.由于SORT命令支持 [BY pattern]根据外部key进行排序，因此要确保key和pattern匹配上的key在同一个槽中，否则会出现与预期不符的结果。

2.SORT命令支持将结果写入destination中，因此，要确保destination和key 在同一个槽中，否则会(error) ERR CROSSSLOT Keys in request don't hash to the same slot错误

## 4.0新增支持的命令

| Key(键) | Hash(哈希表) | SortedSet（有序集合） | Server（服务器） | Scripting(脚本) | HyperLogLog（HLL） |   Geo(地理位置)   |
|:-------:|:------------:|:---------------------:|:----------------:|:---------------:|:------------------:|:-----------------:|
|  OBJECT |    HSTRLEN   |     ZREVRANGEBYLEX    |      DBSIZE      |       EVAL      |        PFADD       |       GEOADD      |
|  TOUCH  |              |                       |     RANDOMKEY    |     EVALSHA     |       PFCOUNT      |     GEORADIUS     |
|  UNLINK |              |                       |      MEMORY      |  SCRIPT EXISTS  |       PFMERGE      | GEORADIUSBYMEMBER |
|  BITOP  |              |                       |      LATENCY     |   SCRIPT FLUSH  |                    |      GEOHASH      |
|   MOVE  |              |                       |                  |   SCRIPT KILL   |                    |       GEOPOS      |
|         |              |                       |                  |   SCRIPT LOAD   |                    |      GEODIST      |

- LATENCY:  集群版的模式下，可以指定shardId。用来获取指定分片的数据，默认返回分片0的数据。

1.LATENCY支持的子命令有：[LATEST] [DOCTOR] [ HISTORY event-name] [RESET [event-name … event-name]] [GRAPH event-name] 

2.在集群版模式下，例如：LATENCY latest 1，来查看1号分片的最近一次的延迟时间信息。不指定shardId则默认为0号分片

- MEMORY命令，支持help，doctor，stats，purge，malloc-stats这几个子命令，支持指定shardId

MEMORY stats 1，表示查看1号分片的内存统计信息，不指定则默认0号分片

## 集群实例不支持的命令

| Key( 键 ) | String( 字符串 ) | List（列表） | Set （集合） | SortedSet （有序集合） | Server （服务器） | Transaction( 事务 ) |
|:---------:|:----------------:|-------------:|--------------|------------------------|-------------------|---------------------|
| RENAME    |       BITOP      |    RPOPLPUSH | SDIFF        | ZUNIONSTORE            | SLOWLOG           | DISCARD             |
| RENAMENX  |      MSETNX      |              | SDIFFSTORE   | ZINTERSTORE            | CONFIG REWRITE    | EXEC                |
| OBJECT    |                  |              | SINTER       |                        | CONFIG RESETSTAT  | MULTI               |
|           |                  |              | SINTERSTORE  |                        | COMMAND COUNT     | UNWATCH             |
|           |                  |              | SMOVE        |                        | COMMAND GETKEYS   | WATCH               |
|           |                  |              | SUNION       |                        | COMMAND INFO      |                     |
|           |                  |              | SUNIONSTORE  |                        |                   |                     |
	
- Redis2.8版本主从支持事务，集群不支持；Redis4.0主从集群都支持。事务中不支持的命令: SCRIPT *、INFO、SLOWLOG、LATENCY、EVAL、FLUSHALL、SCAN、AUTH、EVALSHA、DBSIZE、CONFIG、FLUSHDB、RANDOMKEY、PING

- ZUNIONSTORE/ZINTERSTORE命令，参数为destination numkeys key [key ...] [WEIGHTS weight] [SUM|MIN|MAX]

指定的所有key和destination 必须要要同属于一个槽，否则会(error) ERR CROSSSLOT Keys in request don't hash to the same slot错误

   
## 暂未开放的命令

|  Key(键)  | List（列表） | Server（服务器） | Pub/Sub（发布/订阅） |  Cluster(集群) | Connection(连接) |
|:---------:|:------------:|:----------------:|:--------------------:|:-------------:|:----------------:|
|  MIGRATE  |     BLPOP    |       TIME       |      PSUBSCRIBE      |  READWRITE   |      SWAPDB      |
|    WAIT   |     BRPOP    |      MONITOR     |        PUBLISH       |   READONLY   |                  |
|           |  BRPOPLPUSH  |   BGREWRITEAOF   |        PUBSUB        |  CLUSTER *   |                  |
|           |              |      BGSAVE      |     PUNSUBSCRIBE     |              |                  |
|           |              |    CONFIG SET    |       SUBSCRIBE      |              |                  |
|           |              |      COMMAND     |      UNSUBSCRIBE     |              |                  |
|           |              |   DEBUG OBJECT   |                      |              |                  |
|           |              |       DEBUG      |                      |              |                  |
|           |              |  DEBUG SEGFAULT  |                      |              |                  |
|           |              |       SAVE       |                      |              |                  |
|           |              |     LASTSAVE     |                      |              |                  |
|           |              |     SHUTDOWN     |                      |              |                  |
|           |              |      SLAVEOF     |                      |              |                  |
|           |              |       SYNC       |                      |              |                  |
|           |              |       PSYNC      |                      |              |                  |
|           |              |       ROLE       |                      |              |                  |		




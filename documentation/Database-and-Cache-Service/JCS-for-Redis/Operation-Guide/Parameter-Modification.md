# 参数修改

参数修改开放了九个参数供用户修改，参数修改操作步骤为：

1. 登录 Redis 管理控制台，选择目标实例；

2. 单击实例名称进入实例资源信息页面；

3. 在标签栏中，选择参数修改标签；

4. 右上角点击修改当前运行值，当前运行值列变为可输入；

5. 输入完后点击右上角保存修改。

- 附上参数说明表

参数名称|参数说明|默认值|参数范围
:--|:--|:--|:--
maxmemory-policy|达到最大内存使用率时数据的移除策略|volatile-lru|volatile-lru,allkeys-lru,volatile-random,allkeys-random,volatile-ttl,noeviction，4.0版多allkeys-lfu,volatile-random
hash-max-ziplist-entries|当hash的key的数量不大于指定值时，使用特殊存储(ZIPLIST)来节省空间|512|0-10000
hash-max-ziplist-value|当FIELD和VALUE的长度不大于指定值时，使用特殊存储(ZIPLIST)来节省存储空间|64|0-10000
list-max-ziplist-entries(2.8版)|当列表的数据不大于指定值时，使用特殊编码（ziplist）来捷顺存储空间|512|0-10000
list-max-ziplist-value(2.8版)|当value的长度不大于指定值时，使用特殊编码（ziplist)来节省存储空间|64|0-10000
list-max-ziplist-size(4.0版)|用ziplist编码实现的列表对象，按照数据项个数或占用的字节数，限定ziplist的长度|-2|-5-10000
list-compress-depth(4.0版)|用ziplist编码实现的列表对象，quicklist两端不被压缩的节点个数|0|0-10000
set-max-intset-entries|当set数量不大于指定值时，使用特殊编码（intset）来节省存储空间|512|0-10000
zset-max-ziplist-entries|当zset元素数量不大于指定值时，使用特殊编码（ziplist）来节省存储空间|128|0-10000
zset-max-ziplist-value|当元素值得最大长度不大于指定值时，使用特殊编码（ziplist）来节省存储空间|64|0-10000
slowlog-log-slower-than|慢日志功能记录命令的最大执行时间，单位：微秒|10000|0-10000


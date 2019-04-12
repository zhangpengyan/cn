# MySQL 性能测试
针对不同的云数据库 MySQL 规格，他们的最大连接数和最大 IOPS 是不一样的，参见[这里](../Introduction/Specifications/MySQL-Specifications.md)。

下面是针对云数据库 MySQL 的性能测试教程

## 测试环境
* 所有测试均在华北-北京，可用区A完成
* 测试用的云主机规格：4C 16GB
* 测试用的云主机镜像：CentOS 6.5 64位
* 测试用的云数据库 MySQL 版本：5.7

## 测试工具
### SysBench
SysBench 是一个基于 LuaJIT 的可脚本的多线程基准测试工具。它最常用于数据库基准测试，但也可以用于创建不涉及数据库服务器的任意复杂的工作负载。

#### 安装
1. sysbench 下载地址，[点击下载](https://github.com/akopytov/sysbench/archive/1.0.zip)
2. 安装命令

```
$ yum install gcc gcc-c++ autoconf automake make libtool bzr mysql-devel
$ unzip sysbench-1.0.zip
$ cd sysbench-1.0
$ ./autogen.sh
$ ./configure --prefix=/usr
$ make
$ make install
```

## 测试命令
### 准备数据

```
$ sysbench ./share/sysbench/oltp_read_write.lua --table_size=10000000 --db-driver=mysql --tables=10 --mysql-host=XXX --mysql-user=XXX --mysql-password=XXX prepare
```

### 性能压测

```
$ sysbench ./share/sysbench/oltp_read_write.lua --tables=10 --threads=32 --max-requests=999999999 --time=3600 --table_size=10000000  --db-driver=mysql --mysql-host=XXX --mysql-user=XXX --mysql-password=XXX run
```

### 环境清理

```
$ sysbench ./share/sysbench/oltp_read_write.lua --tables=10 --threads=32 --max-requests=999999999 --time=3600 --table_size=10000000  --db-driver=mysql --mysql-host=XXX --mysql-user=XXX --mysql-password=XXX cleanup
```

## 测试模型
### 表结构

```
CREATE TABLE `sbtest7` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` int(11) NOT NULL DEFAULT '0',
  `c` char(120) NOT NULL DEFAULT '',
  `pad` char(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `k_7` (`k`)
) ENGINE=InnoDB
```

### 数据格式

```
id: 1
  k: 5003504
  c: 98210233655-92920312724-46680254539-74097273196-30247159819-37778834059-40387910259-28547466616-68642657061-93956851311
pad: 13866500364-00628646396-45402716318-87575412098-94787248459
```

### SQL 样式
#### 查询

```
$ SELECT c FROM sbtest3 WHERE id=5007521
$ SELECT c FROM sbtest7 WHERE id BETWEEN 5000580 AND 5000679
$ SELECT SUM(k) FROM sbtest2 WHERE id BETWEEN 4992664 AND 4992763
$ SELECT DISTINCT c FROM sbtest6 WHERE id BETWEEN 5041654 AND 5041753 ORDER BY c
```

#### 更新

```
$ UPDATE sbtest2 SET k=k+1 WHERE id=4979352
$ DELETE FROM sbtest6 WHERE id=5037406
$ INSERT INTO sbtest4 (id, k, c, pad) VALUES (4995019, 4995155, '58990155292-53936825106-56125467619-3...
``` 

## 测试指标
* TPS：Transaction Per Second，数据库每秒执行的事务数，以commit为准。
* QPS：Query Per Second，数据库每秒执行的SQL数（含insert、select、update、delete等）。
* QT：Query Time，数据库每个请求执行的时间。

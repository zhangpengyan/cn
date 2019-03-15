# 搭建MongoDB分片集群

本文说明如何基于京东云主机搭建MongoDB分片集群。

## MongoDB分片集群配置信息

**系统版本**

	云主机：centos 7.4
	数据库：MongoDB 3.4

**Shard**

	3个分片，每个分片为3节点副本集：
	- shard1：10.0.0.1，10.0.0.2，10.0.0.3
	- shard2：10.0.0.4，10.0.0.5，10.0.0.6
	- shard3：10.0.0.7，10.0.0.8，10.0.0.9

	主机配置：
	- 规格：c.n2.large 
	- 系统盘:40GB
	- 数据盘：1000GB

**Config Server**

	使用3节点副本集：
	- 10.0.0.10
	- 10.0.0.11
	- 10.0.0.12

	主机配置：
	- 规格：c.n2.large 
	- 系统盘:40GB

**Router**

	使用3个mongos服务：
	- 10.0.0.13
	- 10.0.0.14
	- 10.0.0.15

	主机配置：
	- 规格：c.n2.large 
	- 系统盘:40GB

## 一、创建云主机，安装MongoDB

**1、通过云主机控制台，创建云主机**

- Shard单独挂载数据盘用于数据存储，Config Server、Router只需要系统盘。
- 建议所有的云主机部署在同一个子网中，为方便安装配置，可先绑定公网IP。
- 创建云主机请参考：[创建Linux实例](https://docs.jdcloud.com/cn/virtual-machines/create-linux-instance)
- 挂载数据盘请参考：[挂载数据盘](https://docs.jdcloud.com/cn/virtual-machines/mount-datadisk)

**2、安装MongoDB**

以下说明如何以yum方式MongoDB，云主机需要绑定公网IP。

1）创建yum源文件。

```
vi /etc/yum.repos.d/mongodb-org-3.4.repo
```
2）将以下内容添加到yum源文件。

```
[mongodb-org-3.4]  
name=MongoDB Repository  
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/  
gpgcheck=1  
enabled=1  
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc
```

3）执行安装。

```
yum -y install mongodb-org
```
**3、安装完成一台后，制作镜像，以镜像批量创建剩余的云主机。**

- 制作镜像请参考：[基于实例创建私有镜像](https://docs.jdcloud.com/cn/virtual-machines/create-private-image)。


## 二、配置Shard

**1、配置Shard1副本集**

1）选择云主机10.0.0.1，10.0.0.2，10.0.0.3，执行以下操作，创建所需的目录和文件。
```
mkdir -p /jddata1/work/data
mkdir -p /jddata1/work/log
echo "1773301708" > /jddata1/work/keyfile
chmod 0600 /jddata1/work/keyfile
```
2）修改配置文件

```
vi /etc/mongodb.conf
```
3）将以下内容添加到配置文件中
```
port = 27017  
fork = true  
logappend = true  
dbpath = /jddata1/work/data  
logpath = /jddata1/work/log/mongod.log  
maxConns = 2000  
timeStampFormat = iso8601-local  
wiredTigerCacheSizeGB = 7  
replSet = mgset-63514045  
keyFile = /jddata1/work/keyfile  
auth = true  
shardsvr = true  
```

4）启动mongod
```
nohup mongod -f /etc/mongodb.conf &
```
5）配置副本集

登录 10.0.0.1， 用`mongo`连接mongod。
```
use admin
rs.initiate({_id:"mgset-63514045", version:1, members:[{_id:0, host:"10.0.0.1:27017"}, {_id:1, host:"10.0.0.2:27017"},{_id:2, host:"10.0.0.3:27017"}]})  

```
执行完成后，Shard1副本集配置完成，可运行`rs.status`查看副本集状态。

**2、配置Shard2、Shard3副本集。**

重复以上步骤，完成Shard2、Shard3的配置，注意**不同Shard的replSet参数需要不同**。

## 三、配置Config Server

1、执行以下操作，创建所需的目录和文件。
```
mkdir -p /root/work/data
mkdir -p /root/work/log
echo "1773301708" > /root/work/keyfile
chmod 0600 /root/work/keyfile
```
2、修改配置文件

```
vi /etc/mongodb.conf
```
3、将以下内容添加到配置文件中
```
port = 27017  
fork = true  
logappend = true  
dbpath = /root/work/data  
logpath = /root/work/log/mongod.log  
maxConns = 400  
timeStampFormat = iso8601-local  
wiredTigerCacheSizeGB = 1  
replSet = mgset-73514045  
keyFile = /root/work/keyfile  
auth = true  
configsvr=true
```
4、启动mongod
```
nohup mongod -f /etc/mongodb.conf &
```
5、配置副本集

登录 10.0.0.10， 用`mongo`连接mongod。
```
use admin
rs.initiate({_id:"mgset-73514045", version:1, members:[{_id:0, host:"10.0.0.10:27017"}, {_id:1, host:"10.0.0.11:27017"},{_id:2, host:"10.0.0.12:27017"}]}) 
```
执行完成后，Shard1副本集配置完成，可运行`rs.status`查看副本集状态。

## 四、配置Router

Router服务可以配置1个或多个mongos。

**1、配置第1个mongos**

1）执行以下操作，创建所需的目录和文件。
```
mkdir -p /root/work/log
echo "1773301708" > /root/work/keyfile
chmod 0600 /root/work/keyfile
```
2）修改配置文件

```
vi /etc/mongos.conf
```
3）将一下内容添加到配置文件
```
port = 27017
fork = true
logappend = true
logpath = /root/work/log/mongod.log
maxConns = 200
timeStampFormat = iso8601-local
keyFile = /root/work/keyfile
configdb=mgset-73514045/10.0.0.10:27017,10.0.0.11:27017,10.0.0.12:27017

```

4）启动mongos
```
nohup mongos -f /etc/mongos.conf &
```

5）使用`mongo`连接mongos，创建账号
```
use admin
db.createUser(
{
     user: "root",
     pwd: "12345678",
     roles: [ { role: "root", db: "admin" } ]
   } 
)
```
6）使用新账号重新登录
```
mongo --port 27017 -u root -p 12345678 --authenticationDatabase admin
```
7）添加分片
```
sh.addShard("mgset-63514045/100.0.0.1:27017")
sh.addShard("mgset-63514045/100.0.0.2:27017")
sh.addShard("mgset-63514045/100.0.0.3:27017")
sh.addShard("mgset-63514046/100.0.0.4:27017")
sh.addShard("mgset-63514046/100.0.0.5:27017")
sh.addShard("mgset-63514046/100.0.0.6:27017")
sh.addShard("mgset-63514047/100.0.0.7:27017")
sh.addShard("mgset-63514047/100.0.0.8:27017")
sh.addShard("mgset-63514047/100.0.0.9:27017")
```

**2、连接测试**

1）连接MongoDB

```
mongo --host 10.0.0.13 --port 27017 -u root -p 12345678 --authenticationDatabase admin
```
2）测试写入数据

选择一个数据库， 开启分片， 指定集合的分片策略。
```
sh.enableSharding("mytest")
use mytest
db.mycol.ensureIndex({_id:1})
sh.shardCollection("mytest.mycol",{_id:1})
```

**3、配置另外2个mongos**

按以上步骤配置另外两个mongos。

**注意：**使用配置第1个mongos时已创建账号，配置其余mongos时不需要再次创建账号。



**至此，MongoDB分片集群搭建完成，为安全起见，正式使用时请解绑云主机的公网IP。**

# 京东云 Oracle RAC 11g 主要安装步骤

Oracle是业界使用最广泛的商业级数据库，目前很多用户都有在云上使用Oracle RAC的需求。因此本文档提供了如何在京东云上通过云主机，搭建Oracle RAC 11g的主要步骤。

## 1. 安装环境
- 云主机：2台，2核8G配置以上；需要可访问外网，用于安装一些必需的软件
- 云硬盘：100GB以上，需要支持多点挂载
- 操作系统环境：centos 6.5 64位
- 数据库版本： oracle 11.2.0.4

## 2. 环境规划
### IP规划

|主机名|公共IP|私有IP|虚拟IP|scan IP|
|-|-|-|-|-|
|oracle-rac1|10.10.10.101|192.168.100.101|10.10.10.103|10.10.10.105 scan-ip|
|oracle-rac2|10.10.10.102|192.168.100.102|10.10.10.104|10.10.10.105 scan-ip|

### ASM共享存储规划

|磁盘组|冗余类型|磁盘LIST|
|-|-|-|
|OCR|NORMAL|VOLCRS01、VOLCRS01、VOLCRS03|
|DATA|EXTERNAL|VOLDATA01、VOLDATA02、VOLDATA03|

### 配置/etc/hosts文件：

两个节点
```
#pub
10.10.10.101 oracle-rac1
10.10.10.102 oracle-rac2
#vip
10.10.10.103 oracle-rac1-vip
10.10.10.104 oracle-rac2-vip 
#priv
192.168.100.101 oracle-rac1-priv 
192.168.100.102 oracle-rac2-priv 
#scan-ip
10.10.10.105 scan-ip
```

## 3. 安装配置n2n
由于Oracle RAC需要网络具有组播功能，因此在云端需要借助n2n软件实现

### 3.1 安装n2n
安装svn需要的rpm
```
yum -y install subversion
sudo yum install openssl-devel
```

在两台云主机上均执行下面的命令
```
cd /usr/src
svn co https://svn.ntop.org/svn/ntop/trunk/n2n
cd n2n/n2n_v2
make
make PREFIX=/opt/n2n install
```

### 3.2 配置和启动n2n服务

```
# n2n服务端启动supernode
/opt/n2n/sbin/supernode -l 65530

# 写入开机自启动
echo "/opt/n2n/sbin/supernode -l 65530" >> /etc/rc.local
```

两个节点运行客户端，并写入到/etc/rc.local

注意：server端ip，是supernode的ip
- edge0: private网卡
- edge1: public网卡

- **节点1**
```
/opt/n2n/sbin/edge -d edge0 -a 10.10.10.101 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r
/opt/n2n/sbin/edge -d edge1 -a 192.168.100.101 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r
```

- **节点2**
```
/opt/n2n/sbin/edge -d edge0 -a 10.10.10.102 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r
/opt/n2n/sbin/edge -d edge1 -a 192.168.100.102 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r
```

## 4. 用户和目录配置
### 4.1 创建grid、oracle用户
在两台主机上均执行下面的命令
```
/usr/sbin/groupadd -g 501 oinstall
/usr/sbin/groupadd -g 502 asmadmin
/usr/sbin/groupadd -g 503 dba
/usr/sbin/groupadd -g 504 oper
/usr/sbin/groupadd -g 505 asmdba
/usr/sbin/groupadd -g 506 asmoper
/usr/sbin/useradd -u 501 -g oinstall -G asmadmin,asmdba,asmoper,oper,dba grid
/usr/sbin/useradd -u 502 -g oinstall -G dba,asmdba,oper oracle
```

### 4.2 配置对等性
配置两个节点的无密码访问
- **节点1**
```
su - grid (oracle)
mkdir .ssh
chmod -R 700 .ssh
ssh-keygen -t rsa
ssh-keygen -t dsa
```

- **节点2**
```
su - grid 
mkdir .ssh
chmod -R 700 .ssh
ssh-keygen -t rsa
ssh-keygen -t dsa
```

在节点1上执行
```
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys 
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
ssh oracle-rac2 cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys 
ssh oracle-rac2 cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
scp ~/.ssh/authorized_keys oracle-rac2:~/.ssh/authorized_keys
```

验证配置正确
```
ssh oracle-rac1 date (public网卡)
ssh oracle-rac2 date
ssh oracle-rac1-priv date (private网卡)
ssh oracle-rac2-priv date
```

### 4.3 创建目录
```
mkdir -p /u01/app/
mkdir -p /u01/app/grid_base
mkdir -p /u01/app/grid_home
chown -R grid:oinstall /u01/app/grid_base
chown -R grid:oinstall /u01/app/grid_home
chown -R oracle:oinstall /u01/app
chmod -R 775 /u01/app/
```

### 4.4 配置环境变量
**Grid用户**
```
vi ~/.bash_profile
umask 022
export ORACLE_BASE=/u01/app/grid_base
export ORACLE_HOME=/u01/app/grid_home
export ORACLE_SID=+ASM1 #第二个节点+ASM2
export PATH=/usr/sbin:$PATH
export PATH=$ORACLE_HOME/bin:$PATH
```

**Oracle用户**
```
umask 022
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/db_1
export ORA_GRID_HOME=/u01/app/grid_home
export ORACLE_UNQNAME=orcl 
export ORACLE_SID=orcl1 #第二个节点orcl2
export PATH=/usr/sbin:$PATH
export PATH=$ORACLE_HOME/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME/lib:/usr/lib
export CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib
export NLS_LANG=AMERICAN_AMERICA.ZHS16GBK
export NLS_DATE_FORMAT="YYYY-MM-DD HH24:MI:SS"
export TNS_ADMIN=$ORACLE_HOME/network/admin
export LANG=en_US
```

### 4.5 创建swap
在root用户下执行
```
# 增加文件系统
mkdir -p /home/oracle/myswaps
dd if=/dev/zero of=/home/oracle/myswaps/swapfile1 bs=1M count=2048
# 注意：of后面的路径一定不能是/dev下，否则在激活swap文件时报参数无效

# 创建swap文件
mkswap /home/oracle/myswaps/swapfile1

# 激活swap文件
swapon /home/oracle/myswaps/swapfile1

# vi /etc/fstab添加如下内容：
echo "/home/oracle/myswaps/swapfile1 swap swap defaults 0 0" >>/etc/fstab
```

### 4.6 准备软件
一共需要三个安装文件：
- p13390677_112040_Linux-x86-64_1of7.zip
- p13390677_112040_Linux-x86-64_2of7.zip
- p13390677_112040_Linux-x86-64_3of7.zip

将oracle软件的安装介质（前两个文件），上传到/home/oracle:

将grid软件的安装介质（第三个文件），上传到/home/grid:

## 5. 安装oracle rac的依赖包

### 5.1 检查缺少的rpm包
```
rpm -q binutils \
compat-libstdc++-33 \
elfutils-libelf \
elfutils-libelf-devel \
gcc \
gcc-c++ \
glibc \
glibc-common \
glibc-devel \
glibc-headers \
ksh \
libaio \
libaio-devel \
libgcc \
libstdc++ \
libstdc++-devel \
libXp \
make \
numactl-devel \
sysstat \
unixODBC \
unixODBC-devel \
compat-libcap1.x86_64 \
libcap.x86_64|grep not
```

例如上述命令输出以下内容
```
package compat-libstdc++-33 is not installed
package elfutils-libelf-devel is not installed
package ksh is not installed
package libaio-devel is not installed
package libXp is not installed
package numactl-devel is not installed
package sysstat is not installed
package unixODBC is not installed
package unixODBC-devel is not installed
package compat-libcap1.x86_64 is not installed
```

### 5.2 处理缺少的基础包
```
yum install -y compat-libstdc++-33
yum install -y elfutils-libelf-devel
yum install -y ksh
yum install -y libaio-devel
yum install -y libXp
yum install -y numactl-devel
yum install -y sysstat
yum install -y unixODBC*
yum install -y compat-libcap1.x86_64
```
其中2个rpm包的特殊处理 pdksh 和 cvuqdisk ，一个需要单独下载，一个需要在oracle安装介质中找

ksh无用，需要安装pdksh
```
rpm -ivh pdksh-5.2.14-21.x86_64.rpm
pdksh conflicts with ksh-20120801-37.el6_9.x86_64
rpm -e ksh-20120801-37.el6_9.x86_64
```
假如冲突，卸载ksh
```
pdksh conflicts with ksh-20120801-37.el6_9.x86_64
rpm -e ksh-20120801-37.el6_9.x86_64
```

cvuqdisk 可在在Oracle安装介质中可以找到
```
yum install -y smartmontools
rpm -ivh cvuqdisk-1.0.9-1.rpm
```

安装asmlib的相关包，oracleasmlib、oracleasm-support、Kmod-oracleasm
```
rpm -ivh kmod-oracleasm-2.0.6.rh1-3.el6.x86_64.rpm
rpm -ivh oracleasm-support-2.1.8-1.el6.x86_64.rpm 
rpm -ivh oracleasmlib-2.0.4-1.el6.x86_64.rpm
```

## 6. 系统参数设置

### 6.1 修改内核参数
```
vi /etc/sysctl.conf
echo "fs.aio-max-nr = 1048576" >> /etc/sysctl.conf
echo "fs.file-max = 6815744" >> /etc/sysctl.conf
echo "kernel.shmall =7864320" >> /etc/sysctl.conf 
echo "kernel.shmmax = 52451655680" >> /etc/sysctl.conf
echo "kernel.shmmni = 4096" >> /etc/sysctl.conf
echo "kernel.sem = 250 32000 100 128" >> /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range = 9000 65500" >> /etc/sysctl.conf
echo "net.core.rmem_default = 262144" >> /etc/sysctl.conf
echo "net.core.rmem_max = 4194304" >> /etc/sysctl.conf
echo "net.core.wmem_default = 262144" >> /etc/sysctl.conf
echo "net.core.wmem_max = 1048576" >> /etc/sysctl.conf
sysctl -p 
```

### 6.2 修改用户限制
```
vi /etc/security/limits.conf
echo "oracle soft nofile 4096" >> /etc/security/limits.conf
echo "oracle hard nofile 65536" >> /etc/security/limits.conf
echo "oracle soft nproc 2047" >> /etc/security/limits.conf
echo "oracle hard nproc 16384" >> /etc/security/limits.conf
echo "oracle soft stack 10240" >> /etc/security/limits.conf
echo "grid soft nofile 4096" >> /etc/security/limits.conf
echo "grid hard nofile 65536" >> /etc/security/limits.conf
echo "grid soft nproc 2047" >> /etc/security/limits.conf
echo "grid hard nproc 16384" >> /etc/security/limits.conf
echo "grid soft stack 10240" >> /etc/security/limits.conf
echo "* soft memlock 18874368" >> /etc/security/limits.conf
echo "* hard memlock 18874368" >> /etc/security/limits.conf
```

### 6.3 修改/etc/pam.d/login，加入认证模块
```
echo "session required pam_limits.so" >> /etc/pam.d/login
```

### 6.4 disable iptables ,selinux 和 ntp server
```
chkconfig --list iptables
chkconfig iptables off
chkconfig --list iptables
service iptables stop
service network restart
echo "SELINUX=disabled" >>/etc/selinux/config

/sbin/service ntpd stop
chkconfig ntpd off
mv /etc/ntp.conf /etc/ntp.conf.bk
rm /var/run/ntpd.pid
```

### 6.5 共享磁盘

1. 购买支持多点挂载的硬盘
京东云控制台的操作： 位置在 “弹性计算\云硬盘” ，注意一定要选择“多点挂载”

2. 两台节点分别挂载共享硬盘
京东云控制台的操作： 位置在“弹性计算\云主机” ，选择购买的共享disk进行挂载

### 6.6 分区规划（6个分区）
```
parted /dev/vdb mklabel gpt
parted /dev/vdb mkpart primary 0 10000 
parted /dev/vdb mkpart primary 10000 20000
parted /dev/vdb mkpart primary 20000 30000
parted /dev/vdb mkpart primary 30000 40000
parted /dev/vdb mkpart primary 40000 50000
parted /dev/vdb mkpart primary 50000 60000
parted /dev/vdb p
```

### 6.7 配置asmlib
```
/usr/sbin/oracleasm configure -i #两个节点
/etc/init.d/oracleasm enable #两个节点
/etc/init.d/oracleasm start #两个节点
```

### 6.8 创建磁盘
```
/etc/init.d/oracleasm createdisk VOLCRS01 /dev/vdb1
/etc/init.d/oracleasm createdisk VOLCRS02 /dev/vdb2
/etc/init.d/oracleasm createdisk VOLCRS03 /dev/vdb3
/etc/init.d/oracleasm createdisk VOLDATA01 /dev/vdb4
/etc/init.d/oracleasm createdisk VOLDATA02 /dev/vdb5
/etc/init.d/oracleasm createdisk VOLDATA03 /dev/vdb6
/usr/sbin/oracleasm scandisks #一个节点创建磁盘后，另一个节点扫描磁盘即可
/usr/sbin/oracleasm listdisks #
```

### 6.9 扫描识别asm硬盘
```
/usr/sbin/oracleasm scandisks #一个节点创建磁盘后，另一个节点扫描磁盘即可
```

### 6.10 检查输出asm清单
两个节点分别执行
```
/usr/sbin/oracleasm listdisks 
```

## 7. grid安装

### 7.1 环境核验
用grid用户解压grid软件的安装介质

```
su - grid
unzip p13390677_112040_Linux-x86-64_3of7.zip -d /home/grid
/home/grid/grid/runcluvfy.sh stage -pre crsinst -n oracle-rac1,oracle-rac2 -verbose 
```

### 7.2 准备响应文件
```
cp /home/grid/grid/response/grid_install.rsp grid_install_jdtest.rsp
```
编辑文件grid_install_jdtest.rsp文件，修改的参数如下
```
ORACLE_HOSTNAME=oracle-rac1
INVENTORY_LOCATION=/u01/app/oraInventory
oracle.install.option=CRS_CONFIG
ORACLE_BASE=/u01/app/grid_base
ORACLE_HOME=/u01/app/grid_home
oracle.install.asm.OSDBA=asmdba
oracle.install.asm.OSOPER=asmoper
oracle.install.asm.OSASM=asmadmin
oracle.install.crs.config.gpnp.scanPort=1521
oracle.install.crs.config.clusterName=rac-cluster
oracle.install.crs.config.clusterNodes=oracle-rac1:oracle-rac1-vip,oracle-rac2:oracle-rac2-vip
oracle.install.crs.config.privateInterconnects=edge1:192.168.100.0:2,edge0:10.10.10.0:1 # 1代表public，2代表private，3代表在群集中不使用该网卡
oracle.install.crs.config.storageOption=ASM_STORAGE
oracle.install.asm.SYSASMPassword=Grid123
oracle.install.asm.diskGroup.name=OCR
oracle.install.asm.diskGroup.redundancy=NORMAL
oracle.install.asm.diskGroup.AUSize=1
oracle.install.asm.diskGroup.disks=/dev/oracleasm/disks/VOLCRS01,/dev/oracleasm/disks/VOLCRS02,/dev/oracleasm/disks/VOLCRS03
oracle.install.asm.diskGroup.diskDiscoveryString=/dev/oracleasm/disks
oracle.install.asm.monitorPassword=Grid123
```

### 7.3 安装grid
```
./runInstaller -silent -responseFile /home/grid/grid/response/grid_install_jdtest.rsp -ignoreSysPrereqs -ignorePrereq
```
等待一段时间后，会提示在两个节点分别用root用户执行：
```
/u01/grid/oraInventory/orainstRoot.sh
/u01/crs/11.2.0/root.sh
```

### 7.4 设置grid的用户密码
创建和写入文件 cfgrsp.properties
```
cd /home/grid/grid/response
cat << EOF > cfgrsp.properties 
oracle.assistants.asm|S_ASMPASSWORD=Grid123
oracle.assistants.asm|S_ASMMONITORPASSWORD=Grid123
EOF
```

修改文件属性
```
chmod 600 cfgrsp.properties
```

执行configToolAllCommands，生成密码信息
```
/u01/app/grid_home/cfgtoollogs/configToolAllCommands RESPONSE_FILE=/home/grid/grid/response/cfgrsp.properties
```


### 7.5 查看集群资源
grid安装完成，查看集群资源的输出如下：
```
crs_stat -t
Name Type Target State Host 
# ------------------------------------------------------------
ora....ER.lsnr ora....er.type ONLINE ONLINE oracle-rac1 
ora....N1.lsnr ora....er.type ONLINE ONLINE oracle-rac1 
ora.OCR.dg ora....up.type ONLINE ONLINE oracle-rac1 
ora.asm ora.asm.type ONLINE ONLINE oracle-rac1 
ora.cvu ora.cvu.type ONLINE ONLINE oracle-rac1 
ora.gsd ora.gsd.type OFFLINE OFFLINE 
ora....network ora....rk.type ONLINE ONLINE oracle-rac1 
ora.oc4j ora.oc4j.type ONLINE ONLINE oracle-rac1 
ora.ons ora.ons.type ONLINE ONLINE oracle-rac1 
ora....SM1.asm application ONLINE ONLINE oracle-rac1 
ora....C1.lsnr application ONLINE ONLINE oracle-rac1 
ora....ac1.gsd application OFFLINE OFFLINE 
ora....ac1.ons application ONLINE ONLINE oracle-rac1 
ora....ac1.vip ora....t1.type ONLINE ONLINE oracle-rac1 
ora....SM2.asm application ONLINE ONLINE oracle-rac2 
ora....C2.lsnr application ONLINE ONLINE oracle-rac2 
ora....ac2.gsd application OFFLINE OFFLINE 
ora....ac2.ons application ONLINE ONLINE oracle-rac2 
ora....ac2.vip ora....t1.type ONLINE ONLINE oracle-rac2 
ora.scan1.vip ora....ip.type ONLINE ONLINE oracle-rac1 
crsctl check cluster -all
# **************************************************************
oracle-rac1:
CRS-4537: Cluster Ready Services is online
CRS-4529: Cluster Synchronization Services is online
CRS-4533: Event Manager is online
# **************************************************************
oracle-rac2:
CRS-4537: Cluster Ready Services is online
CRS-4529: Cluster Synchronization Services is online
CRS-4533: Event Manager is online
# **************************************************************
```

### 7.6 创建asmdisk group
```
su – grid
asmca -silent -createDiskGroup -sysAsmPassword Grid123 -diskString '/dev/oracleasm/disks/*' -diskGroupName DATA -diskList '/dev/oracleasm/disks/VOLDATA01' -redundancy EXTERNAL -compatible.asm 11.2 -compatible.rdbms 11.2
asmca -silent -addDisk -sysAsmPassword Grid123 -diskGroupName DATA -diskList '/dev/oracleasm/disks/VOLDATA02','/dev/oracleasm/disks/VOLDATA03'
```

### 7.7 查看信息
```
select name,path,STATE,GROUP_NUMBER 
from v$asm_disk;
select name,state,type,total_mb,free_mb 
from v$asm_diskgroup;
```


## 8. 安装oracle数据库软件：

### 8.1 安装前验证：
```
#grid用户执行
/home/grid/grid/runcluvfy.sh stage -pre dbinst -n oracle-rac1,oracle-rac2 -verbose
```

### 8.2 编译响应文件
```
#oracle用户执行
vi u01/soft/oracle/database/response/db_install_jdtest.rsp
```

修改参考:
```
oracle.install.option=INSTALL_DB_SWONLY
ORACLE_HOSTNAME=oracle-rac1
UNIX_GROUP_NAME=oinstall
INVENTORY_LOCATION=/u01/app/oraInventory
SELECTED_LANGUAGES=en
ORACLE_HOME=/u01/app/oracle/product/11.2.0/db_1
ORACLE_BASE=/u01/app/oracle
oracle.install.db.InstallEdition=EE
oracle.install.db.EEOptionsSelection=false
oracle.install.db.optionalComponents=oracle.rdbms.partitioning:11.2.0.4.0,oracle.oraolap:11.2.0.4.0,oracle.rdbms.dm:11.2.0.4.0,oracle.rdbms.dv:11.2.0.4.0,oracle.rdbms.lbac:11.2.0.4.0,oracle.rdbms.rat:11.2.0.4.0
oracle.install.db.DBA_GROUP=dba
oracle.install.db.OPER_GROUP=oinstall
oracle.install.db.CLUSTER_NODES=rac1,rac2
DECLINE_SECURITY_UPDATES=true
```

### 8.3 修改目录权限

因为/u01/app的权限变成了root，所以需要修改一下.两个节点执行:
```
chown -R oracle:oinstall /u01/app
chmod -R 775 /u01/app/
chown -R grid:oinstall /u01/app/grid_base
chown -R grid:oinstall /u01/app/grid_home
```


### 8.4. 执行静默安装oracle软件
```
./runInstaller -silent -ignoreSysPrereqs -ignorePrereq -responseFile /home/oracle/database/response/db_install_jdtest.rsp
```

### 8.5 根据提示执行下面的脚本:
```
/u01/app/oracle/product/11.2.0/db_1/root.sh
```

## 9. 安装DB

### 9.1 准备响应文件
```
#oracle用户执行
cp /home/oracle/database/response/dbca.rsp /home/oracle/database/response/dbca_jdtest.rsp
```
### 9.2 编辑文件dbca_jdtest.rsp
修改的参数如下：
```
GDBNAME = "orcl"
SID = "orcl"
NODELIST=oracle-rac1,oracle-rac2
SYSPASSWORD = "Oracle123"
SYSTEMPASSWORD = "Oracle123"
STORAGETYPE=ASM
DISKGROUPNAME=DATA
RECOVERYGROUPNAME=DATA
CHARACTERSET = "ZHS16GBK"
```

检查$ORACLE_HOME/bin/oracle文件属性
```
su - grid #切换到grid用户
```

检查文件属性：
```
ls -l $ORACLE_HOME/bin/oracle
```

输出结果应该为：
```
-rwsr-sr-x 1 grid oinstall
```

如果不是-rwsr-sr-x ，执行属性修改：
```
chmod 6755 $ORACLE_HOME/bin/oracle
```

### 9.3 静默创建数据库
```
dbca -silent -responseFile /home/oracle/database/response/dbca_jdtest.rsp
```

至此全部安装完成,确认结果的输出如下：
```
[grid@oracle-rac1 ~]$ crs_stat -t
Name Type Target State Host 
------------------------------------------------------------
ora.DATA.dg ora....up.type ONLINE ONLINE oracle-rac1 
ora....ER.lsnr ora....er.type ONLINE ONLINE oracle-rac1 
ora....N1.lsnr ora....er.type ONLINE ONLINE oracle-rac1 
ora.OCR.dg ora....up.type ONLINE ONLINE oracle-rac1 
ora.asm ora.asm.type ONLINE ONLINE oracle-rac1 
ora.cvu ora.cvu.type ONLINE ONLINE oracle-rac1 
ora.gsd ora.gsd.type OFFLINE OFFLINE 
ora....network ora....rk.type ONLINE ONLINE oracle-rac1 
ora.oc4j ora.oc4j.type ONLINE ONLINE oracle-rac1 
ora.ons ora.ons.type ONLINE ONLINE oracle-rac1 
ora....SM1.asm application ONLINE ONLINE oracle-rac1 
ora....C1.lsnr application ONLINE ONLINE oracle-rac1 
ora....ac1.gsd application OFFLINE OFFLINE 
ora....ac1.ons application ONLINE ONLINE oracle-rac1 
ora....ac1.vip ora....t1.type ONLINE ONLINE oracle-rac1 
ora....SM2.asm application ONLINE ONLINE oracle-rac2 
ora....C2.lsnr application ONLINE ONLINE oracle-rac2 
ora....ac2.gsd application OFFLINE OFFLINE 
ora....ac2.ons application ONLINE ONLINE oracle-rac2 
ora....ac2.vip ora....t1.type ONLINE ONLINE oracle-rac2 
ora.orcl.db ora....se.type ONLINE ONLINE oracle-rac1 
ora.scan1.vip ora....ip.type ONLINE ONLINE oracle-rac1
crsctl status res -t
--------------------------------------------------------------------------------
NAME TARGET STATE SERVER STATE_DETAILS 
--------------------------------------------------------------------------------
Local Resources
--------------------------------------------------------------------------------
ora.DATA.dg
ONLINE ONLINE oracle-rac1 
ONLINE ONLINE oracle-rac2 
ora.LISTENER.lsnr
ONLINE ONLINE oracle-rac1 
ONLINE ONLINE oracle-rac2 
ora.OCR.dg
ONLINE ONLINE oracle-rac1 
ONLINE ONLINE oracle-rac2 
ora.asm
ONLINE ONLINE oracle-rac1 Started 
ONLINE ONLINE oracle-rac2 Started 
ora.gsd
OFFLINE OFFLINE oracle-rac1 
OFFLINE OFFLINE oracle-rac2 
ora.net1.network
ONLINE ONLINE oracle-rac1 
ONLINE ONLINE oracle-rac2 
ora.ons
ONLINE ONLINE oracle-rac1 
ONLINE ONLINE oracle-rac2 
--------------------------------------------------------------------------------
Cluster Resources
--------------------------------------------------------------------------------
ora.LISTENER_SCAN1.lsnr
1 ONLINE ONLINE oracle-rac1 
ora.cvu
1 ONLINE ONLINE oracle-rac1 
ora.oc4j
1 ONLINE ONLINE oracle-rac1 
ora.oracle-rac1.vip
1 ONLINE ONLINE oracle-rac1 
ora.oracle-rac2.vip
1 ONLINE ONLINE oracle-rac2 
ora.orcl.db
1 ONLINE ONLINE oracle-rac1 Open 
2 ONLINE ONLINE oracle-rac2 Open 
ora.scan1.vip
1 ONLINE ONLINE oracle-rac1
```

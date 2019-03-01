

#### 当前代码: documentation/Cloud-Security/Security-Instruction/Security-Vulnerability-Instruction/Intel-Meltdown-Spectre-Solution.md
```
    apt-get update     apt-get install linux-image-3.13.0-139-generic
```


#### 当前代码: documentation/Cloud-Security/Security-Instruction/Security-Vulnerability-Instruction/Intel-Meltdown-Spectre-Solution.md
```
    apt-get update     apt-get install linux-image-4.4.0-109-generic
```


#### 当前代码: documentation/Cloud-Security/Security-Instruction/Security-Vulnerability-Instruction/Intel-Meltdown-Spectre-Solution.md
```
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v MinVmVersionForCpuBasedMitigations /t REG_SZ /d "1.0" /f
```


#### 当前代码: documentation/Cloud-Security/Security-Instruction/Security-Vulnerability-Instruction/Intel-Meltdown-Spectre-Solution.md
```
 PS> # Save the current execution policy so it can be reset
 PS> $SaveExecutionPolicy = Get-ExecutionPolicy
 PS> Set-ExecutionPolicy RemoteSigned -Scope Currentuser
 PS> CD C:\ADV180002\SpeculationControl
 PS> Import-Module .\SpeculationControl.psd1
 PS> Get-SpeculationControlSettings
 PS> # Reset the execution policy to the original state
 PS> Set-ExecutionPolicy $SaveExecutionPolicy -Scope Currentuser
```


#### 当前代码: documentation/Cloud-Security/Security-Instruction/Security-Vulnerability-Instruction/Intel-Meltdown-Spectre-Solution.md
```
 PS C:\> Get-SpeculationControlSettings
 Speculation control settings for CVE-2017-5715 [branch target injection]
 Hardware support for branch target injection mitigation is present: True
 Windows OS support for branch target injection mitigation is present: True
 Windows OS support for branch target injection mitigation is enabled: True
 Speculation control settings for CVE-2017-5754 [rogue data cache load]
 Hardware requires kernel VA shadowing: True
 Windows OS support for kernel VA shadow is present: True
 Windows OS support for kernel VA shadow is enabled: True
 Windows OS support for PCID optimization is enabled: True
```


#### 当前代码: documentation/Cloud-Security/Security-Instruction/Security-Vulnerability-Instruction/Intel-Meltdown-Spectre-Solution.md
```
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v MinVmVersionForCpuBasedMitigations /t REG_SZ /d "1.0" /f
```


#### 当前代码: documentation/Cloud-Security/Security-Instruction/Security-Vulnerability-Instruction/Intel-Meltdown-Spectre-Solution.md
```
 PS> # Save the current execution policy so it can be reset
 PS> $SaveExecutionPolicy = Get-ExecutionPolicy
 PS> Set-ExecutionPolicy RemoteSigned -Scope Currentuser
 PS> CD C:\ADV180002\SpeculationControl
 PS> Import-Module .\SpeculationControl.psd1
 PS> Get-SpeculationControlSettings
 PS> # Reset the execution policy to the original state
 PS> Set-ExecutionPolicy $SaveExecutionPolicy -Scope Currentuser
```


#### 当前代码: documentation/Cloud-Security/Security-Instruction/Security-Vulnerability-Instruction/Intel-Meltdown-Spectre-Solution.md
```
 PS C:\> Get-SpeculationControlSettings
 Speculation control settings for CVE-2017-5715 [branch target injection]
 Hardware support for branch target injection mitigation is present: True
 Windows OS support for branch target injection mitigation is present: True
 Windows OS support for branch target injection mitigation is enabled: True
 Speculation control settings for CVE-2017-5754 [rogue data cache load]
 Hardware requires kernel VA shadowing: True
 Windows OS support for kernel VA shadow is present: True
 Windows OS support for kernel VA shadow is enabled: True
 Windows OS support for PCID optimization is enabled: True
```


#### 当前代码: documentation/Cloud-Security/Security-Instruction/Security-Vulnerability-Instruction/NTP-Monlist-Vulnerability.md
```
restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
```


#### 当前代码: documentation/Cloud-Security/Security-Instruction/Security-Vulnerability-Instruction/NTP-Monlist-Vulnerability.md
```
1.ntpdc -n -c monlist ntp_server-IP 
2.nmap -sU -pU:123 -Pn -n --script=ntp-monlist NTP_Server_IP 
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Memcached/Best-Practices/Cplusplus-libmemcached.md
```
wget https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz
tar -xvf libmemcached-1.0.18.tar.gz 
cd libmemcached-1.0.18 
./configure --enable-sasl
make && make install 
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Memcached/Best-Practices/Cplusplus-libmemcached.md
```
  #include <iostream>
  #include <string>
  #include <libmemcached/memcached.h>

  using namespace std;
    
  #define IP "ip"
  #define PORT port//默认为11211
  
  int main(int argc,char *argv[])
  {
      //connect server
     memcached_st *memc;
     memcached_return rc;
     memcached_server_st *server;
     time_t expiration = 0;
     uint32_t  flags;
 
     memc = memcached_create(NULL);
     server = memcached_server_list_append(NULL,IP,PORT,&rc); 
     rc=memcached_server_push(memc,server);
     memcached_server_list_free(server);
 
     string key = "Key";
     string value = "Value";
     size_t value_length = value.length();
     size_t key_length = key.length();
 
     rc=memcached_set(memc,key.c_str(),key.length(),value.c_str(),value.length(),expiration,flags);
     if(rc==MEMCACHED_SUCCESS)
     {
         cout<<"Save key: "<<key<<", value: "<<value<<", sucessfully!"<<endl;
     }

     char* result = memcached_get(memc,key.c_str(),key_length,&value_length,&flags,&rc);
     if(rc == MEMCACHED_SUCCESS)
     {
         cout<<"Get key: "<<key<<", value: "<<result<<", sucessfully!"<<endl;
     }

     rc=memcached_delete(memc,key.c_str(),key_length,expiration);
     if(rc==MEMCACHED_SUCCESS)
     {
         cout<<"Delete key: "<<key<<", value: "<<value<<", sucessfully!"<<endl;
     }
     else
     {
        cout<<rc<<endl;
     }

    memcached_free(memc);
     return 0;
 }
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Memcached/Best-Practices/Cplusplus-libmemcached.md
```
  #include <iostream>
  #include <string>
  #include <libmemcached/memcached.h>

  using namespace std;
    
  #define IP "ip"
  #define PORT port//默认为11211
  #define USERNAME "username"
  #define PASSWORD "password"
  
  int main(int argc,char *argv[])
  {
     memcached_st *memc;
     memcached_return rc;
     memcached_server_st *server;
     time_t expiration = 0;
     uint32_t  flags;
 
     memc = memcached_create(NULL);
     server = memcached_server_list_append(NULL,IP,PORT,&rc); 
     sasl_client_init(NULL);
     rc = memcached_set_sasl_auth_data(memc, USERNAME, PASSWORD);
     if(rc != MEMCACHED_SUCCESS)
        {
        cout<<"Set SASL err:"<< endl;
        }
     rc = memcached_behavior_set(memc,MEMCACHED_BEHAVIOR_BINARY_PROTOCOL,1);
     if(rc != MEMCACHED_SUCCESS)
        {
         cout<<"Binary Set err:"<<endl;
        }
     rc=memcached_server_push(memc,server);
     memcached_server_list_free(server);
 
     string key = "Key";
     string value = "Value";
     size_t value_length = value.length();
     size_t key_length = key.length();
 
     rc=memcached_set(memc,key.c_str(),key.length(),value.c_str(),value.length(),expiration,flags);
     if(rc==MEMCACHED_SUCCESS)
     {
         cout<<"Save key: "<<key<<", value: "<<value<<", sucessfully!"<<endl;
     }

     char* result = memcached_get(memc,key.c_str(),key_length,&value_length,&flags,&rc);
     if(rc == MEMCACHED_SUCCESS)
     {
         cout<<"Get key: "<<key<<", value: "<<result<<", sucessfully!"<<endl;
     }

     rc=memcached_delete(memc,key.c_str(),key_length,expiration);
     if(rc==MEMCACHED_SUCCESS)
     {
         cout<<"Delete key: "<<key<<", value: "<<value<<", sucessfully!"<<endl;
     }
     else
     {
        cout<<rc<<endl;
     }

    memcached_free(memc);
     return 0;
 }
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Memcached/Best-Practices/Python-bmemcached.md
```
#!/usr/bin/env python
import bmemcached

if __name__ == '__main__':
client = bmemcached.Client(('ip:port',), 'username', 'password')#免密模式下不需要用户名和密码
client.set('test1', 'value1')
    print (client.get('test1'))
    client.add('test2', 'value2')
    print(client.get('test1'))
    client.replace('test1', '1')
    client.incr('test1', 1)
    client.decr('test1', 1)
    _, cas = client.gets('test1')
    client.cas('test1', 11, cas)
    dictMap = {'a': '1', 'b': '2', 'c': '3'}
    client.set_multi(dictMap)
    keys = ['a', 'b', 'c']
print (client.get_multi(keys))
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Memcached/Best-Practices/go-gomemcache.md
```
package gomemcached

import (
	"fmt"
	"github.com/bradfitz/gomemcache/memcache"
)

func main() {
	mc := memcache.New("ip:port")//可通过添加多个实例的ip:port来实现集群版客户端
	mc.Set(&memcache.Item{Key: "key", Value: []byte("value")})

	it, err := mc.Get("key")
	if err != nil {
		panic(err)
	}

	fmt.Printf("Value: %s", it.Value)
}
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Memcached/Best-Practices/java-spymemcached.md
```
package Spymemcached;

import java.net.InetSocketAddress;
import net.spy.memcached.MemcachedClient;
import net.spy.memcached.internal.OperationFuture;
 
public class Spymemcached {
   public static void main(String[] args) {
   
      try{
         MemcachedClient mcc = new MemcachedClient(new InetSocketAddress("ip", port));
         System.out.println("Connection to server sucessfully.");
         OperationFuture<Boolean> fo = mcc.set("key", 0, "value");
         System.out.println("set status:" + fo.get());
         System.out.println("key value - " + mcc.get("key"));
         mcc.shutdown();
         
      }catch(Exception ex){
         System.out.println( ex.getMessage() );
      }
   }
}
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Memcached/Best-Practices/java-spymemcached.md
```
package Spymemcached;

import java.net.InetSocketAddress;

import net.spy.memcached.AddrUtil;
import net.spy.memcached.ConnectionFactoryBuilder;
import net.spy.memcached.ConnectionFactoryBuilder.Protocol;
import net.spy.memcached.MemcachedClient;
import net.spy.memcached.auth.AuthDescriptor;
import net.spy.memcached.auth.PlainCallbackHandler;
import net.spy.memcached.internal.OperationFuture;
 
public class Spymemcached {
   public static void main(String[] args) {
   
      try{
    	  AuthDescriptor ad = new AuthDescriptor(new String[]{"PLAIN"}, new PlainCallbackHandler("test", "test"));
    	  MemcachedClient mcc = new MemcachedClient(
                             new ConnectionFactoryBuilder().setProtocol(Protocol.BINARY)
                  .setAuthDescriptor(ad)
                  .build(),
                  AddrUtil.getAddresses("ip" + ":" + port));
         System.out.println("Connection to server sucessful.");
         OperationFuture<Boolean> fo = mcc.set("key", 0, "value");
         System.out.println("set status:" + fo.get());
         System.out.println("key value - " + mcc.get("key"));
         mcc.shutdown();
         
      }catch(Exception ex){
         System.out.println( ex.getMessage() );
      }
   }
}
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Memcached/Best-Practices/php-PECL.md
```
wget http://pecl.php.net/get/memcached-2.2.0.tgz
tar zxvf memcached-2.2.0.tgz
cd memcached-2.2.0
phpize
./configure --with-libmemcached-dir=/usr/local/libmemcached --enable-memcached-sasl
make && make install
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Memcached/Best-Practices/php-PECL.md
```
extension=memcached.so 
memcached.use_sasl = 1
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Memcached/Best-Practices/php-PECL.md
```
<?php
$memcached = new Memcached;
$memcached->addServer('ip', port); 
$memcached->setOption(Memcached::OPT_BINARY_PROTOCOL, true);
$memcached->setSaslAuthData('username', 'port'); 
$memcached->set("key", "value");
echo 'key: ',$memcached->get("key");
$memcached->delete("key",0);
$memcached->quit();
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Memcached/Best-Practices/php-PECL.md
```
<?php
$memcached = new Memcached;
$memcached->addServer('ip', port); 
$memcached->set("key", "value");
echo 'key: ',$memcached->get("key");
$memcached->delete("key",0);
$memcached->quit();
?>
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
vi /etc/yum.repos.d/mongodb-org-3.4.repo
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
[mongodb-org-3.4]  
name=MongoDB Repository  
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/  
gpgcheck=1  
enabled=1  
gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
yum -y install mongodb-org
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
mkdir -p /jddata1/work/data
mkdir -p /jddata1/work/log
echo "1773301708" > /jddata1/work/keyfile
chmod 0600 /jddata1/work/keyfile
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
vi /etc/mongodb.conf
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
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


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
nohup mongod -f /etc/mongodb.conf &
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
use admin
rs.initiate({_id:"mgset-63514045", version:1, members:[{_id:0, host:"10.0.0.1:27017"}, {_id:1, host:"10.0.0.2:27017"},{_id:2, host:"10.0.0.3:27017"}]})  

```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
mkdir -p /root/work/data
mkdir -p /root/work/log
echo "1773301708" > /root/work/keyfile
chmod 0600 /root/work/keyfile
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
vi /etc/mongodb.conf
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
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


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
nohup mongod -f /etc/mongodb.conf &
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
use admin
rs.initiate({_id:"mgset-73514045", version:1, members:[{_id:0, host:"10.0.0.10:27017"}, {_id:1, host:"10.0.0.11:27017"},{_id:2, host:"10.0.0.12:27017"}]}) 
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
mkdir -p /root/work/log
echo "1773301708" > /root/work/keyfile
chmod 0600 /root/work/keyfile
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
vi /etc/mongos.conf
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
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


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
nohup mongos -f /etc/mongos.conf &
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
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


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
mongo --port 27017 -u root -p 12345678 --authenticationDatabase admin
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
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


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
mongo --host 10.0.0.13 --port 27017 -u root -p 12345678 --authenticationDatabase admin
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Best-Practices/Create-Sharded-Cluster.md
```
sh.enableSharding("mytest")
use mytest
db.mycol.ensureIndex({_id:1})
sh.shardCollection("mytest.mycol",{_id:1})
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Operation-Guide/Account-Management/Create-MongoDB-Account.md
```
{ user: "<name>",
  pwd: "<cleartext password>",
  customData: { <any information> },
  roles: [
    { role: "<role>", db: "<database>" } | "<role>",
    ...
  ]
 }
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Operation-Guide/Account-Management/Create-MongoDB-Account.md
```
    use products
    db.createUser( { user: "accountAdmin01",
                     pwd: "changeMe",
                     customData: { employeeId: 12345 },
                     roles: [ { role: "clusterAdmin", db: "admin" },
                              { role: "readAnyDatabase", db: "admin" },
                              "readWrite"] },
                   { w: "majority" , wtimeout: 5000 } )
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Operation-Guide/Account-Management/Create-MongoDB-Account.md
```
    use products
    db.createUser(
       {
         user: "accountUser",
         pwd: "password",
         roles: [ "readWrite", "dbAdmin" ]
       }
    )
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Operation-Guide/Account-Management/Create-MongoDB-Account.md
```
    use admin
    db.createUser(
       {
         user: "reportsUser",
         pwd: "password",
         roles: [ ]
       }
    )
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-MongoDB/Operation-Guide/Account-Management/Create-MongoDB-Account.md
```
    use admin
    db.createUser(
       {
         user: "appAdmin",
         pwd: "password",
         roles:
           [
             { role: "readWrite", db: "config" },
             "clusterAdmin"
           ]
       }
    )
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/CorCplusplus-Connect-to-Redis-Instance.md
```
 git clone https://github.com/redis/hiredis.git 
 cd hiredis 
 make 
 sudo make install 
 ldconfig
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/CorCplusplus-Connect-to-Redis-Instance.md
```
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <hiredis.h>
 int main(int argc, char **argv) {
     unsigned int j;
     redisContext *c;
     redisReply *reply;
     if (argc < 3) {
         printf("Usage: example jredis-cn-north-1-prod-redis-xxxxxxxxxx.jdcloud.com 6379 password\n");
         exit(0);
     }
     const char *hostname = argv[1];
     const int port = atoi(argv[2]);
     const char *password = argv[3];
     struct timeval timeout = { 1, 500000 }; // 1.5 seconds

     c = redisConnectWithTimeout(hostname, port, timeout);
     if (c == NULL || c->err) {
         if (c) {
            printf("Connection error: %s\n", c->errstr);
            redisFree(c);
         } else {
            printf("Connection error: can't allocate redis context\n");
         }
         exit(1);
     }

     /* AUTH */
     reply = redisCommand(c, "AUTH %s", password);
     printf("AUTH: %s\n", reply->str);
     freeReplyObject(reply);

     /* PING server */
     reply = redisCommand(c,"PING");
     printf("PING: %s\n", reply->str);
     freeReplyObject(reply);

     /* Set a key */
     reply = redisCommand(c,"SET %s %s", "foo", "hello world");
     printf("SET: %s\n", reply->str);
     freeReplyObject(reply);

     /* Set a key using binary safe API */
     reply = redisCommand(c,"SET %b %b", "bar", (size_t) 3, "hello", (size_t) 5);
     printf("SET (binary API): %s\n", reply->str);
     freeReplyObject(reply);

     /* Try a GET and two INCR */
     reply = redisCommand(c,"GET foo");
     printf("GET foo: %s\n", reply->str);
     freeReplyObject(reply);
     reply = redisCommand(c,"INCR counter");
     printf("INCR counter: %lld\n", reply->integer);
     freeReplyObject(reply);

     /* again ... */
     reply = redisCommand(c,"INCR counter");
     printf("INCR counter: %lld\n", reply->integer);
     freeReplyObject(reply);

     /* Create a list of numbers, from 0 to 9 */
     reply = redisCommand(c,"DEL mylist");
     freeReplyObject(reply);
     for (j = 0; j < 10; j++) {
         char buf[64];
         snprintf(buf,64,"%d",j);
         reply = redisCommand(c,"LPUSH mylist element-%s", buf);
         freeReplyObject(reply);
     }

     /* Let's check what we have inside the list */
     reply = redisCommand(c,"LRANGE mylist 0 -1");
     if (reply->type == REDIS_REPLY_ARRAY) {
         for (j = 0; j < reply->elements; j++) {
            printf("%u) %s\n", j, reply->element[j]->str);
         }
     }
     freeReplyObject(reply);
     /* Disconnects and frees the context */
     redisFree(c);
     return 0;
 }
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/CorCplusplus-Connect-to-Redis-Instance.md
```
./example jredis-cn-north-1-prod-redis-xxxxxxxxxx.jdcloud.com 6379 password
AUTH: OK
PING: PONG
SET: OK
SET (binary API): OK
GET foo: hello world
INCR counter: 3
INCR counter: 4
0) element-9
1) element-8
2) element-7
3) element-6
4) element-5
5) element-4
6) element-3
7) element-2
8) element-1
9) element-0
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/Golang-Connect-to-Redis-Instance.md
```
package main
 import (
     "fmt"
    "github.com/garyburd/redigo/redis"
)
func main() {
    host := "jredis-cn-north-1-prod-redis-xxxxxxxxxx.jdcloud.com"//控制台显示的地址
    port := 6379
    c, err := redis.Dial("tcp", fmt.Sprintf("%s:%d", host, port))
    if err != nil {
        fmt.Println("Connect to redis error", err)
        return
    }
    defer c.Close()
    _, err := c.Do("AUTH", "********")
    if err != nil {
        fmt.Println("redis auth failed: ", err)
        return
    }
    _, err := c.Do("SET", "key", "jcloud-redis")
    if err != nil {
        fmt.Println("redis set failed: ", err)
        return
    }
     _, err := c.Do("GET", "key")
    if err != nil {
        fmt.Println("redis get failed: ", err)
        return
    }
    //do other command...
}
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/Java-Connect-to-Redis-Instance.md
```
package com.jd.jmiss;
import redis.clients.jedis.Jedis;
public class JedisTester {

public static void main(String[] args) {
    Jedis jedis = null;
    try {
        String host = "${your redis domain}";//控制台显示访问地址
        int port = 6379;
        String password = "${your password}";//控制台显示的token
        jedis = new Jedis(host, port);
        //鉴权信息
        jedis.auth("password");
        String key = "redis";
        String value = "jmiss-redis";
        //set一个key
        String retCode = jedis.set(key, value);
        System.out.println("Set Key: " + key + " Value: " + value + "  return code is: " + retCode);
        //get 设置进去的key
        String getvalue = jedis.get(key);
        System.out.println("Get Key: " + key + " ReturnValue: " + getvalue);
    } catch (Exception e) {
        e.printStackTrace();
    }
    finally {
        if(null != jedis){
            jedis.quit();
            jedis.close();
        }
    }
}
}
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/Java-Connect-to-Redis-Instance.md
```
<dependencies>
<dependency>
   <groupId>redis.clients</groupId>
   <artifactId>jedis</artifactId>
   <version>2.5.2</version>
</dependency>

<dependency>
    <groupId>org.springframework.data</groupId>
    <artifactId>spring-data-redis</artifactId>
    <version>1.7.2.RELEASE</version>
</dependency>
</dependencies>

```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/Java-Connect-to-Redis-Instance.md
```
<beans>
<bean id="jedisPoolConfig" class="redis.clients.jedis.JedisPoolConfig">
    <!-- <property name="maxActive" value="${redis.pool.maxTotal}" />-->
     <property name="maxIdle" value="${redis.pool.maxIdle}" />
     <property name="timeBetweenEvictionRunsMillis" value="${redis.pool.timeBetweenEvictionRunsMillis}" />
     <property name="minEvictableIdleTimeMillis" value="${redis.pool.minEvictableIdleTimeMillis}" />
     <property name="testOnBorrow" value="${redis.pool.testOnBorrow}" />
     <property name="testWhileIdle" value="${redis.pool.testWhileIdle}" />
     <property name="maxWaitMillis" value="5000"/>
     <property name="minIdle" value="10" />
     <property name="numTestsPerEvictionRun" value="10" />
     <property name="testOnReturn" value="true" />
     <property name="softMinEvictableIdleTimeMillis" value="60000" />
</bean>
<bean id="jedisConnectionFactory" class="org.springframework.data.redis.connection.jedis.JedisConnectionFactory" destroy-method="destroy">
     <property name="poolConfig" ref="jedisPoolConfig"></property>
     <property name="hostName" value="${redis.pool.host}"></property>
     <property name="port" value="${redis.pool.port}"></property>
     <property name="password" value="${redis.pool.pass}"></property>
     <property name="timeout" value="${redis.pool.timeout}"></property>
     <property name="usePool" value="true"></property>
</bean>
<bean id="redisTemplate" class="org.springframework.data.redis.core.RedisTemplate">
     <property name="connectionFactory" ref="jedisConnectionFactory"></property>
     <property name="keySerializer">
            <bean class="org.springframework.data.redis.serializer.StringRedisSerializer"/>
     </property>
</bean>
</beans>
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/Java-Connect-to-Redis-Instance.md
```
#IP地址
redis.pool.host=jredis-cn-north-1-prod-redis-xxxxxxxxxx.jdcloud.com
#端口号
redis.pool.port=6379
redis.pool.pass=********
#最大idle
redis.pool.maxIdle=300
#最大分配对象
redis.pool.maxTotal=600
#多长时间检查空闲连接
redis.pool.timeBetweenEvictionRunsMillis=5000
#空闲连接多长时间收回
redis.pool.minEvictableIdleTimeMillis=8000
#上面两个值的和加起来应该小于15秒，否则服务器会断掉连接
#borrow object
redis.pool.testOnBorrow=true
redis.pool.timeout=3000
redis.pool.testWhileIdle=true
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/Java-Connect-to-Redis-Instance.md
```
class JMiss implements Serializable {
private String time;

public String getTime() {
    return time;
}

public void setTime(String value) {
    this.time = value;
}
@Override
public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    JMiss jMiss = (JMiss) o;

    return !(time != null ? !time.equals(jMiss.time) : jMiss.time != null);
}
@Override
public int hashCode() {
    return time != null ? time.hashCode() : 0;
}
@Override
public String toString() {
    return "JMiss{" +
            "time='" + time + '\'' +
            '}';
}
}
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/Java-Connect-to-Redis-Instance.md
```
public class JMissProcessor {

private RedisTemplate<String, JMiss> redisTemplate;

public void setRedisTemplate(RedisTemplate<String, JMiss> redisTemplate){
    this.redisTemplate = redisTemplate;
}

public void setJMiss(String key, final JMiss jMiss){
    ValueOperations<String, JMiss> valueOps = redisTemplate.opsForValue();
    valueOps.set(key, jMiss);
}

public JMiss getJMiss(String key){
    ValueOperations<String, JMiss> valueOps = redisTemplate.opsForValue();
    return valueOps.get(key);
}
}
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/Java-Connect-to-Redis-Instance.md
```
public class JedisTester {

public static void main(String [] args){
    ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
    final RedisTemplate<String, JMiss> redisTemplate = (RedisTemplate<String, JMiss>) context.getBean("redisTemplate");
    JMissProcessor processor = new JMissProcessor();
    processor.setRedisTemplate(redisTemplate);
    JMiss jmissIn = new JMiss();
    String key = "jmiss_redis_time";
    for(int i = 0 ; i < 10000; ++ i){
        System.out.println("i is " + i);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SS");
        jmissIn.setTime(df.format(new Date()));
        processor.setJMiss(key,jmissIn);
        JMiss jmissOut = processor.getJMiss(key);
        System.out.println("jmissOut is " + jmissOut);
        if(jmissOut == null || !jmissIn.equals(jmissOut)){
            System.out.println("error happen");
        }else{
            System.out.println("read write succss");
        }
        try {
            Thread.sleep(1000 * i);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
}
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/Node.js-Connect-to-Redis-Instance.md
```
git clone https://github.com/NodeRedis/node_redisnpm install redis
```


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/Node.js-Connect-to-Redis-Instance.md
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


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/PHP-Connect-to-Redis-Instance.md
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


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/Python-Connect-to-Redis-Instance.md
```
git clone https://github.com/andymccurdy/redis-py
```
 



#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/data-migration.md
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


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Best-Practices/data-migration.md
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


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Operation-Guide/Data-Migration.md
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


#### 当前代码: documentation/Database-and-Cache-Service/JCS-for-Redis/Operation-Guide/Data-Migration.md
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


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-MariaDB-Instance/Local-to-MariaDB.md
```
    mysqldump -u用户名 -p密码 --single-transaction --set-gtid-purged=OFF -B 数据库名称 > /路径/导出文件名.sql

    参数描述
        用户名：自建数据库的用户名。
        密码：自建数据库的密码。
        数据库名称：填写您需要导出的库名，多个库名通过空格来分隔。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-MariaDB-Instance/Local-to-MariaDB.md
```
    scp /路径/导出文件名.sql 云主机用户名@云主机公网IP: /云主机路径

    参数描述
        云主机用户名：创建云主机实例时候的用户名。
        云主机公网 IP：云主机绑定的公网 IP 地址。
        云主机路径：本地上传的文件在云主机中存放的路径。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-MariaDB-Instance/Local-to-MariaDB.md
```
    mysql -u用户名 -p密码 -h 云数据库域名 < /云主机路径/导出文件名.sql

    参数描述
        用户名：第 3 步操作中的用户名。
        密码：第 3 步操作中的用户对应的密码。
        数据库域名：云数据库 MariaDB 的域名可以在实例的详情页查看。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-MariaDB-Instance/VM-to-MariaDB.md
```
    mysqldump -u用户名 -p密码 --single-transaction --set-gtid-purged=OFF -B 数据库名称 > /路径/导出文件名.sql

    参数描述
        用户名：自建数据库的用户名。
        密码：自建数据库的密码。
        数据库名称：填写您需要导出的库名，多个库名通过空格来分隔。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-MariaDB-Instance/VM-to-MariaDB.md
```
    mysql -u用户名 -p密码 -h 云数据库域名 < /路径/导出文件名.sql

    参数描述
        用户名：第 3 步操作中的用户名。
        密码：第 3 步操作中的用户对应的密码。
        数据库域名：云数据库 MariaDB 的域名可以在实例的详情页查看。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-MySQL-Instance/Local-to-MySQL.md
```
    mysqldump -u用户名 -p密码 --single-transaction --set-gtid-purged=OFF -B 数据库名称 > /路径/导出文件名.sql

    参数描述
        用户名：自建数据库的用户名。
        密码：自建数据库的密码。
        数据库名称：填写您需要导出的库名，多个库名通过空格来分隔。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-MySQL-Instance/Local-to-MySQL.md
```
    scp /路径/导出文件名.sql 云主机用户名@云主机公网IP: /云主机路径

    参数描述
        云主机用户名：创建云主机实例时候的用户名。
        云主机公网 IP：云主机绑定的公网 IP 地址。
        云主机路径：本地上传的文件在云主机中存放的路径。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-MySQL-Instance/Local-to-MySQL.md
```
    mysql -u用户名 -p密码 -h 云数据库域名 < /云主机路径/导出文件名.sql

    参数描述
        用户名：第 3 步操作中的用户名。
        密码：第 3 步操作中的用户对应的密码。
        数据库域名：云数据库 MySQL 的域名可以在实例的详情页查看。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-MySQL-Instance/VM-to-MySQL.md
```
    mysqldump -u用户名 -p密码 --single-transaction --set-gtid-purged=OFF -B 数据库名称 > /路径/导出文件名.sql

    参数描述
        用户名：自建数据库的用户名。
        密码：自建数据库的密码。
        数据库名称：填写您需要导出的库名，多个库名通过空格来分隔。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-MySQL-Instance/VM-to-MySQL.md
```
    mysql -u用户名 -p密码 -h 云数据库域名 < /路径/导出文件名.sql

    参数描述
        用户名：第 3 步操作中的用户名。
        密码：第 3 步操作中的用户对应的密码。
        数据库域名：云数据库 MySQL 的域名可以在实例的详情页查看。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-Percona-Instance/Local-to-Percona.md
```
    mysqldump -u用户名 -p密码 --single-transaction --set-gtid-purged=OFF -B 数据库名称 > /路径/导出文件名.sql

    参数描述
        用户名：自建数据库的用户名。
        密码：自建数据库的密码。
        数据库名称：填写您需要导出的库名，多个库名通过空格来分隔。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-Percona-Instance/Local-to-Percona.md
```
    scp /路径/导出文件名.sql 云主机用户名@云主机公网IP: /云主机路径

    参数描述
        云主机用户名：创建云主机实例时候的用户名。
        云主机公网 IP：云主机绑定的公网 IP 地址。
        云主机路径：本地上传的文件在云主机中存放的路径。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-Percona-Instance/Local-to-Percona.md
```
    mysql -u用户名 -p密码 -h 云数据库域名 < /云主机路径/导出文件名.sql

    参数描述
        用户名：第 3 步操作中的用户名。
        密码：第 3 步操作中的用户对应的密码。
        数据库域名：云数据库 Percona 的域名可以在实例的详情页查看。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-Percona-Instance/VM-to-Percona.md
```
    mysqldump -u用户名 -p密码 --single-transaction --set-gtid-purged=OFF -B 数据库名称 > /路径/导出文件名.sql

    参数描述
        用户名：自建数据库的用户名。
        密码：自建数据库的密码。
        数据库名称：填写您需要导出的库名，多个库名通过空格来分隔。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Import-Data-Into-Percona-Instance/VM-to-Percona.md
```
    mysql -u用户名 -p密码 -h 云数据库域名 < /路径/导出文件名.sql

    参数描述
        用户名：第 3 步操作中的用户名。
        密码：第 3 步操作中的用户对应的密码。
        数据库域名：云数据库 Percona 的域名可以在实例的详情页查看。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Migrate-From-MySQL-Database-to-Percona-Database.md
```
    mysqldump -u用户名 -p密码 --single-transaction  --set-gtid-purged=OFF -B 数据库名称 > /路径/导出文件名.sql

    参数描述
        用户名：云数据库 MySQL 的用户名。
        密码：云数据库 MySQL 的密码。
        数据库名称：填写您需要导出的库名，多个库名通过空格来分隔。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Data-Migration/Migrate-From-MySQL-Database-to-Percona-Database.md
```
    mysql -u用户名 -p密码 -h 云数据库域名 < /云主机路径/导出文件名.sql

    参数描述
        用户名：第 6 步操作中的用户名。
        密码：第 6 步操作中的用户对应的密码。
        数据库域名：云数据库 Percona 的域名可以在实例的详情页查看。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MariaDB-Database.md
```
    # 查看帮助手册
    ./mysql_backup_extract.py -h
     
     # 解压云数据库 MariaDB 实例的备份数据
     ./mysql_backup_extract.py  -v 10.2 -f ./backup.xbstream
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MariaDB-Database.md
```
    wget -c '<数据备份下载地址>' -O <自定义备份文件名>.xbstream

    -c：启动断点续传
    -O：将下载的结果保存为指定的文件，注意文件的后者必须是 .xbstream
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MariaDB-Database.md
```
    ./mysql_backup_extract.py -v 10.2 -f <自定义备份文件名>.xbstream
    
    -v 参数必须指定，具体 -v 后面可以跟什么变量可以通过 -h 查看帮助手册得知。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MariaDB-Database.md
```
    innobackupex --defaults-file=$HOME/tmp_snapshot/backup-my.cnf --apply-log $HOME/tmp_snapshot
``` 


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MariaDB-Database.md
```
    # The MySQL server
    [mysqld]
    innodb_checksum_algorithm=innodb
    #innodb_log_checksum_algorithm=strict_crc32
    innodb_data_file_path=ibdata1:512M;ibdata2:512M:autoextend
    innodb_log_files_in_group=3
    innodb_log_file_size=536870912
    #innodb_fast_checksum=false
    #innodb_page_size=16384
    #innodb_log_block_size=512
    innodb_undo_directory=.
    innodb_undo_tablespaces=0
    #redo_log_version=1
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MariaDB-Database.md
```
    chown -R mysql:mysql $HOME/tmp_snapshot
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MariaDB-Database.md
```
    mysqld --defaults-file=/export/tmp_snapshot/backup-my.cnf --user=mysql --datadir=/export/tmp_snapshot
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MariaDB-Database.md
```
    mysql -uroot -p
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MySQL-Database.md
```
    # 查看帮助手册
    ./mysql_backup_extract.py -h
     
     # 解压云数据库 MySQL 实例的备份数据
     ./mysql_backup_extract.py  -v 5.7 -f ./backup.xbstream
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MySQL-Database.md
```
    wget -c '<数据备份下载地址>' -O <自定义备份文件名>.xbstream

    -c：启动断点续传
    -O：将下载的结果保存为指定的文件，注意文件的后者必须是 .xbstream
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MySQL-Database.md
```
    ./mysql_backup_extract.py -v 5.7 -f <自定义备份文件名>.xbstream
    
    -v 参数可以不指定，默认：5.7，具体 -v 后面可以跟什么变量可以通过 -h 查看帮助手册得知。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MySQL-Database.md
```
    innobackupex --defaults-file=$HOME/tmp_snapshot/backup-my.cnf --apply-log $HOME/tmp_snapshot
``` 


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MySQL-Database.md
```
    # The MySQL server
    [mysqld]
    innodb_checksum_algorithm=innodb
    #innodb_log_checksum_algorithm=strict_crc32
    innodb_data_file_path=ibdata1:512M;ibdata2:512M:autoextend
    innodb_log_files_in_group=3
    innodb_log_file_size=536870912
    #innodb_fast_checksum=false
    #innodb_page_size=16384
    #innodb_log_block_size=512
    innodb_undo_directory=.
    innodb_undo_tablespaces=0
    #redo_log_version=1
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MySQL-Database.md
```
    chown -R mysql:mysql $HOME/tmp_snapshot
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MySQL-Database.md
```
    mysqld_safe --defaults-file=$HOME/tmp_snapshot/backup-my.cnf --user=mysql --datadir=$HOME/tmp_snapshot &
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-MySQL-Database.md
```
    mysql -uroot -p
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-Percona-Database.md
```
    # 查看帮助手册
    ./mysql_backup_extract.py -h
     
     # 解压云数据库 Percona 实例的备份数据
     ./mysql_backup_extract.py  -v 5.7 -f ./backup.xbstream
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-Percona-Database.md
```
    wget -c '<数据备份下载地址>' -O <自定义备份文件名>.xbstream

    -c：启动断点续传
    -O：将下载的结果保存为指定的文件，注意文件的后者必须是 .xbstream
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-Percona-Database.md
```
    ./mysql_backup_extract.py -v 5.7 -f <自定义备份文件名>.xbstream
    
    -v 参数可以不指定，默认：5.7，具体 -v 后面可以跟什么变量可以通过 -h 查看帮助手册得知。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-Percona-Database.md
```
    innobackupex --defaults-file=$HOME/tmp_snapshot/backup-my.cnf --apply-log $HOME/tmp_snapshot
``` 


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-Percona-Database.md
```
    # The MySQL server
    [mysqld]
    innodb_checksum_algorithm=innodb
    #innodb_log_checksum_algorithm=strict_crc32
    innodb_data_file_path=ibdata1:512M;ibdata2:512M:autoextend
    innodb_log_files_in_group=3
    innodb_log_file_size=536870912
    #innodb_fast_checksum=false
    #innodb_page_size=16384
    #innodb_log_block_size=512
    innodb_undo_directory=.
    innodb_undo_tablespaces=0
    #redo_log_version=1
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-Percona-Database.md
```
    chown -R mysql:mysql $HOME/tmp_snapshot
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-Percona-Database.md
```
    mysqld --defaults-file=$HOME/tmp_snapshot/backup-my.cnf --user=mysql --datadir=$HOME/tmp_snapshot --socket=$HOME/tmp_snapshot/mysql.sock &
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Restore-Backup-To-Self-Built-Database/Restore-Backup-To-Self-Built-Percona-Database.md
```
    mysql -uroot -p --socket=$HOME/tmp_snapshot/mysql.sock
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Upgrade-Database-Version/Upgrade-MySQL.md
```
    mysqldump -u用户名 -p密码 -R -E --skip-tz-utc --opt --skip-add-drop-table --single-transaction --hex-blob --default-character-set=binary --master-data=2 -B 数据库名称 > /路径/导出文件名.sql

    参数描述
        用户名：云数据库的用户名。
        密码：云数据库的密码。
        数据库名称：填写您需要导出的库名，多个库名通过空格来分隔。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Best-Practices/Upgrade-Database-Version/Upgrade-MySQL.md
```
    mysql -u用户名 -p密码 -h 云数据库域名 --default-character-set=binary < /路径/导出文件名.sql

    参数描述
        用户名：第 6 步操作中的用户名。
        密码：第 6 步操作中的用户对应的密码。
        数据库域名：云数据库 MySQL 8.0 的域名可以在实例的详情页查看。
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Introduction/Restrictions/MariaDB-Restrictions.md
```
mysql，information_schema，performance_schema，sys，percona, admin, aurora, replicator, xtrabak, root, mysql, test, eagleye, information_schema, guest, add, analyze, asc, between, blob, call, change, check, condition, continue, cross, current_timestamp, database, day_microsecond, dec, default, desc, distinct, double, each, enclosed, exit, fetch, float8, foreign, goto, having, hour_minute, ignore, infile, insensitiv, int1, int4, interval, iterate, keys, leading, like, lines, localtimestamp, longblob, low_priority, mediumint, minute_microsecond, modifies, no_write_to_binlog, on, optionally, out, precision, purge, read, references, rename, require, revoke, schema, select, set, spatial, sqlexception, sql_big_result, ssl, table, tinyblob, to, true, unique, update, using, utc_timestamp, varchar, when, with, xor, all, and, asensitive, bigint, both, cascade, char, collate, connection, convert, current_date, current_user, databases, day_minute, decimal, delayed, describe, distinctrow, drop, else, escaped, explain, float, for, from, grant, high_priority, hour_second, in, inner, insert, int2, int8, into, join, kill, leave, limit, load, lock, longtext, match, mediumtext, minute_second, natural, null, optimize, or, outer, primary, raid0, reads, regexp, repeat, restrict, right, schemas, sensitive, show, specific, sqlstate, sql_calc_found_rows, starting, terminated, tinyint, trailing, undo, unlock, usage, utc_date, values, varcharacter, where, write, year_month, alter, as, before, binary, by, case, character, column, constraint, create, current_time, cursor, day_hour, day_second, declare, delete, deterministic, div, dual, elseif, exists, false, float4, force, fulltext, group, hour_microsecond, if, index, inout, int, int3, integer, is, key, label, left, linear, localtime, long, loop, mediumblob, middleint, mod, not, numeric, option, order, outfile, procedure, range, real, release, replace, return, rlike, second_microsecond, separator, smallint, sql, sqlwarning, sql_small_result, straight_join, then, tinytext, trigger, union, unsigned, use, utc_time, varbinary, varying, while, x509, zerofill, jcloud_yunding_db_push, jcloudv_push_rw, jcloudv_push_ro, jddb_percona
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Introduction/Restrictions/MariaDB-Restrictions.md
```
root，admin，os_admin，replicater，monitor，percona, admin, aurora, replicator, xtrabak, root, mysql, test, eagleye, information_schema, guest, add, analyze, asc, between, blob, call, change, check, condition, continue, cross, current_timestamp, database, day_microsecond, dec, default, desc, distinct, double, each, enclosed, exit, fetch, float8, foreign, goto, having, hour_minute, ignore, infile, insensitiv, int1, int4, interval, iterate, keys, leading, like, lines, localtimestamp, longblob, low_priority, mediumint, minute_microsecond, modifies, no_write_to_binlog, on, optionally, out, precision, purge, read, references, rename, require, revoke, schema, select, set, spatial, sqlexception, sql_big_result, ssl, table, tinyblob, to, true, unique, update, using, utc_timestamp, varchar, when, with, xor, all, and, asensitive, bigint, both, cascade, char, collate, connection, convert, current_date, current_user, databases, day_minute, decimal, delayed, describe, distinctrow, drop, else, escaped, explain, float, for, from, grant, high_priority, hour_second, in, inner, insert, int2, int8, into, join, kill, leave, limit, load, lock, longtext, match, mediumtext, minute_second, natural, null, optimize, or, outer, primary, raid0, reads, regexp, repeat, restrict, right, schemas, sensitive, show, specific, sqlstate, sql_calc_found_rows, starting, terminated, tinyint, trailing, undo, unlock, usage, utc_date, values, varcharacter, where, write, year_month, alter, as, before, binary, by, case, character, column, constraint, create, current_time, cursor, day_hour, day_second, declare, delete, deterministic, div, dual, elseif, exists, false, float4, force, fulltext, group, hour_microsecond, if, index, inout, int, int3, integer, is, key, label, left, linear, localtime, long, loop, mediumblob, middleint, mod, not, numeric, option, order, outfile, procedure, range, real, release, replace, return, rlike, second_microsecond, separator, smallint, sql, sqlwarning, sql_small_result, straight_join, then, tinytext, trigger, union, unsigned, use, utc_time, varbinary, varying, while, x509, zerofill, jcloud_yunding_db_push, jcloudv_push_rw, jcloudv_push_ro, jddbaclholder
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Introduction/Restrictions/MySQL-Restrictions.md
```
mysql，information_schema，performance_schema，sys，percona, admin, aurora, replicator, xtrabak, root, mysql, test, eagleye, information_schema, guest, add, analyze, asc, between, blob, call, change, check, condition, continue, cross, current_timestamp, database, day_microsecond, dec, default, desc, distinct, double, each, enclosed, exit, fetch, float8, foreign, goto, having, hour_minute, ignore, infile, insensitiv, int1, int4, interval, iterate, keys, leading, like, lines, localtimestamp, longblob, low_priority, mediumint, minute_microsecond, modifies, no_write_to_binlog, on, optionally, out, precision, purge, read, references, rename, require, revoke, schema, select, set, spatial, sqlexception, sql_big_result, ssl, table, tinyblob, to, true, unique, update, using, utc_timestamp, varchar, when, with, xor, all, and, asensitive, bigint, both, cascade, char, collate, connection, convert, current_date, current_user, databases, day_minute, decimal, delayed, describe, distinctrow, drop, else, escaped, explain, float, for, from, grant, high_priority, hour_second, in, inner, insert, int2, int8, into, join, kill, leave, limit, load, lock, longtext, match, mediumtext, minute_second, natural, null, optimize, or, outer, primary, raid0, reads, regexp, repeat, restrict, right, schemas, sensitive, show, specific, sqlstate, sql_calc_found_rows, starting, terminated, tinyint, trailing, undo, unlock, usage, utc_date, values, varcharacter, where, write, year_month, alter, as, before, binary, by, case, character, column, constraint, create, current_time, cursor, day_hour, day_second, declare, delete, deterministic, div, dual, elseif, exists, false, float4, force, fulltext, group, hour_microsecond, if, index, inout, int, int3, integer, is, key, label, left, linear, localtime, long, loop, mediumblob, middleint, mod, not, numeric, option, order, outfile, procedure, range, real, release, replace, return, rlike, second_microsecond, separator, smallint, sql, sqlwarning, sql_small_result, straight_join, then, tinytext, trigger, union, unsigned, use, utc_time, varbinary, varying, while, x509, zerofill, jcloud_yunding_db_push, jcloudv_push_rw, jcloudv_push_ro, jddb_percona
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Introduction/Restrictions/MySQL-Restrictions.md
```
root，admin，os_admin，replicater，monitor，percona, admin, aurora, replicator, xtrabak, root, mysql, test, eagleye, information_schema, guest, add, analyze, asc, between, blob, call, change, check, condition, continue, cross, current_timestamp, database, day_microsecond, dec, default, desc, distinct, double, each, enclosed, exit, fetch, float8, foreign, goto, having, hour_minute, ignore, infile, insensitiv, int1, int4, interval, iterate, keys, leading, like, lines, localtimestamp, longblob, low_priority, mediumint, minute_microsecond, modifies, no_write_to_binlog, on, optionally, out, precision, purge, read, references, rename, require, revoke, schema, select, set, spatial, sqlexception, sql_big_result, ssl, table, tinyblob, to, true, unique, update, using, utc_timestamp, varchar, when, with, xor, all, and, asensitive, bigint, both, cascade, char, collate, connection, convert, current_date, current_user, databases, day_minute, decimal, delayed, describe, distinctrow, drop, else, escaped, explain, float, for, from, grant, high_priority, hour_second, in, inner, insert, int2, int8, into, join, kill, leave, limit, load, lock, longtext, match, mediumtext, minute_second, natural, null, optimize, or, outer, primary, raid0, reads, regexp, repeat, restrict, right, schemas, sensitive, show, specific, sqlstate, sql_calc_found_rows, starting, terminated, tinyint, trailing, undo, unlock, usage, utc_date, values, varcharacter, where, write, year_month, alter, as, before, binary, by, case, character, column, constraint, create, current_time, cursor, day_hour, day_second, declare, delete, deterministic, div, dual, elseif, exists, false, float4, force, fulltext, group, hour_microsecond, if, index, inout, int, int3, integer, is, key, label, left, linear, localtime, long, loop, mediumblob, middleint, mod, not, numeric, option, order, outfile, procedure, range, real, release, replace, return, rlike, second_microsecond, separator, smallint, sql, sqlwarning, sql_small_result, straight_join, then, tinytext, trigger, union, unsigned, use, utc_time, varbinary, varying, while, x509, zerofill, jcloud_yunding_db_push, jcloudv_push_rw, jcloudv_push_ro, jddbaclholder
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Introduction/Restrictions/Percona-Restrictions.md
```
mysql，information_schema，performance_schema，sys，percona, admin, aurora, replicator, xtrabak, root, mysql, test, eagleye, information_schema, guest, add, analyze, asc, between, blob, call, change, check, condition, continue, cross, current_timestamp, database, day_microsecond, dec, default, desc, distinct, double, each, enclosed, exit, fetch, float8, foreign, goto, having, hour_minute, ignore, infile, insensitiv, int1, int4, interval, iterate, keys, leading, like, lines, localtimestamp, longblob, low_priority, mediumint, minute_microsecond, modifies, no_write_to_binlog, on, optionally, out, precision, purge, read, references, rename, require, revoke, schema, select, set, spatial, sqlexception, sql_big_result, ssl, table, tinyblob, to, true, unique, update, using, utc_timestamp, varchar, when, with, xor, all, and, asensitive, bigint, both, cascade, char, collate, connection, convert, current_date, current_user, databases, day_minute, decimal, delayed, describe, distinctrow, drop, else, escaped, explain, float, for, from, grant, high_priority, hour_second, in, inner, insert, int2, int8, into, join, kill, leave, limit, load, lock, longtext, match, mediumtext, minute_second, natural, null, optimize, or, outer, primary, raid0, reads, regexp, repeat, restrict, right, schemas, sensitive, show, specific, sqlstate, sql_calc_found_rows, starting, terminated, tinyint, trailing, undo, unlock, usage, utc_date, values, varcharacter, where, write, year_month, alter, as, before, binary, by, case, character, column, constraint, create, current_time, cursor, day_hour, day_second, declare, delete, deterministic, div, dual, elseif, exists, false, float4, force, fulltext, group, hour_microsecond, if, index, inout, int, int3, integer, is, key, label, left, linear, localtime, long, loop, mediumblob, middleint, mod, not, numeric, option, order, outfile, procedure, range, real, release, replace, return, rlike, second_microsecond, separator, smallint, sql, sqlwarning, sql_small_result, straight_join, then, tinytext, trigger, union, unsigned, use, utc_time, varbinary, varying, while, x509, zerofill, jcloud_yunding_db_push, jcloudv_push_rw, jcloudv_push_ro, jddb_percona
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Introduction/Restrictions/Percona-Restrictions.md
```
root，admin，os_admin，replicater，monitor，percona, admin, aurora, replicator, xtrabak, root, mysql, test, eagleye, information_schema, guest, add, analyze, asc, between, blob, call, change, check, condition, continue, cross, current_timestamp, database, day_microsecond, dec, default, desc, distinct, double, each, enclosed, exit, fetch, float8, foreign, goto, having, hour_minute, ignore, infile, insensitiv, int1, int4, interval, iterate, keys, leading, like, lines, localtimestamp, longblob, low_priority, mediumint, minute_microsecond, modifies, no_write_to_binlog, on, optionally, out, precision, purge, read, references, rename, require, revoke, schema, select, set, spatial, sqlexception, sql_big_result, ssl, table, tinyblob, to, true, unique, update, using, utc_timestamp, varchar, when, with, xor, all, and, asensitive, bigint, both, cascade, char, collate, connection, convert, current_date, current_user, databases, day_minute, decimal, delayed, describe, distinctrow, drop, else, escaped, explain, float, for, from, grant, high_priority, hour_second, in, inner, insert, int2, int8, into, join, kill, leave, limit, load, lock, longtext, match, mediumtext, minute_second, natural, null, optimize, or, outer, primary, raid0, reads, regexp, repeat, restrict, right, schemas, sensitive, show, specific, sqlstate, sql_calc_found_rows, starting, terminated, tinyint, trailing, undo, unlock, usage, utc_date, values, varcharacter, where, write, year_month, alter, as, before, binary, by, case, character, column, constraint, create, current_time, cursor, day_hour, day_second, declare, delete, deterministic, div, dual, elseif, exists, false, float4, force, fulltext, group, hour_microsecond, if, index, inout, int, int3, integer, is, key, label, left, linear, localtime, long, loop, mediumblob, middleint, mod, not, numeric, option, order, outfile, procedure, range, real, release, replace, return, rlike, second_microsecond, separator, smallint, sql, sqlwarning, sql_small_result, straight_join, then, tinytext, trigger, union, unsigned, use, utc_time, varbinary, varying, while, x509, zerofill, jcloud_yunding_db_push, jcloudv_push_rw, jcloudv_push_ro, jddbaclholder
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Audit/SQL-Server-Audit/View-Audit-Result.md
```commandline
select * from sys.fn_get_audit_file('D:\audit\RDSAudit_131702498897960000.sqlaudit',NULL, NULL)
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/Backup-Local-Database.md
```commandline
use master;
go
select name,   case recovery_model
when 1 then   'Full'
when 2 then ' Bulk_logged   '
when 3 then   'Simple' end model from sys.databases
where name not   in ('master','tempdb','model','msdb');
go
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/Backup-Local-Database.md
```commandline
alter database [dbname] set recovery full;
go
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/Backup-Local-Database.md
```commandline
use master;
go
backup database [dbname] to disk   ='z:\Backup\testdb.bak' with compression,init,stats=5;
go
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/Backup-Local-Database.md
```commandline
use master;
go
restore filelistonly 
from disk = 'z:\backup\testdb.bak';
go
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/Backup-Local-Database.md
```commandline
alter database [dbname] set recovery [model];
go
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/Upload-Backup.md
```
upload-tool.exe -r [区域代码] -f [备份文件本地路径] -k [上传key值]
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/Upload-Backup.md
```
upload-tool.exe -r [区域代码] -f [备份文件本地路径] -k [上传key值] -i

## -i:表示使用内网进行文件上传
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/Upload-Backup.md
```
upload-tool.exe -r cn-north -f z:/Backup/testdb.bak -k   U2FsdGVkX19c7B0ZGP0mU++sXgWZoHCeGP0tacbRz3TpoOKPsXmncA
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/V2/Backup-Local-Database-v2.md
```commandline
use master;
go
select name,   case recovery_model
when 1 then   'Full'
when 2 then ' Bulk_logged   '
when 3 then   'Simple' end model from sys.databases
where name not   in ('master','tempdb','model','msdb');
go
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/V2/Backup-Local-Database-v2.md
```commandline
alter database [dbname] set recovery full;
go
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/V2/Backup-Local-Database-v2.md
```commandline
use master;
go
backup database [dbname] to disk   ='z:\Backup\testdb.bak' with compression,init,stats=5;
go
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/V2/Backup-Local-Database-v2.md
```commandline
use master;
go
restore filelistonly 
from disk = 'z:\backup\testdb.bak';
go
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Data-To-Cloud/V2/Backup-Local-Database-v2.md
```commandline
alter database [dbname] set recovery [model];
go
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Operation-Guide/Security/tde.md
```
USE master
GO
SELECT name FROM sys.certificates WHERE name LIKE 'TDE%'
GO

-- TDECertificateName 为上一步查询出的TDE证书名称
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM=AES_128
ENCRYPTION BY SERVER CERTIFICATE [TDECertificateName]
GO

ALTER DATABASE db1
SET ENCRYPTION ON
GO

-- 验证TDE已开启
USE master
GO
SELECT name FROM sys.databases WHERE is_encrypted = 1
GO
SELECT db_name(database_id) as DatabaseName, * FROM sys.dm_database_encryption_keys
GO 
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Tutorial/MySQL-Performance-Test.md
```
$ yum install gcc gcc-c++ autoconf automake make libtool bzr mysql-devel
$ unzip sysbench-1.0.zip
$ cd sysbench-1.0
$ ./autogen.sh
$ ./configure --prefix=/usr
$ make
$ make install
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Tutorial/MySQL-Performance-Test.md
```
$ sysbench ./share/sysbench/oltp_read_write.lua --table_size=10000000 --db-driver=mysql --tables=10 --mysql-host=XXX --mysql-user=XXX --mysql-password=XXX prepare
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Tutorial/MySQL-Performance-Test.md
```
$ sysbench ./share/sysbench/oltp_read_write.lua --tables=10 --threads=32 --max-requests=999999999 --time=3600 --table_size=10000000  --db-driver=mysql --mysql-host=XXX --mysql-user=XXX --mysql-password=XXX run
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Tutorial/MySQL-Performance-Test.md
```
$ sysbench ./share/sysbench/oltp_read_write.lua --tables=10 --threads=32 --max-requests=999999999 --time=3600 --table_size=10000000  --db-driver=mysql --mysql-host=XXX --mysql-user=XXX --mysql-password=XXX cleanup
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Tutorial/MySQL-Performance-Test.md
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


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Tutorial/MySQL-Performance-Test.md
```
id: 1
  k: 5003504
  c: 98210233655-92920312724-46680254539-74097273196-30247159819-37778834059-40387910259-28547466616-68642657061-93956851311
pad: 13866500364-00628646396-45402716318-87575412098-94787248459
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Tutorial/MySQL-Performance-Test.md
```
$ SELECT c FROM sbtest3 WHERE id=5007521
$ SELECT c FROM sbtest7 WHERE id BETWEEN 5000580 AND 5000679
$ SELECT SUM(k) FROM sbtest2 WHERE id BETWEEN 4992664 AND 4992763
$ SELECT DISTINCT c FROM sbtest6 WHERE id BETWEEN 5041654 AND 5041753 ORDER BY c
```


#### 当前代码: documentation/Database-and-Cache-Service/RDS/Tutorial/MySQL-Performance-Test.md
```
$ UPDATE sbtest2 SET k=k+1 WHERE id=4979352
$ DELETE FROM sbtest6 WHERE id=5037406
$ INSERT INTO sbtest4 (id, k, c, pad) VALUES (4995019, 4995155, '58990155292-53936825106-56125467619-3...
``` 


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Data-Migration-Overview.md
```
SET GLOBAL binlog_format = ROW;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Data-Migration-Overview.md
```
# 下载 tool 压缩包
wget http://download.pingcap.org/tidb-enterprise-tools-latest-linux-amd64.tar.gz
wget http://download.pingcap.org/tidb-enterprise-tools-latest-linux-amd64.sha256

# 检查文件完整性，返回 ok 则正确
sha256sum -c tidb-enterprise-tools-latest-linux-amd64.sha256
# 解开压缩包
tar -xzf tidb-enterprise-tools-latest-linux-amd64.tar.gz
cd tidb-enterprise-tools-latest-linux-amd64
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Data-Migration-Overview.md
```
USE test;
CREATE TABLE t1 (id INT, age INT, PRIMARY KEY(id)) ENGINE=InnoDB;
CREATE TABLE t2 (id INT, name VARCHAR(256), PRIMARY KEY(id)) ENGINE=InnoDB;

INSERT INTO t1 VALUES (1, 1), (2, 2), (3, 3);
INSERT INTO t2 VALUES (1, "a"), (2, "b"), (3, "c");
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Data-Migration-Overview.md
```
./bin/checker -host 127.0.0.1 -port 3306 -user root test
2016/10/27 13:11:49 checker.go:48: [info] Checking database test
2016/10/27 13:11:49 main.go:37: [info] Database DSN: root:@tcp(127.0.0.1:3306)/test?charset=utf8
2016/10/27 13:11:49 checker.go:63: [info] Checking table t1
2016/10/27 13:11:49 checker.go:69: [info] Check table t1 succ
2016/10/27 13:11:49 checker.go:63: [info] Checking table t2
2016/10/27 13:11:49 checker.go:69: [info] Check table t2 succ
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Data-Migration-Overview.md
```
./bin/checker -host 127.0.0.1 -port 3306 -user root test t1
2016/10/27 13:13:56 checker.go:48: [info] Checking database test
2016/10/27 13:13:56 main.go:37: [info] Database DSN: root:@tcp(127.0.0.1:3306)/test?charset=utf8
2016/10/27 13:13:56 checker.go:63: [info] Checking table t1
2016/10/27 13:13:56 checker.go:69: [info] Check table t1 succ
Check database succ!
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Data-Migration-Overview.md
```
CREATE TABLE t_error ( a INT NOT NULL, PRIMARY KEY (a))
ENGINE=InnoDB TABLESPACE ts1
PARTITION BY RANGE (a) PARTITIONS 3 (
PARTITION P1 VALUES LESS THAN (2),
PARTITION P2 VALUES LESS THAN (4) TABLESPACE ts2,
PARTITION P3 VALUES LESS THAN (6) TABLESPACE ts3);
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Data-Migration-Overview.md
```
./bin/checker -host 127.0.0.1 -port 3306 -user root test t_error
2017/08/04 11:14:35 checker.go:48: [info] Checking database test
2017/08/04 11:14:35 main.go:39: [info] Database DSN: root:@tcp(127.0.0.1:3306)/test?charset=utf8
2017/08/04 11:14:35 checker.go:63: [info] Checking table t1
2017/08/04 11:14:35 checker.go:67: [error] Check table t1 failed with err: line 3 column 29 near " ENGINE=InnoDB DEFAULT CHARSET=latin1
/*!50100 PARTITION BY RANGE (a)
(PARTITION P1 VALUES LESS THAN (2) ENGINE = InnoDB,
 PARTITION P2 VALUES LESS THAN (4) TABLESPACE = ts2 ENGINE = InnoDB,
 PARTITION P3 VALUES LESS THAN (6) TABLESPACE = ts3 ENGINE = InnoDB) */" (total length 354)
github.com/pingcap/tidb/parser/yy_parser.go:96:
github.com/pingcap/tidb/parser/yy_parser.go:109:
/home/jenkins/workspace/build_tidb_tools_master/go/src/github.com/pingcap/tidb-tools/checker/checker.go:122:  parse CREATE TABLE `t1` (
  `a` int(11) NOT NULL,
  PRIMARY KEY (`a`)
) /*!50100 TABLESPACE ts1 */ ENGINE=InnoDB DEFAULT CHARSET=latin1
/*!50100 PARTITION BY RANGE (a)
(PARTITION P1 VALUES LESS THAN (2) ENGINE = InnoDB,
 PARTITION P2 VALUES LESS THAN (4) TABLESPACE = ts2 ENGINE = InnoDB,
 PARTITION P3 VALUES LESS THAN (6) TABLESPACE = ts3 ENGINE = InnoDB) */ error
/home/jenkins/workspace/build_tidb_tools_master/go/src/github.com/pingcap/tidb-tools/checker/checker.go:114:
2017/08/04 11:14:35 main.go:83: [error] Check database test with 1 errors and 0 warnings.
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Full-Import.md
```
./bin/mydumper -h 127.0.0.1 -P 3306 -u root -t 16 -F 64 -B test -T t1,t2 --skip-tz-utc -o ./var/test
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Full-Import.md
```
./bin/loader -h 127.0.0.1 -u root -P 4000 -t 32 -d ./var/test
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Full-Import.md
```
mysql -h127.0.0.1 -P4000 -uroot

mysql> show tables;
+----------------+
| Tables_in_test |
+----------------+
| t1             |
| t2             |
+----------------+

mysql> select * from t1;
+----+------+
| id | age  |
+----+------+
|  1 |    1 |
|  2 |    2 |
|  3 |    3 |
+----+------+

mysql> select * from t2;
+----+------+
| id | name |
+----+------+
|  1 | a    |
|  2 | b    |
|  3 | c    |
+----+------+
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Incremental-Import.md
```
# 下载 tool 压缩包
wget http://download.pingcap.org/tidb-enterprise-tools-latest-linux-amd64.tar.gz
wget http://download.pingcap.org/tidb-enterprise-tools-latest-linux-amd64.sha256

# 检查文件完整性，返回 ok 则正确
sha256sum -c tidb-enterprise-tools-latest-linux-amd64.sha256
# 解开压缩包
tar -xzf tidb-enterprise-tools-latest-linux-amd64.tar.gz
cd tidb-enterprise-tools-latest-linux-amd64
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Incremental-Import.md
```
Started dump at: 2017-04-28 10:48:10
SHOW MASTER STATUS:
    Log: mysql-bin.000003
    Pos: 930143241
    GTID:

Finished dump at: 2017-04-28 10:48:11
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Incremental-Import.md
```
# cat syncer.meta
binlog-name = "mysql-bin.000003"
binlog-pos = 930143241
binlog-gtid = "2bfabd22-fff7-11e6-97f7-f02fa73bcb01:1-23,61ccbb5d-c82d-11e6-ac2e-487b6bd31bf7:1-4"
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Incremental-Import.md
```
log-level = "info"

server-id = 101

## meta 文件地址
meta = "./syncer.meta"

worker-count = 16
batch = 10

## pprof 调试地址, Prometheus 也可以通过该地址拉取 syncer metrics
## 将 127.0.0.1 修改为相应主机 IP 地址
status-addr = "127.0.0.1:10086"

## 跳过 DDL 或者其他语句，格式为 **前缀完全匹配**，如: `DROP TABLE ABC`,则至少需要填入`DROP TABLE`.
# skip-sqls = ["ALTER USER", "CREATE USER"]

## 在使用 route-rules 功能后，
## replicate-do-db & replicate-ignore-db 匹配合表之后(target-schema & target-table )数值
## 优先级关系: replicate-do-db --> replicate-do-table --> replicate-ignore-db --> replicate-ignore-table
## 指定要同步数据库名；支持正则匹配，表达式语句必须以 `~` 开始
#replicate-do-db = ["~^b.*","s1"]

## 指定要同步的 db.table 表
## db-name 与 tbl-name 不支持 `db-name ="dbname，dbname2"` 格式
#[[replicate-do-table]]
#db-name ="dbname"
#tbl-name = "table-name"

#[[replicate-do-table]]
#db-name ="dbname1"
#tbl-name = "table-name1"

## 指定要同步的 db.table 表；支持正则匹配，表达式语句必须以 `~` 开始
#[[replicate-do-table]]
#db-name ="test"
#tbl-name = "~^a.*"

## 指定**忽略**同步数据库；支持正则匹配，表达式语句必须以 `~` 开始
#replicate-ignore-db = ["~^b.*","s1"]

## 指定**忽略**同步数据库
## db-name & tbl-name 不支持 `db-name ="dbname，dbname2"` 语句格式
#[[replicate-ignore-table]]
#db-name = "your_db"
#tbl-name = "your_table"

## 指定要**忽略**同步数据库名；支持正则匹配，表达式语句必须以 `~` 开始
#[[replicate-ignore-table]]
#db-name ="test"
#tbl-name = "~^a.*"


# sharding 同步规则，采用 wildcharacter
# 1. 星号字符 (*) 可以匹配零个或者多个字符,
#    例子, doc* 匹配 doc 和 document, 但是和 dodo 不匹配;
#    星号只能放在 pattern 结尾，并且一个 pattern 中只能有一个
# 2. 问号字符 (?) 匹配任一一个字符

#[[route-rules]]
#pattern-schema = "route_*"
#pattern-table = "abc_*"
#target-schema = "route"
#target-table = "abc"

#[[route-rules]]
#pattern-schema = "route_*"
#pattern-table = "xyz_*"
#target-schema = "route"
#target-table = "xyz"

[from]
host = "127.0.0.1"
user = "root"
password = ""
port = 3306

[to]
host = "127.0.0.1"
user = "root"
password = ""
port = 4000
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Incremental-Import.md
```
./bin/syncer -config config.toml

2016/10/27 15:22:01 binlogsyncer.go:226: [info] begin to sync binlog from position (mysql-bin.000003, 1280)
2016/10/27 15:22:01 binlogsyncer.go:130: [info] register slave for master server 127.0.0.1:3306
2016/10/27 15:22:01 binlogsyncer.go:552: [info] rotate to (mysql-bin.000003, 1280)
2016/10/27 15:22:01 syncer.go:549: [info] rotate binlog to (mysql-bin.000003, 1280)
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Incremental-Import.md
```
INSERT INTO t1 VALUES (4, 4), (5, 5);
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Incremental-Import.md
```
mysql -h127.0.0.1 -P4000 -uroot -p
mysql> select * from t1;
+----+------+
| id | age  |
+----+------+
|  1 |    1 |
|  2 |    2 |
|  3 |    3 |
|  4 |    4 |
|  5 |    5 |
+----+------+
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Migration/Incremental-Import.md
```
2017/06/08 01:18:51 syncer.go:934: [info] [syncer]total events = 15, total tps = 130, recent tps = 4,
master-binlog = (ON.000001, 11992), master-binlog-gtid=53ea0ed1-9bf8-11e6-8bea-64006a897c73:1-74,
syncer-binlog = (ON.000001, 2504), syncer-binlog-gtid = 53ea0ed1-9bf8-11e6-8bea-64006a897c73:1-17
2017/06/08 01:19:21 syncer.go:934: [info] [syncer]total events = 15, total tps = 191, recent tps = 2,
master-binlog = (ON.000001, 11992), master-binlog-gtid=53ea0ed1-9bf8-11e6-8bea-64006a897c73:1-74,
syncer-binlog = (ON.000001, 2504), syncer-binlog-gtid = 53ea0ed1-9bf8-11e6-8bea-64006a897c73:1-35
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Operation.md
```
SET @@session.tidb_skip_constraint_check=1;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Operation.md
```[raftstore]
# 默认为 true，表示强制将数据刷到磁盘上。如果是非金融安全级别的业务场景，建议设置成 false，
# 以便获得更高的性能。
sync-log = true
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Data-Operation.md
```
for i from 0 to 23:
    while affected_rows > 0:
	delete * from t where insert_time >= i:00:00 and insert_time < (i+1):00:00 limit 5000;
	affected_rows = select affected_rows()
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Best-Practices/Parameters-Optimization.md
``` toml
# 日志级别，可选值为：trace，debug，info，warn，error，off
log-level = "info"

[server]
# 监听地址
# addr = "127.0.0.1:20160"

# 建议使用默认值
# notify-capacity = 40960
# messages-per-tick = 4096

# gRPC 线程池大小
# grpc-concurrency = 4
# TiKV 每个实例之间的 gRPC 连接数
# grpc-raft-conn-num = 10

# TiDB 过来的大部分读请求都会发送到 TiKV 的 coprocessor 进行处理，该参数用于设置
# coprocessor 线程的个数，如果业务是读请求比较多，增加 coprocessor 的线程数，但应比系统的
# CPU 核数小。例如：TiKV 所在的机器有 32 core，在重读的场景下甚至可以将该参数设置为 30。在没有
# 设置该参数的情况下，TiKV 会自动将该值设置为 CPU 总核数乘以 0.8。
# end-point-concurrency = 8

# 可以给 TiKV 实例打标签，用于副本的调度
# labels = {zone = "cn-east-1", host = "118", disk = "ssd"}

[storage]
# 数据目录
# data-dir = "/tmp/tikv/store"

# 通常情况下使用默认值就可以了。在导数据的情况下建议将该参数设置为 1024000。
# scheduler-concurrency = 102400
# 该参数控制写入线程的个数，当写入操作比较频繁的时候，需要把该参数调大。使用 top -H -p tikv-pid
# 发现名称为 sched-worker-pool 的线程都特别忙，这个时候就需要将 scheduler-worker-pool-size
# 参数调大，增加写线程的个数。
# scheduler-worker-pool-size = 4

[pd]
# pd 的地址
# endpoints = ["127.0.0.1:2379","127.0.0.2:2379","127.0.0.3:2379"]

[metric]
# 将 metrics 推送给 Prometheus pushgateway 的时间间隔
interval = "15s"
# Prometheus pushgateway 的地址
address = ""
job = "tikv"

[raftstore]
# 默认为 true，表示强制将数据刷到磁盘上。如果是非金融安全级别的业务场景，建议设置成 false，
# 以便获得更高的性能。
sync-log = true

# Raft RocksDB 目录。默认值是 [storage.data-dir] 的 raft 子目录。
# 如果机器上有多块磁盘，可以将 Raft RocksDB 的数据放在不同的盘上，提高 TiKV 的性能。
# raftdb-dir = "/tmp/tikv/store/raft"

region-max-size = "384MB"
# region 分裂阈值
region-split-size = "256MB"
# 当 region 写入的数据量超过该阈值的时候，TiKV 会检查该 region 是否需要分裂。为了减少检查过程
# 中扫描数据的成本，数据过程中可以将该值设置为32MB，正常运行状态下使用默认值即可。
region-split-check-diff = "32MB"

[rocksdb]
# RocksDB 进行后台任务的最大线程数，后台任务包括 compaction 和 flush。具体 RocksDB 为什么需要进行 compaction，
# 请参考 RocksDB 的相关资料。在写流量比较大的时候（例如导数据），建议开启更多的线程，
# 但应小于 CPU 的核数。例如在导数据的时候，32 核 CPU 的机器，可以设置成 28。
# max-background-jobs = 8

# RocksDB 能够打开的最大文件句柄数。
# max-open-files = 40960

# RocksDB MANIFEST 文件的大小限制.# 更详细的信息请参考：https://github.com/facebook/rocksdb/wiki/MANIFEST
max-manifest-file-size = "20MB"

# RocksDB write-ahead logs 目录。如果机器上有两块盘，可以将 RocksDB 的数据和 WAL 日志放在
# 不同的盘上，提高 TiKV 的性能。
# wal-dir = "/tmp/tikv/store"

# 下面两个参数用于怎样处理 RocksDB 归档 WAL。
# 更多详细信息请参考：https://github.com/facebook/rocksdb/wiki/How-to-persist-in-memory-RocksDB-database%3F
# wal-ttl-seconds = 0
# wal-size-limit = 0

# RocksDB WAL 日志的最大总大小，通常情况下使用默认值就可以了。
# max-total-wal-size = "4GB"

# 可以通过该参数打开或者关闭 RocksDB 的统计信息。
# enable-statistics = true

# 开启 RocksDB compaction 过程中的预读功能，如果使用的是机械磁盘，建议该值至少为2MB。
# compaction-readahead-size = "2MB"

[rocksdb.defaultcf]
# 数据块大小。RocksDB 是按照 block 为单元对数据进行压缩的，同时 block 也是缓存在 block-cache
# 中的最小单元（类似其他数据库的 page 概念）。
block-size = "64KB"

# RocksDB 每一层数据的压缩方式，可选的值为：no,snappy,zlib,bzip2,lz4,lz4hc,zstd。
# no:no:lz4:lz4:lz4:zstd:zstd 表示 level0 和 level1 不压缩，level2 到 level4 采用 lz4 压缩算法,
# level5 和 level6 采用 zstd 压缩算法,。
# no 表示没有压缩，lz4 是速度和压缩比较为中庸的压缩算法，zlib 的压缩比很高，对存储空间比较友
# 好，但是压缩速度比较慢，压缩的时候需要占用较多的 CPU 资源。不同的机器需要根据 CPU 以及 I/O 资
# 源情况来配置怎样的压缩方式。例如：如果采用的压缩方式为"no:no:lz4:lz4:lz4:zstd:zstd"，在大量
# 写入数据的情况下（导数据），发现系统的 I/O 压力很大（使用 iostat 发现 %util 持续 100% 或者使
# 用 top 命令发现 iowait 特别多），而 CPU 的资源还比较充裕，这个时候可以考虑将 level0 和
# level1 开启压缩，用 CPU 资源换取 I/O 资源。如果采用的压缩方式
# 为"no:no:lz4:lz4:lz4:zstd:zstd"，在大量写入数据的情况下，发现系统的 I/O 压力不大，但是 CPU
# 资源已经吃光了，top -H 发现有大量的 bg 开头的线程（RocksDB 的 compaction 线程）在运行，这
# 个时候可以考虑用 I/O 资源换取 CPU 资源，将压缩方式改成"no:no:no:lz4:lz4:zstd:zstd"。总之，目
# 的是为了最大限度地利用系统的现有资源，使 TiKV 的性能在现有的资源情况下充分发挥。
compression-per-level = ["no", "no", "lz4", "lz4", "lz4", "zstd", "zstd"]

# RocksDB memtable 的大小。
write-buffer-size = "128MB"

# 最多允许几个 memtable 存在。写入到 RocksDB 的数据首先会记录到 WAL 日志里面，然后会插入到
# memtable 里面，当 memtable 的大小到达了 write-buffer-size 限定的大小的时候，当前的
# memtable 会变成只读的，然后生成一个新的 memtable 接收新的写入。只读的 memtable 会被
# RocksDB 的 flush 线程（max-background-flushes 参数能够控制 flush 线程的最大个数）
# flush 到磁盘，成为 level0 的一个 sst 文件。当 flush 线程忙不过来，导致等待 flush 到磁盘的
# memtable 的数量到达 max-write-buffer-number 限定的个数的时候，RocksDB 会将新的写入
# stall 住，stall 是 RocksDB 的一种流控机制。在导数据的时候可以将 max-write-buffer-number
# 的值设置的更大一点，例如 10。
max-write-buffer-number = 5

# 当 level0 的 sst 文件个数到达 level0-slowdown-writes-trigger 指定的限度的时候，
# RocksDB 会尝试减慢写入的速度。因为 level0 的 sst 太多会导致 RocksDB 的读放大上升。
# level0-slowdown-writes-trigger 和 level0-stop-writes-trigger 是 RocksDB 进行流控的
# 另一个表现。当 level0 的 sst 的文件个数到达 4（默认值），level0 的 sst 文件会和 level1 中
# 有 overlap 的 sst 文件进行 compaction，缓解读放大的问题。
level0-slowdown-writes-trigger = 20

# 当 level0 的 sst 文件个数到达 level0-stop-writes-trigger 指定的限度的时候，RocksDB 会
# stall 住新的写入。
level0-stop-writes-trigger = 36

# 当 level1 的数据量大小达到 max-bytes-for-level-base 限定的值的时候，会触发 level1 的
# sst 和 level2 种有 overlap 的 sst 进行 compaction。
# 黄金定律：max-bytes-for-level-base 的设置的第一参考原则就是保证和 level0 的数据量大致相
# 等，这样能够减少不必要的 compaction。例如压缩方式为"no:no:lz4:lz4:lz4:lz4:lz4"，那么
# max-bytes-for-level-base 的值应该是 write-buffer-size 的大小乘以 4，因为 level0 和
# level1 都没有压缩，而且 level0 触发 compaction 的条件是 sst 的个数到达 4（默认值）。在
# level0 和 level1 都采取了压缩的情况下，就需要分析下 RocksDB 的日志，看一个 memtable 的压
# 缩成一个 sst 文件的大小大概是多少，例如 32MB，那么 max-bytes-for-level-base 的建议值就应
# 该是 32MB * 4 = 128MB。
max-bytes-for-level-base = "512MB"

# sst 文件的大小。level0 的 sst 文件的大小受 write-buffer-size 和 level0 采用的压缩算法的
# 影响，target-file-size-base 参数用于控制 level1-level6 单个 sst 文件的大小。
target-file-size-base = "32MB"

# 在不配置该参数的情况下，TiKV 会将该值设置为系统总内存量的 40%。如果需要在单个物理机上部署多个
# TiKV 节点，需要显式配置该参数，否则 TiKV 容易出现 OOM 的问题。
# block-cache-size = "1GB"

[rocksdb.writecf]
# 保持和 rocksdb.defaultcf.compression-per-level 一致。
compression-per-level = ["no", "no", "lz4", "lz4", "lz4", "zstd", "zstd"]

# 保持和 rocksdb.defaultcf.write-buffer-size 一致。
write-buffer-size = "128MB"
max-write-buffer-number = 5
min-write-buffer-number-to-merge = 1

# 保持和 rocksdb.defaultcf.max-bytes-for-level-base 一致。
max-bytes-for-level-base = "512MB"
target-file-size-base = "32MB"

# 在不配置该参数的情况下，TiKV 会将该值设置为系统总内存量的 15%。如果需要在单个物理机上部署多个
# TiKV 节点，需要显式配置该参数。版本信息（MVCC）相关的数据以及索引相关的数据都记录在 write 这
# 个 cf 里面，如果业务的场景下单表索引较多，可以将该参数设置的更大一点。
# block-cache-size = "256MB"

[raftdb]
# RaftDB 能够打开的最大文件句柄数。
# max-open-files = 40960

# 可以通过该参数打开或者关闭 RaftDB 的统计信息。
# enable-statistics = true

# 开启 RaftDB compaction 过程中的预读功能，如果使用的是机械磁盘，建议该值至少为2MB。
# compaction-readahead-size = "2MB"

[raftdb.defaultcf]
# 保持和 rocksdb.defaultcf.compression-per-level 一致。
compression-per-level = ["no", "no", "lz4", "lz4", "lz4", "zstd", "zstd"]

# 保持和 rocksdb.defaultcf.write-buffer-size 一致。
write-buffer-size = "128MB"
max-write-buffer-number = 5
min-write-buffer-number-to-merge = 1

# 保持和 rocksdb.defaultcf.max-bytes-for-level-base 一致。
max-bytes-for-level-base = "512MB"
target-file-size-base = "32MB"

# 通常配置在 256MB 到 2GB 之间，通常情况下使用默认值就可以了，但如果系统资源比较充足可以适当调大点。
block-cache-size = "256MB"
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Performance-Test/sysbench-Test.md
``` 
CREATE TABLE `sbtest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `k` int(10) unsigned NOT NULL DEFAULT '0',
  `c` char(120) NOT NULL DEFAULT '',
  `pad` char(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `k_1` (`k`)
) ENGINE=InnoDB  
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Performance-Test/sysbench-Test.md
``` 
// TiDB 部署方案
172.16.20.4    4*tikv    1*tidb    1*sysbench
172.16.20.6    4*tikv    1*tidb    1*sysbench
172.16.20.7    4*tikv    1*tidb    1*sysbench
172.16.10.8    1*tidb    1*pd      1*sysbench  

// 每个物理节点有三块盘：
data3: 2 tikv  (Optane SSD)
data2: 1 tikv
data1: 1 tikv

// TiKV 参数配置
sync-log = false
grpc-concurrency = 8
grpc-raft-conn-num = 24
[defaultcf]
block-cache-size = "12GB"
[writecf]
block-cache-size = "5GB"
[raftdb.defaultcf]
block-cache-size = "2GB"

// Mysql 部署方案
// 分别使用半同步复制和异步复制，部署两副本
172.16.20.4    master
172.16.20.6    slave
172.16.20.7    slave
172.16.10.8    1*sysbench
Mysql version: 5.6.37

// Mysql 参数配置
thread_cache_size = 64
innodb_buffer_pool_size = 64G
innodb_file_per_table = 1
innodb_flush_log_at_trx_commit = 0  
datadir = /data3/mysql  
max_connections = 2000
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/Performance-Test/sysbench-Test.md
```
// TiDB 部署方案
172.16.20.3    4*tikv
172.16.10.2    1*tidb    1*pd     1*sysbench

每个物理节点有三块盘：
data3: 2 tikv  (Optane SSD)
data2: 1 tikv
data1: 1 tikv

// TiKV 参数配置
sync-log = false
grpc-concurrency = 8
grpc-raft-conn-num = 24
[defaultcf]
block-cache-size = "12GB"
[writecf]
block-cache-size = "5GB"
[raftdb.defaultcf]
block-cache-size = "2GB"
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Data-SQL.md
```
INSERT INTO person VALUES("1","tom","20170912");
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Data-SQL.md
```
SELECT * FROM person;
+--------+------+------------+
| number | name | birthday   |
+--------+------+------------+
|  1 | tom  | 2017-09-12 |
+--------+------+------------+
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Data-SQL.md
```
UPDATE person SET birthday='20171010' WHERE name='tom';
SELECT * FROM person;
+--------+------+------------+
| number | name | birthday   |
+--------+------+------------+
|  1 | tom  | 2017-10-10 |
+--------+------+------------+
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Data-SQL.md
```
DELETE FROM person WHERE number=1;
SELECT * FROM person;
Empty set (0.00 sec)
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Database-SQL.md
````
CREATE DATABASE db_name [options];
````


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Database-SQL.md
```
SHOW DATABASES;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Database-SQL.md
```
DROP DATABASE testdb;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Index-SQL.md
```
CREATE INDEX person_num ON person (number);
或者
ALTER TABLE person ADD INDEX person_num (number)；
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Index-SQL.md
```
CREATE UNIQUE INDEX person_num ON person (number);
或者
ALTER TABLE person ADD UNIQUE person_num  on (number);
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Index-SQL.md
```
SHOW INDEX from person;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Index-SQL.md
```
DROP INDEX person_num ON person;
ALTER TABLE person DROP INDEX person_num;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Table-SQL.md
```
CREATE TABLE table_name column_name data_type constraint;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Table-SQL.md
```
CREATE TABLE person (
number INT(11),
name VARCHAR(255),
birthday DAT
);
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Table-SQL.md
```
CREATE TABLE IF NOT EXISTS person (
  number INT(11),
  name VARCHAR(255),
  birthday DATE
);
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Table-SQL.md
```
SHOW TABLES from db_name
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Table-SQL.md
```
SHOW TABLES FROM testdb;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Table-SQL.md
```
SHOW CREATE TABLE table_name;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Table-SQL.md
```
SHOW CREATE table person;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Table-SQL.md
```
SHOW FULL COLUMNS table_name;
例如：
SHOW FULL COLUMNS FROM person;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Table-SQL.md
```
DROP TABLE table_name;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/Table-SQL.md
```
DROP TABLE person;
或者
DROP TABLE IF EXISTS person;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/User-SQL.md
```
CREATE USER 'tiuser'@'localhost' IDENTIFIED BY '123456';
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/User-SQL.md
```
CREATE USER 'tiuser'@'localhost' IDENTIFIED BY '123456';
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/User-SQL.md
```
SHOW GRANTS for tiuser@localhost;
```


#### 当前代码: documentation/Database-and-Cache-Service/TiDB-Service/SQL-Syntax/User-SQL.md
```
DROP USER 'tiuser'@'localhost';
```


#### 当前代码: documentation/Developer-Tools/CodeBuild/Operation-Guide/Build-Spec.md
```
cmds:
  - name: 'list current dir'
    cmd: 'ls'
  - name: 'make output dir'
    cmd: 'mkdir -p output'
  - name: 'touch some files'
    cmd: 'touch a b c'
  - name: 'copy to output dir'
    cmd: 'cp a b c output'

# 抽包路径, 这个是必选项
out_dir: 'output'
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Best-Practice/Blue-green-Deployment.md
```
# 华北-北京
wget -c http://devops-hb.oss-internal.cn-north-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.403.a81f9eb.20181127121007.bin -O installer && sh installer -- -a zero-agent  /usr/local/share/jdcloud/ifrit && rm -f installer
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Best-Practice/Blue-green-Deployment.md
```
---
# 设置需要的环境变量，不需要可以不写
#envs:
#  - name: 'name1' 这里是环境变量的名称
#    value: 'value1' 这里是环境变量的值
#  - name: 'name2' 用列表的方式来了设置多个值
#    value: 'value2'

# 设置编译的命令, 同环境变量的设置方式
# 如:
#cmds: 
#  - name: 'do make'  步骤名称
#    cmd: 'make' 真实的命令,如果不在PATH中，需要写全路径
#  - name: 'do install'
#    cmd: 'make install'
cmds:
  - name: 'chmod'
    cmd: 'chmod a+x ./build.sh'
  - name: 'demo'
    cmd: './build.sh'

# 抽包路径, 这个是必选项
out_dir: 'output'
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Best-Practice/Blue-green-Deployment.md
```
部署路径: 源文件/目录：/       目标目录：/home
停止脚本路径：/home/bin/stop.sh     
启动脚本路径：/home/bin/start.sh
检查脚本路径：
脚本执行账户：  root       
脚本超时时间（s）：100
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Getting-Started/Create-VM.md
```
# 华北-北京
wget -c http://devops-hb.oss-internal.cn-north-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.403.a81f9eb.20181127121007.bin -O installer && sh installer -- -a zero-agent  /usr/local/share/jdcloud/ifrit && rm -f installer
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Getting-Started/Create-VM.md
```
yum -y install java-1.7.0-openjdk*
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Operation-Guide/Convention.md
```
#缓存路径（程序包、解压）
${root dir}/app-${app id}/group-${group id}/deploy-${deploy id}/
#备份路径（备份）
${root dir}/.backup
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Operation-Guide/Install-Agent.md
```
# 华北-北京
wget -c http://devops-hb.oss-internal.cn-north-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.403.a81f9eb.20181127121007.bin -O installer && sh installer -- -a zero-agent  /usr/local/share/jdcloud/ifrit && rm -f installer
# 华南-广州
wget -c http://devops.oss-internal.cn-south-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.403.a81f9eb.20181127121007.bin -O installer && sh installer -- -a zero-agent  /usr/local/share/jdcloud/ifrit && rm -f installer
# 华东-宿迁
wget -c http://devops-sq.oss-internal.cn-east-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.403.a81f9eb.20181127121007.bin -O installer && sh installer -- -a zero-agent  /usr/local/share/jdcloud/ifrit && rm -f installer
# 华东-上海
wget -c http://devops-hd.oss-internal.cn-east-2.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.403.a81f9eb.20181127121007.bin -O installer && sh installer -- -a zero-agent  /usr/local/share/jdcloud/ifrit && rm -f installer
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Operation-Guide/Jdcloud-codedeploy.md
```
files:
  - source: config/sql.txt
    destination: /home/config/sql
  - source: file1
    destination: /home/config
hooks:
   AfterInstall:
     - location: /opt/Control/Test1.sh
       timeout: 100
       runas: root
     - location: /opt/Control/Test2.sh
       timeout: 100
permisssions: 
  - object: /home/config/soft
    pattern: "**"
    except: [function.php]
    owner: admin
    group: admin
    mode: 777
    type:
      - file
env:  
  php_path: /home/config/soft/php/bin
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Operation-Guide/Jdcloud-codedeploy.md
```
file1.txt
file2.txt
folder1/file3.txt
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Operation-Guide/Jdcloud-codedeploy.md
```
# files如下
- source: ./file1.txt
  destination: /home
# 执行结果如下：
/home/file1.txt
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Operation-Guide/Jdcloud-codedeploy.md
```
# files如下
- source: ./file1.txt
  destination: /home
- source: ./file2.txt
  destination: /home  
# 执行结果如下：
/home/file1.txt
/home/file2.txt
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Operation-Guide/Jdcloud-codedeploy.md
```
# files如下
- source: /
  destination: /home
# 执行结果如下：
/home/file1.txt
/home/file2.txt
/home/folder1/file3.txt
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Operation-Guide/Jdcloud-codedeploy.md
```
# files如下
- source: ./folder1
  destination: /home/test01
# 执行结果如下：
/home/test01/file3.txt
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Operation-Guide/Jdcloud-codedeploy.md
```
hooks:
  AfterInstall:
    - location: /home/bin/stop.sh
      timeout: 100
      runas: hadoop
    - location: /home/bin/stop2.sh
      timeout: 100
      runas: root
  ApplicationStart:
    - location: /home/bin/start.sh
      timeout: 100
      runas: root
  BeforeInstall:
    - location: /home/bin/config.sh
      timeout: 10
```


#### 当前代码: documentation/Developer-Tools/CodeDeploy/Operation-Guide/Jdcloud-codedeploy.md
```
permisssions:
  - object: /opt/soft
    pattern: "*bin*"
    except: [sbin/start]
    owner: admin
    mode: 777
    type:
      - directory
```


#### 当前代码: documentation/Developer-Tools/CodePipeline/Best-Practices/Deployment-On-K8S.md
	```
	apiVersion: apps/v1beta1
	kind: Deployment
	metadata:
	  name: golang-test-demo-deployment
	spec:
	  replicas: 3
	  template:
	    metadata:
	      labels:
		app: golang-test-demo
	    spec:
	      containers:
		- name: golang-test-demo
		  image: nginx:1.7.9
		  ports:
		    - containerPort: 8088
	      imagePullSecrets:
		- name: my-secret	
	```


#### 当前代码: documentation/Developer-Tools/CodePipeline/Best-Practices/Deployment-On-K8S.md
	```
	kind: Service
	apiVersion: v1
	metadata:
	  name: lb-show
	  namespace: default
	  labels:
	    k8s-app: kubernetes-test
	spec:
	  ports:
	    - protocol: TCP
	      port: 80
	      targetPort: 8088
	      nodePort: 30190
	  selector:
	    app: golang-test-demo
	  type: LoadBalancer
	  sessionAffinity: None
	  externalTrafficPolicy: Cluster 
	```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Getting-Started/Cloud-Disk/Expand-Filesystem/Expand-File-System-Linux.md
```
umount /home/test
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Getting-Started/Cloud-Disk/Expand-Filesystem/Expand-File-System-Linux.md
```
fdisk /dev/vdb
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Getting-Started/Cloud-Disk/Expand-Filesystem/Expand-File-System-Linux.md
```
fdisk -l /dev/vdb1
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Getting-Started/Cloud-Disk/Expand-Filesystem/Expand-File-System-Linux.md
```
e2fsck -f /dev/vdb1
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Getting-Started/Cloud-Disk/Expand-Filesystem/Expand-File-System-Linux.md
```
resize2fs /dev/vdb1
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Getting-Started/Cloud-Disk/Expand-Filesystem/Expand-File-System-Linux.md
```
df -h /dev/vdb1
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Getting-Started/Cloud-Disk/Parted-Format/Linux-Partition.md
```
fdisk -l
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Getting-Started/Cloud-Disk/Parted-Format/Linux-Partition.md
```
fdisk /dev/vdb

```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Getting-Started/Cloud-Disk/Parted-Format/Linux-Partition.md
```
mkfs -t ext4 /dev/vdb1
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Getting-Started/Cloud-Disk/Parted-Format/Linux-Partition.md
```
mkdir -p /mnt/vdb1 && mount -t ext4 /dev/vdb1 /mnt/vdb1
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Getting-Started/Cloud-Disk/Parted-Format/Linux-Partition.md
```
blkid /dev/vdb1
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Introduction/Performance-Test.md
```
fio -ioengine=libaio -numjobs=64 -bs=4k -direct=1 -rw=randwrite -size=20G -filename=/root/randwrite_20G -name=test -iodepth=32 -runtime=120 --group_reporting --output=/root/fio_test/hdd_randwrite_4k
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Introduction/Performance-Test.md
```
fio -ioengine=libaio -numjobs=64 -bs=4k -direct=1 -rw=randread -size=20G -filename=/root/randread_20G -name=test -iodepth=32 -runtime=120 --group_reporting --output=/root/fio_test/hdd_randread_4k
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Introduction/Performance-Test.md
```
fio -ioengine=libaio -numjobs=64 -bs=1M -direct=1 -rw=read -size=10G -filename=/root/read_10G -name=test -iodepth=32 -runtime=120 --group_reporting --output=/root/fio_test/read_1M
```


#### 当前代码: documentation/Elastic-Compute/Cloud-Disk-Service/Introduction/Performance-Test.md
```
fio -ioengine=libaio -numjobs=64 -bs=1M -direct=1 -rw=write -size=10G -filename=/root/write_10G -name=test -iodepth=32 -runtime=120 --group_reporting --output=/root/fio_test/write_1
```


#### 当前代码: documentation/Elastic-Compute/Container-Registry/Best-Practices/Deploy-Application.md
```
kubectl create secret docker-registry my-secret --docker-server=myregistry-cn-north-1.jcr.service.jdcloud.com --docker-username=jdcloud --docker-password=C********u --docker-email=l****@jd.com
```


#### 当前代码: documentation/Elastic-Compute/Container-Registry/Best-Practices/Deploy-Application.md
```
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: jcr-credential-rbac
subjects:
  - kind: ServiceAccount
    # Reference to upper's `metadata.name`
    name: default
    # Reference to upper's `metadata.namespace`
    namespace: default
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
```


#### 当前代码: documentation/Elastic-Compute/Container-Registry/Best-Practices/Deploy-Application.md
```
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: jdcloud-jcr-credential-cron
spec:
  schedule: "*0 */1 * * *" # 0代表每小时的整点，您可以根据需要修改时间，如改成15代表每小时的第15分钟获取临时令牌。
  successfulJobsHistoryLimit: 2
  failedJobsHistoryLimit: 2  
  jobTemplate:
    spec:
      backoffLimit: 4
      template:
        spec:
          serviceAccountName: default
          terminationGracePeriodSeconds: 0
          restartPolicy: Never
          hostNetwork: true
          containers:
          - name: jcr-token-refresher
            imagePullPolicy: Always
            image: jdcloudcli/jdcloud-cli:latest
            command:
            - "/bin/sh"
            - "-c"
            - |
              REGISTRY_NAME=myregistry
              JCR_REGION=cn-north-1
              DOCKER_REGISTRY_SERVER=https://${REGISTRY_NAME}-${JCR_REGION}.jcr.service.jdcloud.com
              DOCKER_USER=jdcloud
              JDCLOUD_ACCESS_KEY=****************************
              JDCLOUD_SECRET_KEY=****************************
              jdc configure add --profile ${DOCKER_USER} --access-key ${JDCLOUD_ACCESS_KEY} --secret-key ${JDCLOUD_SECRET_KEY}
              PRECHECK=`jdc cr get-authorization-token --region-id ${JCR_REGION} --registry-name ${REGISTRY_NAME} |jq .result.authorizationToken`
              if [ 'null' = "$PRECHECK" ]; then
                  echo "jdc cr call failed no valid content" 
                  exit 0 
              else
                  echo "jdc cr call return authentication string"
              fi;
              DOCKER_PASSWORD=`echo ${PRECHECK} | base64 -d |cut  -d  ':' -f2`
              kubectl delete secret my-secret || true
              echo "0:"$PRECHECK
              echo "1:"$DOCKER_REGISTRY_SERVER
              echo "2:"$DOCKER_USER
              echo "3:"$DOCKER_PASSWORD
              kubectl create secret docker-registry my-secret \
              --docker-server=$DOCKER_REGISTRY_SERVER \
              --docker-username=$DOCKER_USER \
              --docker-password=$DOCKER_PASSWORD \
              --docker-email=**@jd.com
              kubectl patch serviceaccount default  -p '{"imagePullSecrets":[{"name":"my-secret"}]}' # kubectl patch  $SERVICEACCOUNT xxxxx  -n $NAMESPACEOFSERVICEACCOUNT  

```


#### 当前代码: documentation/Elastic-Compute/Container-Registry/Best-Practices/Deploy-Application.md
```
kubectl apply  -f  jcr-credential-rbac.yaml
kubectl apply  -f  jcr-credential-cron.yaml
```


#### 当前代码: documentation/Elastic-Compute/Container-Registry/Best-Practices/Deploy-Application.md
```
apiVersion: v1
 kind: ReplicationController
 metadata:
    name: webapp
 spec:
    replicas: 1
    selector:
      name: container-private-repo
    template:
      metadata:
        labels:
           name: container-private-repo
      spec:
        containers:
          - name:  mycontainer
            image: myregistry-cn-north-1.jcr.service.jdcloud.com/myrepo:latest
            imagePullPolicy: Always
        imagePullSecrets:
          - name: my-secret
```


#### 当前代码: documentation/Elastic-Compute/Function-Service/Getting-Started/helloworld.md
 ```
def handler(event,context):
print(event)
return "hello world"
```


#### 当前代码: documentation/Elastic-Compute/Function-Service/Operation-Guide/ENV-variable.md
```
import os
value = os.environ.get('key')
print(value)
```


#### 当前代码: documentation/Elastic-Compute/Function-Service/Operation-Guide/buildfunction/programming-model/python/context.md
```
class FunctionMeta:
    def __init__(self, invoked_function_id, function_name, function_version, function_handler, memory_size, timeout):
        self.invoked_function_id = invoked_function_id
        self.function_name = function_name
        self.function_version = function_version
        self.function_handler = function_handler
        self.memory_size = memory_size
        self.timeout = timeout

class FContext:
    def __init__(self, request_id, function_meta, logset, logtopic):
        self.request_id = request_id
        self.function = function_meta
        self.logset = logset
        self.logtopic = logtopic
```


#### 当前代码: documentation/Elastic-Compute/Function-Service/Operation-Guide/buildfunction/programming-model/python/processing-program.md
```
   def my_handler(event, context):
   return 'hello world'
  ```


#### 当前代码: documentation/Elastic-Compute/Function-Service/Operation-Guide/buildfunction/programming-model/python/processing-program.md
```
 def my_handler(event, context):
    message = 'Hello {} {}!'.format(event['first_name'], 
                                    event['last_name'])  
    return { 
        'message' : message
    }  
```


#### 当前代码: documentation/Elastic-Compute/Function-Service/Operation-Guide/buildfunction/programming-model/python/record.md
```
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
def my_logging_handler(event, context):
  logger.info('got event{}'.format(event))
  logger.error('something is error')
return 'function is worked'  
```


#### 当前代码: documentation/Elastic-Compute/Function-Service/Operation-Guide/buildfunction/programming-model/python/record.md
```
from __future__ import print_function
def lambda_handler(event, context):
  print('it is running')`
  return 'Hello World!'`   
```  


#### 当前代码: documentation/Elastic-Compute/Function-Service/Operation-Guide/invokefunction/triggermanagement/configtigger-event.md
```
{
     "Records": [
        {
            "version": "0", 
            "id": "6a7e8feb-b491-4cf7-a9f1-bf3703467718",
            "time": "2006-01-02T15:04:05.999999999Z",
            "source": "oss",
            "base64OwnerPin": "NTk0MDM1MjYzMDE5",
            "resources": [
                "jrn:oss:cn-north-1:accountID:bucketname/objectname"
            ],
            "region": "cn-north-1",
            "detailType": "MessageReceived",
            "detail": { 
                "eventName":"event-type",  //事件类型
                "responseElements":{  
                    "x-amz-request-id":"OSS generated request ID"  //发起事件的请求ID
                },
                "s3":{  
                    "s3SchemaVersion":"1.0",  //通知内容版本号，目前为"1.0"
                    "configurationId":"ID found in the bucket notification configuration",  //事件通知配置中ConfigurationId
                    "bucket":{  
                        "name":"bucket-name",  //Bucket名称
                        "ownerIdentity":{  
                            "principalId":"userId-of-the-bucket-owner"  //Bucket owner用户ID
                        }
                     },
                    "object":{  
                        "key":"object-key",  //Object名称
                        "eTag":"object eTag",  //Object的etag，与GetObject请求返回的ETag头的内容相同
                        "size":"object size",  //Object的size
                        "type":"object type"  //Object的type 
                    }
                },
                "callBackVar": {  //回调通知配置中的自定义参数
                    "callBackVars": {                 
                        "var1":["value1","value3"],
                        "var2":["value2"]
                    }
                }
            }       
        }
    ]
}
```


#### 当前代码: documentation/Elastic-Compute/Function-Service/Operation-Guide/invokefunction/triggermanagement/configtigger-event.md
```
{
    "version":"0",
    "id":"6a7e8feb-b491-4cf7-a9f1-bf3703467718",
    "time":"2006-01-02T15:04:05.999999999Z",
    "source":"apigateway",
    "base64OwnerPin":"NTk0MDM1MjYzMDE5",
    "resources":[    
    ],
    "region":"cn-north-1",
    "detailType":"ApiGatewayReceived",
    "detail":{
        "path":"api request path",        //请求路径
        "httpMethod":"GET/POST/DELETE/PUT/PATCH",  
        "headers":{                 //请求头
            "header":"headerValue"
        },
        "pathParameters":{      //路径参数
            "pathParam":"pathValue"
        },
        "queryParameters":{            //查询参数
            "queryParam":"queryValue"
        },
        "body":"string of request payload",
        "requestContext":{
            "stage": "test",             //环境别名 
            "apiId":"testsvc",
            "identity": {
                "accountId": "",        //userid
                "apiKey": "",           //ak
                "user": "",          //pin
                "authType": ""       //身份认证的类型 公测免鉴权/jdcloud鉴权
            },
            "requestId":"c6af9ac6-7b61-11e6-9a41-93e8deadbeef",
            "sourceIp":"10.0.2.14"
        }
    }
} 

```


#### 当前代码: documentation/Elastic-Compute/Function-Service/Operation-Guide/invokefunction/triggermanagement/configtigger-event.md
```
{     
    "statusCode": httpStatusCode,     
    "headers": {"headerName":"headerValue",...},     
    "body": "..." 
 } 
```


#### 当前代码: documentation/Elastic-Compute/Function-Service/Operation-Guide/invokefunction/triggermanagement/eventsourceservice/oss-tirgger.md
```
triggerConfig:
   events:
       s3:ObjectCreated:Put
       s3:ObjectCreated:Post
   filter:
      key:
          prefix: sourcefile/
          suffix: .gif
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Connect-Dashboard.md
```
kind: Service
apiVersion: v1
metadata:
  name: dashboard-lb
  labels:
    k8s-app: kubernetes-dashboard
spec:
  ports:
    - protocol: TCP
      port: 8443
      targetPort: 8443
      nodePort: 30063
  type: LoadBalancer
  selector:
     k8s-app: kubernetes-dashboard
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Create-Pod-InKubernetes.md
```
annotations:
    jdcloud.com/NativeContainer.SystemDisk.Name: distTest
    jdcloud.com/NativeContainer.SystemDisk.Type: ssd
    jdcloud.com/NativeContainer.container-test1.SystemDisk.SizeGB: "40"
    jdcloud.com/NativeContainer.container-test1.SystemDisk.FSType: ext4
    jdcloud.com/NativeContainer.SystemDisk.AutoDelete: "false"
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Create-Pod-InKubernetes.md
```
NAME                         STATUS    ROLES     AGE       VERSION
k8s-node-*******-90lirk7snb   Ready     <none>    10d       v1.8.12-249.9d2635d
k8s-node-*******-90lirk7snb   Ready     <none>    10d       v1.8.12-249.9d2635d
k8s-node-*******-90lirk7snb   Ready     <none>    10d       v1.8.12-249.9d2635d
virtual-kubelet-cn-****-2a   Ready     agent     3d        v1.8.3
virtual-kubelet-cn-****-2b   Ready     agent     3d        v1.8.3
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Create-Pod-InKubernetes.md
```
NAME                                          READY     STATUS             RESTARTS   AGE       IP           NODE
virtual-kubelet-cn-****-2a-7b****f7f-plmnp    1/1       Running            0          6h        10.0.128.5   k8s-node-v****4-90****snb
virtual-kubelet-cn-****-2b-78****c4b7-mk8nv   1/1       Running            0          6h        10.0.128.3   k8s-node-v****a-90****snb
```   


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Create-Pod-InKubernetes.md
```
apiVersion: v1
kind: Pod
metadata:
  name: pod-example
  annotations:
    jdcloud.com/NativeContainer.SystemDisk.Name: distTest
    jdcloud.com/NativeContainer.SystemDisk.Type: ssd
    jdcloud.com/NativeContainer.container-test1.SystemDisk.SizeGB: "40"
    jdcloud.com/NativeContainer.container-test1.SystemDisk.FSType: ext4
    jdcloud.com/NativeContainer.SystemDisk.AutoDelete: "false"
spec:
  containers:
  - name: container-test1
    image: busybox:latest
    command: ["/bin/sh", "-c", "while true; do date && echo Welcome to JDCLOUD! && sleep 5;done"]
    imagePullPolicy: Never
    resources:
      requests:
        memory: "64Mi"
        cpu: "1"
  - name: container-test2
    image: busybox:latest
    command: ["/bin/sh", "-c", "while true; do date && echo Welcome to JDCLOUD! && sleep 5;done"]
    imagePullPolicy: Never
    resources:
      requests:
        memory: "64Mi"
        cpu: "1"
      limits:
        memory: "100Mi"
        cpu: "2"
  nodeSelector:
    kubernetes.io/hostname: virtual-kubelet-cn-****-1a		#必填项，且必须与部署virtual-kubelet时选择的可用区一致
  tolerations:
  - key: virtual-kubelet.io/provider
    operator: Exists
```    


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Create-Pod-InKubernetes.md
```
nodeSelector:
    kubernetes.io/role: agent
    beta.kubernetes.io/os: linux
    type: virtual-kubelet
    kubernetes.io/hostname: virtual-kubelet-{AZ}		#必填项，且必须与部署virtual-kubelet时选择的可用区一致
tolerations:
- key: virtual-kubelet.io/provider
  operator: Exists

```    


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Deployment.md
```
$ kubectl create -f https://kubernetes.io/docs/user-guide/nginx-deployment.yaml --record
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Deployment.md
```
$ kubectl get deployments
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Deployment.md
```
$ kubectl get deployments
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Deployment.md
```
$ kubectl get rs
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Deployment.md
```
$ kubectl get pods --show-labels
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-PV.md
```
kind: PersistentVolume
apiVersion: v1
metadata:
  name: pv-static
  labels:
    type: jdcloud-ebs
spec:
  capacity:
    storage: 30Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  jdcloudElasticBlockStore:
    volumeID: vol-ogcbkdjg7x
    fsType: xfs
```     


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-PV.md
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pv-static-pvc
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: ""
  resources:
    requests:
      storage: 30Gi
  selector:
    matchLabels:
      type: jdcloud-ebs
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-PV.md
```
kind: Pod
apiVersion: v1
metadata:
  name: pod-static
spec:
  volumes:
    - name: pv-static
      persistentVolumeClaim:
        claimName: pv-static-pvc
  containers:
    - name: busybox-static
      image: busybox
      command:
         - sleep
         - "600"
      imagePullPolicy: Always
      volumeMounts:
        - mountPath: "/usr/share/mybusybox/"
          name: pv-static
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-PV.md
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc1
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: jdcloud-ssd
  resources:
    requests:
      storage: 20Gi
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-PV.md
```
NAME                                         STATUS    VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
pvc1                                         Bound     pvc-73d8538b-ebd6-11e8-a857-fa163eeab14b   20Gi       RWO            jdcloud-ssd    18s
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-PV.md
```
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS    CLAIM                                                STORAGECLASS   REASON    AGE
pvc-73d8538b-ebd6-11e8-a857-fa163eeab14b   20Gi       RWO            Delete           Bound     default/pvc1                                         jdcloud-ssd              2m
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Service.md
```
kind: Service
apiVersion: v1
metadata:
  name: servicetest
  labels:
    run: myapp
spec:
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30062
  type: LoadBalancer
  selector:
     run: myapp
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Service.md
```
apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: my-nginx
spec:
  selector:
    matchLabels:
      run: myapp
  replicas: 2
  template:
    metadata:
      labels:
        run: myapp
    spec:
      containers:
      - name: my-nginx
        image: nginx
        ports:
        - containerPort: 80
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Service.md
```
kubectl create -f mynginx.yaml
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Service.md
```
NAME       DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
my-nginx   2         2         2            2           4m
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Service.md
```
NAME                        READY     STATUS    RESTARTS   AGE       IP            NODE
my-nginx-864b5bfdc7-6297s   1/1       Running   0          23m       172.16.0.10   k8s-node-vmtwjb-0vy9nuo0ym
my-nginx-864b5bfdc7-lr7gq   1/1       Running   0          23m       172.16.0.42   k8s-node-vm25q1-0vy9nuo0ym
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Service.md
```
Name:                     servicetest
Namespace:                default
Labels:                   run=myapp
Annotations:              <none>
Selector:                 run=myapp
Type:                     LoadBalancer
IP:                       172.16.61.58
LoadBalancer Ingress:     114.67.227.25
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30062/TCP
Endpoints:                172.16.0.10:80,172.16.0.42:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:
  Type     Reason                      Age                From                Message
  ----     ------                      ----               ----                -------
  Normal   EnsuringLoadBalancer        11m (x9 over 26m)  service-controller  Ensuring load balancer
  Normal   EnsuredLoadBalancer         10m                service-controller  Ensured load balancer

```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-Service.md
```
NAME          ENDPOINTS                       AGE
servicetest   172.16.0.10:80,172.16.0.42:80   28m
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Applications/Deploy-StorageClass.md
```
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: mystorageclass-hdd1
provisioner: kubernetes.io/jdcloud-ebs
parameters:
  zones: cn-north-1a, cn-north-1b
  fstype: ext4
reclaimPolicy: Retain
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Container-Registry.md
```
kubectl create secret docker-registry my-secret --docker-server=myregistry-cn-north-1.jcr.service.jdcloud.com --docker-username=jdcloud --docker-password=C********u --docker-email=l****@jd.com
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Container-Registry.md
```
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: jcr-credential-rbac
subjects:
  - kind: ServiceAccount
    # Reference to upper's `metadata.name`
    name: default
    # Reference to upper's `metadata.namespace`
    namespace: default
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Container-Registry.md
```
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: jdcloud-jcr-credential-cron
spec:
  schedule: "0 */1 * * *" # 0代表每小时的整点，您可以根据需要修改时间，如改成15代表每小时的第15分钟获取临时令牌。
  successfulJobsHistoryLimit: 2
  failedJobsHistoryLimit: 2  
  jobTemplate:
    spec:
      backoffLimit: 4
      template:
        spec:
          serviceAccountName: default
          terminationGracePeriodSeconds: 0
          restartPolicy: Never
          hostNetwork: true
          containers:
          - name: jcr-token-refresher
            imagePullPolicy: Always
            image: jdcloudcli/jdcloud-cli:latest
            command:
            - "/bin/sh"
            - "-c"
            - |
              REGISTRY_NAME=myregistry
              JCR_REGION=cn-north-1
              DOCKER_REGISTRY_SERVER=https://${REGISTRY_NAME}-${JCR_REGION}.jcr.service.jdcloud.com
              DOCKER_USER=jdcloud
              JDCLOUD_ACCESS_KEY=****************************
              JDCLOUD_SECRET_KEY=****************************
              jdc configure add --profile ${DOCKER_USER} --access-key ${JDCLOUD_ACCESS_KEY} --secret-key ${JDCLOUD_SECRET_KEY}
              PRECHECK=`jdc cr get-authorization-token --region-id ${JCR_REGION} --registry-name ${REGISTRY_NAME} |jq .result.authorizationToken`
              if [ 'null' = "$PRECHECK" ]; then
                  echo "jdc cr call failed no valid content" 
                  exit 0 
              else
                  echo "jdc cr call return authentication string"
              fi;
              DOCKER_PASSWORD=`echo ${PRECHECK} | base64 -d |cut  -d  ':' -f2`
              kubectl delete secret my-secret || true
              echo "0:"$PRECHECK
              echo "1:"$DOCKER_REGISTRY_SERVER
              echo "2:"$DOCKER_USER
              echo "3:"$DOCKER_PASSWORD
              kubectl create secret docker-registry my-secret \
              --docker-server=$DOCKER_REGISTRY_SERVER \
              --docker-username=$DOCKER_USER \
              --docker-password=$DOCKER_PASSWORD \
              --docker-email=**@jd.com
              kubectl patch serviceaccount default  -p '{"imagePullSecrets":[{"name":"my-secret"}]}' # kubectl patch  $SERVICEACCOUNT xxxxx  -n $NAMESPACEOFSERVICEACCOUNT

```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Container-Registry.md
```
kubectl apply  -f  jcr-credential-rbac.yaml
kubectl apply  -f  jcr-credential-cron.yaml
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Container-Registry.md
```
apiVersion: v1
 kind: ReplicationController
 metadata:
    name: webapp
 spec:
    replicas: 1
    selector:
      name: container-private-repo
    template:
      metadata:
        labels:
           name: container-private-repo
      spec:
        containers:
          - name:  mycontainer
            image: myregistry-cn-north-1.jcr.service.jdcloud.com/myrepo:latest
            imagePullPolicy: Always
        imagePullSecrets:
          - name: my-secret
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: tiller
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: tiller
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: tiller
    namespace: kube-system
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
helm init --upgrade --service-account tiller --tiller-image registry.docker-cn.com/rancher/tiller:v2.7.2
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
Client: &version.Version{SemVer:"v2.7.2", GitCommit:"8478fb4fc723885b155c924d1c8c410b7a9444e6", GitTreeState:"clean"}
Server: &version.Version{SemVer:"v2.7.2", GitCommit:"8478fb4fc723885b155c924d1c8c410b7a9444e6", GitTreeState:"clean"}
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
NAME                                 	VERSION  	DESCRIPTION                                       
stable/acs-engine-autoscaler         	2.2.0    	Scales worker nodes within agent pools            
stable/aerospike                     	0.1.7    	A Helm chart for Aerospike in Kubernetes          
stable/anchore-engine                	0.2.6    	Anchore container analysis and policy evaluatio...
stable/apm-server                    	0.1.0    	The server receives data from the Elastic APM a...
stable/ark                           	1.2.2    	A Helm chart for ark                 
...
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
NAME                            	VERSION	DESCRIPTION                                       
stable/mysql                    	0.10.2 	Fast, reliable, scalable, and easy to use open-...
stable/mysqldump                	1.0.0  	A Helm chart to help backup MySQL databases usi...
stable/prometheus-mysql-exporter	0.2.1  	A Helm chart for prometheus mysql exporter with...
stable/percona                  	0.3.3  	free, fully compatible, enhanced, open source d...
stable/percona-xtradb-cluster   	0.3.0  	free, fully compatible, enhanced, open source d...
stable/phpmyadmin               	1.3.0  	phpMyAdmin is an mysql administration frontend    
stable/gcloud-sqlproxy          	0.6.0  	Google Cloud SQL Proxy                            
stable/mariadb                  	5.2.3  	Fast, reliable, scalable, and easy to use open-...
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
appVersion: 5.7.14
description: Fast, reliable, scalable, and easy to use open-source relational database
  system.
engine: gotpl
home: https://www.mysql.com/
icon: https://www.mysql.com/common/logos/logo-mysql-170x115.png
keywords:
- mysql
- database
- sql
maintainers:
- email: o.with@sportradar.com
  name: olemarkus
- email: viglesias@google.com
  name: viglesiasce
name: mysql
sources:
- https://github.com/kubernetes/charts
- https://github.com/docker-library/mysql
version: 0.10.2
...
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
NAME:   boisterous-aardwolf
LAST DEPLOYED: Thu Nov  8 16:24:36 2018
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1beta1/Deployment
NAME                           DESIRED  CURRENT  UP-TO-DATE  AVAILABLE  AGE
boisterous-aardwolf-wordpress  1        1        1           0          1s

==> v1beta1/StatefulSet
NAME                         DESIRED  CURRENT  AGE
boisterous-aardwolf-mariadb  1        1        1s
...
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
NAME                                 STATUS    VOLUME    CAPACITY   ACCESS MODES   STORAGECLASS   AGE
boisterous-aardwolf-wordpress        Pending                                       default        2m
data-boisterous-aardwolf-mariadb-0   Pending                                       default        2m
```   


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: boisterous-aardwolf-wordpress
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: jdcloud-ssd
  resources:
    requests:
      storage: 20Gi
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
NAME                                             READY     STATUS    RESTARTS   AGE
boisterous-aardwolf-mariadb-0                    1/1       Running   0          57m
boisterous-aardwolf-wordpress-7b94db45db-s4g8f   1/1       Running   0          57m
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
NAME                            TYPE           CLUSTER-IP       EXTERNAL-IP    PORT(S)                      AGE
boisterous-aardwolf-mariadb     ClusterIP      192.168.57.31    <none>         3306/TCP                     1h
boisterous-aardwolf-wordpress   LoadBalancer   192.168.60.113   114.67.94.77   80:31860/TCP,443:30346/TCP   1h
kubernetes                      ClusterIP      192.168.56.1     <none>         443/TCP                      2d
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
helm fetch stable/nginx-ingress
tar -zxvf nginx-ingress-0.30.0.tgz
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
 name: default-backend
  image:
    repository: googlecontainer/defaultbackend-amd64
    tag: "1.4"
    pullPolicy: IfNotPresent
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
NAME:   fallacious-lionfish
LAST DEPLOYED: Fri Nov  9 14:26:00 2018
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1beta1/ClusterRoleBinding
NAME                               AGE
fallacious-lionfish-nginx-ingress  1s
...
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
NAME                                                              READY     STATUS    RESTARTS   AGE
fallacious-lionfish-nginx-ingress-controller-6499bbb6c5-76t9v     1/1       Running   0          8m
fallacious-lionfish-nginx-ingress-default-backend-674cb8879rds9   1/1       Running   0          8m
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Helm.md
```
NAME                                                TYPE           CLUSTER-IP       EXTERNAL-IP    PORT(S)                      AGE
fallacious-lionfish-nginx-ingress-controller        LoadBalancer   192.168.59.194   114.67.95.42   80:30296/TCP,443:30161/TCP   9m
fallacious-lionfish-nginx-ingress-default-backend   ClusterIP      192.168.61.72    <none>         80/TCP                       9m
kubernetes                                          ClusterIP      192.168.56.1     <none>         443/TCP                      2d
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Virtual-Kubelet.md
```
wget http://kubernetes.oss.cn-north-1.jcloudcs.com/virtual-kubelet/jdcloud-virtual-kubelet.tar.gz    
tar -zxvf jdcloud-virtual-kubelet.tar.gz  
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Virtual-Kubelet.md
```
NAME                                          READY     STATUS     RESTARTS   AGE
virtual-kubelet-cn-east-2a-5cd5bcd4b5-rwlrt   1/1       Running    9          2d
virtual-kubelet-cn-east-2b-7bb6c6f565-zvggm   1/1       Running    3          2d
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Virtual-Kubelet.md
```
NAME                         STATUS    ROLES     AGE       VERSION
k8s-node-*******-90****snb   Ready     <none>    10d       v1.8.12-249.9d2635d
k8s-node-*******-90****snb   Ready     <none>    10d       v1.8.12-249.9d2635d
k8s-node-*******-90****snb   Ready     <none>    10d       v1.8.12-249.9d2635d
virtual-kubelet-cn-****-2a   Ready     agent     3d        v1.8.3
virtual-kubelet-cn-****-2b   Ready     agent     3d        v1.8.3
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Virtual-Kubelet.md
```  
[System]
   OperatingSystem = "Linux"		#Node的操作系统. 默认为Linux
[Metadata]
  Region = "cn-east-2"		#创建的原生容器Pod所在地域，必须与Kubernetes集群在同一个地域
  AvailableZone = "cn-east-2a" 		#创建的原生容器Pod所在可用区，必须是Kubernetes集群支持的可用区
  ClusterID = "k8s-1m******lv"	 	#Kubernetes集群的ID
  PodSubnetId = "subnet-ds******2v"		#创建的原生容器Pod所在的子网，必须与Kubernetes集群Pod所在的子网一致
  PodSecurityGroups = ["sg-12******o7"] 		#Pod子网绑定的安全组ID
  AccessKey = "4B06***********************01B9" 		#创建Kubernetes集群关联的AccessKey
  SecretKey = "EA94************************18A1"		#创建Kubernetes集群关联的SecretKey
[Resource]
  ContainerDefaultCPU = "125m"		#未设置resource request/limit时容器cpu的默认值；1C=1000m
  ContainerDefaultMEM = "256Mi"		##未设置resource request/limit时容器memory的默认值；1G=1024Mi
  Pods = "50"		# 一个Virtual-kubelet虚节点默认支持的原生容器Pod数量；
  TotalCPU = "72"		#一个Virtual-kubelet虚节点默认支持的CPU总核数；
  TotalMEM = "576Gi"		#一个Virtual-kubelet虚节点默认支持的Memory总容量
  InstanceTypeFamily = "g.n2"		#Virtual-kubelet虚节点创建原生容器Pod时默认选择的实例规格族

```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Virtual-Kubelet.md
```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: virtual-kubelet
  namespace: kube-system
  labels:
    k8s-app: virtual-kubelet
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: virtual-kubelet
  namespace: kube-system
subjects:
- kind: ServiceAccount
  name: virtual-kubelet
  namespace: kube-system
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
---
apiVersion: v1
kind: Secret
metadata:
  name: virtual-kubelet
  namespace: kube-system
type: Opaque
data:
  cert.pem: xxxxxxxxxxxxxxxxxxxxxxxxxxx==   #cert.pem的内容
  key.pem: xxxxxxxxxxxxxxxxxxxxxxxxxxxx==   #key.pem的内容

```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Best-Practices/Deploy-Virtual-Kubelet.md
```
# virtual-kubelet-deployment.yaml 
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: virtual-kubelet-cn-****-2a		#cn-****-2a为运行脚本时指定的可用区
  namespace: kube-system
  labels:
    k8s-app: kubelet
spec:
  replicas: 1
  selector:
    matchLabels:
      k8s-app: virtual-kubelet-cn-south-1a
  template:
    metadata:
      labels:
        k8s-app: virtual-kubelet-cn-south-1a
    spec:
      hostNetwork: true
      initContainers:
      - name: init-config
        image: virtual-kubelet:1.0 	 #kubernetes集群node节点上的virtual-kubelet镜像
        imagePullPolicy: IfNotPresent
        env:
        - name: AVALIABILITY_ZONE
          value: cn-south-1a
        command: ["init-config.sh"]
        volumeMounts:
        - name: configs
          mountPath: "/etc/virtual-kubelet/config"
          readOnly: false
      containers:
      - name: virtual-kubelet
        image: virtual-kubelet:1.0
        imagePullPolicy: IfNotPresent
        env:
        - name: KUBERNETES_SERVICE_HOST
          value: 10.0.0.4
        - name: KUBERNETES_SERVICE_PORT
          value: "6443"
        - name: KUBELET_PORT
          value: "10251"
        - name: APISERVER_CERT_LOCATION
          value: /etc/virtual-kubelet/cert/cert.pem
        - name: APISERVER_KEY_LOCATION
          value: /etc/virtual-kubelet/cert/key.pem
        - name: DEFAULT_NODE_NAME
          value: virtual-kubelet-cn-south-1a
        - name: VKUBELET_POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP
        volumeMounts:
        - name: credentials
          mountPath: "/etc/virtual-kubelet/cert"
          readOnly: true
        - name: configs
          mountPath: "/etc/virtual-kubelet/config"
          readOnly: true
        command: ["virtual-kubelet"]
        args: [
          "--provider", "jdcloud",
          "--nodename", "$(DEFAULT_NODE_NAME)",
          "--provider-config", "/etc/virtual-kubelet/config/nc-cn-south-1a.toml",
          "--os", "Linux"
        ]
        livenessProbe:
          tcpSocket:
            port: 10251
          initialDelaySeconds: 20
          periodSeconds: 20
      volumes:
      - name: credentials
        secret:
          secretName: virtual-kubelet
      - name: configs
        hostPath:
          path: /etc/jdcloud-virtual-kubelet/config
          type: DirectoryOrCreate
      serviceAccountName: virtual-kubelet
```  


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Getting-Started/Connect-to-Cluster.md
```
wget https://dl.k8s.io/v1.8.12/kubernetes-client-linux-amd64.tar.gz
tar -zxvf kubernetes-client-linux-amd64.tar.gz
cd kubernetes/client/bin
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Getting-Started/Connect-to-Cluster.md
```
mkdir -p ~/.kube
touch ~/.kube/config
vi ~/.kube/config
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Getting-Started/Connect-to-Cluster.md
```
Client Version: version.Info{Major:"1", Minor:"8", GitVersion:"v1.8.12", GitCommit:"5d26aba6949f188fde1af4875661e038f538f2c6", GitTreeState:"clean", BuildDate:"2018-04-23T23:17:12Z", GoVersion:"go1.8.3", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"8+", GitVersion:"v1.8.12-249.9d2635d", GitCommit:"9d2635d891e745a24d6863cd61b0767575a5e79c", GitTreeState:"", BuildDate:"2018-07-23T10:39:25Z", GoVersion:"go1.8.3", Compiler:"gc", Platform:"linux/amd64"}
```


#### 当前代码: documentation/Elastic-Compute/JCS-for-Kubernetes/Operation-Guide/Cluster/Connect-Cluster.md
```
wget https://dl.k8s.io/v1.8.12/kubernetes-client-linux-amd64.tar.gz
tar -zxvf kubernetes-client-linux-amd64.tar.gz
cd kubernetes/client/bin
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
apt-get update
apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/centos/docker-ce.repo
yum makecache fast
yum -y install docker-ce
service docker start
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```

apt-get   install python-pip –y
pip install docker-compose
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```

yum install python-pip –y
pip install docker-compose
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```

wget   http://harbor.orientsoft.cn/harbor-v1.4.0/harbor-offline-installer-v1.4.0.tgz
tar xf  harbor-offline-installer-v1.4.0.tgz
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```

cd ..
mkdir -p /data/cert
cd /data/cert
vim server.crt
vim server.key
cd ..
cd ..
cd root
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```

cd harbor
vim harbor.cfg
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
hostname = harbortest.jdpoc.com
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
ui_url_protocol = https
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
harbor_admin_password = ********
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
self_registration = off
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
mkdir -p /etc/docker/certs.d/harbortest.jdpoc.com
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
cp /data/cert/server.crt !$
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
docker login harbortest.jdpoc.com
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
mkdir nginx-dockerfile
cd nginx-dockerfile
vim Dockerfile
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
FROM nginx
RUN echo '<h1>Hello, JD Cloud!</h1>' > /usr/share/nginx/html/index.html
EXPOSE 80
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
docker build -t newnginx .
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
docker tag newnginx harbortest.jdpoc.com/test/newnginx:latest
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-Repository1.md
```
docker push harbortest.jdpoc.com/test/newnginx:latest
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Best-Practices/Create-SSH-Image.md
```

FROM centos:latest
MAINTAINER jcloud www.jdcloud.com
RUN yum install openssh-server net-tools -y
RUN mkdir /var/run/sshd
RUN echo 'root:jcloudA#699' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i '/Port 22/a\Port 4011' /etc/ssh/sshd_config
RUN ssh-keygen -A
EXPOSE 4011
CMD ["/usr/sbin/sshd","-D"]
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Getting-Started/Create-Images.md
```
[root@docker ~]# mkdir nginx-dockerfile
[root@docker ~]# cd nginx-dockerfile
[root@docker nginx-dockerfile]# vi Dockerfile
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Getting-Started/Create-Images.md
```
FROM nginx
RUN echo ' <h1> Hello, Docker! </h1> ' > /usr/share/nginx/html/index.html
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Getting-Started/Create-Images.md
```
[root@docker nginx-dockerfile]# docker build -t newnginx .
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Getting-Started/Create-Images.md
```
[root@docker nginx-dockerfile]# docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
newnginx                latest              c9038ef5f829        3 minutes ago       108.5 MB
docker.io/nginx         latest              3f8a4339aadd        2 weeks ago         108.5 MB
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Getting-Started/Create-Images.md
```
[root@docker nginx-dockerfile]# docker tag newnginx myname/newnginx
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Getting-Started/Create-Images.md
```
[root@docker nginx-dockerfile]# docker login
输入用户名和密码
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Getting-Started/Create-Images.md
```
[root@docker nginx-dockerfile]# docker push myname/newnginx
```


#### 当前代码: documentation/Elastic-Compute/Native-Container/Operation-Guide/Instance/Create-Pod-InKubernetes.md
```
annotations:
    jdcloud.com/NativeContainer.SystemDisk.Name: distTest
    jdcloud.com/NativeContainer.SystemDisk.Type: ssd
    jdcloud.com/NativeContainer.container-test1.SystemDisk.SizeGB: "40"
    jdcloud.com/NativeContainer.container-test1.SystemDisk.FSType: ext4
    jdcloud.com/NativeContainer.SystemDisk.AutoDelete: "false"
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Operation-Guide/Instance/Create-Pod-InKubernetes.md
```
NAME                         STATUS    ROLES     AGE       VERSION
k8s-node-*******-90lirk7snb   Ready     <none>    10d       v1.8.12-249.9d2635d
k8s-node-*******-90lirk7snb   Ready     <none>    10d       v1.8.12-249.9d2635d
k8s-node-*******-90lirk7snb   Ready     <none>    10d       v1.8.12-249.9d2635d
virtual-kubelet-cn-****-2a   Ready     agent     3d        v1.8.3
virtual-kubelet-cn-****-2b   Ready     agent     3d        v1.8.3
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Operation-Guide/Instance/Create-Pod-InKubernetes.md
```
NAME                                          READY     STATUS             RESTARTS   AGE       IP           NODE
virtual-kubelet-cn-****-2a-7b****f7f-plmnp    1/1       Running            0          6h        10.0.128.5   k8s-node-v****4-90****snb
virtual-kubelet-cn-****-2b-78****c4b7-mk8nv   1/1       Running            0          6h        10.0.128.3   k8s-node-v****a-90****snb
```   


#### 当前代码: documentation/Elastic-Compute/Native-Container/Operation-Guide/Instance/Create-Pod-InKubernetes.md
```
apiVersion: v1
kind: Pod
metadata:
  name: pod-example
  annotations:
    jdcloud.com/NativeContainer.SystemDisk.Name: distTest
    jdcloud.com/NativeContainer.SystemDisk.Type: ssd
    jdcloud.com/NativeContainer.container-test1.SystemDisk.SizeGB: "40"
    jdcloud.com/NativeContainer.container-test1.SystemDisk.FSType: ext4
    jdcloud.com/NativeContainer.SystemDisk.AutoDelete: "false"
spec:
  containers:
  - name: container-test1
    image: busybox:latest
    command: ["/bin/sh", "-c", "while true; do date && echo Welcome to JDCLOUD! && sleep 5;done"]
    imagePullPolicy: Never
    resources:
      requests:
        memory: "64Mi"
        cpu: "1"
  - name: container-test2
    image: busybox:latest
    command: ["/bin/sh", "-c", "while true; do date && echo Welcome to JDCLOUD! && sleep 5;done"]
    imagePullPolicy: Never
    resources:
      requests:
        memory: "64Mi"
        cpu: "1"
      limits:
        memory: "100Mi"
        cpu: "2"
  nodeSelector:
    kubernetes.io/hostname: virtual-kubelet-cn-****-1a		#必填项，且必须与部署virtual-kubelet时选择的可用区一致
  tolerations:
  - key: virtual-kubelet.io/provider
    operator: Exists
```    


#### 当前代码: documentation/Elastic-Compute/Native-Container/Operation-Guide/Instance/Create-Pod-InKubernetes.md
```
nodeSelector:
    kubernetes.io/role: agent
    beta.kubernetes.io/os: linux
    type: virtual-kubelet
    kubernetes.io/hostname: virtual-kubelet-{AZ}		#必填项，且必须与部署virtual-kubelet时选择的可用区一致
tolerations:
- key: virtual-kubelet.io/provider
  operator: Exists

```    


#### 当前代码: documentation/Elastic-Compute/Native-Container/Operation-Guide/Instance/Deploy-Virtual-Kubelet.md
```
wget http://kubernetes.oss.cn-north-1.jcloudcs.com/virtual-kubelet/jdcloud-virtual-kubelet.tar.gz    
tar -zxvf jdcloud-virtual-kubelet.tar.gz  
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Operation-Guide/Instance/Deploy-Virtual-Kubelet.md
```
NAME                                          READY     STATUS     RESTARTS   AGE
virtual-kubelet-cn-east-2a-5cd5bcd4b5-rwlrt   1/1       Running    9          2d
virtual-kubelet-cn-east-2b-7bb6c6f565-zvggm   1/1       Running    3          2d
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Operation-Guide/Instance/Deploy-Virtual-Kubelet.md
```
NAME                         STATUS    ROLES     AGE       VERSION
k8s-node-*******-90****snb   Ready     <none>    10d       v1.8.12-249.9d2635d
k8s-node-*******-90****snb   Ready     <none>    10d       v1.8.12-249.9d2635d
k8s-node-*******-90****snb   Ready     <none>    10d       v1.8.12-249.9d2635d
virtual-kubelet-cn-****-2a   Ready     agent     3d        v1.8.3
virtual-kubelet-cn-****-2b   Ready     agent     3d        v1.8.3
```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Operation-Guide/Instance/Deploy-Virtual-Kubelet.md
```  
[System]
   OperatingSystem = "Linux"		#Node的操作系统. 默认为Linux
[Metadata]
  Region = "cn-east-2"		#创建的原生容器Pod所在地域，必须与Kubernetes集群在同一个地域
  AvailableZone = "cn-east-2a" 		#创建的原生容器Pod所在可用区，必须是Kubernetes集群支持的可用区
  ClusterID = "k8s-1m******lv"	 	#Kubernetes集群的ID
  PodSubnetId = "subnet-ds******2v"		#创建的原生容器Pod所在的子网，必须与Kubernetes集群Pod所在的子网一致
  PodSecurityGroups = ["sg-12******o7"] 		#Pod子网绑定的安全组ID
  AccessKey = "4B06***********************01B9" 		#创建Kubernetes集群关联的AccessKey
  SecretKey = "EA94************************18A1"		#创建Kubernetes集群关联的SecretKey
[Resource]
  ContainerDefaultCPU = "125m"		#未设置resource request/limit时容器cpu的默认值；1C=1000m
  ContainerDefaultMEM = "256Mi"		##未设置resource request/limit时容器memory的默认值；1G=1024Mi
  Pods = "50"		# 一个Virtual-kubelet虚节点默认支持的原生容器Pod数量；
  TotalCPU = "72"		#一个Virtual-kubelet虚节点默认支持的CPU总核数；
  TotalMEM = "576Gi"		#一个Virtual-kubelet虚节点默认支持的Memory总容量
  InstanceTypeFamily = "g.n2"		#Virtual-kubelet虚节点创建原生容器Pod时默认选择的实例规格族

```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Operation-Guide/Instance/Deploy-Virtual-Kubelet.md
```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: virtual-kubelet
  namespace: kube-system
  labels:
    k8s-app: virtual-kubelet
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: virtual-kubelet
  namespace: kube-system
subjects:
- kind: ServiceAccount
  name: virtual-kubelet
  namespace: kube-system
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
---
apiVersion: v1
kind: Secret
metadata:
  name: virtual-kubelet
  namespace: kube-system
type: Opaque
data:
  cert.pem: xxxxxxxxxxxxxxxxxxxxxxxxxxx==   #cert.pem的内容
  key.pem: xxxxxxxxxxxxxxxxxxxxxxxxxxxx==   #key.pem的内容

```  


#### 当前代码: documentation/Elastic-Compute/Native-Container/Operation-Guide/Instance/Deploy-Virtual-Kubelet.md
```
# virtual-kubelet-deployment.yaml 
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: virtual-kubelet-cn-****-2a		#cn-****-2a为运行脚本时指定的可用区
  namespace: kube-system
  labels:
    k8s-app: kubelet
spec:
  replicas: 1
  selector:
    matchLabels:
      k8s-app: virtual-kubelet-cn-south-1a
  template:
    metadata:
      labels:
        k8s-app: virtual-kubelet-cn-south-1a
    spec:
      hostNetwork: true
      initContainers:
      - name: init-config
        image: virtual-kubelet:1.0 	 #kubernetes集群node节点上的virtual-kubelet镜像
        imagePullPolicy: IfNotPresent
        env:
        - name: AVALIABILITY_ZONE
          value: cn-south-1a
        command: ["init-config.sh"]
        volumeMounts:
        - name: configs
          mountPath: "/etc/virtual-kubelet/config"
          readOnly: false
      containers:
      - name: virtual-kubelet
        image: virtual-kubelet:1.0
        imagePullPolicy: IfNotPresent
        env:
        - name: KUBERNETES_SERVICE_HOST
          value: 10.0.0.4
        - name: KUBERNETES_SERVICE_PORT
          value: "6443"
        - name: KUBELET_PORT
          value: "10251"
        - name: APISERVER_CERT_LOCATION
          value: /etc/virtual-kubelet/cert/cert.pem
        - name: APISERVER_KEY_LOCATION
          value: /etc/virtual-kubelet/cert/key.pem
        - name: DEFAULT_NODE_NAME
          value: virtual-kubelet-cn-south-1a
        - name: VKUBELET_POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP
        volumeMounts:
        - name: credentials
          mountPath: "/etc/virtual-kubelet/cert"
          readOnly: true
        - name: configs
          mountPath: "/etc/virtual-kubelet/config"
          readOnly: true
        command: ["virtual-kubelet"]
        args: [
          "--provider", "jdcloud",
          "--nodename", "$(DEFAULT_NODE_NAME)",
          "--provider-config", "/etc/virtual-kubelet/config/nc-cn-south-1a.toml",
          "--os", "Linux"
        ]
        livenessProbe:
          tcpSocket:
            port: 10251
          initialDelaySeconds: 20
          periodSeconds: 20
      volumes:
      - name: credentials
        secret:
          secretName: virtual-kubelet
      - name: configs
        hostPath:
          path: /etc/jdcloud-virtual-kubelet/config
          type: DirectoryOrCreate
      serviceAccountName: virtual-kubelet
```  


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Getting-Start-Linux/Connect-to-Linux-Instance.md
```
ssh root@<实例的公网IP地址>
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Getting-Start-Linux/Connect-to-Linux-Instance.md
```
chmod 400 <下载到本地的与实例绑定的私钥绝对路径>
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Getting-Start-Linux/Connect-to-Linux-Instance.md
```
ssh -i "<下载到本地的与实例绑定的私钥绝对路径>" root@<实例公网IP地址>
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Getting-Start-Linux/Mount-DataDisk.md
```
sh
sh auto_fdisk.sh
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Getting-Start-Linux/Mount-DataDisk.md
```
sh
sh auto_fdisk.sh /dev/vdb jddata1 ext4
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Getting-Start-Linux/Mount-DataDisk.md
	```
	fdisk -l
	```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Getting-Start-Linux/Mount-DataDisk.md
	```
	fdisk /dev/vdb
	```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Getting-Start-Linux/Mount-DataDisk.md
	```
	mkfs -t ext4 /dev/vdb1
	```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Getting-Start-Linux/Mount-DataDisk.md
	```
	mkdir -p /mnt/vdb1 && mount -t ext4 /dev/vdb1 /mnt/vdb1
	```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Getting-Start-Linux/Mount-DataDisk.md
	```
	blkid /dev/vdb1
	```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Getting-Start-Windows/Connect-to-Windows-Instance.md
```
rdesktop -u administrator -p <实例登录密码> <实例公网IP地址>
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Instance/GPU-VM.md
```
	# uname –r
	3.10.0-693.17.1.el7.x86_6
	# rpm -qa | grep 693.17.1
	kernel-devel-3.10.0-693.17.1.el7.x86_64
	kernel-headers-3.10.0-693.17.1.el7.x86_64
	kernel-3.10.0-693.17.1.el7.x86_64
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Instance/GPU-VM.md
```	
	# Chmod +x NVIDIA-Linux-x86_64-396.44.run
	# ./ NVIDIA-Linux-x86_64-396.44.run
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Instance/Userdata.md
```
#!/bin/bash 
echo 'launch-1a' >> /root/text1.txt
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Instance/Userdata.md
```
#!/usr/bin/env python
import random
seq = list(range(1,10))
tempstr = random.sample(seq,3)
f1 = open('/root/python2-text1.txt', 'a+')
f1.writelines([str(tempstr)])
f1.close()
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Instance/Userdata.md
```
<cmd>
echo %random%>cmd-text1.txt
</cmd>
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Instance/Userdata.md
```
<powershell>
"hello" | Out-File text1.txt -Encoding utf8
</powershell>
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Instance/Userdata.md
```
systemctl status jcs-agent-core.service
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Instance/Userdata.md
```
 ps -ef|grep Monitor
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Instance/Userdata.md
```
wmic process where caption="MonitorPlugin.exe" get caption,commandline /value
```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Network/Assign-Secondary-IPs.md
	```
	TYPE="ETHERNET"  
	BOOTPROTO="dhcp"
	DEFROUTE="yes"
	PEERDNS="yes"
	PEERROUTES="yes"
	IPV4_FAILURE_FATAL="no"
	IPV6INIT="yes"
	IPV6_AUTOCONF="yes"
	IPV6_DEFROUTE="yes"
	IPV6_PEERDNS="yes"
	IPV6_PEERROUTES="yes"
	IPV6_FAILURE_FATAL="no"
	NAME="eth0"
	UUID="dd73a4ea-8f6b-409b-a271-5f7882a3ae53"
	DEVICE="eth0"
	ONBOOT="yes"</pre>
	```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Network/Assign-Secondary-IPs.md
	```
	TYPE="ETHERNET"
	#BOOTPROTO="dhcp"
	DEFROUTE="yes"
	PEERDNS="yes"
	PEERROUTES="yes"
	IPV4_FAILURE_FATAL="no"
	IPV6INIT="yes"
	IPV6_AUTOCONF="yes"
	IPV6_DEFROUTE="yes"
	IPV6_PEERDNS="yes"
	IPV6_PEERROUTES="yes"
	IPV6_FAILURE_FATAL="no"
	NAME="eth0"
	UUID="dd73a4ea-8f6b-409b-a271-5f7882a3ae53"
	DEVICE="eth0"
	ONBOOT="yes"
	IPADDR="192.168.0.4"
	IPADDR1="192.168.0.5"
	NETMASK="255.255.255.0"
	NETMASK1="255.255.255.0"
	GATEWAY="192.168.0.1"
	```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Network/Configurate-ENI-Multi-Queue.md
	```
	[root@test ~]# ethtool -l eth0
	Channel parameters for eth0:
	Pre-set maximums:
	RX:		0
	TX:		0
	Other:		0
	Combined:	4      # 此行代表最多支持4个队列
	Current hardware settings:
	RX:		0
	TX:		0
	Other:		0
	Combined:	1      # 此行代表当前生效1个队列
	[root@test ~]# ethtool -L eth0 combined 4
	```


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Storage/Identify-Local-Data-Disk.md
```ll /dev/disk/by-id```
	
5. 如下入所示，其中virtio-Ephemeral\_Disk\_1至virtio-Ephemeral\_Disk\_4即为对应四块本地数据盘<br>![](../../../../../image/vm/localdatadisklinux.png)

### Windows系统

Windows以 Windows 2008 标准版 系统为例，操作步骤如下：

1. 访问[云主机控制台](https://cns-console.jdcloud.com/host/compute/list)，即进入实例列表页面。或访问[京东云控制台](https://console.jdcloud.com)点击左侧导航栏【弹性计算】-【云主机】进入实例列表页。
2. 选择地域。
3. 在实例列表中选择需要查看本地数据盘的实例，[登录Windows实例](https://docs.jdcloud.com/cn/virtual-machines/connect-to-windows-instance)
4. 输入：
```wmic


#### 当前代码: documentation/Elastic-Compute/Virtual-Machines/Operation-Guide/Storage/Identify-Local-Data-Disk.md
```
	
5. 如下入所示，其中序列号Ephemeral\_Disk\_1至Ephemeral\_Disk\_4即为对应四块本地数据盘<br>![](../../../../../image/vm/localdatadiskwin.png)

## 相关参考

[登录Linux实例](https://docs.jdcloud.com/cn/virtual-machines/connect-to-linux-instance)

[登录Windows实例](https://docs.jdcloud.com/cn/virtual-machines/connect-to-windows-instance)
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-SecurityGroups-description.md
```bash
# list sgs --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-SecurityGroups-description.md
```bash
list sgs --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-SecurityGroups-description.md
```bash
# describe sg <安全组ID> [ --cloud <云实例ID> ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-SecurityGroups-description.md
```bash
describe sg sg-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-SecurityGroups-description.md
```bash
# create sgs [ -f <文件名> | -i <JSON格式数据> ] --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-SecurityGroups-description.md
```json
{
  "securityGroup": {
    "name": "string",
    "description": "string",
    "vpcId": "string"
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-SecurityGroups-description.md
```bash
create sgs -f /data/json/sgs.json --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-SecurityGroups-description.md
```bash
# del sg <安全组实例ID> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-SecurityGroups-description.md
```bash
del sg sg-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
# list disks --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
list disks --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
# describe disk <云硬盘实例ID> [ --cloud <云实例ID> ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
describe disk disk-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
# create disk [ -f <文件名> | -i <JSON格式数据> ] --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```json
{
  "disk": {
    "name": "string",
    "description": "string",
    "diskSizeGB": 0,
    "az": "string",
    "diskType": "string",
    "snapshotId": "string",
    "tags": [
      {
        "tagKey": "string",
        "tagValue": "string"
      }
    ]
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
create disk -f /data/json/disk.json --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
# del disk <云硬盘实例ID> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
del disk disk-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
# attach disk --from <云硬盘实例ID> --to <虚拟机ID> --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
attach disk --from disk-123 --to vm-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
# detach disk --from <云硬盘实例ID> --to <虚拟机ID> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cbs-description.md
```bash
detach disk --from disk-123 --to vm-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cloud-description.md
```bash
# list clouds [--vendor <云厂家>]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cloud-description.md
```bash
list clouds --vendor jdcloud
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cloud-description.md
```bash
# describe cloud <云实例id>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cloud-description.md
```bash
describe cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cloud-description.md
```bash
# register cloud [ -f <文件名> | -i <JSON格式的数据> ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cloud-description.md
```json
{
  "cloud": {
    "name": "string",
    "vendor": "string",
    "info": {},
    "metadata": {}
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cloud-description.md
```bash
register cloud -i '{"cloud":{"name":"mycloud111","vendor":"jdcloud","info":{"access_key":"my_access_key","secret_key":"my_secret_key","region":"cn-north-1"},"metadata":{}}}'
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cloud-description.md
```bash
# unregister cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-cloud-description.md
```bash
unregister cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-http-description.md
```bash
# create listener [ -f <文件名> | -i <JSON格式数据> ] --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-http-description.md
```json
{
  "httpListener": {
    "loadBalancerId": "string",
    "listenerPort": 0,
    "backendServerPort": 0,
    "vserverGroupId": "string",
    "bandwidth": 0,
    "healthCheckConnectPort": 0,
    "healthyThreshold": 0,
    "unhealthyThreshold": 0,
    "healthCheckTimeout": 0,
    "healthCheckInterval": 0,
    "healthCheckHttpCode": "string"
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-http-description.md
```bash
create listener -f /data/json/listener.json --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-instance-description.md
```bash
# list instancetypes --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-instance-description.md
```bash
list instancetypes --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
# list eips --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
list eips --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
# describe eip <弹性公网IP实例ID> [ --cloud <云实例ID> ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
describe eip eip-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
# create eip [ -f <文件名> | -i <JSON格式数据> ] --cloud <云实例ID> [ --tail ] [ --no-table ]

```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```json
{
  "allocate": {
    "name": "string",
    "bandwidth": "string",
    "provider": "string"
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
create eip -f /data/json/eip.json --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
# del eip <弹性公网IP实例ID> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
del eip eip-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
# attach eip --from <公网IP实例ID> --to <虚拟机ID> --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
attach eip --from eip-123 --to vm-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
# detach eip --from <公网IP实例ID> --to <虚拟机ID> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-ip-description.md
```bash
detach eip --from eip-123 --to vm-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-key-description.md
```bash
# list kps --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-key-description.md
```bash
list kps --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-key-description.md
```bash
# describe keypair <密钥对的name> [ --cloud <云实例ID> ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-key-description.md
```bash
describe keypair kp-name
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-key-description.md
```bash
# create keypair [ -f <文件名> | -i <JSON格式数据> ] --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-key-description.md
```json
{
  "keypair": {
    "name": "string",
    "publicKey": "string"
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-key-description.md
```bash
create keypair -f /data/json/keypair.json --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-key-description.md
```bash
# del keypair <密钥对的name> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-key-description.md
```bash
del keypair kp-name --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-lb-description.md
```bash
# list slbs --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-lb-description.md
```bash
list slbs --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-lb-description.md
```bash
# describe slb <负载均衡实例ID> [ --cloud <云实例ID> ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-lb-description.md
```bash
describe slb slb-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-lb-description.md
```bash
# create slb [ -f <文件名> | -i <JSON格式数据> ] --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-lb-description.md
```json

{
  "slb": {
    "name": "string",
    "subnetId": "string",
    "loadBalancerSpec": "string"
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-lb-description.md
```bash
create slb -f /data/json/slb.json --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-lb-description.md
```bash
# del slb <负载均衡实例ID> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-lb-description.md
```bash
del slb slb-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-mirroring-description.md
```bash
# list images --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-mirroring-description.md
```bash
list images --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
# list nis --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
list nis --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
# describe ni <网卡实例ID> [ --cloud <云实例ID> ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
describe ni ni-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
# create ni [ -f <文件名> | -i <JSON格式数据> ] --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```json
{
  "netInterface": {
    "name": "string",
    "description": "string",
    "subnetId": "string",
    "zoneId": "string",
    "privateIpAddress": "string",
    "securityGroupId": "string"
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
create ni -f /data/json/ni.json --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
# del ni <网卡实例ID> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
del ni ni-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
# attach ni --from <网卡实例ID> --to <虚拟机ID> --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
attach ni --from ni-123 --to vm-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
# detach ni --from <网卡实例ID> --to <虚拟机ID> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-network-description.md
```bash
detach ni --from ni-123 --to vm-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-other-description.md
```bash
# task <taskId>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-other-description.md
```bash
task task-abc
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-server-description.md
```bash
# list vservergroups --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-server-description.md
```bash
list vservergroups --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-server-description.md
```bash
# create vsg [ -f <文件名> | -i <JSON格式数据> ] --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-server-description.md
```
json
{
  "vserverGroup": {
    "loadBalancerId": "string",
    "vserverGroupName": "string",
    "backendServers": [
      {
        "serverId": "string",
        "port": 0,
        "weight": 0
      }
    ]
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-server-description.md
```bash
create vsg -f /data/json/vsg.json --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-subnet-description.md
```bash
# list subnets --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-subnet-description.md
```bash
list subnets --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-subnet-description.md
```bash
# describe subnet <子网实例ID> [ --cloud <云实例ID> ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-subnet-description.md
```bash
describe subnet subnet-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-subnet-description.md
```bash
# create subnet [ -f <文件名> | -i <JSON格式数据> ] --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-subnet-description.md
```json
{
  "subnet": {
    "name": "string",
    "vpcId": "string",
    "cidrBlock": "string",
    "description": "string",
    "zoneId": "string"
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-subnet-description.md
```bash
create subnet -f /data/json/subnet.json --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-subnet-description.md
```bash
# del subnet <子网实例ID> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-subnet-description.md
```bash
del subnet subnet-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bas
# list vms --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
list vms --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
# describe vm <虚拟机实例ID> [ --cloud <云实例ID> ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
describe vm vm-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
# create vm [ -f <文件名> | -i <JSON格式数据> ] --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```json
{
  "vms": {
    "az": "string",
    "name": "string",
    "hostName": "string",
    "description": "string",
    "subnetId": "string",
    "tags": [
      {
        "tagKey": "string",
        "tagValue": "string"
      }
    ],
    "privateIpAddress": "string",
    "imageId": "string",
    "instanceFlavorType": "string",
    "securityGroupId": "string",
    "internetMaxBandwidthIn": 0,
    "internetMaxBandwidthOut": 0,
    "password": "string",
    "passwordInherit": true,
    "userData": "string",
    "keyPairName": "string",
    "systemDisk": {
      "category": "string",
      "diskSize": 0,
      "description": "string"
    }
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
create vm -f /data/json/vm.json --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
# del vm <虚拟机实例ID> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
del vm vm-123 --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
# start vm <虚拟机实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
start vm vm-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
# stop vm <虚拟机实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
stop vm vm-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
# reboot vm <虚拟机实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vm-description.md
```bash
reboot vm vm-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vpc-description.md
```bash
# list vpcs --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vpc-description.md
```bash
list vpcs --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vpc-description.md
```bash
# describe vpc <专有网络实例ID> [ --cloud <云实例ID> ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vpc-description.md
```bash
describe vpc vpc-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vpc-description.md
```bash
# create vpc [ -f <文件名> | -i <JSON格式数据> ] --cloud <云实例ID> [ --tail ] [ --no-table ]
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vpc-description.md
```json
{
  "vpc": {
    "name": "string",
    "addressPrefix": "string",
    "description": "string",
    "cidrBlock": "string",
    "userCidr": "string"
  }
}
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vpc-description.md
```bash
create vpc -f /data/json/vpc.json --cloud cloud-123
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vpc-description.md
```bash
# del vpc <专有网络实例ID> --cloud <云实例ID>
```


#### 当前代码: documentation/Hybrid-Cloud/JDFusion/Operation-Guide/jdfusion-vpc-description.md
```bash
del vpc vpc-123 --cloud cloud-123
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Best-Practices/NAT-Gateway-Network-Safety.md
```
iptables -t nat -A POSTROUTING -s 172.16.0.0/16 -o eth1 -j SNAT --to-source 103.37.46.14
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Best-Practices/NAT-Gateway-Network-Safety.md
```
Iptables -A INPUT -i eth1 -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth1 –p udp -m state --state NEW -m tcp --dport 123 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Best-Practices/NAT-Gateway-Network-Safety.md
```
Iptables –t nat -A PREROUTING -p tcp -m tcp --dport 8888 -j DNAT --to-destination 172.16.0.4:22
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -F    #清除预设表filter中的所有规则链的规则
[root@jd ~]# iptables -X    #清除预设表filter中使用者自定链中的规则
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -P OUTPUT ACCEPT
[root@jd ~]# iptables -P FORWARD DROP
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -L –n        #查看是否设置好， 看到全部 DROP 了。这条命令只是临时的， 重启服务器还是会恢复到原有规则。
[root@jd ~]# service iptables save #将规则保存在 /etc/sysconfig/iptables，使重启后也可生效。
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -A INPUT -p tcp --dport 22 -j ACCEPT
[root@jd ~]# iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -A INPUT -p tcp --dport 80 -j ACCEPT
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -A INPUT -p tcp --dport 110 -j ACCEPT
[root@jd ~]# iptables -A INPUT -p tcp --dport 25 -j ACCEPT
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -A INPUT -p tcp --dport 21 -j ACCEPT
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -A INPUT -p tcp --dport 53 -j ACCEPT
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -A INPUT -p tcp --dport 443-j ACCEPT
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -A OUTPUT -p icmp -j ACCEPT
[root@jd ~]# iptables -A INPUT -p icmp -j ACCEPT
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -A INPUT -i lo -p all -j ACCEPT
[root@jd ~]# iptables -A OUTPUT -o lo -p all -j ACCEPT
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -A INPUT -p tcp -s 192.168.1.2 -j DROP
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -L -n --line-number
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
num target     prot opt source               destination
1    DROP       tcp -- 0.0.0.0/0            0.0.0.0/0           tcp dpt:3306
2    DROP       tcp -- 0.0.0.0/0            0.0.0.0/0           tcp dpt:21
3    DROP       tcp -- 0.0.0.0/0            0.0.0.0/0           tcp dpt:80
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Network-And-Security/Steps-Network-And-Security.md
```
[root@jd ~]# iptables -D INPUT 2
```


#### 当前代码: documentation/Hyper-Converged-IDC/Cloud-Physical-Server/Operation-Guide/Remote-Login/Steps-Remote-Login.md
```
管理员帐号：
CentOS：root
Ubuntu：ubuntu
```


#### 当前代码: documentation/Management/DevOps/Getting-Started/Install-Agent.md
```
#华北-北京    
wget -c http://devops-hb.oss-internal.cn-north-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.391.dc2f953.20180910190347.bin -O installer && sh installer /usr/local/jdcloud/ifrit && rm -f installer
#华东-上海：
wget -c http://devops-hd.oss-internal.cn-east-2.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.391.dc2f953.20180910190347.bin -O installer && sh installer /usr/local/jdcloud/ifrit && rm -f installer
#华东-宿迁：
wget -c http://devops-sq.oss-internal.cn-east-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.391.dc2f953.20180910190347.bin -O installer && sh installer /usr/local/jdcloud/ifrit && rm -f installer
#华南-广州：
wget -c http://devops.oss-internal.cn-south-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.391.dc2f953.20180910190347.bin -O installer && sh installer /usr/local/jdcloud/ifrit && rm -f installer
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Alarm-Conf.md
```json
{
	"JUDGE": {
		"alarmInterval": [
			5
		],  ---【配置报警时间间隔，可设置为数组（20,2,5…触发时间点为第一次，20为第一次与第二次的时间间隔）】
		"switchConfig": {
			"enableTime": {
				"beginTime": "00:00",
				"endTime": "23:59"
			},
			"on": true
		},  ---【报警开关，是否开启；开启时间段】
		"level": "WARNING",  ---【报警级别】
		"conditionTagEqual": false,
		"conditionOperator": "&&",  ---【报警依赖关系，||或者&&，或关系，且关系】
		"conditionList": [  ---【报警规则（可添加多个依赖规则）】
			{
				"formula": "必填cpu.idle < 80",  ---【监控项报警的判断规则】
				"metricDataFilter": {  ---【筛选监控项统计值类型、tag匹配结果为true的监控项】
					"tags": "",  ---【监控项tags，支持包含与不包含的关系。HasTag（1个参数）、NotHasTag、TagValueIn、TagValueNotIn(\"core\", \"1,2,3\")指 tag value不在此范围内才满足。tag字段为空时，匹配不含tag的监控项】
					"valueType": "STATISTIC",  ---【支持STRING、STATISTIC】
					"valueKey": "AVG"  ---【MAX|AVG等，valueType=STATISTIC时生效】
				},
				"parameter": {
					"simple": [
						5,
						3
					]  ---【代表采集到的数据m次中n次满足报警阈值，使用突升突降报警时，此规则失效】
				},
				"nsFilter": "",  ---【筛选ns，具体筛选方式见下表】
				"nsType": "HOST",  ---【HOST（机器、死机、agent）|INSTANCE（进程、端口、ssh、日志、自定义）|APP（聚合监控）|DOMAIN（域名监控）】
				"ns": ""
			}
		]
	}
}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Alarm-Conf.md
```json
{
	"ALERT": {
		"tagTransDict": [
			{
				"dict": [
					""
				],
				"tag": ""
			}
		],  ---【说明tag的value的中文解释。tag中填key，dict中填转义】
		"noticer": "$sys_op$,$app_dev$",  ---【报警组】
		"callNoticer": "$product_onCall$",  ---【值班组】
		"callEnableTime": {
			"beginTime": "21:00",
			"endTime": "09:00"
		},  ---【值班组接收报警时间】
		"note": "",---【添加报警配置的中文描述】
		"merge": {
			"on": true,
			"method": "BY_APP"
		}, ---【报警合并，前提，监控项的ns类型为HOST/INSTANCE时才可进行合并。方式：BY_APP、BY_GROUP(第一条报警放一个ns，后面的合并发送，<{{.N}}台NS报警合并>）】
		"sendFlag": 7, ---【sendFlag：数值。1只发邮件，2只发短信，4只发咚咚，8只发语音；多种通知                            方式组合，值是对应多个通知方式的数值之和】
		"maxAlarmTime": 3,  ---【设置报警恢复之前，发送报警通知的最大次数】
		"sendRecoveryNotice": true,  ---【报警事件恢复时，是否接收恢复通知】
		"callback": {  ---【报警回调】
			"timing": {
				"whenNoticeComes": true,  ---【触发报警时即回调】
				"atFirstTime": false,  ---【默认每次触发报警回调，true，第一次触发报警时回调】
				"whenEventEnds": true  ---【事件恢复时回调】
			},
			"parameter": {
				"url": "",  ---【回调地址】
				"requestMethod": "POST",  ---【请求方式，支持POST和GET两种方式】
				"header": {
					"Content-Type": "application/x-www-form-urlencoded"
				},  ---【请求头，可在此填入请求头中的字段值对】
				"postData": ""  ---【请求体】
			},
			"type": "CURL",  ---【回调方式，curL命令】
			"on": false  ---【设置是否开启回调】
		}
	}
}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Alarm-Conf.md
```json
"parameter": {
"advanced": {
  "param": [
    [
      0.1, 0.1
    ],
    [
      0.05, 0.07
    ],
    [
      0.07, 0.15
    ],
    [
      0.05, 0.2
    ]
  ],  ---【4组参数分别代表工作日忙时/工作日闲时/周末忙时/周末闲时配置,每组配置的两个参数为上升百分比阈值,下降百分比阈值】
"disableSwitch": {
  "on": false,
  "disableTime": [
    {
      "beginTime": "00:15",
      "endTime": "00:31",
    }
  ],
  "minActiveValue": 5000
},
}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Arrange-Online.md
```
[
    // 层级1
    {
        "concurrency": 2, // 分组1内并发度（注意：0表示全并发,1表示串行,n 表示最多同时有 n 个 job 同时执行）
        "timeout": 1200,  // 分组1超时时间（s）
        "pause": 1,       // 本层执行完成后,视图会进入“暂停”状态,在执行记录中点击“继续执行”后方可执行后续层级
        "max_fail": 3,    // 本层失败 job 数达到3时才标记本层（以及整个视图）为失败,这里如果给0则忽略所有失败 job
        // 分组1内的部署 job,每个 job 对应一个 APP 的部署
        "jobs": [
            // job1
            {
                "app_name": "yangxiaojia-test-app1",  // job1 APP 名
                "concurrency": "0",                   // job1 实例并发度（包部署：0-串行,30-30%,70-70%,100-并行 || 镜像部署：0-并行,1-串行,2-同时最多2个实例并行…）
                "instance_timeout": 300,              // job1 执行超时时间（s）
                // job1 部署目标
                "target": [
                    "group-hb",                      // 目标分组（如果是包部署也可以是实例,如0.group-hb）
                    "group-sh"
                ],
                "type": "1",                          // job1 上线类型：1-包部署,2-镜像部署,4-弹性部署,5-弹性扩容
                "version": "4f40681d-20170622095458"  // job1 上线包版本
            }
            // 其他job
            ...
        ]
    }
    // 其他层级
    ...
]
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/CI.md
```
#以golang为例，需要在代码库的根路径增加编译脚本，示例build.sh如下：
#!/bin/bash
#编译脚本的原理是将编译结果放到output目录中，这个样例模版提供一个产生一个最基本golang运行程序包的编译脚本，对于特殊的需求请酌情考虑
#
#1、该脚本支持参数化，参数将传入build_package函数（内容为最终执行的编译命令）
#   ，用$1,$2....表示，第1,2...个参数
#2、部署需要启动程序，所以需要提供control文件放在当前目录中，用于启动和
#   监控程序状态
#用户修改部分
readonly PACKAGE_DIR_NAME=""    #main文件相对于src文件夹所在的目录,可选项
readonly PACKAGE_BIN_NAME=""    #定义产出的运行程序名,必填项
readonly CONF_DIR_NAME=""       #定义配置文件目录,此路径为相对路径,可选项
#最终的抽包路径为$OUTPUT
if [[ "${PACKAGE_BIN_NAME}" == "" ]];then
    echo "Please set "PACKAGE_BIN_NAME" value"
    exit 1
fi
function set_work_dir
{
    readonly OUTPUT=$(pwd)/output
    readonly WORKSPACE_DIR=$(pwd)
}
#清理编译构建目录操作
function clean_before_build
{
    cd ${WORKSPACE_DIR}
    rm -rf bin pkg
    rm -rf ${OUTPUT}
}
#实际的编译命令
#这个函数中可使用$1,$2...获取第1,2...个参数
function build_package()
{
    cd ${WORKSPACE_DIR}
    export GOPATH=$(pwd)
    go install ${PACKAGE_DIR_NAME} || return 1
}
#建立最终发布的目录
function build_dir
{
    mkdir -p ${OUTPUT}/bin || return 1
}
function dir_not_empty()
{
    if [[ ! -d $1 ]];then
        return 1
    fi
    if [[ $(ls $1|wc -l) -eq 0 ]];then
        return 1
    fi
    return 0
}
#拷贝编译结果到发布的目录
function copy_result
{
    cd ${WORKSPACE_DIR}
    cp -r ./bin/${PACKAGE_BIN_NAME} ${OUTPUT}/bin/${PACKAGE_BIN_NAME} || return 1
    cp -r ./control ${OUTPUT}/bin || return 1
    (dir_not_empty ${WORKSPACE_DIR}/${CONF_DIR_NAME} && mkdir -p ${OUTPUT}/${CONF_DIR_NAME};cp -rf ./${CONF_DIR_NAME}/* ${OUTPUT}/${CONF_DIR_NAME}/);return 0
}
#执行
function main()
{
    cd $(dirname $0)
    set_work_dir
    echo "At: "$(date "+%Y-%m-%d %H:%M:%S") 'Cleaning...'
    clean_before_build || exit 1
    echo "At: "$(date "+%Y-%m-%d %H:%M:%S") 'Clean completed'
    echo
    echo "At: "$(date "+%Y-%m-%d %H:%M:%S") 'Building...'
    build_package $@ || exit 1
    echo "At: "$(date "+%Y-%m-%d %H:%M:%S") 'Build completed'
    echo
    echo "At: "$(date "+%Y-%m-%d %H:%M:%S") 'Making dir...'
    build_dir || exit 1
    echo "At: "$(date "+%Y-%m-%d %H:%M:%S") 'Make completed'
    echo
    echo "At: "$(date "+%Y-%m-%d %H:%M:%S") 'Copy result to publish dir...'
    copy_result || exit 1
    echo "At: "$(date "+%Y-%m-%d %H:%M:%S") 'Copy completed'
    echo
    exit 0
}
main $@
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/CI.md
```
a. 控制程序启动的相关操作 start 
source env.sh 
nohup command  > /dev/null 2>&1 &
check status
b.控制程序停止的相关操作stop 
find pid by port or process name 
kill  pid
check status
c.检查程序是否启动/停止的相关操作，间隔10s调用 status 
check port
check process name
check url
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/CI.md
```
#!/bin/bash
cd "$(dirname $0)"/.. || exit 1
PROC_NAME=confcenter # 进程名 一般就是二进制的名字java类程序一般就是java
START_COMMAND='bin/confcenter' #在output目录下启动你程序的命令
PROC_PORT=8055 # 程序占用的端口，建议写，程序不占用端口的话只用ps来判断进程是否启动，机器上有同名程序是可能有问题
WAIT_TIME=60 # 执行START_COMMAND后到程序能完全启动listen端口需要花的时间
  
PROC_NAME=${PROC_NAME::15}
if [ -f default_env.sh ];then
    source default_env.sh
fi
help(){
    echo "${0} <start|stop|restart|status>"
    exit 1
}
  
checkhealth(){
    if [[ -n "$PROC_PORT" ]] ; then
        PORT_PROC=$(/usr/sbin/ss -nltp "( sport = :$PROC_PORT )" |sed 1d |awk '{print $NF}' |grep -oP '".*"' |sed "s/\"//g" |uniq)
        if [ X"$PORT_PROC" = X"$PROC_NAME" ] ; then
                echo "running"
            return 0
        fi
        echo "not running"
        return 1
   else
       ps -eo comm,pid |grep -P  "^$PROC_NAME"
       if [ "$?" = 0 ] ; then
       echo "running"
           return 0
       fi
       echo "not running"
       return 1
   fi
}
  
start(){
    checkhealth
    if [ $? = 0 ]; then
        echo "[WARN] $PROC_NAME is aleady running!"
        return 0
    fi
    mkdir -p log
  
    nohup $START_COMMAND  </dev/null &>> /dev/termination-log  &
  
  
    for i in $(seq $WAIT_TIME) ; do
        sleep 1
        checkhealth
        if [ $? = 0 ]; then
            echo "Start $PROC_NAME success"
            return 0
        fi
    done
    echo "[ERROR] Start $PROC_NAME failed"
    return 1
}
  
stop(){
    if [[ -n "$PROC_PORT"  ]] ; then
        PROC_ID=$(  /usr/sbin/ss -nltp "( sport = :$PROC_PORT )" |sed 1d  | awk '{print $NF}' |  grep -oP ',.*,' | grep -oP "d+" |  uniq )
    else
        PROC_ID=$(ps -eo comm,pid  | grep "^$PROC_NAME" |awk '{print $2}')
    fi
  
    if [[ -z "$PROC_ID" ]] ; then
        echo "[WARN] $PROC_NAME is aleady exit, skip stop"
        return 0
    fi
  
    checkhealth
    if [ "$?" != "0" ] ; then
        echo "[WARN] $PROC_NAME is aleady exit, skip stop"
        return 0
    fi
    kill $PROC_ID
    for i in $(seq $WAIT_TIME) ; do
        sleep 1
        checkhealth
        if [ "$?" != "0" ] ; then
            echo "Stop $PROC_NAME success"
            return 0
        fi
    done
  
    kill -9 $PROC_ID
    sleep 1
    checkhealth
    if [ "$?" != "0" ] ; then
        echo "Stop $PROC_NAME success"
        return 0
    fi
  
    echo "[ERROR] Stop $PROC_NAME failed"
    return 1
}
  
case "${1}" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status|health|checkhealth)
        checkhealth
        ;;
    restart)
        stop && start
        ;;
    *)
        help
        ;;
esac
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Custom-Monitoring.md
```sh
[tags:k1:v1,k2:v2]

$ItemName:$ItemValue[,type:$type][,desc:%desc][,classify:%classify]
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Custom-Monitoring.md
```sh
   例如(不带tag)：

    \#!/bin/bash -

    echo "nginx_timeout:998.0,desc: 正常,classify:latency"
    echo "nginx_pv:10000,desc: ping不通数据库,classify:traffic"

  假如采集配置为exec_demo，上面的监控脚本产生的监控项为：
    Name:exec_demo.nginx_timeout
    Value:998.0
    
    Name:exec_demo.nginx_pv
    Value:10000.0  
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Custom-Monitoring.md
```sh
 例如（带tag）

   \#!/bin/bash -

    echo "tags:idc:majuqiao,version:1.0"
    echo "nginx_timeout:998.0,classify:latency"
    echo "nginx_pv:10000,classify:traffic"
    echo "tags:idc:majuqiao,version:2.0"
    echo "nginx_err:78"

  比如采集配置为exec_demo，上面的监控脚本产生的监控项为：
    Name:exec_demo.nginx_timeout
    Tags:idc:majuqiao,version:1.0
    Value:998.0
       
    Name:exec_demo.nginx_pv
    Tags:idc:majuqiao,version:1.0
    Value:10000.0  
    
    Name:exec_demo.nginx_err
    Tags:idc:majuqiao,version:2.0
    Value:78  
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Custom-Monitoring.md
```sh
具体的规则是：

[tags:k1:v1,k2:v2]

     $ItemName:$ItemValue[,type:$type]
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Custom-Monitoring.md
```
mail_cnt:12
mail_queue_size:1
sms_cnt:12
sms_queue_size:2
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Custom-Monitoring.md
```json
{
	"method": "http",
	"para": {
		"port": "4322",
		"target": "/stat"
	},
	"cycle": 10
}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Log-Monitoring.md
```json
{
     "method": "log",
     "cycle": 60,
     "para": {
          "logPath": "/A/B/C/d.ERROR",
          "filters": [
               {
                    "matchStr": "can not follow scaler:",
                    "items": [
                         {
                              "classify":"errno",
                              "metricName": "followscaler_error",
                              "value": "",
                              "tags": "",
                              "desc":"描述该日志监控指标",
                              "scene":false,
                              "defaultValue": 0
                         }
                    ]
               },
               {
                    "matchStr": "getsockopt: connection refused",
                    "items": [
                         {
                              "classify":"errno",
                              "metricName": "ping_error",
                              "value": "",
                              "tags": "",
                              "desc":"描述该日志监控指标",
                              "scene":false,
                              "defaultValue": 0
                         }
                    ]
               }
          ]
     }
}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Log-Monitoring.md
```json
{
     "method": "log",
     "para": {
          "multiLogFilePath": {
               "logFilePattern": "/a/b/c/$ulog_pattern$/d.log",
               "patternValues": [
                    {
                         "value": "b2b.abcd.com",
                         "trans": "b2b.abcd"
                    },
                    {
                         "value": "bbj.abcd.com",
                         "trans": "bbj.abcd"
                    },
                    {
                         "value": "book.abcd.com",
                         "trans": "book.abcd"
                    },
                    {
                         "value": "buyer.b2b.abcd.com",
                         "trans": "buyer.b2b.abcd"
                    }
               ]
          },
          "filters": [
               {
                    "items": [
                         {
                              "classify":"latency",                                                           
                              "metricName": "res_time",
                              "value": "res_time",
                              "tags": "res_code"
                         }
                    ],
                    "matchStr": ".*\\|\\|(?P<res_code>\\d+)\\|\\|(?P<res_tim>[\\.\\d]+)\\|\\|\\S+$"
               }
          ]
     },
     "cycle": 60
}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Log-Monitoring.md
```json
{
     "method": "log",
     "para": {
          "logPath": "/a/b/c/error.log",
          "filters": [
               {
                    "preMatch": "Connect to mysql fail",
                    "items": [
                         {
                              "classify":"errno",                                                           
                              "metricName": "Connectfail",
                              "defaultValue": 0,
                              "value": "",
                              "tags": ""
                         }
                    ],
                    "matchStr": "^."
               },
               {
                    "preMatch": "task not exists in db id",
                    "items": [
                         {
                              "classify":"errno",                                                          
                              "metricName": "task_not_exists",
                              "defaultValue": 0,
                              "value": "",
                              "tags": ""
                         }
                    ],
                    "matchStr": "^."
               }
          ]
     },
     "cycle": 60
}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Log-Monitoring.md
```json
{
     "method": "log",
     "para": {
          "logPath": "$DEPLOY_PATH$",
          "filters": [
               {
                    "items": [
                         {
                              "classify":"errno",                                                           
                              "metricName": "jss_access_error",
                              "defaultValue": 0,
                              "value": "",
                              "tags": ""
                         }
                    ],
                    "matchStr": "失败"
               }
          ]
     },
     "cycle": 60
}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Log-Monitoring.md
```json
{
     "method": "log",
     "cycle": 60,
     "apps":"填入APPName，多个以,分隔",
     "para": {
          "logPath": "/a/b/c.ERROR",
          "filters": [
               {
                    "matchStr": "can not follow scaler:",
                    "items": [
                         {
                              "classify":"errno",                                                           
                              "metricName": "followscaler_error",
                              "value": "",
                              "tags": "",
                              "defaultValue": 0
                         }
                    ]
               },
               {
                    "matchStr": "getsockopt: connection refused",
                    "items": [
                         {
                              "classify":"errno",                                                           
                              "metricName": "ping_error",
                              "value": "",
                              "tags": "",
                              "defaultValue": 0
                         }
                    ]
               }
          ]
     }
}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Machine-Monitoring.md
```sql
注：如果内核支持Available，则mem.usable.* = MemAvailable
若不支持，mem.usable.* = MemFree + Buffers + Cached
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Machine-Monitoring.md
```
    PS: 当前默认采集以下几种开头的网卡，如需采集其他网卡，可通过修改网卡名的方式实现
    
    1. eth
    2. em
    3. bond
    4. en
    5. vEth
    6. Ethernet
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Port-Monitoring.md
```
PS：
配置动态IP：默认访问本机/127.0.0.1端口，如果无法使用此IP，可以切换至JSON配置方式，在端口号中填入$IP$。
配置动态端口：$MAIN_PORT$（配置此动态端口时，约定获取服务树上实例开启的主端口）
配置动态地址$DEPLOY_PATH$（服务树上实例部署路径）
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Collection-Conf/Process-Monitoring.md
```
路径的填写支持以下几种方法,
- 填可唯一标识的进程名，如 "hawkeye-agent"、"nginx"等； 
- 填写/开头的进程绝对路径 如/a/b/c，须先"file /a/b/c"确认输出结果包含ELF； 
- 指定某特定java类进程，可填写"进程路径 参数"(中间为空格。方法：ps -elf获取的进程启动参数，空格分割，从中顺序取出1~2个字段，可唯一标识出进程即可）； 
- jar包名，如"×××.jar", 
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
# CentOS
yum install docker
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
systemctl start docker
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
# 若 基础镜像 为自定义项目中的，那么，FROM 租户名.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
# 若 基础镜像 为官方项目中的，那么，FROM tenant0202.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
# 示例
FROM tenant0202.hub-ark-hn.jdcloud.com/library/centos:7.3
RUN yum -y install centos-release-gluster41 && yum -y install glusterfs-server
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
# 可包含域名信息，也可不包含域名信息
# 不包含域名信息  docker build  -t {镜像名}:{版本}  .
# 示例
docker build  -t glusterfs:4.1.5  .
# 包含域名信息    docker build  -t {域名}/{项目名}/{镜像名}:{版本}  .
# 若 基础镜像 为自定义项目中的，那么，域名为 租户名.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
# 若 基础镜像 为官方项目中的，那么，域名为 tenant0202.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
# 示例
docker build  -t 租户名.hub-ark-hn.jdcloud.com/xdata-op/glusterfs:4.1.5  .
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
docker images
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
# 若 基础镜像 为自定义项目中的，那么，域名为 租户名.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
# 若 基础镜像 为官方项目中的，那么，域名为 tenant0202.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
示例
# 编译镜像
docker run -ti tenant0202.hub-ark-hn.jdcloud.com/library/centos:7.3 /bin/bash
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
docker ps
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
#登录docker镜像
docker exec -it a6779e27ca13 bash
#停止docker镜像
docker stop a6779e27ca13
#删除docker 容器
docker rm a6779e27ca13
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
docker images
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
# 若 基础镜像 为自定义项目中的，那么，域名为 租户名.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
# 若 基础镜像 为官方项目中的，那么，域名为 tenant0202.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
# 示例
# 编译镜像
docker run -ti tenant0202.hub-ark-hn.jdcloud.com/library/centos:7.3 /bin/bash
docker ps
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
docker login -u{用户名} -p{密码} 租户名.hub-ark-hn.jdcloud.com
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
docker tag {镜像名/ID} 租户名.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
docker push 租户名.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
docker pull tenant0202.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
docker login -u{用户名} -p{密码} 租户名.hub-ark-hn.jdcloud.com
# 拉取镜像
docker pull 租户名.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
# 拉取镜像
docker pull 租户名.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Image-Packaging.md
```
docker login -u{用户名} -p{密码} 租户名.hub-ark-hn.jdcloud.com
# 拉取镜像
docker pull 租户名.hub-ark-hn.jdcloud.com/{项目名}/{镜像名}:{版本}
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Operation-Instruction.md
```
#华北-北京    
wget -c http://devops-hb.oss-internal.cn-north-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.391.dc2f953.20180910190347.bin -O installer && sh installer /usr/local/jdcloud/ifrit && rm -f installer
#华东-上海：
wget -c http://devops-hd.oss-internal.cn-east-2.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.391.dc2f953.20180910190347.bin -O installer && sh installer /usr/local/jdcloud/ifrit && rm -f installer
#华东-宿迁：
wget -c http://devops-sq.oss-internal.cn-east-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.391.dc2f953.20180910190347.bin -O installer && sh installer /usr/local/jdcloud/ifrit && rm -f installer
#华南-广州：
wget -c http://devops.oss-internal.cn-south-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.391.dc2f953.20180910190347.bin -O installer && sh installer /usr/local/jdcloud/ifrit && rm -f installer
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Operation-Instruction.md
```
wget -c http://devops-hb.oss.cn-north-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.377.8918eae.20180418132906.bin -O installer && sh installer -- -t $tenant -r $region -v $vpc /export/servers/ifrit && rm -f installer
    -t tenant #devops中的租户名
    -v vpc    #由用户编写,将作为服务器的vpc名称
    -r region #由用户编写,将作为服务器的region名称
```


#### 当前代码: documentation/Management/DevOps/Operation-Guide/Tags.md
```json
{
	"JUDGE": {
		"alarmInterval": [
			5
		],  ---【配置报警时间间隔，可设置为数组（20,2,5…触发时间点为第一次，20为第一次与第二次的时间间隔）】
		"switchConfig": {
			"enableTime": {
				"beginTime": "00:00",
				"endTime": "23:59"
			},
			"on": true
		},  ---【报警开关，是否开启；开启时间段】
		"level": "WARNING",  ---【报警级别】
		"conditionTagEqual": false,
		"conditionOperator": "&&",  ---【报警依赖关系，||或者&&，或关系，且关系】
		"conditionList": [  ---【报警规则（可添加多个依赖规则）】
			{
				"formula": "必填cpu.idle < 80",  ---【监控项报警的判断规则】
				"metricDataFilter": {  ---【筛选监控项统计值类型、tag匹配结果为true的监控项】
					"tags": "",  ---【监控项tags，支持包含与不包含的关系。HasTag（1个参数）、NotHasTag、TagValueIn、TagValueNotIn(\"core\", \"1,2,3\")指 tag value不在此范围内才满足。tag字段为空时，匹配不含tag的监控项】
					"valueType": "STATISTIC",  ---【支持STRING、STATISTIC】
					"valueKey": "AVG"  ---【MAX|AVG等，valueType=STATISTIC时生效】
				},
				"parameter": {
					"simple": [
						5,
						3
					]  ---【代表采集到的数据m次中n次满足报警阈值，使用突升突降报警时，此规则失效】
				},
				"nsFilter": "",  ---【筛选ns，具体筛选方式见下表】
				"nsType": "HOST",  ---【HOST（机器、死机、agent）|INSTANCE（进程、端口、ssh、日志、自定义）|APP（聚合监控）|DOMAIN（域名监控）】
				"ns": ""
			}
		]
	}
}
```


#### 当前代码: documentation/Management/DevOps/Troubleshooting/Configuration.md
```
/export/ 
- servers/ # 基础系统软件目录 
- Backup/ # 【包部署】存放编译包的备份目录 
- Packages/ # 程序目录（包+配置文件） 
  - appKey/ # 【包部署】应用键值 
    - latest -> /export/Packages/moduleName/version # 软链到对应最新版本 
    - version # 版本号 
- Instances/ # 实例目录 
  - appKey/ # 应用键值名称 
    - 0.app_key/ # 实例名称 
       - runtme ->/export/Packages/moduleName/version # 软链到部署的版本号包的存放目录 
       - log ->/export/Logs/appKey/0.app_key # 软链到log目录 
       - data ->/export/Data/appKey/0.app_key # 软链到data目录 
- Logs/ # 日志目录 
  - appKey # 应用键值 
    - 0.app_key/ # 实例名称 
- Data/ # 数据存放目录 
  - appKey/ # 应用键值 
    - 0.app_key/ # 实例名称
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy-Syntax_v2.md
```<policy> =
{
<content>,
<version>
}
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy-Syntax_v2.md
```<content> = 
"content":[
{
<permission>,
<resource>
},
{
<permission>,
<resource>
}
]
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy-Syntax_v2.md
```
"permission" : "R|M|D"
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy-Syntax_v2.md
```
"resource":[
{
<ids>,
<type>
}
]
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy-Syntax_v2.md
```
"ids":[
"resource-id1",
"resource-id2"
]
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy-Syntax_v2.md
```
"type":"service name"
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy_v3/Action.md
```
所有产品所有操作
"action":"*"
"action":"*:*"

// IAM产品所有操作
"action":"iam:*"

// IAM产品的名为 createSubuser 的操作
"action":"iam:createSubuser"

// IAM产品的只读权限的操作
"action":"iam:describe*"

// IAM产品，名为 createSubuser，createGroup，createRole 的操作列表
"action":["iam:createSubuser","cos:createGroup","cos: createGroup"]
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy_v3/Elements.md
```
{
      "Version": "3",
      "Statement":
        [
        {
          "Effect": "Allow",
          "Action": ["iam:describe*","iam:create*"],
          "Resource": ["jrn:iam:*:*:subuser/*","jrn:iam:*:*:group/*"],
          "Condition":
             {
                "IpAddress":
                 {
                 "Jdcloud:SourceIp":"203.0.113.0/24"
                  }
              }
         }]
}
```



#### 当前代码: documentation/Management/IAM/Policy-Management/Policy_v3/Syntax-Structure.md
```
  = < > ( ) | ...
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy_v3/Syntax-Structure.md
```
<condition_block?>
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy_v3/Syntax-Structure.md
```
("allow" | "deny")
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy_v3/Syntax-Structure.md
```
<version_block> = "version" : "3"
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy_v3/Syntax-Structure.md
```
{ } [ ] " , :
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy_v3/Syntax-Structure.md
```
"resource":["resource_string", "resource_string”]  
"action":["action_string", "action_string”]  
"Principal":{<Principal_map>, <Principal_map>}
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy_v3/Syntax-Structure.md
```
"resource": ["resource_string"]     
"resource": "resource_string"
```


#### 当前代码: documentation/Management/IAM/Policy-Management/Policy_v3/Syntax-Structure.md
```
policy  = {
     <version_block>
     <principal_block?>,
     <statement_block>
}

<version_block> = "version" : "3"

<statement_block> = "statement" : [ <statement>, <statement>, ... ]

<statement> = {     
    <effect_block>,
    <action_block>,
    <resource_block>,
    <condition_block?>
}

<effect_block> = "effect" : ("allow" | "deny")  

<principal_block> = "principal": ("*" | <principal_map>)

<principal_map> = { <principal_map_entry>, <principal_map_entry>, ... }

<principal_map_entry> = "JDCloud":   
[<principal_id_string>, <principal_id_string>, ...]

<action_block> = "action": 
("*" | [<action_string>, <action_string>, ...])

<resource_block> = "resource": 
("*" | [<resource_string>, <resource_string>, ...])

<condition_block> = "condition" : { <condition_map> }

<condition_map> = 
{ 
  <condition_type_string> : { <condition_key_string> : <condition_value_list> },
  <condition_type_string> : { <condition_key_string> : <condition_value_list> }, ...
}  

<condition_value_list> = [<condition_value>, <condition_value>, ...]

<condition_value> = ("string" | "number" |"boolean")
```


#### 当前代码: documentation/Management/Monitoring/Operation-Guide/custom-monitoring/reporting-monitoring-data.md
```
{
	"metricDataList": [
	  {
			"namespace": "test",
			"metric": "vm.mem.usage1",
			"dimensions": {
				"host": "1.2.3.23",
				"datacenter": "cn-north-1 "
			},
			"timestamp": 15305424971,
			"type": 1,
			"values": {
				"value": "12342213"
			}
		},

		{
			"namespace": "test1",
			"metric": "vm.cpu.usage",
			"dimensions": {
				"host": "1.2.3.19",
				"tag": "bj"
			},
			"timestamp": 1530542497,
			"type": 2,
			"values": {
				"avg": "80",
				"max": "32424244120"
			}
		}
	]
}
```


#### 当前代码: documentation/Management/Monitoring/Operation-Guide/custom-monitoring/reporting-monitoring-data.md
```
success：

{
    "requestId": "1111",
    "result": {
        "success": true,
        "errMetricDataList": []
    }
}

fail：
{
	"requestId": "1111",
	"result": {
		"success": false,
		"errMetricDataList": [{
			"ErrMetricData": "{\"namespace\":\"test1\",\"metric\":\"vm.cpu.usage\",\"dimensions\":{\"host\":\"1.2.3.19\",\"region\":\"bj\",\"tag\":\"bj\",\"tag2\":\"bj\",\"tag3\":\"bj\",\"tag4\":\"bj\"},\"timestamp\":1540361379,\"type\":2,\"values\":{\"avg\":\"80\",\"max\":\"32424244120\"}}",
			"errDetail": "Invalid dimensions,dimensions num limited in 1 to 5 and not null"
		}]
	},
	"error": {
		"code": 400,
		"message": "INVALID_ARGUMENT",
		"status": "INVALID_ARGUMENT",
		"details": null
	}
}

```


#### 当前代码: documentation/Management/Monitoring/Operation-Guide/custom-monitoring/reporting-monitoring-data.md
```
vi /root/.jdc/config
```


#### 当前代码: documentation/Management/Monitoring/Operation-Guide/custom-monitoring/reporting-monitoring-data.md
```
[default]
access_key = 4332FC1AF6D790660EEC9A7E4124380F
secret_key = E1380087654E1CB0E64AB8A5536E568E
region_id = cn-north-1
endpoint = monitor.cn-north-1.jdcloud-api.com
scheme = https
timeout = 20
```  


#### 当前代码: documentation/Management/Monitoring/Operation-Guide/custom-monitoring/reporting-monitoring-data.md
```
jdc monitor put-metric-data --input-json '{"metricDataList": [{"namespace": "test_ns","metric": "vm.cpu.usage1","dimensions": {"host": "10.10.10.23","datacenter": "cn_north_1"},"timestamp": 1544425695,"type": 1,"values": {"value": "12342213"}}]}'
```  


#### 当前代码: documentation/Management/Monitoring/Operation-Guide/custom-monitoring/reporting-monitoring-data.md
```
{
    "error": null, 
    "result": {
        "errMetricDataList": [], 
        "success": true
    }, 
    "request_id": "bg9ofp78ikqqgvastas64owpqmoijk77"
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Best-Practices/nodejs_web_instance.md
```
{
  "JDCLOUDTemplateFormatVersion": "2018-10-01",
  "Description": "JDRO Nodejs TEMPLATE",
  "Parameters": {
    "VPCName": {
      "Default": "vpc",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the VPC Name. It cannot be same as an existing VPC name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "SubnetName": {
      "Default": "subnet",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the Subnet Name. It cannot be same as an existing Subnet name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "AddressPrefix": {
      "Default": "10.0.0.0/16",
      "Type": "String",
      "Description": "Give an CIDR",
      "AllowedValues": [
        "192.168.0.0/16",
        "172.16.0.0/16",
        "10.0.0.0/16"
      ],
      "ConstraintDescription": "Need give an exact CIDR."
    },
    "InstanceName": {
      "Default": "vm",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "The Instance Name",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "VMPassword": {
      "NoEcho": true,
      "Description": "Password for vm access",
      "Type": "String",
      "MinLength": "8",
      "MaxLength": "16",
      "AllowedPattern": "[a-zA-Z0-9]*"
    }
  },
  "Mappings": {
    "AZInfo": {
      "cn-north-1": {
        "az1": "cn-north-1a",
        "az2": "cn-north-1b"
      },
      "cn-east-1": {
        "az1": "cn-east-1a"
      },
      "cn-east-2": {
        "az1": "cn-east-2a",
        "az2": "cn-east-2b"
      },
      "cn-south-1": {
        "az1": "cn-south-1a"
      }
    },
    "ImageInfo": {
      "cn-north-1": {
        "image": "img-9ha1rgelkq"
      },
      "cn-east-1": {
        "image": "img-htaupmjlqq"
      },
      "cn-east-2": {
        "image": "img-ssazsh60t6"
      },
      "cn-south-1": {
        "image": "img-uxgb28v2y3"
      }
    }
  },
  "Resources": {
    "MyVPC": {
      "Type": "JDCLOUD::VPC::VPC",
      "Properties": {
        "VpcName": {
          "Ref": "VPCName"
        }
      }
    },
    "MySubnet": {
      "Type": "JDCLOUD::VPC::Subnet",
      "Properties": {
        "VpcId": {
          "Ref": "MyVPC"
        },
        "AddressPrefix": {
          "Ref": "AddressPrefix"
        },
        "SubnetName": {
          "Ref": "SubnetName"
        }
      }
    },
    "MyInstance": {
      "Type": "JDCLOUD::VM::Instance",
      "Properties": {
        "Name": {
          "Ref": "InstanceName"
        },
        "ImageId": {
          "Fn::FindInMap": [
            "ImageInfo",
            {
              "Ref": "JDCLOUD::Region"
            },
            "image"
          ]
        },
        "InstanceType": "g.n2.medium",
        "AZ": {
          "Fn::FindInMap": [
            "AZInfo",
            {
              "Ref": "JDCLOUD::Region"
            },
            "az1"
          ]
        },
        "PrimaryNetworkInterface": {
          "NetworkInterface": {
            "SubnetId": {
              "Ref": "MySubnet"
            }
          }
        },
        "Password": {
          "Ref": "VMPassword"
        },
        "Userdata": {
          "Fn::Base64": {
            "Fn::Join": [
              "",
              [
                "#!/bin/bash \n",
                " Region=",
                {
                  "Ref": "JDCLOUD::Region"
                },
                "\n",
                " wget jdro-userdata-${Region}.s3.${Region}.jcloudcs.com/signal.py -O /tmp/signal.py  \n",
                " chmod +x /tmp/signal.py \n",
                " #user code begin \n",
                "cd /root \n",
                "curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash - \n",
                "yum -y install lsof nodejs \n",
                "cat << EOF >> example.js \n",
                "var http = require('http'); \n",
                "http.createServer(function (req, res) { \n",
                "  res.writeHead(200, {'Content-Type' : 'text/plain'}); \n",
                "  res.end('Hello World\\n'); \n",
                "}).listen(3000); \n",
                "EOF\n",
                "node example.js & \n",
                " # user code end \n",
                "/tmp/signal.py --exit-code $? ",
                {
                  "Ref": "MyWaitConditionHandle"
                },
                " \n "
              ]
            ]
          }
        }
      }
    },
    "MyElasticIp": {
      "Type": "JDCLOUD::VPC::ElasticIp",
      "Properties": {
        "ElasticIPSpec": {
          "BandwidthMbps": 1,
          "Provider": "bgp"
        }
      }
    },
    "MyAssociateElasticIp": {
      "Type": "JDCLOUD::VPC::AssociateElasticIp",
      "Properties": {
        "InstanceId": {
          "Ref": "MyInstance"
        },
        "InstanceType": "vm",
        "ElasticIpId": {
          "Ref": "MyElasticIp"
        }
      }
    },
    "MyWaitCondition": {
      "Type": "JDCLOUD::ResourceOrchestration::WaitCondition",
      "DependsOn": [
        "MyInstance"
      ],
      "Properties": {
        "Count": 1,
        "Handle": {
          "Ref": "MyWaitConditionHandle"
        },
        "Timeout": "3600"
      }
    },
    "MyWaitConditionHandle": {
      "Type": "JDCLOUD::ResourceOrchestration::WaitConditionHandle",
      "Properties": {}
    }
  },
  "Outputs": {
    "Server_Domain": {
      "Value": {
        "Fn::Join": [
          ":",
          [
            {
              "Fn::GetAtt": [
                "MyInstance",
                "ElasticIpAddress"
              ]
            },
            "3000"
          ]
        ]
      }
    }
  }
}

```


#### 当前代码: documentation/Management/Resource-Orchestration/Best-Practices/rds_instance.md
```  
{
  "JDCLOUDTemplateFormatVersion": "2018-10-01",
  "Description": "JDRO RDS_INSTANCE TEMPLATE",
  "Parameters": {
    "VPCName": {
      "Default": "vpc",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the VPC Name. It cannot be same as an existing VPC name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "SubnetName": {
      "Default": "subnet",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the Subnet Name. It cannot be same as an existing Subnet name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "AddressPrefix": {
      "Default": "10.0.0.0/16",
      "Type": "String",
      "Description": "Give an CIDR",
      "AllowedValues": [
        "192.168.0.0/16",
        "172.16.0.0/16",
        "10.0.0.0/16"
      ],
      "ConstraintDescription": "Need give an exact CIDR."
    },
    "DBName": {
      "Default": "mydb",
      "Description": "MySQL database name",
      "Type": "String",
      "MinLength": "2",
      "MaxLength": "32",
      "AllowedPattern": "^[a-z][a-z0-9]*$",
      "ConstraintDescription": "The name only supports figures letters both in upper case and lower case and English underline, no less than 2 characters and no more than 32 characters."
    },
    "DBUser": {
      "Default": "user",
      "Description": "Username for MySQL database access",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "16",
      "AllowedPattern": "^[a-zA-Z][a-zA-Z0-9]*$",
      "ConstraintDescription": "must begin with a letter and contain only alphanumeric characters."
    },
    "DBPassword": {
      "NoEcho": true,
      "Description": "Password for dbuser or DB access",
      "Type": "String",
      "MinLength": "8",
      "MaxLength": "16",
      "AllowedPattern": "[a-zA-Z0-9]*"
    }
  },
  "Mappings": {
    "AZInfo": {
      "cn-north-1": {
        "az1": "cn-north-1a",
        "az2": "cn-north-1b"
      },
      "cn-east-1": {
        "az1": "cn-east-1a"
      },
      "cn-east-2": {
        "az1": "cn-east-2a",
        "az2": "cn-east-2b"
      },
      "cn-south-1": {
        "az1": "cn-south-1a"
      }
    },
    "ImageInfo": {
      "cn-north-1": {
        "image": "img-2qz094wxaz"
      },
      "cn-east-1": {
        "image": "img-nfrxl97pal"
      },
      "cn-east-2": {
        "image": "img-wcewkxc5c1"
      },
      "cn-south-1": {
        "image": "img-xkjedl0lgm"
      }
    }
  },
  "Resources": {
    "MyVPC": {
      "Type": "JDCLOUD::VPC::VPC",
      "Properties": {
        "VpcName": {
          "Ref": "VPCName"
        }
      }
    },
    "MySubnet": {
      "Type": "JDCLOUD::VPC::Subnet",
      "Properties": {
        "VpcId": {
          "Ref": "MyVPC"
        },
        "AddressPrefix": {
          "Ref": "AddressPrefix"
        },
        "SubnetName": {
          "Ref": "SubnetName"
        }
      }
    },
    "MyDBInstance": {
      "Type": "JDCLOUD::RDS::DBInstance",
      "Properties": {
        "Engine": "MySQL",
        "AZId": [
          {
            "Fn::FindInMap": [
              "AZInfo",
              {
                "Ref": "JDCLOUD::Region"
              },
              "az1"
            ]
          }
        ],
        "ChargeSpec": {
          "ChargeMode": "postpaid_by_duration"
        },
        "EngineVersion": "5.7",
        "InstanceClass": "db.mysql.s1.micro",
        "InstanceName": {
          "Ref": "DBName"
        },
        "InstanceStorageGB": 20,
        "VpcId": {
          "Ref": "MyVPC"
        },
        "SubnetId": {
          "Ref": "MySubnet"
        },
        "Database": {
          "CharacterSetName": "utf8",
          "DBName": {
            "Ref": "DBName"
          }
        },
        "Account": {
          "AccountName": {
            "Ref": "DBUser"
          },
          "AccountPassword": {
            "Ref": "DBPassword"
          }
        }
      }
    }
  },
  "Outputs": {
    "MySQL_ID": {
      "Value": {
        "Ref": "MyDBInstance"
      }
    },
    "MySQL_Domain": {
      "Value": {
        "Fn::GetAtt": [
          "MyDBInstance",
          "InternalDomainName"
        ]
      }
    }
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Best-Practices/vm_vpc_instance.md
```  
{
  "JDCLOUDTemplateFormatVersion": "2018-10-01",
  "Description": "JDRO VM_VPC_INSTANCE TEMPLATE",
  "Parameters": {
    "VPCName": {
      "Default": "vpc",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the VPC Name. It cannot be same as an existing VPC name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "SubnetName": {
      "Default": "subnet",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the Subnet Name. It cannot be same as an existing Subnet name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "AddressPrefix": {
      "Default": "10.0.0.0/16",
      "Type": "String",
      "Description": "Give an CIDR",
      "AllowedValues": [
        "192.168.0.0/16",
        "172.16.0.0/16",
        "10.0.0.0/16"
      ],
      "ConstraintDescription": "Need give an exact CIDR."
    },
    "InstanceName": {
      "Default": "vm",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "The Instance Name",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "DiskName": {
      "Default": "disk",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "The Disk Name",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "Password": {
      "NoEcho": true,
      "Description": "Password for vm access",
      "Type": "String",
      "MinLength": "8",
      "MaxLength": "16",
      "AllowedPattern": "[a-zA-Z0-9]*",
      "ConstraintDescription": ""
    }
  },
  "Mappings": {
    "AZInfo": {
      "cn-north-1": {
        "az1": "cn-north-1a",
        "az2": "cn-north-1b"
      },
      "cn-east-1": {
        "az1": "cn-east-1a"
      },
      "cn-east-2": {
        "az1": "cn-east-2a",
        "az2": "cn-east-2b"
      },
      "cn-south-1": {
        "az1": "cn-south-1a"
      }
    },
    "ImageInfo": {
      "cn-north-1": {
        "image": "img-9ha1rgelkq"
      },
      "cn-east-1": {
        "image": "img-htaupmjlqq"
      },
      "cn-east-2": {
        "image": "img-ssazsh60t6"
      },
      "cn-south-1": {
        "image": "img-uxgb28v2y3"
      }
    }
  },
  "Resources": {
    "MyVPC": {
      "Type": "JDCLOUD::VPC::VPC",
      "Properties": {
        "VpcName": {
          "Ref": "VPCName"
        }
      }
    },
    "MySubnet": {
      "Type": "JDCLOUD::VPC::Subnet",
      "Properties": {
        "VpcId": {
          "Ref": "MyVPC"
        },
        "AddressPrefix": {
          "Ref": "AddressPrefix"
        },
        "SubnetName": {
          "Ref": "SubnetName"
        }
      }
    },
    "MyInstance": {
      "Type": "JDCLOUD::VM::Instance",
      "Properties": {
        "Name": {
          "Ref": "InstanceName"
        },
        "ImageId": {
          "Fn::FindInMap": [
            "ImageInfo",
            {
              "Ref": "JDCLOUD::Region"
            },
            "image"
          ]
        },
        "InstanceType": "g.n2.medium",
        "AZ": {
          "Fn::FindInMap": [
            "AZInfo",
            {
              "Ref": "JDCLOUD::Region"
            },
            "az1"
          ]
        },
        "PrimaryNetworkInterface": {
          "NetworkInterface": {
            "SubnetId": {
              "Ref": "MySubnet"
            }
          }
        },
        "Password": {
          "Ref": "Password"
        }
      }
    },
    "MyDisk": {
      "Type": "JDCLOUD::VM::Disk",
      "Properties": {
        "DiskSizeGB": 20,
        "DiskType": "premium-hdd",
        "Name": {
          "Ref": "DiskName"
        },
        "AZ": {
          "Fn::FindInMap": [
            "AZInfo",
            {
              "Ref": "JDCLOUD::Region"
            },
            "az1"
          ]
        }
      }
    },
    "MyAttachDisk": {
      "Type": "JDCLOUD::VM::AttachDisk",
      "Properties": {
        "InstanceId": {
          "Ref": "MyInstance"
        },
        "DiskId": {
          "Ref": "MyDisk"
        },
        "AutoDelete": true
      }
    },
    "MyElasticIp": {
      "Type": "JDCLOUD::VPC::ElasticIp",
      "Properties": {
        "AutoDelete": true,
        "ElasticIPSpec": {
          "BandwidthMbps": 1,
          "Provider": "bgp"
        }
      }
    },
    "MyAssociateElasticIp": {
      "Type": "JDCLOUD::VPC::AssociateElasticIp",
      "Properties": {
        "InstanceId": {
          "Ref": "MyInstance"
        },
        "InstanceType": "vm",
        "ElasticIpId": {
          "Ref": "MyElasticIp"
        }
      }
    }
  },
  "Outputs": {
    "VM_ID": {
      "Value": {
        "Ref": "MyInstance"
      }
    },
    "VM_EIP": {
      "Value": {
        "Fn::GetAtt": [
          "MyInstance",
          "ElasticIpAddress"
        ]
      }
    },
    "VM_PrivateIP": {
      "Value": {
        "Fn::GetAtt": [
          "MyInstance",
          "PrivateIpAddress"
        ]
      }
    }
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Best-Practices/vpc_subnet.md
```  
{
  "JDCLOUDTemplateFormatVersion": "2018-10-01",
  "Description": "JDRO VPC_SUBNET TEMPLATE",
  "Parameters": {
    "VPCName": {
      "Default": "vpc",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the VPC Name. It cannot be same as an existing VPC name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "SubnetName": {
      "Default": "subnet",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the Subnet Name. It cannot be same as an existing Subnet name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "AddressPrefix": {
      "Default": "10.0.0.0/16",
      "Type": "String",
      "Description": "Give an CIDR",
      "AllowedValues": [
        "192.168.0.0/16",
        "172.16.0.0/16",
        "10.0.0.0/16"
      ],
      "ConstraintDescription": "Need give an exact CIDR."
    }
  },
  "Mappings": {
    "AZInfo": {
      "cn-north-1": {
        "az1": "cn-north-1a",
        "az2": "cn-north-1b"
      },
      "cn-east-1": {
        "az1": "cn-east-1a"
      },
      "cn-east-2": {
        "az1": "cn-east-2a",
        "az2": "cn-east-2b"
      },
      "cn-south-1": {
        "az1": "cn-south-1a"
      }
    },
    "ImageInfo": {
      "cn-north-1": {
        "image": "img-2qz094wxaz"
      },
      "cn-east-1": {
        "image": "img-nfrxl97pal"
      },
      "cn-east-2": {
        "image": "img-ssazsh60t6"
      },
      "cn-south-1": {
        "image": "img-xkjedl0lgm"
      }
    }
  },
  "Resources": {
    "MyVPC": {
      "Type": "JDCLOUD::VPC::VPC",
      "Properties": {
        "VpcName": {
          "Ref": "VPCName"
        }
      }
    },
    "MySubnet": {
      "Type": "JDCLOUD::VPC::Subnet",
      "Properties": {
        "VpcId": {
          "Ref": "MyVPC"
        },
        "AddressPrefix": {
          "Ref": "AddressPrefix"
        },
        "SubnetName": {
          "Ref": "SubnetName"
        }
      }
    }
  },
  "Outputs": {
    "VPC_ID": {
      "Value": {
        "Ref": "MyVPC"
      }
    },
    "Subnet_ID": {
      "Value": {
        "Ref": "MySubnet"
      }
    },
    "Subnet_AddressPrefix": {
      "Value": {
        "Fn::GetAtt": [
          "MySubnet",
          "AddressPrefix"
        ]
      }
    }
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Best-Practices/wordpress_with_cluster.md
```  
{
  "JDCLOUDTemplateFormatVersion": "2018-10-01",
  "Description": "JDRO WORDPRESS_WITH_CLUSTER TEMPLATE",
  "Parameters": {
    "VPCName": {
      "Default": "vpc",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the VPC Name. It cannot be same as an existing VPC name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "SubnetName": {
      "Default": "subnet",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the Subnet Name. It cannot be same as an existing Subnet name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "AddressPrefix": {
      "Default": "10.0.0.0/16",
      "Type": "String",
      "Description": "Give an exact CIDR",
      "AllowedValues": [
        "192.168.0.0/16",
        "172.16.0.0/16",
        "10.0.0.0/16"
      ],
      "ConstraintDescription": "Need give an exact CIDR."
    },
    "InstanceName1": {
      "Default": "vm1",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the Instance Name",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen."
    },
    "InstanceName2": {
      "Default": "vm2",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the Instance Name",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen."
    },
    "VMPassword": {
      "NoEcho": true,
      "Description": "Password for vm access",
      "Type": "String",
      "MinLength": "8",
      "MaxLength": "16",
      "AllowedPattern": "[a-zA-Z0-9]*"
    },
    "DiskName1": {
      "Default": "disk1",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "The Disk Name",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen."
    },
    "DiskName2": {
      "Default": "disk2",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "The Disk Name",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports  numbers, capital and lowercase letters, English underline and hyphen."
    },
    "DBName": {
      "Default": "wordpress",
      "Description": "MySQL database name",
      "Type": "String",
      "MinLength": "2",
      "MaxLength": "32",
      "AllowedPattern": "^[a-z][a-z0-9_]*$",
      "ConstraintDescription": "The name only supports lower case letters, numbers and English underline, no less than 2 characters and no more than 32 characters."
    },
    "DBUser": {
      "Default": "wordpress",
      "Description": "Username for MySQL database access",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "16",
      "AllowedPattern": "^[a-zA-Z][a-zA-Z0-9]*$",
      "ConstraintDescription": "must begin with a letter and contain only alphanumeric characters."
    },
    "DBPassword": {
      "NoEcho": true,
      "Description": "Password must contain and only supports letters both in upper case and lower case as well as figures, no less than 8 characters and no more than 16 characters. e.g. Ptest1130",
      "Type": "String",
      "MinLength": "8",
      "MaxLength": "16",
      "AllowedPattern": "[a-zA-Z0-9]*"
    },
    "LoadBalancerName": {
      "Default": "lb",
      "Description": "LoadBalancer name",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports  numbers, capital and lowercase letters, English underline  and hyphen."
    },
    "TargetGroupName": {
      "Default": "lbtargetgroup",
      "Description": "TargetGroup Name",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports  numbers, capital and lowercase letters, English underline  and hyphen."
    },
    "LBBackendName": {
      "Default": "lbbackend",
      "Description": "Backend Name",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports  numbers, capital and lowercase letters, English underline  and hyphen."
    }
  },
  "Mappings": {
    "AZInfo": {
      "cn-north-1": {
        "az1": "cn-north-1a",
        "az2": "cn-north-1b"
      },
      "cn-east-1": {
        "az1": "cn-east-1a"
      },
      "cn-east-2": {
        "az1": "cn-east-2a",
        "az2": "cn-east-2b"
      },
      "cn-south-1": {
        "az1": "cn-south-1a"
      }
    },
    "ImageInfo": {
      "cn-north-1": {
        "image": "img-9ha1rgelkq"
      },
      "cn-east-1": {
        "image": "img-htaupmjlqq"
      },
      "cn-east-2": {
        "image": "img-ssazsh60t6"
      },
      "cn-south-1": {
        "image": "img-uxgb28v2y3"
      }
    }
  },
  "Resources": {
    "MyVPC": {
      "Type": "JDCLOUD::VPC::VPC",
      "Properties": {
        "VpcName": {
          "Ref": "VPCName"
        }
      }
    },
    "MySubnet": {
      "Type": "JDCLOUD::VPC::Subnet",
      "Properties": {
        "VpcId": {
          "Ref": "MyVPC"
        },
        "AddressPrefix": {
          "Ref": "AddressPrefix"
        },
        "SubnetName": {
          "Ref": "SubnetName"
        }
      }
    },
    "MyInstance1": {
      "Type": "JDCLOUD::VM::Instance",
      "Properties": {
        "Name": {
          "Ref": "InstanceName1"
        },
        "ImageId": {
          "Fn::FindInMap": [
            "ImageInfo",
            {
              "Ref": "JDCLOUD::Region"
            },
            "image"
          ]
        },
        "ElasticIp": {
          "BandwidthMbps": 1,
          "Provider": "bgp"
        },
        "InstanceType": "g.n2.medium",
        "AZ": {
          "Fn::FindInMap": [
            "AZInfo",
            {
              "Ref": "JDCLOUD::Region"
            },
            "az1"
          ]
        },
        "PrimaryNetworkInterface": {
          "NetworkInterface": {
            "SubnetId": {
              "Ref": "MySubnet"
            }
          }
        },
        "Password": {
          "Ref": "VMPassword"
        },
        "DataDisks": [
          {
            "AutoDelete": true,
            "CloudDiskSpec": {
              "Name": {
                "Ref": "DiskName1"
              },
              "AZ": {
                "Fn::FindInMap": [
                  "AZInfo",
                  {
                    "Ref": "JDCLOUD::Region"
                  },
                  "az1"
                ]
              },
              "DiskSizeGB": 20,
              "DiskType": "ssd"
            },
            "DiskCategory": "cloud"
          }
        ],
        "Userdata": {
          "Fn::Base64": {
            "Fn::Join": [
              "",
              [
                " #!/bin/bash \n",
                " Region=",
                {
                  "Ref": "JDCLOUD::Region"
                },
                "\n",
                " wget  jdro-userdata-${Region}.s3.${Region}.jcloudcs.com/signal.py -O /tmp/signal.py \n",
                " chmod +x /tmp/signal.py \n",
                " #user code begin \n",
                "DatabaseUser=",
                {
                  "Ref": "DBUser"
                },
                "\n",
                "DatabasePwd=",
                {
                  "Ref": "DBPassword"
                },
                "\n",
                "DatabaseName=",
                {
                  "Ref": "DBName"
                },
                "\n",
                "DatabaseHost=",
                {
                  "Fn::GetAtt": [
                    "MyDBInstance",
                    "InternalDomainName"
                  ]
                },
                "\n",
                "WebRootPath='/var/www/html'\n",
                "mkdir -p $WebRootPath \n",
                "yum install -y curl httpd mysql-server php php-common php-mysql\n",
                "yum install -y php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc\n",
                "chkconfig httpd on\n",
                "wget http://wordpress.org/latest.tar.gz \n",
                "tar -xzvf latest.tar.gz \n",
                "sed -i \"s/database_name_here/$DatabaseName/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/username_here/$DatabaseUser/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/password_here/${DatabasePwd:-$DatabasePwdDef}/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/localhost/$DatabaseHost/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/bpache/apache/\" wordpress/wp-config-sample.php\n",
                "mv wordpress/wp-config-sample.php wordpress/wp-config.php\n",
                "cp -a wordpress/* $WebRootPath \n",
                "rm -rf wordpress*\n",
                "service httpd stop\n",
                "usermod -d $WebRootPath apache &>/dev/null\n",
                "chown apache:apache -R $WebRootPath\n",
                "service httpd start\n",
                " # user code end \n",
                "/tmp/signal.py --exit-code $? ",
                {
                  "Ref": "MyWaitConditionHandle"
                },
                " \n "
              ]
            ]
          }
        }
      }
    },
    "MyInstance2": {
      "Type": "JDCLOUD::VM::Instance",
      "Properties": {
        "Name": {
          "Ref": "InstanceName2"
        },
        "ImageId": {
          "Fn::FindInMap": [
            "ImageInfo",
            {
              "Ref": "JDCLOUD::Region"
            },
            "image"
          ]
        },
        "ElasticIp": {
          "BandwidthMbps": 1,
          "Provider": "bgp"
        },
        "InstanceType": "g.n2.medium",
        "AZ": {
          "Fn::FindInMap": [
            "AZInfo",
            {
              "Ref": "JDCLOUD::Region"
            },
            "az1"
          ]
        },
        "PrimaryNetworkInterface": {
          "NetworkInterface": {
            "SubnetId": {
              "Ref": "MySubnet"
            }
          }
        },
        "Password": {
          "Ref": "VMPassword"
        },
        "DataDisks": [
          {
            "AutoDelete": true,
            "CloudDiskSpec": {
              "Name": {
                "Ref": "DiskName2"
              },
              "AZ": {
                "Fn::FindInMap": [
                  "AZInfo",
                  {
                    "Ref": "JDCLOUD::Region"
                  },
                  "az1"
                ]
              },
              "DiskSizeGB": 20,
              "DiskType": "ssd"
            },
            "DiskCategory": "cloud"
          }
        ],
        "Userdata": {
          "Fn::Base64": {
            "Fn::Join": [
              "",
              [
                " #!/bin/bash \n",
                " Region=",
                {
                  "Ref": "JDCLOUD::Region"
                },
                "\n",
                " wget  jdro-userdata-${Region}.s3.${Region}.jcloudcs.com/signal.py -O /tmp/signal.py \n",
                " chmod +x /tmp/signal.py \n",
                " #user code begin \n",
                "DatabaseUser=",
                {
                  "Ref": "DBUser"
                },
                "\n",
                "DatabasePwd=",
                {
                  "Ref": "DBPassword"
                },
                "\n",
                "DatabaseName=",
                {
                  "Ref": "DBName"
                },
                "\n",
                "DatabaseHost=",
                {
                  "Fn::GetAtt": [
                    "MyDBInstance",
                    "InternalDomainName"
                  ]
                },
                "\n",
                "WebRootPath='/var/www/html'\n",
                "mkdir -p $WebRootPath \n",
                "yum install -y curl httpd mysql-server php php-common php-mysql\n",
                "yum install -y php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc\n",
                "chkconfig httpd on\n",
                "wget http://wordpress.org/latest.tar.gz \n",
                "tar -xzvf latest.tar.gz \n",
                "sed -i \"s/database_name_here/$DatabaseName/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/username_here/$DatabaseUser/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/password_here/${DatabasePwd:-$DatabasePwdDef}/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/localhost/$DatabaseHost/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/bpache/apache/\" wordpress/wp-config-sample.php\n",
                "mv wordpress/wp-config-sample.php wordpress/wp-config.php\n",
                "cp -a wordpress/* $WebRootPath \n",
                "rm -rf wordpress*\n",
                "service httpd stop\n",
                "usermod -d $WebRootPath apache &>/dev/null\n",
                "chown apache:apache -R $WebRootPath\n",
                "service httpd start\n",
                " # user code end \n",
                "/tmp/signal.py --exit-code $? ",
                {
                  "Ref": "MyWaitConditionHandle"
                },
                " \n "
              ]
            ]
          }
        }
      }
    },
    "MyDBInstance": {
      "Type": "JDCLOUD::RDS::DBInstance",
      "Properties": {
        "Engine": "MySQL",
        "AZId": [
          {
            "Fn::FindInMap": [
              "AZInfo",
              {
                "Ref": "JDCLOUD::Region"
              },
              "az1"
            ]
          }
        ],
        "EngineVersion": "5.7",
        "InstanceClass": "db.mysql.s1.micro",
        "InstanceName": {
          "Ref": "DBName"
        },
        "InstanceStorageGB": 20,
        "VpcId": {
          "Ref": "MyVPC"
        },
        "SubnetId": {
          "Ref": "MySubnet"
        },
        "Database": {
          "CharacterSetName": "utf8",
          "DBName": {
            "Ref": "DBName"
          }
        },
        "Account": {
          "AccountName": {
            "Ref": "DBUser"
          },
          "AccountPassword": {
            "Ref": "DBPassword"
          }
        }
      }
    },
    "MyLoadBalancer": {
      "Type": "JDCLOUD::LoadBalance::LoadBalancer",
      "Properties": {
        "LoadBalancerName": {
          "Ref": "LoadBalancerName"
        },
        "SubnetId": {
          "Ref": "MySubnet"
        },
        "Azs": [
          {
            "Fn::FindInMap": [
              "AZInfo",
              {
                "Ref": "JDCLOUD::Region"
              },
              "az1"
            ]
          }
        ]
      }
    },
    "MyElasticIp": {
      "Type": "JDCLOUD::VPC::ElasticIp",
      "Properties": {
        "ElasticIPSpec": {
          "BandwidthMbps": 1,
          "Provider": "bgp"
        }
      }
    },
    "MyAssociateElasticIp": {
      "Type": "JDCLOUD::VPC::AssociateElasticIp",
      "Properties": {
        "InstanceId": {
          "Ref": "MyLoadBalancer"
        },
        "InstanceType": "lb",
        "ElasticIpId": {
          "Ref": "MyElasticIp"
        }
      }
    },
    "MyLoadBalancerTargetGroup": {
      "Type": "JDCLOUD::LoadBalance::TargetGroup",
      "Properties": {
        "TargetGroupName": {
          "Ref": "TargetGroupName"
        },
        "LoadBalancerId": {
          "Ref": "MyLoadBalancer"
        }
      }
    },
    "MyLoadBalancerRegisterTargets": {
      "Type": "JDCLOUD::LoadBalance::RegisterTargets",
      "Properties": {
        "TargetGroupId": {
          "Ref": "MyLoadBalancerTargetGroup"
        },
        "TargetSpecs": [
          {
            "InstanceId": {
              "Ref": "MyInstance1"
            },
            "Port": 80
          },
          {
            "InstanceId": {
              "Ref": "MyInstance2"
            },
            "Port": 80
          }
        ]
      }
    },
    "MyLoadBalancerBackend": {
      "Type": "JDCLOUD::LoadBalance::Backend",
      "Properties": {
        "LoadBalancerId": {
          "Ref": "MyLoadBalancer"
        },
        "Port": 80,
        "BackendName": {
          "Ref": "LBBackendName"
        },
        "TargetGroupIds": [
          {
            "Ref": "MyLoadBalancerTargetGroup"
          }
        ],
        "Protocol": "Http",
        "HealthCheckSpec": {
          "Protocol": "Http",
          "Port": 80,
          "HttpPath": "/"
        }
      }
    },
    "MyLoadBalancerListener": {
      "Type": "JDCLOUD::LoadBalance::Listener",
      "Properties": {
        "BackendId": {
          "Ref": "MyLoadBalancerBackend"
        },
        "LoadBalancerId": {
          "Ref": "MyLoadBalancer"
        },
        "Protocol": "Http",
        "Port": 80
      }
    },
    "MyWaitCondition": {
      "Type": "JDCLOUD::ResourceOrchestration::WaitCondition",
      "DependsOn": [
        "MyInstance1",
        "MyInstance2"
      ],
      "Properties": {
        "Count": 2,
        "Handle": {
          "Ref": "MyWaitConditionHandle"
        },
        "Timeout": "3600"
      }
    },
    "MyWaitConditionHandle": {
      "Type": "JDCLOUD::ResourceOrchestration::WaitConditionHandle",
      "Properties": {}
    }
  },
  "Outputs": {
    "wordpress_cluster_domain": {
      "Value": {
        "Fn::Join": [
          ":",
          [
            {
              "Fn::GetAtt": [
                "MyLoadBalancer",
                "ElasticIpAddress"
              ]
            },
            {
              "Fn::GetAtt": [
                "MyLoadBalancerListener",
                "Port"
              ]
            }
          ]
        ]
      }
    }
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Best-Practices/wordpress_with_single.md
```
{
  "JDCLOUDTemplateFormatVersion": "2018-10-01",
  "Description": "JDRO WORDPRESS_WITH_SINGLE TEMPLATE",
  "Parameters": {
    "VPCName": {
      "Default": "vpc",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the VPC Name. It cannot be same as an existing VPC name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "SubnetName": {
      "Default": "subnet",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "Define the Subnet Name. It cannot be same as an existing Subnet name, otherwise the resource will fail to be created",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "AddressPrefix": {
      "Default": "10.0.0.0/16",
      "Type": "String",
      "Description": "Give an CIDR",
      "AllowedValues": [
        "192.168.0.0/16",
        "172.16.0.0/16",
        "10.0.0.0/16"
      ],
      "ConstraintDescription": "Need give an exact CIDR."
    },
    "InstanceName": {
      "Default": "vm",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "The Instance Name",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": "Name only supports numbers, capital and lowercase letters, English underline and hyphen ."
    },
    "VMPassword": {
      "NoEcho": true,
      "Description": "Password for vm access",
      "Type": "String",
      "MinLength": "8",
      "MaxLength": "16",
      "AllowedPattern": "[a-zA-Z0-9]*"
    },
    "DiskName": {
      "Default": "disk",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "32",
      "Description": "The Disk Name",
      "AllowedPattern": "^[a-zA-Z_][a-zA-Z0-9_-]*$",
      "ConstraintDescription": ""
    },
    "DBName": {
      "Default": "wordpress",
      "Description": "MySQL database name",
      "Type": "String",
      "MinLength": "2",
      "MaxLength": "32",
      "AllowedPattern": "^[a-z][a-z0-9_]*$",
      "ConstraintDescription": "The name only supports lower case letters, numbers and English underline, no less than 2 characters and no more than 32 characters."
    },
    "DBUser": {
      "Default": "wordpress",
      "Description": "Username for MySQL database access",
      "Type": "String",
      "MinLength": "1",
      "MaxLength": "16",
      "AllowedPattern": "^[a-zA-Z][a-zA-Z0-9]*$",
      "ConstraintDescription": "must begin with a letter and contain only alphanumeric characters."
    },
    "DBPassword": {
      "NoEcho": true,
      "Description": "Password must contain and only supports letters both in upper case and lower case as well as figures, no less than 8 characters and no more than 16 characters. e.g. Ptest1130",
      "Type": "String",
      "MinLength": "8",
      "MaxLength": "16",
      "AllowedPattern": "[a-zA-Z0-9]*"
    }
  },
  "Mappings": {
    "AZInfo": {
      "cn-north-1": {
        "az1": "cn-north-1a",
        "az2": "cn-north-1b"
      },
      "cn-east-1": {
        "az1": "cn-east-1a"
      },
      "cn-east-2": {
        "az1": "cn-east-2a",
        "az2": "cn-east-2b"
      },
      "cn-south-1": {
        "az1": "cn-south-1a"
      }
    },
    "ImageInfo": {
      "cn-north-1": {
        "image": "img-9ha1rgelkq"
      },
      "cn-east-1": {
        "image": "img-htaupmjlqq"
      },
      "cn-east-2": {
        "image": "img-ssazsh60t6"
      },
      "cn-south-1": {
        "image": "img-uxgb28v2y3"
      }
    }
  },
  "Resources": {
    "MyVPC": {
      "Type": "JDCLOUD::VPC::VPC",
      "Properties": {
        "VpcName": {
          "Ref": "VPCName"
        }
      }
    },
    "MySubnet": {
      "Type": "JDCLOUD::VPC::Subnet",
      "Properties": {
        "VpcId": {
          "Ref": "MyVPC"
        },
        "AddressPrefix": {
          "Ref": "AddressPrefix"
        },
        "SubnetName": {
          "Ref": "SubnetName"
        }
      }
    },
    "MyInstance": {
      "Type": "JDCLOUD::VM::Instance",
      "Properties": {
        "Name": {
          "Ref": "InstanceName"
        },
        "ImageId": {
          "Fn::FindInMap": [
            "ImageInfo",
            {
              "Ref": "JDCLOUD::Region"
            },
            "image"
          ]
        },
        "InstanceType": "g.n2.medium",
        "AZ": {
          "Fn::FindInMap": [
            "AZInfo",
            {
              "Ref": "JDCLOUD::Region"
            },
            "az1"
          ]
        },
        "PrimaryNetworkInterface": {
          "NetworkInterface": {
            "SubnetId": {
              "Ref": "MySubnet"
            }
          }
        },
        "Password": {
          "Ref": "VMPassword"
        },
        "DataDisks": [
          {
            "AutoDelete": true,
            "CloudDiskSpec": {
              "Name": {
                "Ref": "DiskName"
              },
              "AZ": {
                "Fn::FindInMap": [
                  "AZInfo",
                  {
                    "Ref": "JDCLOUD::Region"
                  },
                  "az1"
                ]
              },
              "DiskSizeGB": 20,
              "DiskType": "ssd"
            },
            "DiskCategory": "cloud"
          }
        ],
        "Userdata": {
          "Fn::Base64": {
            "Fn::Join": [
              "",
              [
                "#!/bin/bash \n",
                " Region=",
                {
                  "Ref": "JDCLOUD::Region"
                },
                "\n",
                " wget jdro-userdata-${Region}.s3.${Region}.jcloudcs.com/signal.py -O /tmp/signal.py  \n",
                " chmod +x /tmp/signal.py \n",
                " #user code begin \n",
                "DatabaseUser=",
                {
                  "Ref": "DBUser"
                },
                "\n",
                "DatabasePwd=",
                {
                  "Ref": "DBPassword"
                },
                "\n",
                "DatabaseName=",
                {
                  "Ref": "DBName"
                },
                "\n",
                "DatabaseHost=",
                {
                  "Fn::GetAtt": [
                    "MyDBInstance",
                    "InternalDomainName"
                  ]
                },
                "\n",
                "WebRootPath='/var/www/html'\n",
                "mkdir -p $WebRootPath \n",
                "yum install -y curl httpd mysql-server php php-common php-mysql\n",
                "yum install -y php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc\n",
                "chkconfig httpd on\n",
                "wget http://wordpress.org/latest.tar.gz \n",
                "tar -xzvf latest.tar.gz \n",
                "sed -i \"s/database_name_here/$DatabaseName/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/username_here/$DatabaseUser/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/password_here/${DatabasePwd:-$DatabasePwdDef}/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/localhost/$DatabaseHost/\" wordpress/wp-config-sample.php\n",
                "sed -i \"s/bpache/apache/\" wordpress/wp-config-sample.php\n",
                "mv wordpress/wp-config-sample.php wordpress/wp-config.php\n",
                "cp -a wordpress/* $WebRootPath \n",
                "rm -rf wordpress*\n",
                "service httpd stop\n",
                "usermod -d $WebRootPath apache &>/dev/null\n",
                "chown apache:apache -R $WebRootPath\n",
                "service httpd start\n",
                " # user code end \n",
                "/tmp/signal.py --exit-code $? ",
                {
                  "Ref": "MyWaitConditionHandle"
                },
                " \n "
              ]
            ]
          }
        }
      }
    },
    "MyElasticIp": {
      "Type": "JDCLOUD::VPC::ElasticIp",
      "Properties": {
        "ElasticIPSpec": {
          "BandwidthMbps": 1,
          "Provider": "bgp"
        }
      }
    },
    "MyAssociateElasticIp": {
      "Type": "JDCLOUD::VPC::AssociateElasticIp",
      "Properties": {
        "InstanceId": {
          "Ref": "MyInstance"
        },
        "InstanceType": "vm",
        "ElasticIpId": {
          "Ref": "MyElasticIp"
        }
      }
    },
    "MyDBInstance": {
      "Type": "JDCLOUD::RDS::DBInstance",
      "Properties": {
        "Engine": "MySQL",
        "AZId": [
          {
            "Fn::FindInMap": [
              "AZInfo",
              {
                "Ref": "JDCLOUD::Region"
              },
              "az1"
            ]
          }
        ],
        "ChargeSpec": {
          "ChargeMode": "postpaid_by_duration"
        },
        "EngineVersion": "5.7",
        "InstanceClass": "db.mysql.s1.micro",
        "InstanceName": {
          "Ref": "DBName"
        },
        "InstanceStorageGB": 20,
        "VpcId": {
          "Ref": "MyVPC"
        },
        "SubnetId": {
          "Ref": "MySubnet"
        },
        "Database": {
          "CharacterSetName": "utf8",
          "DBName": {
            "Ref": "DBName"
          }
        },
        "Account": {
          "AccountName": {
            "Ref": "DBUser"
          },
          "AccountPassword": {
            "Ref": "DBPassword"
          }
        }
      }
    },
    "MyWaitCondition": {
      "Type": "JDCLOUD::ResourceOrchestration::WaitCondition",
      "DependsOn": [
        "MyInstance"
      ],
      "Properties": {
        "Count": 1,
        "Handle": {
          "Ref": "MyWaitConditionHandle"
        },
        "Timeout": "3600"
      }
    },
    "MyWaitConditionHandle": {
      "Type": "JDCLOUD::ResourceOrchestration::WaitConditionHandle",
      "Properties": {}
    }
  },
  "Outputs": {
    "Server_Domain": {
      "Value": {
        "Fn::Join": [
          ":",
          [
            {
              "Fn::GetAtt": [
                "MyInstance",
                "ElasticIpAddress"
              ]
            },
            "80"
          ]
        ]
      }
    }
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/Resource-Stack/delete-stack.md
```
      "Resources" : {
        "MyInstance" : {
          "Type" : "JDCLOUD::VM::Instance",
          "Properties" : {
            "ImageId" : "img-wcewkxc5c1"
          },
          "DeletionPolicy" : "Retain"
        }
      }
      
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Conditions.md
```
"Conditions" : {
  "Logical ID" : {Intrinsic function}
}

```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Conditions.md
```
{
    "JDCLOUDTemplateFormatVersion": "2018-10-01",
    "Parameters": {
        "EnvType": {
            "Description": "Environment type.",
            "Default": "test",
            "Type": "String",
            "AllowedValues": [
                "prod",
                "test"
            ],
            "ConstraintDescription": "must specify prod or test."
        }
    },
    "Mappings": {
        "AZInfo": {
            "cn-north-1": {
                "az1": "cn-north-1a",
                "az2": "cn-north-1b"
            },
            "cn-east-1": {
                "az1": "cn-east-1a",
                "az2": "cn-east-1b"
            },
            "cn-east-2": {
                "az1": "cn-east-2a",
                "az2": "cn-east-2b"
            },
            "cn-south-1": {
                "az1": "cn-south-1a",
                "az2": "cn-south-1b"
            }
        }
    },
    "Conditions": {
        "CreateProdResources": {
            "Fn::Equals": [
                {
                    "Ref": "EnvType"
                },
                "prod"
            ]
        }
    },
    "Resources": {
        "MyInstance": {
            "Type": "JDCLOUD::VM::Instance",
            "Properties": {
                "AZ": {
                    "Fn::FindInMap": [
                        "AZInfo",
                        {
                            "Ref": "JDCLOUD::Region"
                        },
                        "az1"
                    ]
                }
            }
        },
        "MyElasticIp": {
            "Type": "JDCLOUD::VPC::ElasticIp",
            "Condition": "CreateProdResources",
            "Properties": {
                "ElasticIpSpec": {
                    "BandwidthMbps": "1",
                    "Provider": "bgp"
                }
            }
        },
        "MyAssociateElasticIp": {
            "Type": "JDCLOUD::VPC::AssociateElasticIp",
            "Condition": "CreateProdResources",
            "Properties": {
                "InstanceId": {
                    "Ref": "MyInstance"
                },
                "InstanceType": "vm",
                "ElasticIpId": {
                    "Ref": "MyElasticIp"
                }
            }
        }
    },
    "Outputs": {
        "ElasticIpAddress": {
            "Value": {
                "Fn: : GetAtt": [
                    "MyInstance",
                    "ElasticIpAddress"
                ]
            },
            "Condition": "CreateProdResources"
        }
    }
}

```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{ "Fn::Base64" : valueToEncode }
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{ "Fn::Base64" : "hello world" }
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{ "Fn::FindInMap" : [ "MapName", "TopLevelKey", "SecondLevelKey"] }
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{
  ...
  "Mappings" : {
    "RegionMap" : {
      "cn-north-1" : { "32" : "img-wcewkxc5c1", "64" : "img-wcewkxc5c2" },
      "cn-west-1" : { "32" : "img-wcewkxc5c1", "64" : "img-wcewkxc5c2" },
      "cn-west-2" : { "32" : "img-wcewkxc5c1", "64" : "img-wcewkxc5c2" },
      "cn-south-1" : { "32" : "img-wcewkxc5c1", "64" : "img-wcewkxc5c2" }
    }
  },

  "Resources" : {
     "MyInstance" : {
        "Type" : "JDCLOUD::VM::Instance",
        "Properties" : {
           "ImageId" : { "Fn::FindInMap" : [ "RegionMap", { "Ref" : "JDCLOUD::Region" }, "32"]},
           "InstanceType" : "g.n2.medium"
        }
     }
 }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{ "Fn::GetAtt" : [ "logicalNameOfResource", "attributeName" ] }
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{
    "Fn::GetAtt" : [ "MyInstance" , "PrivateIpAddress" ]
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{ "Fn::Join" : [ "delimiter", [ "string1", "string2", ... ]] }
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{
    "Fn::Join" : [ ",", [ "a", "b", "c" ] ]
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{"Fn::Select" : [ "index", [ "value1", "value2", ... ] ]}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{ "Fn::Select" : [ "1", [ "apples", "grapes", "oranges", "mangoes" ] ] }
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{"Fn::Split" : [ "delim",  "original_string" ]}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{"Fn::Split": [";", "foo; bar; achoo"]}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{ "Fn::Sub" : [ "", { Var1Name: Var1Value, Var2Name: Var2Value } ] }
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{ "Fn::Sub": [ "www.${Domain}", { "Domain": {"Ref" : "RootDomainName" }} ]}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{ "Fn::Sub": "${JDCLOUD::Region}:${JDCLOUD::StackName}:vpc/${vpc}" }
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{
    "Ref" : "LogicalID"
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{
        "JDCLOUDTemplateFormatVersion": "2018-10-01",
        "Parameters": {
            "AddressPrefix": {
                "ConstraintDescription": "Need give an exact CIDR.",
                "Default": "10.0.0.0/16",
                "Description": "Need give an exact CIDR",
                "Type": "String"
            },
            "SubnetName": {
                "ConstraintDescription": "No overwritten Info.",
                "Default": "MySubnet",
                "Description": "My Subnet Name",
                "MaxLength": "32",
                "MinLength": "1",
                "Type": "String"
            },
            "VPCName": {
                "ConstraintDescription": "No overwritten Info.",
                "Default": "MyVPC",
                "Description": "My VPC Name",
                "MaxLength": "32",
                "MinLength": "1",
                "Type": "String"
            }
        },
        "Resources": {
            "MySubnet": {
                "Properties": {
                    "AddressPrefix": {
                        "Ref": "AddressPrefix"
                    },
                    "SubnetName": {
                        "Ref": "SubnetName"
                    },
                    "VpcId": {
                        "Ref": "MyVPC"
                    }
                },
                "Type": "JDCLOUD::VPC::Subnet"
            },
            "MyVPC": {
                "Properties": {
                    "VpcName": {
                        "Ref": "VPCName"
                    }
                },
                "Type": "JDCLOUD::VPC::VPC"
            }
        }
    }
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{"Fn::And": ["condition", {...}]}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{
  "JDCLOUDTemplateFormatVersion" : "2018-10-01",
  "Parameters":{
    "EnvType":{
      "Default":"pre",
      "Type":"String"
    }
  },
  "Conditions": {
    "TestEqualsCond": {"Fn::Equals": ["prod", {"Ref": "EnvType"}]},
    "TestAndCond": {"Fn::And": ["TestEqualsCond", {"Fn::Equals": ["pre", {"Ref": "EnvType"}]}]}
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{"Fn::Equals": ["value_1", "value_2"]}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{
  "JDCLOUDTemplateFormatVersion" : "2018-10-01",
  "Parameters":{
    "EnvType":{
      "Default":"pre",
      "Type":"String"
    }
  },
  "Conditions": {
    "TestEqualsCond": {"Fn::Equals": ["prod", {"Ref": "EnvType"}]}
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{"Fn::If": ["condition_name", "value_if_true", "value_if_false"]}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{
    "JDCLOUDTemplateFormatVersion": "2018-10-01",
    "Parameters":{
        "EnvType":{
          "Default":"pre",
          "Type":"String"
        }
      },
    "Conditions": {
        "IsPre": {"Fn::Equals": ["pre", {"Ref": "EnvType"}]}
      },
    "Resources": {
        "MyInstance": {
            "Type": "JDCLOUD::VM::Instance",
            "Properties": {
                "AZ": {
                    "Fn::FindInMap": [
                        "AZInfo",
                        {
                            "Ref": "JDCLOUD::Region"
                        },
                        "az1"
                    ]
                },
                "ImageId":{
                    "Fn::If":[
                        "IsPre",
                        "PreImageID",
                        "notPreImageID"
                    ]
                }
            }
        }
    }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{"Fn::Not": "condition"}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{
  "JDCLOUDTemplateFormatVersion" : "2018-10-01",
  "Parameters":{
    "EnvType":{
      "Default":"pre",
      "Type":"String"
    }
  },
  "Conditions": {
    "TestNotCond": {"Fn::Not": {"Fn::Equals": ["pre", {"Ref": "EnvType"}]}}
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{"Fn::Or": ["condition", {...}]}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Functions.md
```
{
  "JDCLOUDTemplateFormatVersion" : "2018-10-01",
  "Parameters":{
    "EnvType":{
      "Default":"pre",
      "Type":"String"
    }
  },
  "Conditions": {
    "TestEqualsCond": {"Fn::Equals": ["prod", {"Ref": "EnvType"}]},
    "TestOrCond": {"Fn::And": ["TestEqualsCond", {"Fn::Equals": ["pre", {"Ref": "EnvType"}]}]}
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Mappings.md
```
{
    "Mappings" : {
        "Mapping01" : {
            "Key01" : {
                "Name" : "Value01",
                "Name" : "Value01-1"
            },
            "Key02" : {
                "Name" : "Value02",
                "Name" : "Value02-1"
            },
            "Key03" : {
                "Name" : "Value03",
                "Name" : "Value03-1"
            }
    }
}

```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Mappings.md
```
{
    "JDCLOUDTemplateFormatVersion": "2018-10-01",
    "Mappings": {
        "AZInfo": {
            "cn-north-1": {
                "az1": "cn-north-1a",
                "az2": "cn-north-1b"
            },
            "cn-east-1": {
                "az1": "cn-east-1a",
                "az2": "cn-east-1b"
            },
            "cn-east-2": {
                "az1": "cn-east-2a",
                "az2": "cn-east-2b"
            },
            "cn-south-1": {
                "az1": "cn-south-1a",
                "az2": "cn-south-1b"
            }
        }
    },
    "Resources": {
        "MyInstance": {
            "Type": "JDCLOUD::VM::Instance",
            "Properties": {
                "AZ": { "Fn::FindInMap": [ "AZInfo", { "Ref": "JDCLOUD::Region" }, "az1"]},
            }
        }
    }
}

```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Outputs.md
```
"Outputs" : {
  "output1 LogicID" : {
    "Description" : "输出的描述",
    "Condition": "是否输出此资源属性的条件",
    "Value" : "输出值的表达式"
  },
  "output2 LogicID" : {
    "Description" : "输出的描述",
    "Condition": "是否输出此资源属性的条件",
    "Value" : "输出值的表达式"
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Outputs.md
```
{
    "Outputs": {
        "ElasticIpAddress": {
            "Value": "ElasticIpAddress value",
            "Condition": "CreateProdResources"
        }
    }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Parameters.md
```
"Parameters" : {
  "InstanceTypeParameter" : {
    "Type" : "String",
    "Default" : "g.n2.medium",
    "AllowedValues" : ["g.n2.medium", "g.n2.large", "g.n2.xlarge"],
    "Description" : "选择实例类型，默认为 g.n2.medium，可选值为g.n2.medium, g.n2.large, g.n2.xlarge"
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Parameters.md
```
"MyInstance" : {
  "Type" : "JDCLOUD::VM::Instance",
  "Properties" : {
    "InstanceType" : { "Ref" : "InstanceTypeParameter" },
    "ImageId" : "img-wcewkxc5c1"
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Pseudo.md
```
JDCLOUD::StackId
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Pseudo.md
```
JDCLOUD::StackName
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Pseudo.md
```
JDCLOUD::Region
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Resources.md
```
"Resources" : {
    "resource1 LogicID" : {
        "Type" : "资源类型",
        "Condition": "是否创建此资源的条件"，
        "Properties" : {
            资源属性描述
        }
        "DeletionPolicy":"资源的删除策略",
        "DependsOn":["资源依赖列表"],
    },
    "resource2 LogicID" : {
        "Type" : "资源类型",
        "Condition": "是否创建此资源的条件"，
        "Properties" : {
            资源属性描述
        }
    }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Resources.md
```
{
    "JDCLOUDTemplateFormatVersion": "2018-10-01",
    "Parameters": {
        "EnvType": {
            "Description": "Environment type.",
            "Default": "test",
            "Type": "String",
            "AllowedValues": [
                "prod",
                "test"
            ],
            "ConstraintDescription": "must specify prod or test."
        }
    },
    "Mappings": {
        "AZInfo": {
            "cn-north-1": {
                "az1": "cn-north-1a",
                "az2": "cn-north-1b"
            },
            "cn-east-1": {
                "az1": "cn-east-1a",
                "az2": "cn-east-1b"
            },
            "cn-east-2": {
                "az1": "cn-east-2a",
                "az2": "cn-east-2b"
            },
            "cn-south-1": {
                "az1": "cn-south-1a",
                "az2": "cn-south-1b"
            }
        }
    },
    "Conditions": {
        "CreateProdResources": {
            "Fn::Equals": [
                {
                    "Ref": "EnvType"
                },
                "prod"
            ]
        }
    },
    "Resources": {
        "MyInstance": {
            "Type": "JDCLOUD::VM::Instance",
            "Properties": {
                "AZ": {
                    "Fn::FindInMap": [
                        "AZInfo",
                        {
                            "Ref": "JDCLOUD::Region"
                        },
                        "az1"
                    ]
                }
            }
        },
        "MyElasticIp": {
            "Type": "JDCLOUD::VPC::ElasticIp",
            "Condition": "CreateProdResources",
            "Properties": {
                "ElasticIpSpec": {
                    "BandwidthMbps": "1",
                    "Provider": "bgp"
                }
            }
        },
        "MyAssociateElasticIp": {
            "Type": "JDCLOUD::VPC::AssociateElasticIp",
            "Condition": "CreateProdResources",
            "Properties": {
                "InstanceId": {
                    "Ref": "MyInstance"
                },
                "InstanceType": "vm",
                "ElasticIpId": {
                    "Ref": "MyElasticIp"
                }
            }
        }
    },
    "Outputs": {
        "ElasticIpAddress": {
            "Value": {
                "Fn: : GetAtt": [
                    "MyInstance",
                    "ElasticIpAddress"
                ]
            },
            "Condition": "CreateProdResources"
        }
    }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Resources.md
```
"Resources" : {
  "MyInstance" : {
    "Type" : "JDCLOUD::VM::Instance",
    "Properties" : {
      "ImageId" : "img-wcewkxc5c1"
    }
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Resources.md
```
"Properties" : {
    "String" : "one-string-value",
    "Number" : 123,
    "LiteralList" : [ "first-value", "second-value" ],
    "Boolean" : true,
    "ReferenceForOneValue" :  { "Ref" : "MyLogicalResourceName" } ,
    "FunctionResultWithFunctionParams" : {
        "Fn::Join" : [ "%", [ "Key=", { "Ref" : "MyParameter" } ] ] }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Resources.md
```
"Resources" : {
  "MyInstance" : {
    "Type" : "JDCLOUD::VM::Instance",
    "Properties" : {
      "ImageId" : "img-wcewkxc5c1"
    },
    "DeletionPolicy" : "Retain"
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-grammar-Resources.md
```
{
    "JDCLOUDTemplateFormatVersion": "2018-10-01",
    "Resources": {
        "MyDBInstance": {
            "Type": "JDCLOUD::RDS::DBInstance",
            "Properties": {
            }
        },
        "MyInstance": {
            "Type": "JDCLOUD::VM::Instance",
            "DependsOn": "MyDBInstance"
            "Properties": {
            }
        },
    }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/orchestration-templates/templates-structure.md
```
{
  "JDCLOUDTemplateFormatVersion" : "2018-10-01",

  "Description" : "模板描述信息，可用于说明模板的适用场景、架构说明等。",

  "Parameters" : {
      // 定义创建资源栈时，用户可以定制化的参数。
  },

  "Mappings" : {
      // 定义映射信息表，映射信息是一种多层的 Map 结构。
  },

  "Conditions" : {
      // 使用内部条件函数定义条件。这些条件确定何时创建关联的资源。
  },

  "Resources" : {
      // 所需资源的详细定义，包括资源间的依赖关系、配置细节等。
  },

  "Outputs" : {
      // 用于输出一些资源属性等有用信息。可以通过 API 或控制台获取输出的内容。
  }
}
```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/resource-type.md
```
     "Userdata": {
        "Fn::Base64": {
          "Fn::Join": [
            "",
            [
              "#!/bin/bash \n",
              " Region=",
              {
                "Ref": "JDCLOUD::Region"
              },
              "\n",
              " wget jdro-userdata-${Region}.s3.${Region}.jcloudcs.com/signal.py -O /tmp/signal.py  \n",
              " chmod +x /tmp/signal.py \n",
              " #user code begin \n",



    	  " #add your userdata scripts  here"



              " # user code end \n",
              "/tmp/signal.py --exit-code $? ",
              {
                "Ref": "MyWaitConditionHandle"
              },
              " \n "
            ]
          ]
        }
      }

```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/resource-type.md
```
     "Userdata": {
        "Fn::Base64": {
          "Fn::Join": [
            "",
            [
               " <powershell> \n",
               " $Region=\"",
               {
                "Ref": "JDCLOUD::Region"
               },
               "\"\n",
               " $client = new-object System.Net.WebClient \n",
               " $OSSAdress = \"http://jdro-userdata-$Region.s3.$Region.jcloudcs.com/signal.exe\" \n",
               " $client.DownloadFile($OSSAdress, 'C:\\WINDOWS\\system32\\signal.exe') \n",

               " $useraction = \"hello world\" \n",
               " $useraction > C:\\jdro.txt \n",

               " jdro-signal  ",
               "       --success ",	" true ",
               {
                   "Ref":"MyWaitConditionHandle"
               },
               "  >> C:\\jdro.log \n ",
               " </powershell> \n"
            ]
          ]
        }
      }

```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/resource-type.md
```
    		Usage: signal.py   \[options\]  \[WaitConditionHandle URL\]

    		Options:
     			-s SUCCESS, --success=SUCCES  

    						[optional] If true, signal success to jdro; if false, signal failure. Default: true 
     			-i ID, --id=ID        [optional]  An unique ID to send with the signal
     			-e EXIT_CODE, --exit-code=EXIT_CODE [optional]  Derive success or failure from specified exit code

```


#### 当前代码: documentation/Management/Resource-Orchestration/Operation-Guide/resource-type.md
```
      	{
                   "Ref": "MyWaitConditionHandle"
        }
```


#### 当前代码: documentation/Marketplace/Marketplace/ISV/Product-Enter/Notify-Interface-Standard.md
```
         {

                "instanceId":   "1001",

                "appInfo": {

                "frontEndUrl":   "http://xxx.com/",

                "adminUrl":   "http://xxx.com/admin",

                "username":   "admin",

                "password":   "admin_password"

                …

         },

         "info": {

                "key1": "自定义信息"

                }

         }
```


#### 当前代码: documentation/Marketplace/Marketplace/ISV/Product-Enter/Notify-Interface-Standard.md
```
            http://www.isvwebsite.com?action=dilateInstance&accountNum=1&instanceId=1002&orderId=520801&token=475f28682b5d0d1af820ffd477c1188f&extraInfo={"key1":"1","key1","2"}
```


#### 当前代码: documentation/Marketplace/Marketplace/ISV/Product-Enter/Notify-Interface-Standard.md
```
    import java.io.UnsupportedEncodingException;
    import java.security.MessageDigest;
    import java.security.NoSuchAlgorithmException;

    public class Md5Util {

        private static String byteArrayToHexString(byte b[]) {
            StringBuffer resultSb = new StringBuffer();
            for (int i = 0; i < b.length; i++) {
                resultSb.append(byteToHexString(b[i]));
            }

            return resultSb.toString();
        }

        private static String byteToHexString(byte b) {
            int n = b;
            if (n < 0)
                n += 256;
            int d1 = n / 16;
            int d2 = n % 16;
            return hexDigits[d1] + hexDigits[d2];
        }

        /**
         * saas接口获取token方法
         *
         * @param origin
         * @return
         */
        public static String md5Encode(String origin) {
            try {
                MessageDigest md = MessageDigest.getInstance("MD5");
                return byteArrayToHexString(md.digest(origin.getBytes("utf-8")));
            } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            return null;

        }
        private static final String hexDigits[] = {"0", "1", "2", "3", "4", "5",
                "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};

      public static void main(String[] args) {
            String md2 = Md5Util.md5Encode("accountNum=1&action=createInstance&email=bujiaban@jd.com&expiredOn=2018-06-30  
```


#### 当前代码: documentation/Middleware/API-Gateway/Best-Practices/example_for_create_api.md
```Java
package net.jdcloud.PetStore;

import com.jdcloud.sdk.auth.CredentialsProvider;
import com.jdcloud.sdk.auth.StaticCredentialsProvider;
import com.jdcloud.sdk.client.Environment;
import com.jdcloud.sdk.http.HttpRequestConfig;
import com.jdcloud.sdk.http.Protocol;
import net.jdcloud.PetStore.client.PetStoreClient;
import net.jdcloud.PetStore.model.*;

import java.math.BigDecimal;

/**
 * Demo
 */
public class Demo {

    private static String accessKeyId = "0E91C3765B78CBD71715F9BF24997AF3";
    private static String secretKey = "AF7B13C8010F50F03A52C01458714701";
    private static CredentialsProvider credentialsProvider = new StaticCredentialsProvider(accessKeyId, secretKey);
    private static PetStoreClient client = PetStoreClient.builder()
                .credentialsProvider(credentialsProvider)
                .httpRequestConfig(new HttpRequestConfig.Builder().connectionTimeout(10000).protocol(Protocol.HTTPS).build())
//                .environment(new Environment.Builder().endpoint("xv3xbwah945y-test.cn-north-1.jdcloud-api.net").build()) // 测试环境地址
//                .environment(new Environment.Builder().endpoint("xv3xbwah945y-preview.cn-north-1.jdcloud-api.net").build()) // 预发环境地址
                .environment(new Environment.Builder().endpoint("xv3xbwah945y.cn-north-1.jdcloud-api.net").build()) // 线上环境地址
                .build();

    public static void main (String[] args){
//        GetPetInfo
        GetPetInfoRequest getPetInfoRequest = new GetPetInfoRequest();
        getPetInfoRequest.setPetId(1);
        GetPetInfoResponse getPetInfoResponse = client.getPetInfo(getPetInfoRequest);
        System.out.println(getPetInfoResponse.getGetPetInfoResult());

//        CreatePet
        CreatePetRequest createPetRequest = new CreatePetRequest();
        CreatePetBody CreatePetBody = new CreatePetBody();
        CreatePetBody.setId(1);
        CreatePetBody.setPrice(new BigDecimal(3.3));
        CreatePetBody.setType("dog");
        createPetRequest.setBody(CreatePetBody);
        CreatePetResponse createPetResponse = client.createPet(createPetRequest);
        System.out.println(createPetResponse.getCreatePetResult());

//        TestFunction
        TestFunctionRequest testFunctionRequest = new TestFunctionRequest();
        TestFunctionResponse testFunctionResponse = client.testFunction(testFunctionRequest);
        System.out.println(testFunctionResponse.getTestFunctionResult());

    }
}

```


#### 当前代码: documentation/Middleware/API-Gateway/Best-Practices/example_for_create_api.md
```
# coding=utf8

from jdcloud_sdk.core.credential import Credential
from jdcloud_sdk.core.config import Config
from jdcloud_sdk.core.const import SCHEME_HTTPS
from PetStore.apis.create_pet_request import *
from PetStore.apis.get_pet_info_request import *
from PetStore.apis.test_function_request import *
from PetStore.client.PetStore_client import PetStoreClient
from PetStore.models.create_pet_body import *


class PetStoreTest(object)：

    def __init__(self, access_key, secret_key, end_point)：
        self.access_key = access_key
        self.secret_key = secret_key
        self.end_point = end_point
        self.credential = Credential(self.access_key, self.secret_key)
        self.config = Config(self.end_point, scheme=SCHEME_HTTPS)
        self.client = PetStoreClient(self.credential, self.config)

    def create_pet_test(self)：
        req_body = CreatePetBody(id=1, type="dog", price=12).to_dict()
        parameters = CreatePetParameters()
        request = CreatePetRequest(parameters=parameters, bodyParameters=req_body)
        res = self.client.send(request)
        return res

    def get_pet_info_test(self)：
        parameters = GetPetInfoParameters(petId=1)
        request = GetPetInfoRequest(parameters=parameters, bodyParameters=None)
        res = self.client.send(request)
        return res

    def function_test(self)：
        parameters = TestFunctionParameters()
        request = TestFunctionRequest(parameters=parameters, bodyParameters=None)
        res = self.client.send(request)
        return res


if __name__ == "__main__"：
    # 访问密钥详细信息中的APIKey
    APIKey = "0E91C3765B78CBD71715F9BF24997AF3"
    # 访问密钥详细信息中的APISecert
    APISecert = "AF7B13C8010F50F03A52C01458714701"
    # API分组信息中分组路径去掉前缀的部分
    endpoint = "xv3xbwah945y.cn-north-1.jdcloud-api.net"

    pet_store = PetStoreTest(APIKey, APISecert, endpoint)
    print pet_store.create_pet_test().content
    print pet_store.get_pet_info_test().content
    print pet_store.function_test().content

```


#### 当前代码: documentation/Middleware/API-Gateway/Getting-Started/example_console.md
```Java
package net.jdcloud.PetStore;

import com.jdcloud.sdk.auth.CredentialsProvider;
import com.jdcloud.sdk.auth.StaticCredentialsProvider;
import com.jdcloud.sdk.client.Environment;
import com.jdcloud.sdk.http.HttpRequestConfig;
import com.jdcloud.sdk.http.Protocol;
import net.jdcloud.PetStore.client.PetStoreClient;
import net.jdcloud.PetStore.model.*;

import java.math.BigDecimal;

/**
 * Demo
 */
public class Demo {

    private static String accessKeyId = "0E91C3765B78CBD71715F9BF24997AF3";
    private static String secretKey = "AF7B13C8010F50F03A52C01458714701";
    private static CredentialsProvider credentialsProvider = new StaticCredentialsProvider(accessKeyId, secretKey);
    private static PetStoreClient client = PetStoreClient.builder()
                .credentialsProvider(credentialsProvider)
                .httpRequestConfig(new HttpRequestConfig.Builder().connectionTimeout(10000).protocol(Protocol.HTTPS).build())
//                .environment(new Environment.Builder().endpoint("xv3xbwah945y-test.cn-north-1.jdcloud-api.net").build()) // 测试环境地址
//                .environment(new Environment.Builder().endpoint("xv3xbwah945y-preview.cn-north-1.jdcloud-api.net").build()) // 预发环境地址
                .environment(new Environment.Builder().endpoint("xv3xbwah945y.cn-north-1.jdcloud-api.net").build()) // 线上环境地址
                .build();

    public static void main (String[] args){
//        GetPetInfo
        GetPetInfoRequest getPetInfoRequest = new GetPetInfoRequest();
        getPetInfoRequest.setPetId(1);
        GetPetInfoResponse getPetInfoResponse = client.getPetInfo(getPetInfoRequest);
        System.out.println(getPetInfoResponse.getGetPetInfoResult());

//        CreatePet
        CreatePetRequest createPetRequest = new CreatePetRequest();
        CreatePetBody CreatePetBody = new CreatePetBody();
        CreatePetBody.setId(1);
        CreatePetBody.setPrice(new BigDecimal(3.3));
        CreatePetBody.setType("dog");
        createPetRequest.setBody(CreatePetBody);
        CreatePetResponse createPetResponse = client.createPet(createPetRequest);
        System.out.println(createPetResponse.getCreatePetResult());

//        TestFunction
        TestFunctionRequest testFunctionRequest = new TestFunctionRequest();
        TestFunctionResponse testFunctionResponse = client.testFunction(testFunctionRequest);
        System.out.println(testFunctionResponse.getTestFunctionResult());

    }
}

```


#### 当前代码: documentation/Middleware/API-Gateway/Getting-Started/example_console.md
```
# coding=utf8

from jdcloud_sdk.core.credential import Credential
from jdcloud_sdk.core.config import Config
from jdcloud_sdk.core.const import SCHEME_HTTPS
from PetStore.apis.create_pet_request import *
from PetStore.apis.get_pet_info_request import *
from PetStore.apis.test_function_request import *
from PetStore.client.PetStore_client import PetStoreClient
from PetStore.models.create_pet_body import *


class PetStoreTest(object)：

    def __init__(self, access_key, secret_key, end_point)：
        self.access_key = access_key
        self.secret_key = secret_key
        self.end_point = end_point
        self.credential = Credential(self.access_key, self.secret_key)
        self.config = Config(self.end_point, scheme=SCHEME_HTTPS)
        self.client = PetStoreClient(self.credential, self.config)

    def create_pet_test(self)：
        req_body = CreatePetBody(id=1, type="dog", price=12).to_dict()
        parameters = CreatePetParameters()
        request = CreatePetRequest(parameters=parameters, bodyParameters=req_body)
        res = self.client.send(request)
        return res

    def get_pet_info_test(self)：
        parameters = GetPetInfoParameters(petId=1)
        request = GetPetInfoRequest(parameters=parameters, bodyParameters=None)
        res = self.client.send(request)
        return res

    def function_test(self)：
        parameters = TestFunctionParameters()
        request = TestFunctionRequest(parameters=parameters, bodyParameters=None)
        res = self.client.send(request)
        return res


if __name__ == "__main__"：
    # 访问密钥详细信息中的APIKey
    APIKey = "0E91C3765B78CBD71715F9BF24997AF3"
    # 访问密钥详细信息中的APISecert
    APISecert = "AF7B13C8010F50F03A52C01458714701"
    # API分组信息中分组路径去掉前缀的部分
    endpoint = "xv3xbwah945y.cn-north-1.jdcloud-api.net"

    pet_store = PetStoreTest(APIKey, APISecert, endpoint)
    print pet_store.create_pet_test().content
    print pet_store.get_pet_info_test().content
    print pet_store.function_test().content

```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/Capacity-Assessment.md
```
实际空间 = 源数据 * (1 + 副本数量) * (1 + 索引开销) / （1-操作系统预留）/(1 - 内部任务开销) 
        = 源数据 * (1 + 副本数量) * 1.45
        = 源数据 *2.9
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/Capacity-Assessment.md
```	
存储容量 = 源数据 * (1 + 副本数量) * 1.45 * （1 + 0.5）
        = 源数据 * 4.35
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/connect-ES.md
```
curl -XGET es-nlb-es-kgqo8zmgcv.jvessel-open-hb.jdcloud.com:9200/_cat
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/connect-ES.md
```
{
  =^.^=
/_cat/allocation
/_cat/shards
/_cat/shards/{index}
/_cat/master
/_cat/nodes
/_cat/tasks
/_cat/indices
/_cat/indices/{index}
/_cat/segments
/_cat/segments/{index}
/_cat/count
/_cat/count/{index}
/_cat/recovery
/_cat/recovery/{index}
}
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/connect-ES.md
```
wget https://download.elastic.co/demos/kibana/gettingstarted/shakespeare.json
wget https://download.elastic.co/demos/kibana/gettingstarted/accounts.zip
wget https://download.elastic.co/demos/kibana/gettingstarted/logs.jsonl.gz
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/connect-ES.md
```
unzip accounts.zip
gunzip logs.jsonl.gz
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/connect-ES.md
```
curl -X PUT "es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/shakespeare" -H 'Content-Type: application/json' -d' { "mappings" : { "_default_" : { "properties" : { "speaker" : {"type": "keyword" }, "play_name" : {"type": "keyword" }, "line_id" : { "type" : "integer" }, "speech_number" : { "type" : "integer" } } } } } '

 
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/connect-ES.md
```
{"acknowledged":true,"shards_acknowledged":true,"index":"shakespeare"}
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/connect-ES.md
```
curl -X PUT "es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/logstash-20181011" -H 'Content-Type: application/json' -d' { "mappings": { "log": { "properties": { "geo": { "properties": { "coordinates": { "type": "geo_point" } } } } } } }' 

```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/connect-ES.md
```
curl -H 'Content-Type: application/x-ndjson' -XPOST 'es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/bank/account/_bulk?pretty' --data-binary @accounts.json

curl -H 'Content-Type: application/x-ndjson' -XPOST 'es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/shakespeare/_bulk?pretty' --data-binary @shakespeare.json

curl -H 'Content-Type: application/x-ndjson' -XPOST 'es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/_bulk?pretty' --data-binary @logs.jsonl

curl -X GET "es-nlb-es-u92rc1eulw.jvessel-open-hb.jdcloud.com:9200/_cat/indices?v"

```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/connect-ES.md
```
health status index uuid pri rep docs.count docs.deleted store.size pri.store.size
green open logstash-20181010 kUP-0TEJTxCTJLRZzTGeWg  5  1          0            0      1.5kb           810b
green  open   logstash-2015.05.18 GLLhXFRhQIaEmCE-JjYUew   5   1       4631            0       65mb         32.7mb
green  open   logstash-2015.05.19 MYvyilYSRNitM1cP4cn5cQ   5   1       4624            0     63.8mb         32.4mb
green  open   bank                AI80JfMGTY2zf916VqqnmQ   5   1       1000            0      1.2mb        640.8kb
green  open   shakespeare         y9zglGy5TqmNJ-AdtQKblg   5   1     111396            0     57.8mb         29.1mb
green  open   .kibana             Wui_-I2FR0eyu2IIvf7SZQ   1   1          1            0      6.4kb          3.2kb
green  open   logstash-2015.05.20 ssOTajNfRsO0FmXMmO2qvA   5   1       4750            0     65.8mb         33.1mb

```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/plugin.md
```
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.6.9-linux-x86_64.tar.gz
tar xvf filebeat-5.6.9.tar.gz
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/plugin.md
```
// 定义日志文件的路径
filebeat.prospectors:
- input_type: log
    paths:
    - /usr/local/services/testlogs/*.log
 
// 设置输出到ES的IP地址和端口
output.elasticsearch:
  # Array of hosts to connect to.
  hosts: ["172.16.0.39:9200"]
 ```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/plugin.md
```
nohup ./filebeat 2>&1 >/dev/null &
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/plugin.md
```
wget https://artifacts.elastic.co/downloads/logstash/logstash-5.6.9.tar.gz

tar xvf logstash-5.6.9.tar.gz

yum install java-1.8.0-openjdk  java-1.8.0-openjdk-devel -y
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/plugin.md
```
input {

    file {

        path => "/var/log/nginx/access.log" # 文件路径

        }

}

filter {

}

output {

  elasticsearch {

    hosts => ["http://172.16.0.89:9200"] # Elasticsearch集群的内网VIP地址和端口

    index => "nginx_access-%{+YYYY.MM.dd}" # 自定义索引名称, 以日期为后缀，每天生成一个索引

 }

}
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/plugin.md
```
input{

      kafka{

        bootstrap_servers => ["172.16.16.22:9092"]

        client_id => "test"

        group_id => "test"

        auto_offset_reset => "latest" #从最新的偏移量开始消费

        consumer_threads => 5

        decorate_events => true #此属性会将当前topic、offset、group、partition等信息也带到message中

        topics => ["test1","test2"] #数组类型，可配置多个topic

        type => "test" #数据源标记字段

      }

}



output {

  elasticsearch {

    hosts => ["http://172.16.0.89:9200"] # Elasticsearch集群的内网VIP地址和端口

    index => "test_kafka"

 }

}
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Best-Practices/plugin.md
```
nohup ./bin/logstash -f ~/*.conf 2>&1 >/dev/null &
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Introduction/Restrictions.md
```
请注意：
* 云搜索Elasticsearch集群创建成功后，不支持VPC网络的切换，需要您在创建集群时，提前进行业务规划部署。

```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Operation-Guide/Dedicated-master.md
```
请注意：
* 在启用专用主节点时，我们默认并建议为每个集群分配3个专用主节点，3个专用主节点可在主节点发生故障时提供额外的备份节点来选择新主节点。
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Operation-Guide/Tag/Edit-Tag.md
```
请注意：
* 同一个资源，标签键不能重复，编辑前后标签键（Key）相同而值不同则将以新的值覆盖旧的值。
* 点击【添加】按钮不触发编辑标签，只有点击【确认】按钮会触发编辑标签，会根据编辑后的标签对当前云主机先解绑不再需要的标签，后绑定新标签/覆盖原有标签。若遇到网络抖动可能会遇到解绑成功而绑定/覆盖不成功的情况，此时还请再次操作编辑标签。
完成编辑标签后，您可以通过实例列表页/详情页查看标签是否编辑成功，也可以单击【标签筛选】按钮查看是否已变更。
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Operation-Guide/deletesnapshot.md
```
DELETE _snapshot/auto_snapshot/snapshot_2
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Operation-Guide/indexsnapshot.md
```
PUT _snapshot/auto_snapshot/snapshot_2
{
 "indices":"customer,index"
}
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Operation-Guide/viewsnapshot.md
```
GET _snapshot/auto_snapshot/snapshot_1
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Operation-Guide/viewsnapshot.md
```
{
  "snapshots": [
    {
      "snapshot": "snapshot_1",
      "uuid": "AMvUjS9HStmIk5e6BUr2Hw",
      "version_id": 5060999,
      "version": "5.6.9",
      "indices": [
        "customer",
        "index"
      ],
      "state": "SUCCESS",
      "start_time": "2019-02-19T02:53:55.899Z",
      "start_time_in_millis": 1550544835899,
      "end_time": "2019-02-19T02:54:00.327Z",
      "end_time_in_millis": 1550544840327,
      "duration_in_millis": 4428,
      "failures": [],
      "shards": {
        "total": 10,
        "failed": 0,
        "successful": 10
      }
    }
  ]
}
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Operation-Guide/viewsnapshot.md
```
GET _snapshot/auto_snapshot/_all
```


#### 当前代码: documentation/Middleware/JCS-for-Elasticsearch/Operation-Guide/viewsnapshot.md
```
GET _snapshot/auto_snapshot/snapshot_1/_status
```


#### 当前代码: documentation/Middleware/Message-Queue/Getting-Started/Produce-And-Consume-Message.md
```
<dependency>
   <groupId>com.jdcloud</groupId>
   <artifactId>jcq-java-sdk</artifactId>
   <version>1.0.2</version>
</dependency>
```


#### 当前代码: documentation/Middleware/Message-Queue/Operation-Guide/API-Reference/Call-Method/Signature-Algorithm.md
```python
#!/home/lizhijian/opt/python3.7/bin/python3

import base64
import collections
import hashlib
import hmac
import json
import random
import requests
from datetime import datetime

def md5(content):
    b = bytes(content, 'utf-8')
    h = hashlib.new('md5')
    h.update(b)
    return h.hexdigest()

def message2str(message):
    m = dict(message)  # deep copy
    m.update(m.get('properties', {}))
    m.pop('properties')
    od = collections.OrderedDict(sorted(m.items()))
    ms = '&'.join([k + '=' + str(v) for k, v in od.items()])
    return md5(ms)

def get_sign_source(headers, params):
    d = {
        'accessKey': headers['accessKey'],
        'dateTime': headers['dateTime'],
    }
    d.update(params)
    if type(d.get('messages')) == list:
        d['messages'] = ','.join([message2str(m) for m in d['messages']])
    od = collections.OrderedDict(sorted(d.items()))
    return '&'.join([k + '=' + str(v) for k, v in od.items()])

def get_signature(source, key):
    key = key.encode('utf-8')
    source = source.encode('utf-8')
    digester = hmac.new(key, source, hashlib.sha1)
    signature = base64.standard_b64encode(digester.digest())
    return signature.decode('utf-8').strip()

def send_message(access_key, secret_key, topic, type_, messages):
    url = 'http://192.168.6.1:9090/v1/messages'
    headers = {
        "Content-Type": "application/json",
        "accessKey": access_key,
        "dateTime": datetime.utcnow().isoformat(timespec='seconds') + "Z",
    }
    body = {
        "topic": topic,
        "type": type_,
        "messages": messages,
    }
    sign_source = get_sign_source(headers, body)
    signature = get_signature(sign_source, secret_key)
    headers["signature"] = signature
    resp = requests.post(url, headers=headers, data=json.dumps(body))
    return resp.text

def mysend():
    access_key = "your_access_key"
    secret_key = "your_secret_key"
    topic = "your_topic"
    type_ = "NORMAL"
    messages = []
    for i in range(10):
        messages.append({
            'body': 'message-%d' % i,
            'delaySeconds': random.randint(0, 10),
            'tag': 'tag-%d' % i,
            'properties': {str(random.randint(0, 100)): 'test'}
        })
    resp = send_message(access_key, secret_key, topic, type_, messages)
    print(resp)

if __name__ == '__main__':
    mysend()
```


#### 当前代码: documentation/Middleware/Message-Queue/Operation-Guide/API-Reference/Interface-Specification/Ack-Message.md
```
POST {Http接入点}/v1/ack HTTP/1.1
```


#### 当前代码: documentation/Middleware/Message-Queue/Operation-Guide/API-Reference/Interface-Specification/Consume-Message.md
```
GET {Http接入点}/v1/messages HTTP/1.1
```


#### 当前代码: documentation/Middleware/Message-Queue/Operation-Guide/API-Reference/Interface-Specification/Send-Message-Http.md
```
POST {Http接入点}/v1/messages HTTP/1.1
```


#### 当前代码: documentation/Middleware/Message-Queue/SDK-Rerference/Java-SDK/Consume-Message-SDK.md
```java
package com.jcloud.jcq.sdk.demo;

import com.jcloud.jcq.client.consumer.ConsumeResult;
import com.jcloud.jcq.client.consumer.MessageListener;
import com.jcloud.jcq.common.filter.FilterExpression;
import com.jcloud.jcq.protocol.Message;
import com.jcloud.jcq.sdk.JCQClientFactory;
import com.jcloud.jcq.sdk.auth.UserCredential;
import com.jcloud.jcq.sdk.consumer.Consumer;
import com.jcloud.jcq.sdk.consumer.ConsumerConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * 推送型消费者 demo.
 * @date 2018-05-17
 */
public class ConsumerDemo {
    private static final Logger logger = LoggerFactory.getLogger(ConsumerDemo.class);
    /**
     * 用户accessKey
     */
    private static final String ACCESS_KEY = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0";
    /**
     * 用户secretKey
     */
    private static final String SECRET_KEY = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB0";
    /**
     * 元数据服务器地址
     */
    private static final String META_SERVER_ADDRESS = "127.0.0.1:18888";
    /**
     * topic名称
     */
    private static final String TOPIC = "testTopic";
    /**
     * 消费组Id
     */
    private static final String CONSUMER_GROUP_ID = "testConsumerGroup";

    public static void main(String[] args) throws Exception {
        // 创建消息consumer, 普通及全局顺序消息都适用
        UserCredential userCredential = new UserCredential(ACCESS_KEY, SECRET_KEY);
        ConsumerConfig consumerConfig = ConsumerConfig.builder()
                .consumerGroupId(CONSUMER_GROUP_ID)
                .metaServerAddress(META_SERVER_ADDRESS)
                .build();
        Consumer consumer = JCQClientFactory.getInstance().createConsumer(userCredential, consumerConfig);

        // 创建消费过滤条件，如果需要
        FilterExpression filterExpression = new FilterExpression();
        filterExpression.setExpressionType(FilterExpression.ExpressionType.TAG);
        filterExpression.setExpression("TAG");

        // 订阅topic，有过滤条件
        consumer.subscribeTopic(TOPIC, new MessageListener() {
                    @Override
                    public ConsumeResult consumeMessages(List<Message> list) {
                        logger.info("messages:{}", list);
                        return ConsumeResult.SUCCESS;
                    }
                },
                filterExpression);

        // 订阅topic1, 无过滤条件
        consumer.subscribeTopic("testTopic1", new MessageListener() {
                    @Override
                    public ConsumeResult consumeMessages(List<Message> list) {
                        logger.info("messages:{}", list);
                        return ConsumeResult.SUCCESS;
                    }
                },
                null);

        // 开启consumer,开始消费
        consumer.start();
    }
}
```


#### 当前代码: documentation/Middleware/Message-Queue/SDK-Rerference/Java-SDK/Environment-Preparation.md
 ```
  <dependency>
     <groupId>com.jdcloud</groupId>
     <artifactId>jcq-java-sdk</artifactId>
     <version>x.x.x</version>
     //设置为 Java SDK 的最新版本号
  </dependency>
 ```


#### 当前代码: documentation/Middleware/Message-Queue/SDK-Rerference/Java-SDK/Initialization.md
```java
/**
 * 用户accessKey
 */
private static final String ACCESS_KEY = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0";
/**
 * 用户secretKey
 */
private static final String SECRET_KEY = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB0";
/**
 * 元数据服务器地址（接入点地址）
 */
private static final String META_SERVER_ADDRESS = "127.0.0.1:18888";
/**
 * topic名称
 */
private static final String TOPIC = "testTopic";
/**
 * 消费组Id
 */
private static final String CONSUMER_GROUP_ID = "testConsumerGroup";
```


#### 当前代码: documentation/Middleware/Message-Queue/SDK-Rerference/Java-SDK/Produce-FIFO-Message.md
```java
package com.jcloud.jcq.sdk.demo;

import com.jcloud.jcq.protocol.Message;
import com.jcloud.jcq.sdk.JCQClientFactory;
import com.jcloud.jcq.sdk.auth.UserCredential;
import com.jcloud.jcq.sdk.producer.GlobalOrderProducer;
import com.jcloud.jcq.sdk.producer.ProducerConfig;
import com.jcloud.jcq.sdk.producer.model.SendBatchResult;
import com.jcloud.jcq.sdk.producer.model.SendResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * 全局顺序消息生产者 demo.
 * @date 2018-05-17
 */
public class GlobalOrderProducerDemo {
    private static final Logger logger = LoggerFactory.getLogger(GlobalOrderProducerDemo.class);
    /**
     * 用户accessKey
     */
    private static final String ACCESS_KEY = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0";
    /**
     * 用户secretKey
     */
    private static final String SECRET_KEY = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB0";
    /**
     * 元数据服务器地址（接入点地址）
     */
    private static final String META_SERVER_ADDRESS = "127.0.0.1:18888";
    /**
     * topic名称
     */
    private static final String TOPIC = "testTopic";

    public static void main(String[] args) throws Exception {
        // 创建全局顺序消息producer
        UserCredential userCredential = new UserCredential(ACCESS_KEY, SECRET_KEY);
        ProducerConfig producerConfig = ProducerConfig.builder()
                .metaServerAddress(META_SERVER_ADDRESS)
                .build();
        GlobalOrderProducer globalOrderProducer = JCQClientFactory.getInstance().createGlobalOrderProducer(userCredential, producerConfig);

        // 开启producer
        globalOrderProducer.start();

        // 创建message, 全局顺序消息不支持延迟投递属性设置
        Message message = new Message();
        message.setTopic(TOPIC);
        message.setBody(("this is message boy").getBytes());
        Message message1 = new Message();
        message1.setTopic(TOPIC);
        message1.setBody(("this is message1 boy").getBytes());

        // 设置message tag属性, 如有需要
        message.getProperties().put(MessageConstants.PROPERTY_TAGS, "TAG");
        
        // 同步发送单条消息
        SendResult sendResult = globalOrderProducer.sendMessage(message);
        logger.info("messageId:{}, resultCode:{}", sendResult.getMessageId(), sendResult.getResultCode());

        // 同步发送批量消息, 一批最多32条消息
        List<Message> messages = new ArrayList<>();
        messages.add(message);
        messages.add(message1);
        SendBatchResult sendBatchResult = globalOrderProducer.sendBatchMessage(messages);
        logger.info("messageIds:{}, resultCode:{}", sendBatchResult.getMessageIds(), sendBatchResult.getResultCode());
    }
}
```


#### 当前代码: documentation/Middleware/Message-Queue/SDK-Rerference/Java-SDK/Produce-Standard-Message.md
```java
package com.jcloud.jcq.sdk.demo;

import com.jcloud.jcq.common.constants.MessageConstants;
import com.jcloud.jcq.protocol.Message;
import com.jcloud.jcq.sdk.JCQClientFactory;
import com.jcloud.jcq.sdk.auth.UserCredential;
import com.jcloud.jcq.sdk.producer.Producer;
import com.jcloud.jcq.sdk.producer.ProducerConfig;
import com.jcloud.jcq.sdk.producer.async.AsyncSendBatchCallback;
import com.jcloud.jcq.sdk.producer.async.AsyncSendCallback;
import com.jcloud.jcq.sdk.producer.model.SendBatchResult;
import com.jcloud.jcq.sdk.producer.model.SendResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * 普通消息生产者 demo.
 * @date 2018-05-17
 */
public class ProducerDemo {
    private static final Logger logger = LoggerFactory.getLogger(ProducerDemo.class);
    /**
     * 用户accessKey
     */
    private static final String ACCESS_KEY = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0";
    /**
     * 用户secretKey
     */
    private static final String SECRET_KEY = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB0";
    /**
     * 元数据服务器地址（接入点地址）
     */
    private static final String META_SERVER_ADDRESS = "192.168.166.57:18888";
    /**
     * topic名称
     */
    private static final String TOPIC = "testTopic";

    public static void main(String[] args) throws Exception {
        // 创建普通消息producer
        UserCredential userCredential = new UserCredential(ACCESS_KEY, SECRET_KEY);
        ProducerConfig producerConfig = ProducerConfig.builder()
                .metaServerAddress(META_SERVER_ADDRESS)
                .build();
        Producer producer = JCQClientFactory.getInstance().createProducer(userCredential, producerConfig);

        // 开启producer
        producer.start();

        // 创建message
        Message message = new Message();
        message.setTopic(TOPIC);
        message.setBody(("this is message boy").getBytes());
        Message message1 = new Message();
        message1.setTopic(TOPIC);
        message1.setBody(("this is message1 boy").getBytes());

        // 设置message tag属性, 如有需要
        message.getProperties().put(MessageConstants.PROPERTY_TAGS, "TAG");

        // 设置message 延迟投递属性(单位second)，如有需要
        message.getProperties().put(MessageConstants.PROPERTY_DELAY_TIME, "1000");

        // 同步发送单条消息
        SendResult sendResult = producer.sendMessage(message);
        logger.info("messageId:{}, resultCode:{}", sendResult.getMessageId(), sendResult.getResultCode());

        // 异步发送单条消息
        producer.sendMessageAsync(message, new AsyncSendCallback() {
            @Override
            public void onResult(SendResult sendResult) {
                logger.info("messageId:{}, resultCode:{}", sendResult.getMessageId(), sendResult.getResultCode());
            }

            @Override
            public void onException(Throwable throwable) {
                logger.info("exception:{}", throwable);
            }
        });

        // 同步发送批量消息, 一批最多32条消息
        List<Message> messages = new ArrayList<>();
        messages.add(message);
        messages.add(message1);
        SendBatchResult sendBatchResult = producer.sendBatchMessage(messages);
        logger.info("messageIds:{}, resultCode:{}", sendBatchResult.getMessageIds(), sendBatchResult.getResultCode());

        // 异步发送批量消息，一批最多32条消息
        producer.sendBatchMessageAsync(messages, new AsyncSendBatchCallback() {
            @Override
            public void onResult(SendBatchResult sendBatchResult) {
                logger.info("messageIds:{}, resultCode:{}", sendBatchResult.getMessageIds(), sendBatchResult.getResultCode());
            }

            @Override
            public void onException(Throwable throwable) {
                logger.info("exception:{}", throwable);
            }
        });
    }
}
```


#### 当前代码: documentation/Middleware/Message-Queue/SDK-Rerference/Java-SDK/Pull-Consume-Messgae-SDK.md
```java
package com.jcloud.jcq.sdk.demo;

import com.jcloud.jcq.common.filter.FilterExpression;
import com.jcloud.jcq.common.message.AckAction;
import com.jcloud.jcq.sdk.JCQClientFactory;
import com.jcloud.jcq.sdk.auth.UserCredential;
import com.jcloud.jcq.sdk.consumer.PullConsumer;
import com.jcloud.jcq.sdk.consumer.PullConsumerConfig;
import com.jcloud.jcq.sdk.consumer.async.AsyncAckCallback;
import com.jcloud.jcq.sdk.consumer.async.AsyncPullCallback;
import com.jcloud.jcq.sdk.consumer.model.AckResult;
import com.jcloud.jcq.sdk.consumer.model.PullResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 拉取型消费者 demo.
 *
 * @date 2018-05-17
 */
public class PullConsumerDemo {
    private static final Logger logger = LoggerFactory.getLogger(PullConsumerDemo.class);
    /**
     * 用户accessKey
     */
    private static final String ACCESS_KEY = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0";
    /**
     * 用户secretKey
     */
    private static final String SECRET_KEY = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB0";
    /**
     * 元数据服务器地址
     */
    private static final String META_SERVER_ADDRESS = "127.0.0.1:18888";
    /**
     * topic名称
     */
    private static final String TOPIC = "testTopic";
    /**
     * 消费组Id
     */
    private static final String CONSUMER_GROUP_ID = "testConsumerGroup";

    public static void main(String[] args) throws Exception {
        // 创建拉取型消费者, 普通及全局顺序消息都适用
        UserCredential userCredential = new UserCredential(ACCESS_KEY, SECRET_KEY);
        PullConsumerConfig pullConsumerConfig = PullConsumerConfig.builder()
                .consumerGroupId(CONSUMER_GROUP_ID)
                .metaServerAddress(META_SERVER_ADDRESS)
                .build();
        PullConsumer pullConsumer = JCQClientFactory.getInstance().createPullConsumer(userCredential, pullConsumerConfig);
        pullConsumer.start();

        // 创建消费过滤条件，如果需要
        FilterExpression filterExpression = new FilterExpression();
        filterExpression.setExpressionType(FilterExpression.ExpressionType.TAG);
        filterExpression.setExpression("TAG1");

        // 同步拉取消息, 当需要指定tag作为过滤条件时，第二个参数填充具体的filterExpression
        PullResult pullResult = pullConsumer.pullMessage(TOPIC, null);
        logger.info("Sync pullResult.resultCode:{}, pullResult.ackIndex:{}, pullResult.messages:{}",
                pullResult.getResultCode(), pullResult.getAckIndex(), pullResult.getMessages());

        // 异步拉取消息,当需要指定tag作为过滤条件时，第二个参数填充具体的filterExpression
        pullConsumer.pullMessageAsync(TOPIC, null, new AsyncPullCallback() {
            @Override
            public void onResult(PullResult pullResult) {
                logger.info("Async pullResult.resultCode:{}, pullResult.ackIndex:{}, pullResult.messages:{}",
                        pullResult.getResultCode(), pullResult.getAckIndex(), pullResult.getMessages());
            }

            @Override
            public void onException(Throwable throwable) {
            }
        });

        // 同步ack消息
        AckResult ackResult = pullConsumer.ackMessage(TOPIC, pullResult.getAckIndex(), AckAction.SUCCESS);
        logger.info("Sync ackResult:{}", ackResult.getResultCode());

        // 异步ack消息
        pullConsumer.ackMessageAsync(TOPIC, pullResult.getAckIndex(), AckAction.SUCCESS, new AsyncAckCallback() {
            @Override
            public void onResult(AckResult ackResult) {
                logger.info("Async ackResult:{}", ackResult.getResultCode());
            }

            @Override
            public void onException(Throwable throwable) {
            }
        });
    }
}
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
cd /usr/src
svn co https://svn.ntop.org/svn/ntop/trunk/n2n
cd n2n/n2n_v2
make
make PREFIX=/opt/n2n install
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
# n2n服务端启动supernode
/opt/n2n/sbin/supernode -l 65530

# 写入开机自启动
echo "/opt/n2n/sbin/supernode -l 65530" >> /etc/rc.local
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
/opt/n2n/sbin/edge -d edge0 -a 10.10.10.101 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r
/opt/n2n/sbin/edge -d edge1 -a 192.168.100.101 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
/opt/n2n/sbin/edge -d edge0 -a 10.10.10.102 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r
/opt/n2n/sbin/edge -d edge1 -a 192.168.100.102 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
su - grid (oracle)
mkdir .ssh
chmod -R 700 .ssh
ssh-keygen -t rsa
ssh-keygen -t dsa
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
su - grid 
mkdir .ssh
chmod -R 700 .ssh
ssh-keygen -t rsa
ssh-keygen -t dsa
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys 
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
ssh oracle-rac2 cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys 
ssh oracle-rac2 cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
scp ~/.ssh/authorized_keys oracle-rac2:~/.ssh/authorized_keys
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
ssh oracle-rac1 date (public网卡)
ssh oracle-rac2 date
ssh oracle-rac1-priv date (private网卡)
ssh oracle-rac2-priv date
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
mkdir -p /u01/app/
mkdir -p /u01/app/grid_base
mkdir -p /u01/app/grid_home
chown -R grid:oinstall /u01/app/grid_base
chown -R grid:oinstall /u01/app/grid_home
chown -R oracle:oinstall /u01/app
chmod -R 775 /u01/app/
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
vi ~/.bash_profile
umask 022
export ORACLE_BASE=/u01/app/grid_base
export ORACLE_HOME=/u01/app/grid_home
export ORACLE_SID=+ASM1 #第二个节点+ASM2
export PATH=/usr/sbin:$PATH
export PATH=$ORACLE_HOME/bin:$PATH
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
rpm -ivh pdksh-5.2.14-21.x86_64.rpm
pdksh conflicts with ksh-20120801-37.el6_9.x86_64
rpm -e ksh-20120801-37.el6_9.x86_64
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
rpm -ivh cvuqdisk-1.0.9-1.rpm
依赖于：yum install -y smartmontools
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
rpm -ivh kmod-oracleasm-2.0.6.rh1-3.el6.x86_64.rpm
rpm -ivh oracleasm-support-2.1.8-1.el6.x86_64.rpm 
rpm -ivh oracleasmlib-2.0.4-1.el6.x86_64.rpm
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
echo "session required pam_limits.so" >> /etc/pam.d/login
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
chkconfig --list iptables
chkconfig iptables off
chkconfig --list iptables
service iptables stop
service network restart
echo "SELINUX=disabled" >>/etc/selinux/config
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
/sbin/service ntpd stop
chkconfig ntpd off
mv /etc/ntp.conf /etc/ntp.conf.bk
rm /var/run/ntpd.pid
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
/usr/sbin/oracleasm configure -i #两个节点
/etc/init.d/oracleasm enable #两个节点
/etc/init.d/oracleasm start #两个节点
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
/home/grid/grid/runcluvfy.sh stage -pre crsinst -n oracle-rac1,oracle-rac2 -verbose 
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
./runInstaller -silent -responseFile /home/grid/grid/response/grid_install_jdtest.rsp -ignoreSysPrereqs -ignorePrereq
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
/u01/grid/oraInventory/orainstRoot.sh
/u01/crs/11.2.0/root.sh
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
su – grid
asmca -silent -createDiskGroup -sysAsmPassword Grid123 -diskString '/dev/oracleasm/disks/*' -diskGroupName DATA -diskList '/dev/oracleasm/disks/VOLDATA01' -redundancy EXTERNAL -compatible.asm 11.2 -compatible.rdbms 11.2
asmca -silent -addDisk -sysAsmPassword Grid123 -diskGroupName DATA -diskList '/dev/oracleasm/disks/VOLDATA02','/dev/oracleasm/disks/VOLDATA03'
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
select name,path,STATE,GROUP_NUMBER 
from v$asm_disk;
select name,state,type,total_mb,free_mb 
from v$asm_diskgroup;
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
/home/grid/grid/runcluvfy.sh stage -pre dbinst -n oracle-rac1,oracle-rac2 -verbose
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
vi u01/soft/oracle/database/response/db_install_jdtest.rsp
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
./runInstaller -silent -ignoreSysPrereqs -ignorePrereq -responseFile /home/oracle/database/response/db_install_jdtest.rsp
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
/u01/app/oracle/product/11.2.0/db_1/root.sh
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
vi /u01/soft/oracle/database/response/dbca_jdtest.rsp
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
```
dbca -silent -responseFile /home/oracle/database/response/dbca_jdtest.rsp
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Key-Steps.md
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


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Setting-Multicase.md
```
svn co https://svn.ntop.org/svn/ntop/trunk/n2n
cd n2n/n2n_v2
make
make install
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Setting-Multicase.md
```
/opt/n2n/sbin/supernode -l 65530
# 写入开机自启动
echo "/opt/n2n/sbin/supernode -l 65530" >> /etc/rc.local
```


#### 当前代码: documentation/Solutions/Oracle-on-Cloud/Setting-Multicase.md
```
# 10.0.0.32为启动supernode服务服务节点的IP地址

# 节点1
/opt/n2n/sbin/edge -d edge0 -a 10.10.10.101 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r
/opt/n2n/sbin/edge -d edge1 -a 192.168.100.101 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r

# 节点2
/opt/n2n/sbin/edge -d edge0 -a 10.10.10.102 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r
/opt/n2n/sbin/edge -d edge1 -a 192.168.100.102 -s 255.255.255.0 -c dtstack -k dtstack -l 10.0.0.32:65530 -E -r
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/API-Log-download.md
```
curl -H "Content-type:application/json" -X POST -d '{"username":"test_user","signature":"d847267fc702273abf394dd0c3128d64","domain":"www.a.com,www.b.com","start_time":"2017-10-19 00:00","end_time":"2017-10-19 23:59","interval":"DAY"}' http://opencdn.jcloud.com/api/downloadUrlInterval
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/API-Log-download.md
```
https://opencdn.jcloud.com/api/downloadUrlInterval
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :" www.a.com,www.b.com ",
    "start_time" :"2017-10-19 00:00",
    "end_time" :"2017-10-19 23:59",
    "interval" :"DAY"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/API-Log-download.md
```
{
"status": 0,//0 表示本次请求成功
"data": [
{
"domain": "DOMAIN",//查询的域名, 不要包含 http://
"urls": [
[
"URL"//日志URL 
],
],
},
]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/API-Log-download.md
```
{
    "status": 0,
    "msg": "成功",
    "data": [
        {
            "domain": "www.a.com",
            "urls": [
                "http://oss.cn-north-1.jcloudcs.com/cdnuserlog/www.a.com/20171019.zip?Expires=1508753731&AccessKey=ImtdrS1VXMdkph&Signature=2br%2B5KwRY5Nk5YvLp7%2BfAwsQVAM%10D"
            ]
        },
        {
            "domain": " www.b.com ",
            "urls": [
                "http://oss.cn-north-1.jcloudcs.com/cdnuserlog/www.b.com/20171019.zip?Expires=1508753731&AccessKey=ImtsrS1VXMfeikph&Signature=HdM1weVHJbHuS%2FEiZm82o9GrZSY%6D"
            ]
        }
    ]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Area-isp-detail-statistics.md
```
https://opencdn.jcloud.com/api/area_isp_stat_v2
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com",
    "start_time" :"2016-12-14 07:00",
    "end_time" :"2016-12-14 12:59"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Area-isp-detail-statistics.md
```
{
"status": 0,//0 表示本次请求成功
"data": [
[
TS, //时间戳,
AREA, //区域
ISP, //运营商
BANDWIDTH, //带宽,单位:Mbps
flow，//流量，单位：MB
PV, //请求数
HIT_RATIO, //命中率, 类型: 浮点型, 如 0.5 表示 50%的命中率
{
CODE1: CODE1_COUNT, //CODE1 为具体的状态码,如 206, CODE1_COUNT
为 206 的个数,
CODE2: CODE2_COUNT, //CODE2 为具体的状态码,如 200, CODE2_COUNT
为 200 的个数
},
FST_PKG_TIME, //平均首包响应时间,单位:ms
SVG_SPEED, // 平均下载速度,单位:KB/s
],
]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Area-isp-detail-statistics.md
```
{

    "status": 0,
    "msg": "成功",
    "data": [
        {
            "domain": "www.a.com",
            "data": [
                {
                    "time": "1539227100",
                    "area": "hebei",
                    "isp": "cmcc",
                    "bandwidth": 0.7114295959472656,
                    "flow": 26.678627967834473,
                    "pv": 11876,
                    "hitratio": 1,
                    "codestat": {
                        "200": 11601,
                        "201": 0,
                        "206": 0,
                        "300": 0,
                        "301": 0,
                        "302": 0,
                        "304": 0,
                        "400": 0,
                        "403": 275,
                        "404": 0,
                        "408": 0,
                        "416": 0,
                        "499": 0,
                        "500": 0,
                        "501": 0,
                        "502": 0,
                        "503": 0,
                        "504": 0,
                        "other": 0
                    },
                    "firstpkgtime": 2.767766883647595,
                    "avgspeed": 569.2294921875
                },
                {
                    "time": "1539227100",
                    "area": "xinjiang",
                    "isp": "ct",
                    "bandwidth": 2.0854625701904297,
                    "flow": 78.20485877990723,
                    "pv": 11747,
                    "hitratio": 1.02,
                    "codestat": {
                        "200": 11747,
                        "201": 0,
                        "206": 0,
                        "300": 0,
                        "301": 0,
                        "302": 0,
                        "304": 0,
                        "400": 0,
                        "403": 0,
                        "404": 0,
                        "408": 0,
                        "416": 0,
                        "499": 0,
                        "500": 0,
                        "501": 0,
                        "502": 0,
                        "503": 0,
                        "504": 0,
                        "other": 0
                    },
                    "firstpkgtime": 0.9670554039944506,
                    "avgspeed": 1125.3603515625
                }
            ]
        }
    ]
}

```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Back-to-source-bandwidth.md
```
https://opencdn.jcloud.com/api/origin_ratio
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com,www.b.com",
    "start_time" :"2016-12-14 07:00",
    "end_time" :"2016-12-14 12:59"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Back-to-source-bandwidth.md
```
{
"status": 0,//0 表示本次请求成功
"data": [
{
"domain": "DOMAIN",//查询的域名, 不要包含 http://
"data": [
{
"time":TS,//时间戳
"bandwidth":BANDWIDTH,//带宽, Mbps
"originBandwidth":ORIGINBANDWIDTH,//回源带宽, Mbps
"originRatio":ORIGINRATIO,//占比，百分比，计算公式 (回源带宽/总带宽)*100
},
],
},
]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Back-to-source-bandwidth.md
```
{
    "status": 0,
    "msg": "成功",
    "data": [
        {
            "domain": "www.a.com",
            "data": [
                {
                    "time": 1513540200,
                    "originRatio": 23.62,
                    "originBandwidth": 1.53,
                    "bandwidth": 6.46
                },  
{
                    "time": 1513588500,
                    "originRatio": 6,
                    "originBandwidth": 0.81,
                    "bandwidth": 13.5
                }
            ]
        }
    ]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Change-Back-To-Source.md
```
curl -H “Content-type: application/json” -X POST -d ‘{“username”:“test_user”,“signature”:“914a3f412fd9bc1eec14bb5eb104d253”,“domain” :“www.b.com”, “type” :“web”,“sourceType” :“domain”,“source” :“[{’domain’:’source1.www.a.com’,’priority’:’1’},{’domain’:’source2.www.a.com’,’priority’:’2’}]”}’ http://opencdn.jcloud.com/api/changeSource
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Change-Back-To-Source.md
```
https://opencdn.jcloud.com/api/changeSource
* 域名回源示例
{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "type" :"web",
    "sourceType" :"domain",
    "source" :"[{'domain':'source1.a.com','priority':'1'},{'domain':'source2.a.com','priority':'2'}]"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Change-Back-To-Source.md
```
* IP回源示例

{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "type" :"web",
    "sourceType" :"ips",
    "source" :"[{'ip':'1.1.1.1','master':'1','ratio':0.6},{'ip':'2.2.2.2','master':'1','ratio':0.4},{'ip':'3.3.3.3','master':'2','ratio':'0.3'},{'ip':'4.4.4.4','master':'2','ratio':'0.7'}]"
 }
``` 


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Change-Back-To-Source.md
```
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Change-Cache-policy.md
```
 curl -H “Content-type: application/json” -X POST -d ‘{“username”:“test_user”,“signature”:“914a3f412fd9bc1eec14bb5eb104d253”,“domain” :“www.a.com”, “weight” :“1”, “ttl” :“7200”, “content” :“.jpg”}’ http://opencdn.jcloud.com/api/changeCache/add
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Change-Cache-policy.md
```
https://opencdn.jcloud.com/api/changeCache/add
{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "weight" :"1",
    "ttl" :"7200",
    "configId": "1303",//修改和删除时必填字段，新加缓存配置不需要
    "content" :".jpg"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Change-Cache-policy.md
```
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Change-Domain-Status.md
```
 curl -H “Content-type: application/json” -X POST -d ‘{“username”:“test_user”,“signature”:“914a3f412fd9bc1eec14bb5eb104d253”,“domain” :“www.b.com”}’ https://opencdn.jcloud.com/api/changeDomainStatus/start
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Change-Domain-Status.md
```
https://opencdn.jcloud.com/api/changeDomainStatus/start
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.b.com"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Change-Domain-Status.md
```
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Code-status.md
```
https://opencdn.jcloud.com/api/hcode
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com,www.b.com",
    "start_time" :"2016-12-14 07:00",
    "end_time" :"2016-12-14 12:59"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Code-status.md
```
{
"status": 0,//0 表示本次请求成功
"data": [
{
"domain": "DOMAIN",//查询的域名, 不要包含 http://
"data": [
[
TS,//时间戳
{
CODE1: CODE_COUNT1,//具体每个状态码对应的数量
CODE2: CODE_COUNT2,//CODE2 的数量为 CODE_COUNT2
...... // 这里的每个 codeN 代表一个状态码
日志状态码包括：
200/206/301/302/304/400/401/403/
404/416/499/500/502/503/504/0/000
}
],
],
},
]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Code-status.md
```
{
  "status": 0,
  "msg": "成功",
  "data": [
    {
      "domain": "www.a.com",
      "data": [
        {
          "200": 0,
          "201": 0,
          "206": 10,
          "301": 0,
          "302": 10,
          "400": 0,
          "403": 0,
          "404": 0,
          "408": 0,
          "500": 0,
          "501": 0,
          "502": 0,
          "503": 0,
          "504": 0,
          "other": 0,
          "time": 1480990500
        },
        {
          "200": 0,
          "201": 0,
          "206": 10,
          "301": 0,
          "302": 0,
          "400": 0,
          "403": 0,
          "404": 0,
          "408": 0,
          "500": 0,
          "501": 0,
          "502": 0,
          "503": 0,
          "504": 0,
          "other": 0,
          "time": 1480990800
        }
      ]
    },
    {
      "domain": "www.b.com",
      "data": [
        {
          "200": 11443930,
          "201": 0,
          "206": 16050,
          "301": 0,
          "302": 0,
          "400": 510,
          "403": 0,
          "404": 7630,
          "408": 0,
          "500": 0,
          "501": 0,
          "502": 0,
          "503": 0,
          "504": 0,
          "other": 709530,
          "time": 1480989900
        },
        {
          "200": 11068840,
          "201": 0,
          "206": 17470,
          "301": 0,
          "302": 0,
          "400": 600,
          "403": 0,
          "404": 5930,
          "408": 0,
          "500": 0,
          "501": 0,
          "502": 0,
          "503": 0,
          "504": 0,
          "other": 716170,
          "time": 1480990200
        },
      ]
    }
  ]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Creat-domain.md
```
curl -H "Content-type: application/json" -X POST -d '{"username":" testuser ","signature":"914a3f412fd9bc1eec14bb5eb104d253","domain" :"www.a.com","type" :"web","sourceType" :"ips","source" :"[{'ip':'1.1.1.1','priority':'master'},{'ip':'2.2.2.2','priority':'master'},{'ip':'3.3.3.3','priority':'slave'}]","backSourceType" :"http","dailyBandWidth" :200}' https://opencdn.jcloud.com/api/createDomain
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Creat-domain.md
```
{
    "username" :"testuser",
    "signature" :"914a3f412fd9bc1eec14bb5eb104d253",
    "domain" :"www.a.com",
    "type" :"web",
    "sourceType" :"ips",
    "source" :"[{'ip':'1.1.1.1','priority':'master'},{'ip':'2.2.2.2','priority':'master'},{'ip':'3.3.3.3','priority':'slave'}]",
    "backSourceType" :"http",
    "dailyBandWidth" :200
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Creat-domain.md
```
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com "
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Get-all-area-isp.md
```
https://opencdn.jcloud.com/api/region_name
{
    "username" :"test_user",
    "signature" :"dbc1c1302d0a1baa48a256cbfc840317"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Get-all-area-isp.md
```
{
"status": 0,//0 表示本次请求成功
"data":{
"mainLandChina":[//中国大陆
{
region,//地区
name//地区名
}
]
"operators":[//运营商
region,//运营商
name//运营商名
]
 "overseas": [  //海外
 region,//海外区域
name//海外区域名称
]

}
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Get-all-area-isp.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "mainLandChina": [
            {
                "region": "anhui",
                "name": "安徽"
            }
  {
                "region": "zhejiang",
                "name": "浙江"
            }
        ],
              "operators": [
            {
                "region": "cmcc",
                "name": "移动"
            },
            {
                "region": "cnc",
                "name": "联通"
            }
            {
                "region": "huashu",
                "name": "华数"
            }
        ],
        "overseas": [
            {
                "region": "gangaotai",
                "name": "港澳台"
            },
            {
                "region": "world",
                "name": "国外"
            }
        ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Prefetch.md
```
https://opencdn.jcloud.com/api/prefetch
{
    "username":"jcloud_00",
    "signature":"d847267fc702273abf699dd0c3128d64",
    "publish_urls":["http://jiekou.jcloud.com/text.css","http://jiekou.jcloud.com/text.js"]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Prefetch.md
```
{
  "status": 0,
  "msg": "成功",
  "taskid": "93820486-226d-459b-b33f-5124b566cab7"//任务id，查询预热任务时使用
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-Cache-policy.md
```
 curl -H “Content-type: application/json” -X POST -d ‘{“username”:“test_user”,“signature”:“914a3f412fd9bc1eec14bb5eb104d253”,“domain” :“www.b.com”}’ https://opencdn.jcloud.com/api/queryDomainCache
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-Cache-policy.md
```
https://opencdn.jcloud.com/api/queryDomainCache
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.b.com"
    
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-Cache-policy.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "total": 2,
        "cacheRules": [
            {
                "configId": "1304",
                "content": ".jpg",
                "ttl": 7200,
                "weight": 2
            },
            {
                "configId": "1305",
                "content":    ".wmv;.mp3;.wma;.ogg;.fiv;.mp4;.avi;.mpg;.mpeg;.f4v;.hlv;.rmvb;.rm;.3gp;.img;.m3u8;.ts",
                "ttl": 3600,
                "weight": 3
            }
        ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-Header.md
```
https://opencdn.jcloud.com/api/queryHttpHeaderConfig
{
    "username" :"use_test",
    "signature" :"1e28b8b4a1feddcacce74fa8b7131499",
    "domain":"www.a.com"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-Header.md
```
•json格式
{
    "status": 0,
    "msg": "成功",
    "data": {
        "headerContext": [
            {
                "headerName": "cache-control",//header头名称
                "headerType": "resp",
                "headerValue": "no-cache"
            },
            {
                "headerName": "Content-Type",
                "headerType": "resp",
                "headerValue": "web"
            }
        ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-IP-Blacklist.md
```
{
    "username": "user_test",
    "signature": "ca4c56f85e3582f4d814cc77949c82a7",
    "domain":"test.jcloud.com"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-IP-Blacklist.md
```
{
  "status": 0,
  "msg": "成功",
  "data": {
    "domain": "test.jcloud.com",
    "ipList": [
      "10.112.3.1",
      "10.112.3.2",
    ],
    "isOpen": "off"
  }
}

```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-bandwidth.md
```
https://opencdn.jcloud.com/api/bandwidth
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com,www.b.com",
    "start_time" :"2016-12-14 07:00",
    "end_time" :"2016-12-14 12:59"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-bandwidth.md
```
{
"status": 0,//0 表示本次请求成功
"data": [
{
"domain": "DOMAIN",//查询的域名, 不要包含 http://
"data": [
[
TS,//时间戳
BANDWIDTH,//带宽, Mbps
],
],
},
]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-bandwidth.md
```
{
  "status": 0,
  "msg": "成功",
  "data": [
    {
      "domain": "www.a.com",
      "data": [
        [
          1480989900,
          1
        ],
        [
          1480990200,
          301
        ],
        [
          1480990500,
          601
        ],
        [
          1480990800,
          901
        ]
      ]
    },
    {
      "domain": "www.b.com",
      "data": [
        [
          1480989900,
          100
        ],
        [
          1480990200,
          400
        ],
        [
          1480990500,
          700
        ],
        [
          1480990800,
          1000
        ]
      ]
    }
  ]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-billing.md
```
https://opencdn.jcloud.com/api/fee
{
    "username" :"test_user",
    "signature" :"8480204f27968a53d6dbfee99157339f",
    "domain" :"www.a.com",
    "start_time" :"2017-11-01 14:08",
    "end_time" :"2017-11-30 16:08",
    "type":3
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-billing.md
```
{
    "status": 0,//0 表示本次请求成功
    "msg": "成功",
    "data": {
        "domian": "www.a.com",//查询的域名, 不要包含 http://
        "data": {
            "feeData": 4787.29,//带宽, Mbps
            "feeTime": [
                "2017/11/23 19:15" //时间
            ]
        }
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-billing.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "domian": "www.a.com",
        "data": {
            "feeData": 4787.29,
            "feeTime": [
                "2017/11/23 19:15"
            ]
        }
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-domain-config.md
```
https://opencdn.jcloud.com/api/queryDomainConfigs

{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.b.com"
    
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-domain-config.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "rangeArgs": "on",
        "httpsCertificate": "",
        "httpsJumpType": "",
        "httpsRsaKey": "",
        "httpType": "http",
        "ignoreArgs": "on"
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-domain-detail.md
```
 curl -H “Content-type: application/json” -X POST -d ‘{“username”:“test_user”,“signature”:“914a3f412fd9bc1eec14bb5eb104d253”,“domain” :“www.a.com”}’ https://opencdn.jcloud.com/api/queryDomainDetail
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-domain-detail.md
```
https://opencdn.jcloud.com/api/queryDomainDetail
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com"
    
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-domain-detail.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "backSourceType": "http",
        "sourceType": "domain",
        "source": "[{\"priority\":2,\"domain\":\"source2.test1.a.com \"},  {\"priority\":1,\"domain\":\"source1. test1.a.com \"}]",
        "status": "部署中",
        "archiveNo": "京ICP备11041704号-6",
        "domain": "test1.a.com",
        "dailyBandWidth": 200,
        "type": "图片小文件",
        "cname": "test1.a.com.s.galileo.jcloud-cdn.com"
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-domain.md
```
curl -H “Content-type: application/json” -X POST -d ‘{“username”:“test_user”,“signature”:“914a3f412fd9bc1eec14bb5eb104d253”,“pageNumber”:1,“pageSize”:10}’ https://opencdn.jcloud.com/api/queryDomains
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-domain.md
```
https://opencdn.jcloud.com/api/queryDomains
{
    "username" :"test_user",
    "signature" :"b036e6094db32b5a5abc47e6be426c50",
    "pageNumber":1,
    "pageSize":10
   
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-domain.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "total": 10,
        "domains": [
            {
                "cname": "www.a.com.s.galileo.jcloud-cdn.com",
                "domain": "www.a.com",
                "status": "配置中",
                "type": "图片小文件"
            },
            {
                "cname": "www.b.com.s.galileo.jcloud-cdn.com",
                "domain": " www.b.com ",
                "status": "配置中",
                "type": "图片小文件"
            }
            ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-flow.md
```
https://opencdn.jcloud.com/api/flow
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com,www.b.com",
    "start_time" :"2016-12-14 07:00",
    "end_time" :"2016-12-14 12:59"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-flow.md
```
{
"status": 0,//0 表示本次请求成功
"data": [
{
"domain": "DOMAIN",//查询的域名, 不要包含 http://
"data": [
[
TS,//时间戳
FLOW,//流量,单位MB
HIT_FLOW//命中流量，单位MB
],
],
},
]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-flow.md
```
{
  "status": 0,
  "msg": "成功",
  "data": [
    {
      "domain": "www.a.com",
      "data": [
        [
          1480989960,
      1,
          1
        ],
        [
          1480990860,
      901,
          901
        ]
      ]
    },
    {
      "domain": "www.b.com",
      "data": [
        [
          1480989960,
      100,
          100
        ],
        [
          1480990860,
      1001,
          1000
        ]
      ]
    }
  ]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-node-ip.md
```
https://opencdn.jcloud.com/api/node_ip
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com,www.b.com"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-node-ip.md
```
 {
    "status": 0, //0 代表成功
    "message": "success",
    "data": {
    DOMAIN: [
    IP1,
    IP2,
    ],
    },
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-node-ip.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "www.a.com": [
            "1.1.1.1",
            "2.2.2.2"
        ],
        "www.b.com": [
            "3.3.3.3",
            "4.4.4.4"
             ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-prefetch.md
```
https://opencdn.jcloud.com/api/prefetchQuery
{
    "username":"jcloud_00",
    "signature":"d847267fc702273abf699dd0c3128d64",
    "taskid":"545ec2e2-e9e5-47b8-8f34-44c104a84fd3"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-prefetch.md
```
{
  "status": 0,
  "data": {
    "taskid": "545ec2e2-e9e5-47b8-8f34-44c104a84fd3",
    "status": 1,
    "msg": "进行中"
  }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-pv.md
```
https://opencdn.jcloud.com/api/pv
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com,www.b.com",
    "start_time" :"2016-12-14 07:00",
    "end_time" :"2016-12-14 12:59"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-pv.md
```
{
"status": 0,//0 表示本次请求成功
"data": [
{
"domain": "DOMAIN",//查询的域名, 不要包含 http://
"data": [
[
TS,//时间戳
PV,//请求数
HIT,//命中PV
],
],
},
]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-refresh.md
```
https://opencdn.jcloud.com/api/refreshQuery
{
    "username":"jcloud_00",
    "signature":"d847267fc702273abf699dd0c3128d64",
    "taskid":"545ec2e2-e9e5-47b8-8f34-44c104a84fd3"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-refresh.md
```
{
  "status": 0,
  "data": {
    "taskid": "545ec2e2-e9e5-47b8-8f34-44c104a84fd3",
    "status": 1,
    "msg": "进行中"
  }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-scheduling-relationship.md
```
https://opencdn.jcloud.com/api/area_isp_ip
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com,www.b.com"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-scheduling-relationship.md
```
 {
    "domain1":{ // 查询的第一个域名
    "isp1":{ // 运营商
    "area1":[ip1,ip2,ip3......], // 地区+ip， 需要列出所有当前放出的解析
    "area2":[ip4,ip5,ip6......]
    ......
    },
    "isp2":{
    "area1":[ip1,ip2,ip3......],
    ......
    },
    ......
    } "
    domain2":{
    "isp1":{
    "area1":[ip7,ip8,ip9......]
    ......
    } .
    .....
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-scheduling-relationship.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "ne-www.a.com": {
            "cmcc": {
                "yunnan": [
                    "1.1.1.1"
                ],
                "sichuan": [
                    "2.2.2.2",
                    "3.3.3.3"
                ]
            }
        },
        "www.a.com": {
            "cmcc": {
               "guangxi": [
                    "4.4.4.4"
                ],
                 "beijing": [
                    "5.5.5.5"
                ]
            }
        }
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-top-ip.md
```
https://opencdn.jcloud.com/api/queryTopIP
{
    "username" :"test_user",
    "signature" :"1e28b8b4a1feddcacce74fa8b7131499",
    "domain":"www.a.com",
    "start_time":"2017-12-18 00:00",
    "end_time":"2017-12-18 23:59",
    "topfield":"pv"
   
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-top-ip.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "count": 6,
        "list": [
            {
                "rank": 1,//top排名
                "pv": 12437657,//pv
                "flow": 6121.59,//流量
                "ip": "120.11.23.12"//TOPIP值
            }
        ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-top-ip.md
```
 {
    "status": 0,
    "msg": "成功",
    "data": {
        "count": 3,
        "list": [
            {
                "rank": 1,
                "pv": 12437657,
                "flow": 6121.59,
                "ip": "1.1.1.1"
            },
            {
                "rank": 2,
                "pv": 256271,
                "flow": 146.04,
                "ip": "2.2.2.2"
            },
            {
                "rank": 3,
                "pv": 46620,
                "flow": 54321.06,
                "ip": "3.3.3.3"
            }
        ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-top-url.md
```
https://opencdn.jcloud.com/api/queryTopUrl
{
    "username" :"test_user",
    "signature" :"1e28b8b4a1feddcacce74fa8b7131499",
    "domain":"www.a.com",
    "start_time":"2017-12-18 00:00",
    "end_time":"2017-12-18 23:59",
    "topfield":"pv",
    "params":"true"
   
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-top-url.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "count": 6,
        "list": [
            {
                "rank": 1,
                "pvRatio": 0.38,
                "pv": 44155,
                "flow": 51446.52,
                "flowRatio": 57.58,
                "url": "www.a.com/no-cache/resource.ppt",
                "bandwidth": 131.25
            },
            {
                "rank": 2,
                "pvRatio": 0.23,
                "pv": 27337,
                "flow": 31841.6,
                "flowRatio": 35.64,
                "url": " www.a.com /cdn-mon/resource.ppt",
                "bandwidth": 71.98
            }
            ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-top-url.md
```
 {
    "status": 0,
    "msg": "成功",
    "data": {
        "count": 6,
        "list": [
            {
                "rank": 1,
                "uv": 44191,
                "oridata": null,
                "pvRatio": 97.27,
                "pv": 12437657,
                "flow": 6121.59,
                "flowRatio": 5.33,
                "bandwidth": 6121.59,
                "url": "www.a.com/cdn-mon/monitor.html"
            },
            {
                "rank": 2,
                "uv": 153,
                "oridata": null,
                "pvRatio": 2,
                "pv": 256271,
                "flow": 146.04,
                "flowRatio": 0.13,
                "bandwidth": 6121.59,
                "url": "www.a.com/no-cache/monitor.html"
            },
            {
                "rank": 3,
                "uv": 4884,
                "oridata": null,
                "pvRatio": 0.36,
                "pv": 46620,
                "flow": 54321.06,
                "flowRatio": 47.32,
                "bandwidth": 6121.59,
                "url": "www.a.com/cdn-mon/resource.ppt"
            },
            {
                "rank": 4,
                "uv": 4875,
                "oridata": null,
                "pvRatio": 0.36,
                "pv": 46533,
                "flow": 54199.88,
                "flowRatio": 47.22,
                "bandwidth": 6121.59,
                "url": "www.a.com/no-cache/resource.ppt"
            },
            {
                "rank": 5,
                "uv": 5,
                "oridata": null,
                "pvRatio": 0,
                "pv": 7,
                "flow": 0.01,
                "flowRatio": 0,
                "bandwidth": 6121.59,
                "url": "www.a.com/"
            },
            {
                "rank": 6,
                "uv": 1,
                "oridata": null,
                "pvRatio": 0,
                "pv": 1,
                "flow": 0,
                "flowRatio": 0,
                "bandwidth": 6121.59,
                "url": "www.a.com/cdn-mon/monitor.jpg?Mon%20Dec%2018%202017%2000:08:48%20GMT+0800%20(CST)0.12802168394632263"
            }
        ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-total-data.md
```
{
    "username" :"test_user",
    "signature" :"dbc1c1302d0a1baa48a256cbfc840317",
    "domain":"www.a.com,www.b.com",
    "start_time":"2017-12-18 00:00",
    "end_time":"2017-12-18 23:59" 
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-total-data.md
```
{
    "status": 0,//0 表示本次请求成功
    "msg": "成功",
    "data": {
        "domian": "www.a.com,www.b.com",
        "data": {
            "oriflow": 19685.6,//回源流量, MB
            "hitflow": 57683.25,//命中流量, MB
            "oripvPercent": 0,//回源pv占比,%
            "oribandwidth": 5.78,//回源带宽，Mbps
            "oriflowPercent": 18,//回源流量占比，%
            "hitpv": 7454903,//命中pv
            "toptime": "2017-12-18 18:20:00",//峰值带宽时间点
            "pv": 8535492,//pv
            "uv": 300102,//uv
            "flow": 112124.61,//流量, MB
            "oripv": 0,//回源pv
            "bandwidth": 13.84//带宽, Mbps
        }
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-total-data.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "domian": "www.a.com,www.b.com",
        "data": {
            "oriflow": 19685.6,
            "hitflow": 57683.25,
            "oripvPercent": 0,
            "oribandwidth": 5.78,
            "oriflowPercent": 18,
            "hitpv": 7454903,
            "toptime": "2017-12-18 18:20:00",
            "pv": 8535492,
        "uv": 300102,
            "flow": 112124.61,
            "oripv": 0,
            "bandwidth": 13.84
        }
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-uv.md
```
https://opencdn.jcloud.com/api/area_isp_uv
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com,www.b.com",
    "start_time" :"2016-12-14 07:00",
    "end_time" :"2016-12-14 12:59"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-uv.md
```
{
"status": 0,
"data": [{
 "domain": //DOMAIN,
  "data": [
     { 
    "time":TS1,//时间戳1
    "area":AREA1, //区域1
    "isp":ISP1, //运营商1
    "uv": UV //UV数
    "pv": PV //PV数
    },
    ]
    },
]
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Query-uv.md
```
{
    "status": 0,
    "msg": "成功",
    "data": [
        {
            "domain": "www.a.com",
            "data": [
                {
                    "area": "zhejiang",
                    "isp": "ct",
                    "pv": 2153,
                    "time": "1513529100",
                    "uv": 0
                },
                {
                    "area": "zhejiang",
                    "isp": "cmcc",
                    "pv": 85,
                    "time": "1513529100",
                    "uv": 0
                },
                {
                    "area": "ningxia",
                    "isp": "ct",
                    "pv": 164,
                    "time": "1513530000",
                    "uv": 0
                }
            ]
        }
    ]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Refresh.md
```
https://opencdn.jcloud.com/api/refresh
{
    "username":"jcloud_00",
    "signature":"d847267fc702273abf699dd0c3128d64",
    "type":"file",
    "instances":["http://www.a.com/text1.css","http://www.a.com/text2.js"]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Refresh.md
```
{
  "status": 0,
  "msg": "成功",
  "taskid": "93820486-226d-459b-b33f-5124b566cab7"//任务id，查询刷新任务时使用
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Follow-302-Configuration.md
```
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com",
    "value" :"on"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Follow-302-Configuration.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "domain": "www.a.com",
        "requestId": "144791ff-3d4b-4850-a7d1-75907006290a",
        "follow302": "on"
    }
}

```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Follow-302-Configuration.md
```
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Follow-302-Configuration.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "domain": "www.a.com",
        "requestId": "144791ff-3d4b-4850-a7d1-75907006290a",
        "follow302": "on"
    }
}

```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Header.md
```
https://opencdn.jcloud.com/api/setHttpHeader
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain":"www.a.com",
    "headerType" :"resp",
    "headerName":"Cache-Control",
    "headerValue":'no-cache'
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Header.md
```
* json格式
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Header.md
```
https://opencdn.jcloud.com/api/batchSetHttpHeader
{
    "username" :"use_test",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain":"www.a.com",
    "headerContext" :[{'headerType':'resp','headerName':'Server','headerValue':'user CDN Server'},{'headerType':'req','headerName':'Cache-Control','headerValue':'no-cache'}]
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Header.md
```
json格式
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com" 
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-IP-Blacklist.md
```
{
    "username": "user_test",
    "signature": "ca4c56f85e3582f4d814cc77949c82a7",
    "domain":"test.jcloud.com",
    "ipList":[
        "1.1.1.1",
        "2.2.2.2"
        ]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-IP-Blacklist.md
```
{
    "status": 0,
    "msg": "成功",
    "data": "test.jcloud.com"
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-IgnoreArgs.md
```
{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "status" :"on"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-IgnoreArgs.md
```
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Protocol-Follow-Back-To-Origin.md
```
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com",
    "value" :"on"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Protocol-Follow-Back-To-Origin.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "domain": "www.a.com",
        "requestId": "144791ff-3d4b-4850-a7d1-75907006290a",
        "followStatus": "on"
    }
}

```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Protocol-Follow-Back-To-Origin.md
```
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-Protocol-Follow-Back-To-Origin.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "domain": "www.a.com",
        "requestId": "144791ff-3d4b-4850-a7d1-75907006290a",
        "followStatus": "on"
    }
}


```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-back-to-source-host.md
```
{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "sourceHost" :"sourcehost1.a.com"
 }

```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-back-to-source-host.md
```
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-http-type.md
```
curl -H “Content-type: application/json” -X POST -d ‘{“username”:“test_user”,“signature”:“914a3f412fd9bc1eec14bb5eb104d253”,“domain” :“www.a.com”,“httpType” :“https”,“certificate” :“start—-stop”,“rsaKey” :“start—stop”,“jumpType” :“https”}’ https://opencdn.jcloud.com/api/setHttpType
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-http-type.md
```
https://opencdn.jcloud.com/api/setHttpType
{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "httpType" :"https",
    "certificate" :"start----stop",
    "rsaKey" :"start---stop",
    "jumpType" :"https"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-http-type.md
```
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-range.md
```
{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "status" :"on"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-range.md
```
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-referer.md
```
{
    "username" :"test_user",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "referType" :"block",
    "referList" :"www.blanck1.com,www.blanck2.com",
    "allowEmpty" :"on"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/CDN-Open-API/Set-referer.md
```
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Area-isp-statistics.md
```
{
    "username" :"test_user",
    "signature" :"d847267fc702273abf394dd0c3128d64",
    "domain" :"www.a.com,www.b.com",
    "start_time" :"2016-12-14 07:00",
    "end_time" :"2016-12-14 12:59"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Area-isp-statistics.md
```
{
"status": 0,//0 表示本次请求成功
"data": [
[
TS, //时间戳,
AREA, //区域
ISP, //运营商
BANDWIDTH, //带宽,单位:Mbps
flow,//流量,单位:MB
],
]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Area-isp-statistics.md
```
{
    "status": 0,
    "msg": "成功",
    "data": [
        {
            "domain": "www.a.com",
            "data": [
                [
                    "1513533900",
                    "neimenggu",
                    "ct",
                    1.4548978805541992,
                    34.147540288671976,
                ],
                [
                    "1513533900",
                    "neimenggu",
                    "cmcc",
                    20,
                    29268.666015625
                ]

]
]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Change-Live-Back-To-Source.md
```
{
  "username": "jd_cdn",
  "signature": "7a9beb5119e1cb439208e444193d39ec",
  "domain":"a.jcloud.com",
  "sourceType":"ips",
  "source":{
  "ips": {
    "master": {
      "1.1.1.1": {
        "ratio": “”
      }
    }
  },
  "domain": {
    "a.baidu.com": {
      "priority": 1
    },
    "c.jd.com": {
      "priority": 2
    }
     }
    }
}

```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Change-Live-Back-To-Source.md
```
{
    "status": 0,
    "msg": "",
    "data": {
        "sourceType": "ips",
        "source": {
            "ips": {
                "master": {
                    "1.1.1.1": {
                        "ratio": 1
                        }
                    }
                },
                "domain": {
                    " a.baidu.com ": {
                        "priority": 1
                    },
                    "c.jd.com": {
                        "priority": 2
                    }
                }
            }
        }
    }

```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Change-Live-Domain-Status.md
```
{
    "username":"test_user",
    "signature":"7a9beb5119e1cb439208e444193d39ec",
    "domain":"www.b.com"
}
 
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Change-Live-Domain-Status.md
```
{
    "status": 0,
    "msg": "启动成功",
    "data": null
}

```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Creat-Live-Domain.md
```
{
    "username":"jcloud_username",
    "signature":"xxxxxxxxx",
    "siteType":"push/pull/mix",//业务模式， 推流模式，拉流模式，混合模式(推拉流模式)
    "domainType":"push/pull",  //本次添加的域名类型,业务模式为pull类型时，domainType只能为pull
    "domain":"newDomain.ex.com",//本次需要添加的域名
    "protocol":"rtmp/hls/hdl/all",//如果创建的是拉流域名，那么为必须的字段
    "referDomain":"xxxxx",//关联的推流域名，推流模式，混合模式下创建播放域名时，为必须的字段，其他情况非必须
    "sourceType":"ips/domain" , //ip or domain，混合模式和拉流模式下为必填
    "source":{   //回源信息配置
        "ips": {
            "master": {//所有ratio的配置项相加应该为1
                "1.1.1.1": {
                    "isp": "default",
                    "ratio": 0.25
                },
                "1.1.1.2": {
                    "isp": "CM",
                    "ratio": 0.49
                },
                "1.1.1.3": {
                    "isp": "CT",
                    "ratio": 0.43
                }
            },
            "slave": {
                "1.1.1.5": {
                    "isp": "default",
                    "ratio": 0.73
                },
                "1.1.1.6": {
                    "isp": "default",
                    "ratio": 0.76
                }
            }
        },
        "domain": {  //
            "a.jd.com": {"priority": 3},
            "c.jd.com": {"priority": 1}
         }
        }, 
    "forwardDomain":"forward.jcloud.com",
    "audioType":"AAC", //当前只支持AAC,非必填项
    "videoType":"H.264"   //当前只支持H.264,非必填项
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Creat-Live-Domain.md
```
{
    "username":"jcloud_username",
    "signature":"xxxxxxxxx",
    "siteType":"mix",//混合模式(推拉流模式)
    "domainType":"push",  //本次添加的域名类型:推流域名
    "domain":"push.ex.com",//本次需要添加的推流域名
    "forwardDomain":"forward.jcloud.com" //配置的转推域名，允许为空
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Creat-Live-Domain.md
```
{
    "username":"jcloud_username",
    "signature":"xxxxxxxxx",
    "siteType":"mix",//混合模式(推拉流模式)
    "domainType":"pull",  //本次添加的域名类型
    "domain":"pull.ex.com",//本次需要添加的域名
    "protocol":"rtmp",//如果创建的是拉流域名，那么为必须的字段
    "referDomain":"push.ex.com",//关联的推流域名
    "sourceType":"domain" , //ip or domain，混合模式和拉流模式下为必填
    "source":{   //回源信息配置
         "domain": {  
            "origin1.jcloud.com": {"priority": 3},
            "origin2.jcloud.com": {"priority": 1}
         }
     }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Creat-Live-Domain.md
```
{
    "username":"jcloud_username",
    "signature":"xxxxxxxxx",
    "siteType":"pull",//混合模式(推拉流模式)
    "domainType":"pull",  //本次添加的域名类型
    "domain":"pullRtmp.ex.com",//本次需要添加的域名
    "protocol":"rtmp",//如果创建的是拉流域名，那么为必须的字段
    "sourceType":"domain" , //ip or domain，混合模式和拉流模式下为必填
    "source":{   //回源信息配置
         "domain": {  
            "origin1.jcloud.com": {"priority": 3},
            "origin2.jcloud.com": {"priority": 1}
         }
     }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Creat-Live-Domain.md
```
{
    "username":"jcloud_username",
    "signature":"xxxxxxxxx",
    "siteType":"push",//推流模式
    "domainType":"push",  //本次添加的域名类型:推流域名
    "domain":"push1.ex.com",//本次需要添加的推流域名
    "forwardDomain":"forward.jcloud.com" //配置的转推域名，允许为空
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Creat-Live-Domain.md
```
{
    "username":"jcloud_username",
    "signature":"xxxxxxxxx",
    "siteType":"push",//混合模式(推拉流模式)
    "domainType":"pull",  //本次添加的域名类型
    "domain":"pullHls.ex.com",//本次需要添加的域名
    "protocol":"hls",//如果创建的是拉流域名，那么为必须的字段
    "referDomain":"push1.ex.com"//关联的推流域名
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Creat-Live-Domain.md
```
{
    "status": 0,
    "msg": "",
    "requestId":"xxxxxxxxxxxx",
    "data": {
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Creat-Live-Domain.md
```
{
    "status": 1 ,//或其他错误码
    "msg": "错误原因",
    "requestId":"xxxxxxxxxxxx",
    "data": {
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Permit-stream.md
```
{
    "username" :"jd_cdntest",
    "signature" :"914a3f412fd9bc1eec14bb5eb104d253",
    "domain" :"a.live.com",
    "deleteStreams" :[{'app':'App1','stream':'stream1'},{'app':'App2','stream':'stream2'}]
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Permit-stream.md
```
{
  "status": 0,
  "msg": "成功",
  "data": "a.live.com"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Query-Live-Domain-Config.md
```
{
    "username": "user_test",
    "signature": "7a9beb5119e1cb439208e444193d39ec",
    "domain":"test.jcloud.com"
    
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Query-Live-Domain-Config.md
```
{
    "status": 0,
    "msg": "",
    "data": {
        "accessKeyType": 0,
        "audioType": "AAC",
        "allowApps": "",
        "backSourceType": "",
        "blackIpList": "",
        "blackIpListEnable": "off",
        "ignoreQueryString": "off",
        "cname": "test.jcloud.com.live-publish.galileo.jcloud-cdn.com",
        "originDomain": "",
        "protocolConvert": "rtmp>http-flv,rtmp>http-hls",
        "siteType": "1",
        "source": "",
        "sourceType": "ips",
        "status": "configuring",
        "videoType": "H.264",
        "type": "live",
        "createTime": "2018-07-30T19:59:41",
        "forwardCustomVhost": "",
        "sourceHost": "",
        "archiveNo": "京ICP备11041704号-6",
        "referType": "block",
        "referList": "",
        "referAllowEmpty": "on",
        "referAllowNull": "on",
        "accesskeyKey": "",
        "pushIpWhiteList": "",
        "publishNormalTimeout": 0
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Query-bandwidth-flow.md
```
{
    "username" :" test_user ",
    "signature" :"f7e472560b470a8d1892ea57626390d6",
    "domain" :" play.live.com ",
    "start_time" :"2018-06-02 17:15,
    "end_time" :"2018-06-02  17:30"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Query-bandwidth-flow.md
```
{
    "username" :" test_user ",
    "signature" :" f7e472560b470a8d1892ea57626390d6",
    "domain" :" play.live.com",
    "start_time" :"2018-06-02  17:15",
    "end_time" :"2018-06-02 17:30"
}
{
    "status": 0,
    "msg": "成功",
    "data": [
        {
            "2018-06-02 17:15": {
                " play.live.com ": {
                    "bandwidth": 6.1,
                    "flow": 228.88
                }
            }
        },
        {
            "2018-06-02 17:20": {
                " play.live.com ": {
                    "bandwidth": 122.07,
                    "flow": 4577.64
                }
            }
        },
        {
            "2018-06-02 17:25": {
                " play.live.com ": {
                    "bandwidth": 122.07,
                    "flow": 4577.64
                }
            }
        },
        {
            "2018-06-02 17:30": {
                " play.live.com ": {
                    "bandwidth": 115.97,
                    "flow": 4348.75
                }
            }
        }
    ]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Query-forbidden.md
```
{
    "username" :"jd_cdntest",
    "signature" :"5fdd933ad652298f9f0fd4c87883e283",
    "domain" :"wshplay-113.live.com",
    "app":"live",
    "stream":"shitest1",
    "pageNumber":1,
    "pageSize":"100",
    "start_time" :"2018-05-31 00:05",
    "end_time" :"2018-06-01 21:49"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Query-forbidden.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "total": 1,
        "streams": [
            {
                "app": "live",
                "stream": "shitest1",
                "type": 2,
                "typeDes": "限时封禁",
                "startTime": "2018-06-01 15:41:23",
                "endTime": "2018-06-01 15:46:23",
                "time": 5
            }
        ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Query-online-Number.md
```
{
    "username":"user_test",
    "signature":"5ca1d52777132a008ae30de039ec8cac",
    "domain":"test.live.com",
    "app":"live",
    "stream":"",
    "startTime":"2018-08-14 16:33",
    "endTime":"2018-08-14 16:35",
    "isp":"",
    "area":"",
    "groupByDomain":"false",
    "period":"oneMin"
    
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Query-online-Number.md
```
{
    "status": 0,
    "msg": "",
    "data": [
        {
            "domain": "test.live.com",
            "data": [
                {
                    "startTime": "2018-08-14 16:33",
                    "endTime": "2018-08-14 16:34",
                    "area": "hubei",
                    "isp": "ct",
                    "pv": 9,
                    "onlineNumber": 2
                },
                {
                    "startTime": "2018-08-14 16:34",
                    "endTime": "2018-08-14 16:35",
                    "area": "hubei",
                    "isp": "ct",
                    "pv": 10,
                    "onlineNumber": 2
                }
            ]
        }
    ]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Query-stream-data.md
```
{
    "username" :"test_user",
    "signature" :"3a4eb9fc81c548bf6f2fea1b2b85f1df",
    "domain":"www.a.com",
    "start_time":"2018-05-16 16:56",
    "end_time":"2018-05-16 16:58",
    "app":"live",
    "stream":"test"
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Query-stream-data.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "domain": "DOMAIN",//域名
        "app": "APP",//APP名
        "starttime": "2018-05-16 16:56",
        "endtime": "2018-05-16 16:58",
        "data": [
            {
                "2018-05-16 16:57": {//时间
                    "steam1": {//流
                        "bit_rate": BIT_RATE,//实时码率单位kbps
                        "frame_rate": FRAME_RATE//实时帧率
                    }
                }
            },
            {
                "2018-05-16 16:58": {//时间
                    "stream1": {//流
                        "bit_rate": BIT_RATE,//实时码率单位kbps
                        "frame_rate": FRAME_RATE//实时帧率
                    }
                }
            },
     ]
    }
   }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Query-stream-data.md
```
{
    "status": 0,
    "msg": "成功",
    "data": {
        "domain": " www.a.com ",
        "app": "live",
        "starttime": "2018-05-16 16:56",
        "endtime": "2018-05-16 16:58",
        "data": [
            {
                "2018-05-16 16:57": {
                    "test": {
                        "bit_rate": 406,
                        "frame_rate": 25
                    }
                }
            },
            {
                "2018-05-16 16:58": {
                    "test": {
                        "bit_rate": 512,
                        "frame_rate":30
                    }
                }
            }
        ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Set-Access-Authentication.md
```
{
    "username": "user_test",
    "signature": "ca4c56f85e3582f4d814cc77949c82a7",
    "domain": "test.jcloud.com",
    "accessKey": "123456789",
    " authLifeTime ": " 1533818918 ",
    "accessKeyType": "1"
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Set-Access-Authentication.md
```
{
    "status": 0,
    "msg": "",
    "data": {
        "accessKeyType": 1,
        " authLifeTime ": " 1533818918 ",
        "accessKey": "123456789"
    }
}

```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Set-Push-IP-Whitelist.md
```
{
    "username": "user_test",
    "signature": "ca4c56f85e3582f4d814cc77949c82a7",
    "domain":"test.jcloud.com",
    "ipList":[
        "1.1.1.1",
        "2.2.2.2"
        ]
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Set-Push-IP-Whitelist.md
```
{
    "status": 0,
    "msg": "",
    "data": {
        "pushIpWhiteList": "1.1.1.1,2.2.2.2"
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Set-forbid-stream.md
```
{
    "username" :" test_user ",
    "signature" :"d00f58f89e8cd55dc080aec0d8051845",
    "domain" :"www.a.com",
    "app" :"live",
    "stream": "test17",
    "type" :2,
    "time" :60
 }
```


#### 当前代码: documentation/Storage-and-CDN/CDN/API-Reference/Live-Video-Open-Api/Set-forbid-stream.md
```
{
  "status": 0,
  "msg": "成功",
  "data": "www.a.com "
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-2-Compatibility-API.md
```
DELETE / HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-2-Compatibility-API.md
```
DELETE / HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Wed, 01 Mar  2006 12:00:00 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-2-Compatibility-API.md
```
HTTP/1.1 204 No Content
x-amz-request-id: 32FE2CEB32F5EE25
Date: Wed, 01 Mar  2006 12:00:00 GMT
Connection: close
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Cors-2.md
```
DELETE /?cors HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Cors-2.md
```
DELETE /?cors HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com
Date: Tue, 13 Dec 2011 19:14:42 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Cors-2.md
```
HTTP/1.1 204 No Content
x-amz-request-id: 0CF038E9BCF63097
Date: Tue, 13 Dec 2011 19:14:42 GMT
Server: JDCloudOSS
Content-Length: 0
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Encryption-2.md
```
DELETE /eric-jdcloud/?encryption HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com
Date: Wed, 06 Sep 2018 12:00:00 GMT
Authorization: authorization string  (使用签名版本4)

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Encryption-2.md
```
DELETE /eric-jdcloud/?encryption HTTP/1.1
Host: examplebucket.s3.cn-north-1.jcloudcs.com
Date: Wed, 06 Sep 2018 12:00:00 GMT
Authorization: signatureValue   (使用签名版本4)

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Encryption-2.md
```
HTTP/1.1 200 OK
Server: JDCloudOSS
Date: Wed, 14 Nov 2018 03:48:31 GMT
Content-Length: 0
Connection: keep-alive
x-req-id: 9DD9D36C74E86398
x-amz-request-id: 9DD9D36C74E86398


```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Lifecycle.md
```
DELETE /?lifecycle HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jcloudcs.com
Date: date
Authorization: authorization string
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Lifecycle.md
```
DELETE /?lifecycle HTTP/1.1·
Host: <BUCKET_NAME>.s3.<REGION>.jcloudcs.com
Date: date
Authorization: authorization string 
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Lifecycle.md
```
HTTP/1.1 204 No Content  
x-amz-request-id: 656c76696e672example  
Date: Wed, 11 Feb 2015 05:37:16 GMT
Connection: keep-alive  
Server: JDCloudOSS    
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Policy-2.md
```
DELETE /?policy HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Policy-2.md
```
DELETE /?policy HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Tue, 04 Apr 2010 20:34:56 GMT  
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Policy-2.md
```
HTTP/1.1 204 No Content 
x-amz-request-id: 656c76696e672SAMPLE5657374  
Date: Tue, 04 Apr 2010 20:34:56 GMT  
Connection: keep-alive  
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Replication-2.md
```
DELETE /?replication HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> 
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Replication-2.md
```
DELETE /?replication HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Wed, 11 Feb 2015 05:37:16 GMT
20150211T171320Z

Authorization: <authorization string> 
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Replication-2.md
```
HTTP/1.1 204 No Content  
x-amz-request-id: 656c76696e672example  
Date: Wed, 11 Feb 2015 05:37:16 GMT
Connection: keep-alive  
Server: JDCloudOSS    
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Website-2.md
```
DELETE /?website HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Website-2.md
```
DELETE ?website HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Thu, 27 Jan 2011 12:00:00 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Delete-Bucket-Website-2.md
```
HTTP/1.1 204 No Content
x-amz-request-id: AF1DD829D3B49707
Date: Thu, 03 Feb 2011 22:10:26 GMT
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/GET-Bucket-Acl-2.md
```
GET /?acl HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/GET-Bucket-Acl-2.md
```
GET ?acl HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Wed, 28 Oct 2009 22:32:00 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/GET-Bucket-Acl-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 318BC8BC148832E5
Date: Wed, 28 Oct 2009 22:32:00 GMT
Last-Modified: Sun, 1 Jan 2006 12:00:00 GMT
Content-Length: 124
Content-Type: text/plain
Connection: close
Server: JDCloudOSS

<AccessControlPolicy>
  <Owner>
    <ID>75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a</ID>
    <DisplayName>CustomersName@amazon.com</DisplayName>
  </Owner>
  <AccessControlList>
    <Grant>
      <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:type="CanonicalUser">
        <ID>75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a</ID>
        <DisplayName>CustomersName@amazon.com</DisplayName>
      </Grantee>
      <Permission>FULL_CONTROL</Permission>
    </Grant>
  </AccessControlList>
</AccessControlPolicy> 
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/GET-Bucket-Location.md
```
GET /?location HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jcloudcs.com
Date: date
Authorization: authorization string (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/GET-Bucket-Location.md
```
GET /?location HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jcloudcs.com
Date: Tue, 09 Oct 2007 20:26:04 +0000
Authorization: signatureValue
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/GET-Bucket-Location.md
```
<?xml version="1.0" encoding="UTF-8"?>
<LocationConstraint>huabei</LocationConstraint>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/GET-Bucket-Notification-2.md
```
GET /?notification HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version 4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/GET-Bucket-Notification-2.md
```
GET ?notification HTTP/1.1 
Host: oss-example.s3.<region>.jcloudcs.com
Date: Wed, 15 Oct 2014 16:59:03 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/GET-Bucket-Notification-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 236A8905248E5A02
Date: Wed, 15 Oct 2014 16:59:04 GMT
Server: JDcloudOSS
<?xml version="1.0" encoding="UTF-8"?>

<NotificationConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <TopicConfiguration>
        <Id>1</Id>
        <Filter>
            <S3Key>
                <FilterRule>
                    <Name>prefix</Name>
                    <Value>images/</Value>
                </FilterRule>
                <FilterRule>
                    <Name>suffix</Name>
                    <Value>.jpg</Value>
                </FilterRule>
           </S3Key>
        </Filter>
        <Topic>NS:http://116.196.97.17:1601/post/callback</Topic>
        <Event>s3:ObjectCreated:Put</Event>
    </TopicConfiguration>
</NotificationConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
GET /?list-type=2 HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
GET /?list-type=2 HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
x-amz-date: 20160430T233541Z
Authorization: <authorization string>
Content-Type: text/plain
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 3B3C7C725673C630
Date: Sat, 30 Apr 2016 23:29:37 GMT
Content-Type: application/xml
Content-Length: length
Connection: close
Server: JDCloudOSS

<?xml version="1.0" encoding="UTF-8"?>
<ListBucketResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <Name>oss-example</Name>
    <Prefix/>
    <KeyCount>205</KeyCount>
    <MaxKeys>1000</MaxKeys>
    <IsTruncated>false</IsTruncated>
    <Contents>
        <Key>my-image.jpg</Key>
        <LastModified>2009-10-12T17:50:30.000Z</LastModified>
        <ETag>&quot;fba9dede5f27731c9771645a39863328&quot;</ETag>
        <Size>434234</Size>
        <StorageClass>STANDARD</StorageClass>
    </Contents>
    <Contents>
       ...
    </Contents>
    ...
</ListBucketResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
GET /?list-type=2&max-keys=3&prefix=E&start-after=ExampleGuide.pdf HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
x-amz-date: 20160430T232933Z
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 3B3C7C725673C630
Date: Sat, 30 Apr 2016 23:29:37 GMT
Content-Type: application/xml
Content-Length: length
Connection: close
Server: JDCloudOSS

<?xml version="1.0" encoding="UTF-8"?>
<ListBucketResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Name>oss-example</Name>
  <Prefix>E</Prefix>
  <StartAfter>ExampleGuide.pdf</StartAfter>
  <KeyCount>1</KeyCount>
  <MaxKeys>3</MaxKeys>
  <IsTruncated>false</IsTruncated>
  <Contents>
    <Key>ExampleObject.txt</Key>
    <LastModified>2013-09-17T18:07:53.000Z</LastModified>
    <ETag>&quot;599bab3ed2c697f1d26842727561fd94&quot;</ETag>
    <Size>857</Size>
    <StorageClass>REDUCED_REDUNDANCY</StorageClass>
  </Contents>
</ListBucketResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
GET /?list-type=2&delimiter=/ HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
x-amz-date: 20160430T235931Z
Authorization: <authorization string>			
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
<ListBucketResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Name>oss-example</Name>
  <Prefix></Prefix>
  <KeyCount>2</KeyCount>
  <MaxKeys>1000</MaxKeys>
  <Delimiter>/</Delimiter>
  <IsTruncated>false</IsTruncated>
  <Contents>
    <Key>sample.jpg</Key>
    <LastModified>2011-02-26T01:56:20.000Z</LastModified>
    <ETag>&quot;bf1d737a4d46a19f3bced6905cc8b902&quot;</ETag>
    <Size>142863</Size>
    <StorageClass>STANDARD</StorageClass>
  </Contents>
  <CommonPrefixes>
    <Prefix>photos/</Prefix>
  </CommonPrefixes>
</ListBucketResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
GET /?list-type=2&prefix=photos/2006/&delimiter=/ HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
x-amz-date: 20160501T000433Z
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
<ListBucketResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Name>oss-example</Name>
  <Prefix>photos/2006/</Prefix>
  <KeyCount>3</KeyCount>
  <MaxKeys>1000</MaxKeys>
  <Delimiter>/</Delimiter>
  <IsTruncated>false</IsTruncated>
  <Contents>
    <Key>photos/2006/</Key>
    <LastModified>2016-04-30T23:51:29.000Z</LastModified>
    <ETag>&quot;d41d8cd98f00b204e9800998ecf8427e&quot;</ETag>
    <Size>0</Size>
    <StorageClass>STANDARD</StorageClass>
  </Contents>

  <CommonPrefixes>
    <Prefix>photos/2006/February/</Prefix>
  </CommonPrefixes>
  <CommonPrefixes>
    <Prefix>photos/2006/January/</Prefix>
  </CommonPrefixes>
</ListBucketResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
GET /?list-type=2 HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Mon, 02 May 2016 23:17:07 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 3B3C7C725673C630
Date: Sat, 30 Apr 2016 23:29:37 GMT
Content-Type: application/xml
Content-Length: length
Connection: close
Server: JDCloudOSS

<ListBucketResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Name>oss-example</Name>
  <Prefix></Prefix>
  <NextContinuationToken>1ueGcxLPRx1Tr/XYExHnhbYLgveDs2J/wm36Hy4vbOwM=</NextContinuationToken>
  <KeyCount>1000</KeyCount>
  <MaxKeys>1000</MaxKeys>
  <IsTruncated>true</IsTruncated>
  <Contents>
    <Key>happyface.jpg</Key>
    <LastModified>2014-11-21T19:40:05.000Z</LastModified>
    <ETag>&quot;70ee1738b6b21e2c8a43f3a5ab0eee71&quot;</ETag>
    <Size>11</Size>
    <StorageClass>STANDARD</StorageClass>
  </Contents>
   ...
</ListBucketResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
GET /?list-type=2 HTTP/1.1
GET /?list-type=2&continuation-token=1ueGcxLPRx1Tr/XYExHnhbYLgveDs2J/wm36Hy4vbOwM= HTTP/1.1

Host: oss-example.s3.<region>.jcloudcs.com 
Date: Mon, 02 May 2016 23:17:07 GMT
Authorization: <authorization string>  
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 3B3C7C725673C630
Date: Sat, 30 Apr 2016 23:29:37 GMT
Content-Type: application/xml
Content-Length: length
Connection: close
Server: JDCloudOSS

<ListBucketResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Name>oss-example</Name>
  <Prefix></Prefix>
  <ContinuationToken>1ueGcxLPRx1Tr/XYExHnhbYLgveDs2J/wm36Hy4vbOwM=</ContinuationToken>
  <KeyCount>112</KeyCount>
  <MaxKeys>1000</MaxKeys>
  <IsTruncated>false</IsTruncated>
  <Contents>
    <Key>happyfacex.jpg</Key>
    <LastModified>2014-11-21T19:40:05.000Z</LastModified>
    <ETag>&quot;70ee1738b6b21e2c8a43f3a5ab0eee71&quot;</ETag>
    <Size>1111</Size>
    <StorageClass>STANDARD</StorageClass>
  </Contents>
   ...
</ListBucketResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Cors-2.md
```
GET /?cors HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Cors-2.md
```
GET /?cors HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Tue, 13 Dec 2011 19:14:42 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Cors-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 0CF038E9BCF63097
Date: Tue, 13 Dec 2011 19:14:42 GMT
Server: JDCloudOSS
Content-Length: 280

<CORSConfiguration>
     <CORSRule>
       <AllowedOrigin>http://www.example.com</AllowedOrigin>
       <AllowedMethod>GET</AllowedMethod>
       <MaxAgeSeconds>3000</MaxAgeSec>
       <ExposeHeader>x-amz-server-side-encryption</ExposeHeader>
     </CORSRule>
</CORSConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Encryption-2.md
```
GET /eric-jdcloud/?encryption  HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com
Date: Wed, 06 Sep 2018 12:00:00 GMT
Authorization: authorization string  (使用签名版本4)
Content-Length:  0

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Encryption-2.md
 ```
HTTP/1.1 200 OK
Server: JDCloudOSS
Date: Wed, 14 Nov 2018 03:50:32 GMT
Content-Type: text/xml;charset=UTF-8
Content-Length: 292
Connection: keep-alive
Vary: Accept-Encoding
x-req-id: 9DFB131D1820AD65
x-amz-request-id: 9DFB131D1820AD65

<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ServerSideEncryptionConfiguration>
    <Rule>
        <ApplyServerSideEncryptionByDefault>
            <SSEAlgorithm>aws:kms</SSEAlgorithm>
        </ApplyServerSideEncryptionByDefault>
     </Rule>
</ServerSideEncryptionConfiguration>

 ```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Lifecycle.md
```
GET /?lifecycle HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jcloudcs.com
Date: date
Authorization: authorization string
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Lifecycle.md
```
GET /?lifecycle HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jcloudcs.com
Date: date
Authorization: authorization string
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Lifecycle.md
```
HTTP/1.1 200 OK
x-amz-request-id: 51991C342C575321
Date: Thu, 15 Nov 2012 00:17:23 GMT
Server: JDCloudOSS
Content-Length: length

<?xml version="1.0" encoding="UTF-8"?>
<LifecycleConfiguration>
    <Rule>
        <ID>delete rule</ID>
        <Filter>
           <Prefix>projectdocs/</Prefix>
        </Filter>
        <Status>Enabled</Status>
        <Expiration>
           <Days>3650</Days>
        </Expiration>
    </Rule>
</LifecycleConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Policy-2.md
```
GET /?policy HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Policy-2.md
```
GET ?policy HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Wed, 28 Oct 2009 22:32:00 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Policy-2.md
```
HTTP/1.1 200 OK   
x-amz-request-id: 656c76696e67SAMPLE57374  
Date: Tue, 04 Apr 2010 20:34:56 GMT  
Connection: keep-alive  
Server: JDCloudOSS  

{
"Version":"2008-10-17",
"Id":"aaaa-bbbb-cccc-dddd",
"Statement" : [
    {
        "Effect":"Deny",
        "Sid":"1", 
        "Principal" : {
            "AWS":["111122223333","444455556666"]
        },
        "Action":["s3:*"],
        "Resource":"arn:aws:s3:::bucket/*"
    }
 ] 
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Replication-2.md
```
GET /?replication HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> 
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Replication-2.md
```
GET /?replication HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: Tue, 10 Feb 2015 00:17:21 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Replication-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 51991C342example
Date: Tue, 10 Feb 2015 00:17:23 GMT
Server: JDCloudOSS
Content-Length: <length>

<?xml version="1.0" encoding="UTF-8"?>
<ReplicationConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Rule>
    <ID>rule1</ID>
    <Status>Enabled</Status>
    <Prefix></Prefix>
    <Destination>
      <Bucket>arn:aws:s3:::exampletargetbucket</Bucket>
      <StorageClass>STANDARD_IA</StorageClass>
    </Destination>
  </Rule>
  <Role>arn:aws:iam::35667example:role/CrossRegionReplicationRoleForS3</Role>
</ReplicationConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Website-2.md
```
GET /?website HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Website-2.md
```
GET ?website HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Thu, 27 Jan 2011 00:49:20 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Get-Bucket-Website-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 3848CD259D811111
Date: Thu, 27 Jan 2011 00:49:26 GMT
Content-Length: 240
Content-Type: application/xml
Transfer-Encoding: chunked
Server: JDCloudOSS

<?xml version="1.0" encoding="UTF-8"?>
<WebsiteConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <IndexDocument>
    <Suffix>index.html</Suffix>
  </IndexDocument>
  <ErrorDocument>
    <Key>404.html</Key>
  </ErrorDocument>
</WebsiteConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Head-Bucket-2.md
```
HEAD / HTTP/1.1     
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))    
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Head-Bucket-2.md
```
HEAD / HTTP/1.1
Date: Fri, 10 Feb 2012 21:34:55 GMT
Authorization: <authorization string>
Host: oss-example.s3.<region>.jcloudcs.com 
Connection: Keep-Alive
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Head-Bucket-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 32FE2CEB32F5EE25
Date: Fri, 10 2012 21:34:56 GMT
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/List-Multipart-Uploads-2.md
```
GET /?uploads HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <Date>
Authorization: <authorization string>			
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/List-Multipart-Uploads-2.md
```
GET /?uploads&max-uploads=3 HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Mon, 1 Nov 2010 20:34:56 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/List-Multipart-Uploads-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 656c76696e6727732072657175657374
Date: Mon, 1 Nov 2010 20:34:56 GMT
Content-Length: 1330
Connection: keep-alive
Server: JDCloudOSS

<?xml version="1.0" encoding="UTF-8"?>
<ListMultipartUploadsResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Bucket>bucket</Bucket>
  <KeyMarker></KeyMarker>
  <UploadIdMarker></UploadIdMarker>
  <NextKeyMarker>my-movie.m2ts</NextKeyMarker>
  <NextUploadIdMarker>YW55IGlkZWEgd2h5IGVsdmluZydzIHVwbG9hZCBmYWlsZWQ</NextUploadIdMarker>
  <MaxUploads>3</MaxUploads>
  <IsTruncated>true</IsTruncated>
  <Upload>
    <Key>my-divisor</Key>
    <UploadId>XMgbGlrZSBlbHZpbmcncyBub3QgaGF2aW5nIG11Y2ggbHVjaw</UploadId>
    <Initiator>
      <ID>arn:aws:iam::111122223333:user/user1-11111a31-17b5-4fb7-9df5-b111111f13de</ID>
      <DisplayName>user1-11111a31-17b5-4fb7-9df5-b111111f13de</DisplayName>
    </Initiator>
    <Owner>
      <ID>75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a</ID>
      <DisplayName>OwnerDisplayName</DisplayName>
    </Owner>
    <StorageClass>STANDARD</StorageClass>
    <Initiated>2010-11-10T20:48:33.000Z</Initiated>  
  </Upload>
  <Upload>
    <Key>my-movie.m2ts</Key>
    <UploadId>VXBsb2FkIElEIGZvciBlbHZpbmcncyBteS1tb3ZpZS5tMnRzIHVwbG9hZA</UploadId>
    <Initiator>
      <ID>b1d16700c70b0b05597d7acd6a3f92be</ID>
      <DisplayName>InitiatorDisplayName</DisplayName>
    </Initiator>
    <Owner>
      <ID>b1d16700c70b0b05597d7acd6a3f92be</ID>
      <DisplayName>OwnerDisplayName</DisplayName>
    </Owner>
    <StorageClass>STANDARD</StorageClass>
    <Initiated>2010-11-10T20:48:33.000Z</Initiated>
  </Upload>
  <Upload>
    <Key>my-movie.m2ts</Key>
    <UploadId>YW55IGlkZWEgd2h5IGVsdmluZydzIHVwbG9hZCBmYWlsZWQ</UploadId>
    <Initiator>
      <ID>arn:aws:iam::444455556666:user/user1-22222a31-17b5-4fb7-9df5-b222222f13de</ID>
      <DisplayName>user1-22222a31-17b5-4fb7-9df5-b222222f13de</DisplayName>
    </Initiator>
    <Owner>
      <ID>b1d16700c70b0b05597d7acd6a3f92be</ID>
      <DisplayName>OwnerDisplayName</DisplayName>
    </Owner>
    <StorageClass>STANDARD</StorageClass>
    <Initiated>2010-11-10T20:49:33.000Z</Initiated>
  </Upload>
</ListMultipartUploadsResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/PUT-Bucket-Notification-2.md
```
<NotificationConfiguration>
</NotificationConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/PUT-Bucket-Notification-2.md
```xml
PUT /?notification HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version 4))

<NotificationConfiguration>
    <TopicConfiguration>
        <Id>ConfigurationId</Id>
        <Filter>
            <S3Key>
                <FilterRule>
                    <Name>prefix</Name>
                    <Value>prefix-value</Value>
                </FilterRule>
                <FilterRule>
                    <Name>suffix</Name>
                    <Value>suffix-value</Value>
                </FilterRule>
           </S3Key>
        </Filter>
        <Topic>NS:endpoint1,endpoint2</Topic>
        <Event>event-type</Event>
        <Event>event-type</Event>
        ...
    </TopicConfiguration>
    <CloudFunctionConfiguration>   
        <Id>ConfigurationId</Id>
        <Filter>
	        ...
        </Filter>
        <CloudFunction>function-id</CloudFunction>    
        <Event>event-type</Event> 
        ...         
    </CloudFunctionConfiguration>  
    ...
</NotificationConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/PUT-Bucket-Notification-2.md
```xml
PUT /?notification HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com
Date: <date>
Authorization: <authorization string> 

<NotificationConfiguration>
    <TopicConfiguration>
        <Id>1</Id>
        <Filter>
            <S3Key>
                <FilterRule>
                    <Name>prefix</Name>
                    <Value>images/</Value>
                </FilterRule>
                <FilterRule>
                    <Name>suffix</Name>
                    <Value>.jpg</Value>
                </FilterRule>
           </S3Key>
        </Filter>
        <Topic>NS:http://116.196.97.17:1601/post/callback</Topic>
        <Event>s3:ObjectCreated:Put</Event>
    </TopicConfiguration>
</NotificationConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/PUT-Bucket-Notification-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: BB1BA8E12D6A80B7
Date: Mon, 13 Oct 2014 22:58:44 GMT
Content-Length: 0
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-2.md
```
PUT / HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Content-Length: <length>
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))

<CreateBucketConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/"> 
  <LocationConstraint>BucketRegion</LocationConstraint> 
</CreateBucketConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-2.md
```
PUT / HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Content-Length: 0
Date: Wed, 01 Mar  2006 12:00:00 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 236A8905248E5A01
Date: Wed, 01 Mar  2006 12:00:00 GMT

Location: /colorpictures
Content-Length: 0
Connection: close
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Cors-2.md
```
<CORSConfiguration>
 <CORSRule>
   <AllowedOrigin>http://www.example.com</AllowedOrigin>

   <AllowedMethod>PUT</AllowedMethod>
   <AllowedMethod>POST</AllowedMethod>
   <AllowedMethod>DELETE</AllowedMethod>

   <AllowedHeader>*</AllowedHeader>
 </CORSRule>
 <CORSRule>
   <AllowedOrigin>*</AllowedOrigin>
   <AllowedMethod>GET</AllowedMethod>
 </CORSRule>
</CORSConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Cors-2.md
```
<CORSConfiguration>
 <CORSRule>
   <AllowedOrigin>http://www.example.com</AllowedOrigin>
   <AllowedMethod>PUT</AllowedMethod>
   <AllowedMethod>POST</AllowedMethod>
   <AllowedMethod>DELETE</AllowedMethod>
   <AllowedHeader>*</AllowedHeader>
   <MaxAgeSeconds>3000</MaxAgeSeconds>
   <ExposeHeader>x-amz-server-side-encryption</ExposeHeader>
 </CORSRule>
</CORSConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Cors-2.md
```
PUT /?cors HTTP/1.1
Host: <Bucket>.s3.<region>.jcloudcs.com 
Content-Length: <length>
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
Content-MD5: <MD5>

<CORSConfiguration>
  <CORSRule>
    <AllowedOrigin>Origin you want to allow cross-domain requests from</AllowedOrigin>
    <AllowedOrigin>...</AllowedOrigin>
    ...
    <AllowedMethod>HTTP method</AllowedMethod>
    <AllowedMethod>...</AllowedMethod>
    ...
    <MaxAgeSeconds>Time in seconds your browser to cache the pre-flight OPTIONS response for a resource</MaxAgeSeconds>
    <AllowedHeader>Headers that you want the browser to be allowed to send</AllowedHeader>
    <AllowedHeader>...</AllowedHeader>
     ...
    <ExposeHeader>Headers in the response that you want accessible from client application</ExposeHeader>
    <ExposeHeader>...</ExposeHeader>
     ...
  </CORSRule>
  <CORSRule>
    ...
  </CORSRule>
    ...
</CORSConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Cors-2.md
```
PUT /?cors HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
x-amz-date: Tue, 21 Aug 2012 17:54:50 GMT
Content-MD5: 8dYiLewFWZyGgV2Q5FNI4W==
Authorization: authorization string
Content-Length: 216

<CORSConfiguration>
 <CORSRule>
   <AllowedOrigin>http://www.example.com</AllowedOrigin>
   <AllowedMethod>PUT</AllowedMethod>
   <AllowedMethod>POST</AllowedMethod>
   <AllowedMethod>DELETE</AllowedMethod>
   <AllowedHeader>*</AllowedHeader>
   <MaxAgeSeconds>3000</MaxAgeSec>
   <ExposeHeader>x-amz-server-side-encryption</ExposeHeader>
 </CORSRule>
 <CORSRule>
   <AllowedOrigin>*</AllowedOrigin>
   <AllowedMethod>GET</AllowedMethod>
   <AllowedHeader>*</AllowedHeader>
   <MaxAgeSeconds>3000</MaxAgeSeconds>
 </CORSRule>
</CORSConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Cors-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: BDC4B83DF5096BBE
Date: Tue, 21 Aug 2012 17:54:50 GMT
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Encryption-2.md
```
GET /eric-jdcloud/?encryption  HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com
Date: Wed, 06 Sep 2018 12:00:00 GMT
Authorization: authorization string  (使用签名版本4)
Content-Length:  length 

default encryption configuration in the request body

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Encryption-2.md
```
<ServerSideEncryptionConfiguration>
  <Rule>
    <ApplyServerSideEncryptionByDefault>
            <SSEAlgorithm>aws:kms</SSEAlgorithm>
    </ApplyServerSideEncryptionByDefault>
</Rule>
</ServerSideEncryptionConfiguration>

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Encryption-2.md
 ```
PUT /?encryption HTTP/1.1
Host: examplebucket.s3.amazonaws.com
Date: Wed, 06 Sep 2017 12:00:00 GMT
Authorization: authorization string
Content-Length: length

<ServerSideEncryptionConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/" >
  <Rule>
    <ApplyServerSideEncryptionByDefault>
        <SSEAlgorithm>aws:kms</SSEAlgorithm>
    </ApplyServerSideEncryptionByDefault>
  </Rule>
</ServerSideEncryptionConfiguration>

 ```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Encryption-2.md
  ```
HTTP/1.1 200 OK
Server: JDCloudOSS
Date: Wed, 14 Nov 2018 03:50:29 GMT
Content-Length: 0
Connection: keep-alive
x-req-id: A8D4BE3AD5D9B626
x-amz-request-id: A8D4BE3AD5D9B626

 ```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Lifecycle.md
```
PUT /?lifecycle HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jcloudcs.com
Content-Length: length
Date: date
Authorization: authorization string
Content-MD5: MD5
 
Lifecycle configuration in the request body
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Lifecycle.md
```
PUT /?lifecycle HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jcloudcs.com
Content-Length: length
Date: date
Authorization: authorization string
Content-MD5: MD5

<LifecycleConfiguration>
  <Rule>
    <ID>id1</ID>
    <Filter>
       <Prefix>documents/</Prefix>
    </Filter>
    <Status>Enabled</Status>
    <Expiration>
      <Days>365</Days>
    </Expiration>
  </Rule>
</LifecycleConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Lifecycle.md
```
HTTP/1.1 200 OK
x-amz-request-id: 9E26D08072A8EF9E
Date: Wed, 14 May 2014 02:11:22 GMT
Content-Length: 0
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Policy-2.md
```
PUT /?policy HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))

Policy written in JSON
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Policy-2.md
```
PUT /?policy HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com  
Date: Tue, 04 Apr 2010 20:34:56 GMT  
Authorization: <authorization string>

{
"Version":"2008-10-17",
"Id":"aaaa-bbbb-cccc-dddd",
"Statement" : [
    {
        "Effect":"Allow",
        "Sid":"1", 
        "Principal" : {
            "AWS":"arn:aws:iam::191853487641:root"
        },
        "Action":["s3:*"],
        "Resource":"arn:aws:s3:::bucket/*"
    }
 ] 
}

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Policy-2.md
```
HTTP/1.1 204 No Content  
x-amz-request-id: 656c76696e6727732SAMPLE7374  
Date: Tue, 04 Apr 2010 20:34:56 GMT  
Connection: keep-alive  
Server: JDCloudOSS  
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Replication-2.md
```
PUT /?replication HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Content-Length: <length>
Date: <date>
Authorization: <authorization string> 
Content-MD5: <MD5>

Replication configuration XML in the body
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Replication-2.md
```
<ReplicationConfiguration>
    <Role>IAM-role-ARN</Role>
    <Rule>
        <ID>Rule-1</ID>
        <Status>rule-status</Status>
        <Prefix>key-prefix</Prefix>
        <Destination>        
           <Bucket>arn:aws:s3:::bucket-name</Bucket>
           <StorageClass>optional-destination-storage-class-override</StorageClass>     
        </Destination>    
    </Rule>
    <Rule>
        <ID>Rule-2</ID>
         ...
    </Rule>
     ...
</ReplicationConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Replication-2.md
```
PUT /?replication HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Wed, 11 Feb 2015 02:11:21 GMT
Content-MD5: q6yJDlIkcBaGGfb3QLY69A==
Authorization: <authorization string>
Content-Length: 406

<ReplicationConfiguration>
  <Role>arn:aws:iam::35667example:role/CrossRegionReplicationRoleForS3</Role>
  <Rule>
    <ID>rule1</ID>
    <Prefix>TaxDocs</Prefix>
    <Status>Enabled</Status>
    <Destination>
      <Bucket>arn:aws:s3:::exampletargetbucket</Bucket>
    </Destination>
  </Rule>
</ReplicationConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Replication-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 9E26D08072A8EF9E
Date: Wed, 11 Feb 2015 02:11:22 GMT
Content-Length: 0
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Website-2.md
```
PUT /?website HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Content-Length: <ContentLength>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))

<WebsiteConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <!-- website configuration information. -->
</WebsiteConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Website-2.md
```
PUT ?website HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Content-Length: 256
Date: Thu, 27 Jan 2011 12:00:00 GMT
Authorization: <authorization string>

<WebsiteConfiguration xmlns='http://s3.amazonaws.com/doc/2006-03-01/'>
    <IndexDocument>
        <Suffix>index.html</Suffix>
    </IndexDocument>
    <ErrorDocument>
        <Key>SomeErrorDocument.html</Key>
    </ErrorDocument>
</WebsiteConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Website-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 80CD4368BD211111
Date: Thu, 27 Jan 2011 00:00:00 GMT
Content-Length: 0
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bucket-Website-2.md
```
PUT ?website HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Content-Length: 580
Date: Thu, 27 Jan 2011 12:00:00 GMT
Authorization: <authorization string>

<WebsiteConfiguration xmlns='http://s3.amazonaws.com/doc/2006-03-01/'>
  <IndexDocument>
    <Suffix>index.html</Suffix>
  </IndexDocument>
  <ErrorDocument>
    <Key>Error.html</Key>
  </ErrorDocument>

  <RoutingRules>
    <RoutingRule>
    <Condition>
      <HttpErrorCodeReturnedEquals>404</HttpErrorCodeReturnedEquals >
    </Condition>
    <Redirect>
      <HostName>ec2-11-22-333-44.compute-1.amazonaws.com</HostName>
      <ReplaceKeyPrefixWith>report-404/</ReplaceKeyPrefixWith>
    </Redirect>
    </RoutingRule>
  </RoutingRules>
</WebsiteConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bukcet-acl-2.md
```xml
PUT /?acl HTTP/1.1
x-amz-acl：Permission
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bukcet-acl-2.md
```xml
PUT /?acl HTTP/1.1
x-amz-acl：public-read
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Bucket/Put-Bukcet-acl-2.md
```xml
HTTP/1.1 200 OK
x-amz-request-id: 656c76696e672SAMPLE5657374  
Date: Tue, 04 Apr 2017 20:34:56 GMT  
Connection: keep-alive  
Server: JDCloudOSS

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Abort-Multipart-Upload-2.md
```
DELETE /ObjectName?uploadId=UploadId HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <Date>
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Abort-Multipart-Upload-2.md
```
DELETE /example-object?uploadId=VXBsb2FkIElEIGZvciBlbHZpbmcncyBteS1tb3ZpZS5tMnRzIHVwbG9hZ HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date:  Mon, 1 Nov 2010 20:34:56 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Abort-Multipart-Upload-2.md
```
HTTP/1.1 204 OK
x-amz-request-id: 996c76696e6727732072657175657374
Date:  Mon, 1 Nov 2010 20:34:56 GMT
Content-Length: 0
Connection: keep-alive
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Complete-Multipart-Upload-2.md
```
POST /ObjectName?uploadId=UploadId HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <Date>
Content-Length: <Size>
Authorization: <authorization string>

<CompleteMultipartUpload>
  <Part>
    <PartNumber>PartNumber</PartNumber>
    <ETag>ETag</ETag>
  </Part>
  ...
</CompleteMultipartUpload>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Complete-Multipart-Upload-2.md
```
POST /example-object?uploadId=AAAsb2FkIElEIGZvciBlbHZpbmcncyWeeS1tb3ZpZS5tMnRzIRRwbG9hZA HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date:  Mon, 1 Nov 2010 20:34:56 GMT
Content-Length: 391
Authorization: <authorization string>

<CompleteMultipartUpload>
  <Part>
    <PartNumber>1</PartNumber>
    <ETag>"a54357aff0632cce46d942af68356b38"</ETag>
  </Part>
  <Part>
    <PartNumber>2</PartNumber>
    <ETag>"0c78aef83f66abc1fa1e8477f296d394"</ETag>
  </Part>
  <Part>
    <PartNumber>3</PartNumber>
    <ETag>"acbd18db4cc2f85cedef654fccc4a4d8"</ETag>
  </Part>
</CompleteMultipartUpload>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Complete-Multipart-Upload-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 656c76696e6727732072657175657374
Date: Mon, 1 Nov 2010 20:34:56 GMT
Connection: close
Server: JDCloudOSS

<?xml version="1.0" encoding="UTF-8"?>
<CompleteMultipartUploadResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Location>http://Example-Bucket.s3.amazonaws.com/Example-Object</Location>
  <Bucket>Example-Bucket</Bucket>
  <Key>Example-Object</Key>
  <ETag>"3858f62230ac3c915f300c664312c11f-9"</ETag>
</CompleteMultipartUploadResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Delete-Multiple-Objects-2.md
```
POST /?delete HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Authorization: <authorization string>
Content-Length: <Size>
Content-MD5: <MD5>

<?xml version="1.0" encoding="UTF-8"?>
<Delete>
    <Quiet>true</Quiet>
    <Object>
         <Key>Key</Key>
         <VersionId>VersionId</VersionId>
    </Object>
    <Object>
         <Key>Key</Key>
    </Object>
    ...
</Delete>			
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Delete-Multiple-Objects-2.md
```
POST /?delete HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Accept: */*
x-amz-date: Wed, 30 Nov 2011 03:39:05 GMT
Content-MD5: p5/WA/oEr30qrEEl21PAqw==
Authorization: <authorization string>
Content-Length: 125
Connection: Keep-Alive

<Delete>
  <Object>
    <Key>sample1.txt</Key>
  </Object>
  <Object>
    <Key>sample2.txt</Key>
  </Object>
</Delete>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Delete-Multiple-Objects-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: A437B3B641629AEE
Date: Fri, 02 Dec 2011 01:53:42 GMT
Content-Type: application/xml
Server: JDCloudOSS
Content-Length: 251

<?xml version="1.0" encoding="UTF-8"?>
<DeleteResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Deleted>
    <Key>sample1.txt</Key>
  </Deleted>
  <Error>
    <Key>sample2.txt</Key>
    <Code>AccessDenied</Code>
    <Message>Access Denied</Message>
  </Error>
</DeleteResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Delete-Object-2.md
```
DELETE /ObjectName HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Content-Length: <length>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Delete-Object-2.md
```
DELETE /my-second-image.jpg HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Wed, 12 Oct 2009 17:50:00 GMT
Authorization: <authorization string>
Content-Type: text/plain
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Delete-Object-2.md
```
HTTP/1.1 204 NoContent
x-amz-request-id: 0A49CE4060975EAC
Date: Wed, 12 Oct 2009 17:50:00 GMT
Content-Length: 0
Connection: close
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Get-Object-2.md
```
GET /ObjectName HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
Range:bytes=<byte_range>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Get-Object-2.md
```
GET /my-image.jpg HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Mon, 3 Oct 2016 22:32:00 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Get-Object-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 318BC8BC148832E5
Date: Mon, 3 Oct 2016 22:32:00 GMT
Last-Modified: Wed, 12 Oct 2009 17:50:00 GMT
ETag: "fba9dede5f27731c9771645a39863328"
Content-Length: 434234

[434234 bytes of object data]
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Head-Object-2.md
```
HEAD /ObjectName HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
Date: <date>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Head-Object-2.md
```
HEAD /my-image.jpg HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Wed, 28 Oct 2009 22:32:00 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Head-Object-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 318BC8BC143432E5
Date: Wed, 28 Oct 2009 22:32:00 GMT
Last-Modified: Sun, 1 Jan 2006 12:00:00 GMT
ETag: "fba9dede5f27731c9771645a39863328"
Content-Length: 434234
Content-Type: text/plain
Connection: close
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Initiate-Multipart-Upload-2.md
```
POST /ObjectName?uploads HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Initiate-Multipart-Upload-2.md
```
POST /example-object?uploads HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Mon, 1 Nov 2010 20:34:56 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Initiate-Multipart-Upload-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 656c76696e6727732072657175657374
Date:  Mon, 1 Nov 2010 20:34:56 GMT
Content-Length: 197
Connection: keep-alive
Server: JDCloudOSS

<?xml version="1.0" encoding="UTF-8"?>
<InitiateMultipartUploadResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Bucket>example-bucket</Bucket>
  <Key>example-object</Key>
  <UploadId>VXBsb2FkIElEIGZvciA2aWWpbmcncyBteS1tb3ZpZS5tMnRzIHVwbG9hZA</UploadId>
</InitiateMultipartUploadResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/List-Parts-2.md
```
GET /ObjectName?uploadId=UploadId HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/List-Parts-2.md
```
GET /example-object?uploadId=XXBsb2FkIElEIGZvciBlbHZpbmcncyVcdS1tb3ZpZS5tMnRzEEEwbG9hZA&max-parts=2&part-number-marker=1 HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Mon, 1 Nov 2010 20:34:56 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/List-Parts-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 656c76696e6727732072657175657374
Date: Mon, 1 Nov 2010 20:34:56 GMT
Content-Length: 985
Connection: keep-alive
Server: JDCloudOSS

<?xml version="1.0" encoding="UTF-8"?>
<ListPartsResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Bucket>example-bucket</Bucket>
  <Key>example-object</Key>
  <UploadId>XXBsb2FkIElEIGZvciBlbHZpbmcncyVcdS1tb3ZpZS5tMnRzEEEwbG9hZA</UploadId>
  <Initiator>
      <ID>arn:aws:iam::111122223333:user/some-user-11116a31-17b5-4fb7-9df5-b288870f11xx</ID>
      <DisplayName>umat-user-11116a31-17b5-4fb7-9df5-b288870f11xx</DisplayName>
  </Initiator>
  <Owner>
    <ID>75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a</ID>
    <DisplayName>someName</DisplayName>
  </Owner>
  <StorageClass>STANDARD</StorageClass>
  <PartNumberMarker>1</PartNumberMarker>
  <NextPartNumberMarker>3</NextPartNumberMarker>
  <MaxParts>2</MaxParts>
  <IsTruncated>true</IsTruncated>
  <Part>
    <PartNumber>2</PartNumber>
    <LastModified>2010-11-10T20:48:34.000Z</LastModified>
    <ETag>"7778aef83f66abc1fa1e8477f296d394"</ETag>
    <Size>10485760</Size>
  </Part>
  <Part>
    <PartNumber>3</PartNumber>
    <LastModified>2010-11-10T20:48:33.000Z</LastModified>
    <ETag>"aaaa18db4cc2f85cedef654fccc4a4x8"</ETag>
    <Size>10485760</Size>
  </Part>
</ListPartsResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Post-Object-2.md
```
POST / HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com
Content-Length: length
Content-Type: multipart/form-data; boundary=your_boundary
 
--your_boundary
Content-Disposition: form-data; name="key"
 
object_key
--your_boundary
Content-Disposition: form-data; name="X-Amz-Credential"
 
<your accessKey>/<date>/<region>/s3/aws4_request
--your_boundary
Content-Disposition: form-data; name="X-Amz-Algorithm"
 
AWS4-HMAC-SHA256
--your_boundary
Content-Disposition: form-data; name="X-Amz-Date"
 
date
--your_boundary 
Content-Disposition: form-data; name="Policy"
 
base64Encoded_policy
--your_boundary
Content-Disposition: form-data; name="X-Amz-Signature"
 
signature
--your_boundary
Content-Disposition: form-data; name="file"; filename=<filename>
Content-Type: content_type
 
file_content
--your_boundary
Content-Disposition: form-data; name="submit"
Upload to OSS
--your_boundary--
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Post-Object-2.md
```
POST / HTTP/1.1
Host: testBucket.s3. cn-north-1.jcloudcs.com
Content-Length: length
Content-Type: multipart/form-data; boundary=123456789000
--123456789000
Content-Disposition: form-data; name="key"
test.txt
--123456789000
Content-Disposition: form-data; name="X-Amz-Credential"
AKIAIOSFODNN7EXAMPLEYYYYYYYYYYYY/20180601/cn-north-1/s3/aws4_request
--123456789000
Content-Disposition: form-data; name="X-Amz-Algorithm"
AWS4-HMAC-SHA256
--123456789000
Content-Disposition: form-data; name="X-Amz-Date"
20180601T000000Z
--123456789000
Content-Disposition: form-data; name="Policy"
eyJjb25kaXRpb25zIjpbeyJidWNrZXQiOiJ5b3VoZS10ZXN0In0sWyJzdGFydHMtd2l0aCIsIiRrZXkiLCJwb3N0LyJdLHsic3VjY2Vzc19hY3Rpb25fc3RhdHVzIjoiMjAxIn0seyJ4LWFtei1jcmVkZW50aWFsIjoiQUtJQUkyTUtVS0ZFUjRMNEJaNFEvMjAxODA3MTUvdXMtd2VzdC0xL3MzL2F3czRfcmVxdWVzdCJ9LHsieC1hbXotYWxnb3JpdGhtIjoiQVdTNC1ITUFDLVNIQTI1NiJ9LHsieC1hbXotZGF0ZSI6IjIwMTgwNzE1VDAzNTcyN1oifSxbImNvbnRlbnQtbGVuZ3RoLXJhbmdlIiwiMCIsIjkiXV0sImV4cGlyYXRpb24iOiIyMDE4LTA3LTMwVDEyOjAwOjAwLjAwMFoifQ==
--123456789000
Content-Disposition: form-data; name="X-Amz-Signature"
1b336b54bb3c7800f2137ee5b2d5d7ee676376800d388a17004ec2bee607897a
--123456789000
Content-Disposition: form-data; name="file"; filename=”d:/ test.txt”
Content-Type: text/plain
wrwe
--123456789000
Content-Disposition: form-data; name="submit"
Upload to OSS
--123456789000--

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Post-Object-2.md
```
<?xml version="1.0" encoding="utf-8"?>
<PostResponse>
  <Bucket>testBucket</Bucket>
  <Key>test.txt</Key>
  <ETag>"1b6be8aac90401fe1cd5e4dd1c4b138f"</ETag>
  <Location>http://s3.cn-north-1.jcloudcs.com/testBucket/test.txt</Location>
</PostResponse>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Post-Object-2.md
```
{ "expiration": "2018-12-01T12:00:00.000Z",
  "conditions":
    {"bucket": "myBucketName" },
    ["starts-with", "$key", "user/yuyu/"],
  ]
}

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Post-Object-2.md
```
{
	"expiration": "<expiration> example:2018-08-30T12:00:00.000Z",
	"conditions": [
		{"bucket": "<your bucket>"},
		["starts-with", "$key", "<your objectKey prefix>"], 
		{"Content-Type": "<type> example:image/jpeg"}, 
		{"X-Amz-Credential": "<your accessKey>/<date> example:20180709/<region>/s3/aws4_request"}, 
		{"X-Amz-Algorithm": "AWS4-HMAC-SHA256"}, 
		{"X-Amz-Date": "<date> example:20180709T053727Z"}
	]
}

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Post-Object-2.md
```
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>
  <body>

  <form action="http://<your bucket>.s3.<region>.jcloudcs.com/" method="post" enctype="multipart/form-data">
    // Key to upload: 
    <input type="input"  name="key" value="<your objectKey>" />
    Content-Type: 
	<input type="input"  name="Content-Type" value="<type> example:image/jpeg" />
    <input type="text"   name="X-Amz-Credential" value="<your accessKey>/<date> example:20180709/<region>/s3/aws4_request" />
    <input type="text"   name="X-Amz-Algorithm" value="AWS4-HMAC-SHA256" />
    <input type="text"   name="X-Amz-Date" value="<date> example:20180709T053727Z" />
	<input type="hidden" name="Policy" value='<base64 policy>' />
    <input type="hidden" name="X-Amz-Signature" value="<signature>" />
    // File: 
    <input type="file"   name="file" /> 
    <!-- The elements after this will be ignored -->
    <input type="submit" name="submit" value="Upload to Amazon S3" />
  </form>
  
</html>

``` 


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Put-Object-2.md
```
PUT /ObjectName HTTP/1.1
Host: <bucket>.s3.<region>.jcloudcs.com
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Put-Object-2.md
```
PUT /my-image.jpg HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Wed, 12 Oct 2009 17:50:00 GMT
Authorization: <authorization string>
Content-Type: text/plain
Content-Length: 11434
Expect: 100-continue
[11434 bytes of object data]
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Put-Object-2.md
```
HTTP/1.1 100 Continue

HTTP/1.1 200 OK
x-amz-request-id: 0A49CE4060975EAC
Date: Wed, 12 Oct 2009 17:50:00 GMT
ETag: "1b2cf535f27731c974343645a3985328"
Content-Length: 0
Connection: close
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Put-Object-Copy-2.md
```
PUT /destinationObject HTTP/1.1
Host: <destinationBucket>.s3.<region>.jcloudcs.com 
x-amz-copy-source: /source_bucket/sourceObject
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
Date: <date>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Put-Object-Copy-2.md
```
PUT /my-second-image.jpg HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date: Wed, 28 Oct 2009 22:32:00 GMT
x-amz-copy-source: /bucket/my-image.jpg
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Put-Object-Copy-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 318BC8BC148832E5
Date: Wed, 28 Oct 2009 22:32:00 GMT
Connection: close
Server: JDCloudOSS

<CopyObjectResult>
   <LastModified>2009-10-28T22:32:00</LastModified>
   <ETag>"9b2cf535f27731c974343645a3985328"</ETag>
</CopyObjectResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Upload-Part-2.md
```
PUT /ObjectName?partNumber=PartNumber&uploadId=UploadId HTTP/1.1
Host: <Bucket>.s3.<region>.jcloudcs.com 
Date: <date>
Content-Length: <Size>
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Upload-Part-2.md
```
PUT /my-movie.m2ts?partNumber=1&uploadId=VCVsb2FkIElEIGZvciBlbZZpbmcncyBteS1tb3ZpZS5tMnRzIHVwbG9hZR HTTP/1.1
Host: oss-example.s3.<region>.jcloudcs.com 
Date:  Mon, 1 Nov 2010 20:34:56 GMT
Content-Length: 10485760
Content-MD5: pUNXr/BjKK5G2UKvaRRrOA==
Authorization: <authorization string>

***part data omitted***
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Upload-Part-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 656c76696e6727732072657175657374
Date:  Mon, 1 Nov 2010 20:34:56 GMT
ETag: "b54357faf0632cce46e942fa68356b38"
Content-Length: 0
Connection: keep-alive
Server: JDCloudOSS
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Upload-Part-Copy-2.md
```
PUT /ObjectName?partNumber=PartNumber&uploadId=UploadId HTTP/1.1
Host: <target-bucket>.s3.<region>.jcloudcs.com 
x-amz-copy-source: /source_bucket/sourceObject
x-amz-copy-source-range:bytes=<first-last>
Date: <date>
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Upload-Part-Copy-2.md
```
PUT /newobject?partNumber=2&uploadId=VCVsb2FkIElEIGZvciBlbZZpbmcncyBteS1tb3ZpZS5tMnRzIHVwbG9hZR HTTP/1.1
Host: target-bucket.s3.<region>.jcloudcs.com
Date:  Mon, 11 Apr 2011 20:34:56 GMT
x-amz-copy-source: /source-bucket/sourceobject
x-amz-copy-source-range:bytes=500-6291456
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Operations-On-Objects/Upload-Part-Copy-2.md
```
HTTP/1.1 200 OK
x-amz-request-id: 656c76696e6727732072657175657374
Date:  Mon, 11 Apr 2011 20:34:56 GMT
Server: JDCloudOSS 

<CopyPartResult>
   <LastModified>2011-04-11T20:34:56.000Z</LastModified>
   <ETag>"9b2cf535f27731c974343645a3985328"</ETag>
</CopyPartResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Service-Related/Get-Service-2.md
```
GET / HTTP/1.1
Host: s3.<region>.jcloudcs.com 
Date: <date>
Authorization: <authorization string> (see Authenticating Requests (AWS Signature Version4))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Service-Related/Get-Service-2.md
```
GET / HTTP/1.1
Host: s3.<region>.jcloudcs.com
Date: Wed, 01 Mar  2006 12:00:00 GMT
Authorization: <authorization string>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-API/Service-Related/Get-Service-2.md
```
<?xml version="1.0" encoding="UTF-8"?>
<ListAllMyBucketsResult xmlns="http://s3.amazonaws.com/doc/2006-03-01">
  <Owner>
    <ID>bcaf1ffd86f461ca5fb16fd081034f</ID>
    <DisplayName>webfile</DisplayName>
  </Owner>
  <Buckets>
    <Bucket>
      <Name>quotes</Name>
      <CreationDate>2006-02-03T16:45:09.000Z</CreationDate>
    </Bucket>
    <Bucket>
      <Name>samples</Name>
      <CreationDate>2006-02-03T16:41:58.000Z</CreationDate>
    </Bucket>
  </Buckets>
</ListAllMyBucketsResult>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Android.md
```
package com.amazonaws.demo.s3transferutility;
 import com.amazonaws.AmazonClientException;
 import com.amazonaws.Request;
 import com.amazonaws.services.s3.Headers;
 import com.amazonaws.services.s3.internal.AWSS3V4Signer;
 import com.amazonaws.util.BinaryUtils;
 import java.io.IOException;
 import java.io.InputStream;
 public class JdAWSS3V4Signer extends AWSS3V4Signer {
     @Override
     protected void processRequestPayload(Request<?> request, HeaderSigningResult headerSigningResult) {
     }
  
     @Override
     protected String calculateContentHash(Request<?> request) {
         request.addHeader("x-amz-content-sha256", "required");
         final String contentLength =
                 request.getHeaders().get(Headers.CONTENT_LENGTH);
         final long originalContentLength;
         if (contentLength != null) {
             originalContentLength = Long.parseLong(contentLength);
         } else {
             /**
              * "Content-Length" header could be missing if the caller is
              * uploading a stream without setting Content-Length in
              * ObjectMetadata. Before using sigv4, we rely on HttpClient to
              * add this header by using BufferedHttpEntity when creating the
              * HttpRequest object. But now, we need this information
              * immediately for the signing process, so we have to cache the
              * stream here.
              */
             try {
                 originalContentLength = getContentLength(request);
             } catch (IOException e) {
                 throw new AmazonClientException(
                         "Cannot get the content-lenght of the request content.",
                         e);
             }
         }
         request.addHeader("x-amz-decoded-content-length",
                 Long.toString(originalContentLength));
         final InputStream payloadStream = getBinaryRequestPayloadStream(request);
         payloadStream.mark(-1);
         final String contentSha256 = BinaryUtils.toHex(hash(payloadStream));
         try {
             payloadStream.reset();
         } catch (final IOException e) {
             throw new AmazonClientException(
                     "Unable to reset stream after calculating AWS4 signature", e);
         }
         return contentSha256;
     }
  
     private long getContentLength(Request<?> request) throws IOException {
         InputStream content = request.getContent();
         if (!content.markSupported()) {
             throw new AmazonClientException("Failed to get content length");
         }
         final int DEFAULT_BYTE_LENGTH = 4096;
         long contentLength = 0;
         byte[] tmp = new byte[DEFAULT_BYTE_LENGTH];
         int read;
         content.mark(-1);
         while ((read = content.read(tmp)) != -1) {
             contentLength += read;
         }
         content.reset();
         return contentLength;
     }
 }
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Android.md
```
SignerFactory.registerSigner("JdAWSS3V4Signer", JdAWSS3V4Signer.class);
 System.setProperty(SDKGlobalConfiguration.ENABLE_S3_SIGV4_SYSTEM_PROPERTY, "true");
 ClientConfiguration config = new ClientConfiguration();
 config.setProtocol(Protocol.HTTP);
 config.setSignerOverride("JdAWSS3V4Signer");
 sS3Client = new AmazonS3Client(getCredProvider(context.getApplicationContext()), config);
 sS3Client.setEndpoint("http://s3.cn-north-1.jcloudcs.com");
 S3ClientOptions options = S3ClientOptions.builder()
         .disableChunkedEncoding()
         .setPayloadSigningEnabled(true)
         .build();
 sS3Client.setS3ClientOptions(options);
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Go.md
```
go get github.com/aws/aws-sdk-go
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Go.md
```
package main

import (
    "github.com/aws/aws-sdk-go/aws"
    "github.com/aws/aws-sdk-go/aws/credentials"
    "github.com/aws/aws-sdk-go/aws/session"
    "github.com/aws/aws-sdk-go/service/s3"
)

func main() {

    ak := "your accesskey"
    sk := "your secretkey"
    creds := credentials.NewStaticCredentials(ak, sk, "")
    _,err := creds.Get()

    config := &aws.Config{
        Region          :aws.String("cn-north-1"),
        Endpoint        :aws.String("s3.cn-north-1.jcloudcs.com"),
        DisableSSL      :aws.Bool(false),
        Credentials     :creds,
    }

    client := s3.New(session.New(config))
    
    //use s3 client to create bucket、put object....
    
}    
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Java/Initialization-S3.md
```
import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.SDKGlobalConfiguration;
 
public class S3SdkTest{
    public static void main(String[] args)  {
        final String accessKey = "your accesskey";
        final String secretKey = "your secretkey";
        final String endpoint = "https://s3.cn-north-1.jcloudcs.com";
        System.setProperty(SDKGlobalConfiguration.ENABLE_S3_SIGV4_SYSTEM_PROPERTY, "true");
        ClientConfiguration config = new ClientConfiguration();
 
        AwsClientBuilder.EndpointConfiguration endpointConfig =
                new AwsClientBuilder.EndpointConfiguration(endpoint, "cn-north-1");
 
        AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey,secretKey);
        AWSCredentialsProvider awsCredentialsProvider = new AWSStaticCredentialsProvider(awsCredentials);
 
        AmazonS3 s3 = AmazonS3Client.builder()
                .withEndpointConfiguration(endpointConfig)
                .withClientConfiguration(config)
                .withCredentials(awsCredentialsProvider)
                .disableChunkedEncoding()
                .withPathStyleAccessEnabled(true)
                .build();
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Java/Installation-S3.md
```
<dependency>  
    <groupId>com.amazonaws</groupId>  
    <artifactId>aws-java-sdk</artifactId>  
    <version>1.11.136</version>  
</dependency>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Java/Multipart-Upload-S3.md
```
// 初始化分片上传
String bucket_name = "<your bucketname>";
String file_path = "<your loacl file>";
String key = Paths.get(file_path).getFileName().toString();
File file = new File(file_path);
long contentLength = file.length();
long partSize = 5 * 1024 * 1024; // 设置每个分片大小为5MB.
	    
try {                
// 创建对象的Etag列表，并取回每个分片的Etag。
    List<PartETag> partETags = new ArrayList<PartETag>();
// 初始化分片上传
    InitiateMultipartUploadRequest initRequest = new InitiateMultipartUploadRequest(bucket_name, key);
    InitiateMultipartUploadResult initResponse = s3.initiateMultipartUpload(initRequest);

// 上传分片
    long filePosition = 0;
    for (int i = 1; filePosition < contentLength; i++) {
        partSize = Math.min(partSize, (contentLength - filePosition));
        UploadPartRequest uploadRequest = new UploadPartRequest()
            .withBucketName(bucket_name)
            .withKey(key)
            .withUploadId(initResponse.getUploadId())
            .withPartNumber(i)
            .withFileOffset(filePosition)
            .withFile(file)
            .withPartSize(partSize);
// 上传分片并将返回的Etag加入列表中
        UploadPartResult uploadResult = s3.uploadPart(uploadRequest);
        partETags.add(uploadResult.getPartETag());
        filePosition += partSize;
    }

// 完成分片上传
    CompleteMultipartUploadRequest compRequest = new CompleteMultipartUploadRequest(bucket_name, key,
    initResponse.getUploadId(), partETags);
    s3.completeMultipartUpload(compRequest);
}
catch(AmazonServiceException e) {
    e.printStackTrace();
}
catch(SdkClientException e) {
    e.printStackTrace();
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Java/Multipart-Upload-S3.md
```
String bucket_name = "<your bucketname>";
	    
try {
    ListMultipartUploadsRequest allMultipartUploadsRequest = new ListMultipartUploadsRequest(bucket_name);
    MultipartUploadListing multipartUploadListing = s3.listMultipartUploads(allMultipartUploadsRequest);
    List<MultipartUpload> uploads = multipartUploadListing.getMultipartUploads();
	    	
    System.out.println(uploads.size() + " multipart upload(s) in progress.");
        for (MultipartUpload u : uploads) {
            System.out.println("Upload in progress: Key = \"" + u.getKey() + "\", id = " + u.getUploadId());
        }
}
catch(AmazonServiceException e) {
    e.printStackTrace();
}
catch(SdkClientException e) {
    e.printStackTrace();
}	
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Java/Multipart-Upload-S3.md
```
String bucket_name = "<your bucketname>";
    
try {
// 列出所有未完成的分片上传
    ListMultipartUploadsRequest allMultipartUploadsRequest = new ListMultipartUploadsRequest(bucket_name);
    MultipartUploadListing multipartUploadListing = s3.listMultipartUploads(allMultipartUploadsRequest);
    List<MultipartUpload> uploads = multipartUploadListing.getMultipartUploads();
    System.out.println("Before deletions, " + uploads.size() + " multipart uploads in progress.");
// 终止分片上传
    for (MultipartUpload u : uploads) {
        System.out.println("Upload in progress: Key = \"" + u.getKey() + "\", id = " + u.getUploadId());    
        s3.abortMultipartUpload(new AbortMultipartUploadRequest(bucket_name, u.getKey(), u.getUploadId()));
        System.out.println("Upload deleted: Key = \"" + u.getKey() + "\", id = " + u.getUploadId());
    }
// 验证未完成的分片上传是否被终止
    multipartUploadListing = s3.listMultipartUploads(allMultipartUploadsRequest);
    uploads = multipartUploadListing.getMultipartUploads();
    System.out.println("After aborting uploads, " + uploads.size() + " multipart uploads in progress.");
}
catch(AmazonServiceException e) {
    e.printStackTrace();
}
catch(SdkClientException e) {
    e.printStackTrace();
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Java/Simple-Upload-S3.md
```
String bucket_name = "<your bucketname>";
String file_path = "<your path>";
String key = Paths.get(file_path).getFileName().toString();

//获取输入流
InputStream inputStream = new FileInputStream(file_path);

ObjectMetadata objectMetadata = new ObjectMetadata();
objectMetadata.setContentType("<your contentType>");
objectMetadata.setContentLength(new File(file_path).length());

//上传文件流
try {
    s3.putObject(bucket_name, key, inputStream, objectMetadata);
    System.out.format("Uploading %s to OSS bucket %s...\n", key, bucket_name);
} catch (AmazonServiceException e) {
    e.printStackTrace();
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Java/Simple-Upload-S3.md
```
String bucket_name = "<your bucketname>";
String file_path = "<your path>";
String key = Paths.get(file_path).getFileName().toString();

try {
    s3.putObject(bucket_name, key, new File(file_path));
    System.out.format("Uploading %s to OSS bucket %s...\n", key, bucket_name);
} catch (AmazonServiceException e) {
    e.printStackTrace();
} 
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-NET.md
```
using Amazon.S3;

namespace Amazon.Samples.S3
{
    public class Test
    {
        const string accessKeyId = "<yourAccessKeyId>";
        const string accessKeySecret = "<yourAccessKeySecret>";
        const string endpoint = "s3.cn-north-1.jcloudcs.com";
        
        private static IAmazonS3 s3Client;
        
        public static void Main()
        {
            var s3ClientConfig = new AmazonS3Config
            {
                ServiceURL = endpoint,
                SignatureVersion = "4",
                UseHttp = true,
            };
            s3Client = new AmazonS3Client(accessKeyId, accessKeySecret, s3ClientConfig);
           
            //use s3 client to create bucket、put object....
        }
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-PHP.md
```
require 'C:\mydir\aws\aws-autoloader.php';
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-PHP.md
```
<?php    
require 'C:\mydir\aws\aws-autoloader.php';    
use Aws\S3\S3Client;    
    
$s3 = new S3Client([    
    'version'=>'latest',    
    'region'=>'cn-north-1',    
    'endpoint' => 'http://s3.cn-north-1.jcloudcs.com',    
    'signature_version' => 'v4',    
     'credentials' => [    
       'key'    => 'your accesskey',    
       'secret' => 'your secretkey',    
          ],    
     ]);     
//use s3 client to create bucket、put object....    
?>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Python.md
```
pip install boto3
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-Python.md
```

import boto3  
        
ACCESS_KEY = 'your accesskey'  
SECRET_KEY = 'your secretkey'  
s3 = boto3.client(  
    's3',  
    aws_access_key_id=ACCESS_KEY,  
    aws_secret_access_key=SECRET_KEY,  
    #下面给出一个endpoint_url的例子  
    endpoint_url='http://s3.cn-north-1.jcloudcs.com'  
    )  
#use s3 client to create bucket、put object....
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Compatibility-Tools/SDK-iOS.md
```
# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
target 'S3UploadDemo' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!
  pod 'AWSCore', git: 'https://github.com/ZHCliang/aws-sdk-ios.git'
  pod 'AWSS3', git: 'https://github.com/ZHCliang/aws-sdk-ios.git'   # For file transfers
end
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Error-Response-2.md
```
<Error>
    <statusCode>404</statusCode>
    <Code>NoSuchBucket</Code>
    <Message>The specified bucket does not exist.</Message>
    <Resource>/henry-dev-test-bucket123123123123</Resource>
    <RequestId>956F69119AE3958B</RequestId>
</Error>

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/Compress-Object.md
```
POST /path/to/zip/object?compress HTTP/1.1 
Host:bucket.s3.region.jcloudcs.com 
Authorization:<Authorization_String>
Content-Type:text/xml 
Content-Length:1024 
Content-MD5:Q2hlY2sgSW50ZWdyaXR5IQ== 
Cache-Control:max-age=300 
Content-Disposition:"attachment;filename=FileName.txt" 
Expires:Wed, 21 Oct 2015 07:28:00 GMT 
x-amz-notification-endpoint:http://example.com/on_compress_done 
x-amz-compress-type:zip
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/Compress-Object.md
```
{
    "Records": [
        {
            "eventName": "ObjectCreated:Compress",
            "s3": {
                "s3SchemaVersion": "1.0",
                "bucket": {
                    "name": "bucket-name"
                },
                "object": {
                    "key": "object-key",
                    "size": 1024,
                    "eTag": "object eTag"
                }
            }
        }
    ]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/Compress-Object.md
```
{
    "Records": [
        {
            "eventName": "Error:CompressFailed",
            "error": {
                "s3ErrorSchemaVersion": "1.0",
                "code": "NoSuchKey",
                "resourse": "/path/to/not/exist/object/key",
                "message": "The specified key does not exist.",
                "requestId": "AB2138B5D4C95193"
            },
            "s3": {
                "s3SchemaVersion": "1.0",
                "bucket": {
                    "name": "bucket-name"
                },
                "object": {
                    "key": "object-key",
                }
            }
        }
    ]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/Compress-Object.md
```
  <dependency>
  <groupId>com.amazonaws</groupId>
  <artifactId>aws-java-sdk-s3</artifactId>
  <version>1.11.136</version>
  </dependency>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/ImgProtected.md
```
PUT /?imgProtected HTTP/1.1
Host: bucket.s3.region.jcloudcs.com
Content-Length: ContentLength
Content-MD5: ContentMD5
Date: Date
Authorization: <Authorization_String>

<?xml version="1.0" encoding="UTF-8"?> 
<Condition>
  <Extension>extension1</Extension>   
  <Extension>extension2</Extension> 
</Condition>

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/ImgProtected.md
```
PUT /?imgProtected HTTP/1.1
Host: example-bucket.s3.cn-north-1.jcloudcs.com
X-Amz-Date: 20180117T122143Z
Authorization: signatureValue
Content-MD5: yzoQScp1SjEhK6u7tdCQbw==
Content-Length: 113

<?xml version="1.0" encoding="UTF-8"?><Condition><Extension>jpg</Extension><Extension>png</Extension></Condition>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/ImgProtected.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Wed, 17 Jan 2018 12:21:40 GMT
Content-Length: 0
Connection: keep-alive
x-amz-request-id: 888B86A04354AFE0
Cache-Control: no-cache
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/ImgProtected.md
```
GET /?imgProtected HTTP/1.1
Host: bucket.s3.region.jcloudcs.com
Date: Date
Authorization: <Authorization_String>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/ImgProtected.md
```
GET /?imgProtected HTTP/1.1
Host: example-bucket.s3.cn-north-1.jcloudcs.com
X-Amz-Date: 20180117T122144Z
Authorization: signatureValue
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/ImgProtected.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Wed, 17 Jan 2018 12:21:41 GMT
Content-Type: text/xml;charset=UTF-8
Content-Length: 113
Connection: keep-alive
x-amz-request-id: B713D3A9BFF851EE
Cache-Control: no-cache
 
<?xml version="1.0" encoding="UTF-8"?><Condition><Extension>jpg</Extension><Extension>png</Extension></Condition>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/ImgProtected.md
```
DELETE /?imgProtected HTTP/1.1
Host: bucket.s3.region.jcloudcs.com
Date: Date
Authorization: <Authorization_String>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/ImgProtected.md
```
DELETE /?imgProtected HTTP/1.1
Host: example-bucket.s3.cn-north-1.jcloudcs.com
X-Amz-Date: 20180117T122640Z
Authorization: signatureValue
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference-S3-Compatible/Extension-API/ImgProtected.md
```
HTTP/1.1 204 No Content
Server: nginx
Date: Wed, 17 Jan 2018 12:26:37 GMT
Connection: keep-alive
x-amz-request-id: BB086C85AB71F139
Cache-Control: no-cache
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control-Signature-In-Header-Or-URL.md
```
Authorization ="jingdong" + " " + AccessKey + ":" + Signature;
Signature =base64(HMAC-SHA1(AccessKeySecret, UTF-8-Encoding-Of( StringToSign ) ) )
StringToSign =HTTP-Verb + "\n"
                       + Content-MD5 + "\n"
                       + Content-Type + "\n"
                       + Date + "\n"
                      + CanonicalizedHeaders
                      + CanonicalizedResource;
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control-Signature-In-Header-Or-URL.md
```
SUB_RESOURCES："lifecycle", "location", "logging", "partNumber", "policy", "uploadId", "uploads", "versionId", "versioning", "versions", "website", "acl"

RESPONSE_HEARDES："contentType", "contentLanguage", "cacheControl","contentDisposition", "contentEncoding"
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control-Signature-In-Header-Or-URL.md
```
PUT /sign.txt   HTTP/1.1
  Content-Type: text/plain
  Content-MD5: 0c791a8c18017c7ad1675936d12bae5d
  x-jss-server-side-encryption: false
  Date: Thu, 13 Jul 2017 02:37:31 GMT
  Authorization: jingdong qbS5QXpLORrvdrmb: xvj2Iv7WcSwnN26XYnTq/c2YBQs=
  Content-Length: 20
  Host: oss.cn-north-1.jcloudcs.com
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control-Signature-In-Header-Or-URL.md
```
Signature =   base64(hmac-sha1(AccessKeySecret,
  HTTP-Verb + “\n” 
  + Content-MD5 + “\n”
  + Content-Type + “\n” 
  + Date + “\n”

+ CanonicalizedHeaders
  + CanonicalizedResource))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control-Signature-In-Header-Or-URL.md
```
PUT\n

0c791a8c18017c7ad1675936d12bae5d\n

text/plain\n

Thu, 13 Jul 2017 02:37:31   GMT\n

x-jss-server-side-encryption:false\n

/oss-test/sign.txt
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control-Signature-In-Header-Or-URL.md
```
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;
 
String secretKey = "1MYaiNh3NeN9SuxaqFjSrc7I49rWKkQCxpl9eLNZ";
String signString = "PUT\n0c791a8c18017c7ad1675936d12bae5d\ntext/plain\nThu, 13 Jul 2017 02:37:31 GMT\n 
                     x-jss-server-side-encryption:false\n/oss-test/sign.txt";
SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"),"HmacSHA1");
Mac mac = Mac.getInstance("HmacSHA1");
mac.init(signingKey);
byte[] rawHmac = mac.doFinal(signString.getBytes("UTF-8"));
String signature =  new String(Base64.encodeBase64(rawHmac), "UTF-8");
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control-Signature-In-Header-Or-URL.md
```
PUT /sign.txt   HTTP/1.1
  Content-Type: text/plain
  Content-MD5: 0c791a8c18017c7ad1675936d12bae5d
  x-jss-server-side-encryption: false
  Date: Thu, 13 Jul 2017 02:37:31 GMT
  Authorization: jingdong qbS5QXpLORrvdrmb: xvj2Iv7WcSwnN26XYnTq/c2YBQs=
  Content-Length: 20
  Host: oss.cn-north-1.jcloudcs.com
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control-Signature-In-Header-Or-URL.md
```
http://s.jcloud.com/mybucket/public/index.html?Expires=1369191796&AccessKey=9c379f079214447fad2959c4621cd6feVb797oH1&Sigature=tzEQUA%2Bj%2BUHcEp%2FBUMKeMd5bqGc%3D
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control-Signature-In-Header-Or-URL.md
```
Signature=URL-Encode(Base64(HMAC-SHA1(UTF-8-Encoding-Of(SecretKey,StringToSign))));

StringToSign =HTTP-Verb + "\n"

                        +Content-MD5 +"\n"

                        +Content-Type +"\n"

                        +Expires +"\n"

                        + CanonicalizedHeaders

                        +CanonicalizedResource;
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control-Signature-In-Header-Or-URL.md
```
import javax.crypto.Mac;

import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;


String secretKey =   "41oUzT1opT69jpedWVg1vFTb31FvrewWSXnnZ7i1";

String signString = "GET\n\n\n1369191796\n/mybucket/index.html";

SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"),   "HmacSHA1");

Mac mac = Mac.getInstance("HmacSHA1");

mac.init(signingKey);

byte[] rawHmac =   mac.doFinal(signString.getBytes("UTF-8"));

String signature =  new   String(Base64.encodeBase64(rawHmac), "UTF-8");
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control-Signature-In-Header-Or-URL.md
```
http://mybucket.s.jcloud.com/index.html?Expires=1369191796&AccessKey=9c379f079214447fad2959c4621cd6feVb797oH1&Signature=mBb1uuC3y2GeyeqlW5+gN/tla6s=Host: s.jcloud.com
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control/Signature-In-Header.md
```
Authorization ="jingdong" + " " + AccessKey + ":" + Signature;
Signature =base64(HMAC-SHA1(AccessKeySecret, UTF-8-Encoding-Of( StringToSign ) ) )
StringToSign =HTTP-Verb + "\n"
                       + Content-MD5 + "\n"
                       + Content-Type + "\n"
                       + Date + "\n"
                      + CanonicalizedHeaders
                      + CanonicalizedResource;
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control/Signature-In-Header.md
```
SUB_RESOURCES："lifecycle", "location", "logging", "partNumber", "policy", "uploadId", "uploads", "versionId", "versioning", "versions", "website", "acl"

RESPONSE_HEARDES："contentType", "contentLanguage", "cacheControl","contentDisposition", "contentEncoding"
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control/Signature-In-Header.md
```
PUT /sign.txt   HTTP/1.1
  Content-Type: text/plain
  Content-MD5: 0c791a8c18017c7ad1675936d12bae5d
  x-jss-server-side-encryption: false
  Date: Thu, 13 Jul 2017 02:37:31 GMT
  Authorization: jingdong qbS5QXpLORrvdrmb: xvj2Iv7WcSwnN26XYnTq/c2YBQs=
  Content-Length: 20
  Host: oss.cn-north-1.jcloudcs.com
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control/Signature-In-Header.md
```
Signature =   base64(hmac-sha1(AccessKeySecret,
  HTTP-Verb + “\n” 
  + Content-MD5 + “\n”
  + Content-Type + “\n” 
  + Date + “\n”

+ CanonicalizedHeaders
  + CanonicalizedResource))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control/Signature-In-Header.md
```
PUT\n

0c791a8c18017c7ad1675936d12bae5d\n

text/plain\n

Thu, 13 Jul 2017 02:37:31   GMT\n

x-jss-server-side-encryption:false\n

/oss-test/sign.txt
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control/Signature-In-Header.md
```
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;
 
String secretKey = "1MYaiNh3NeN9SuxaqFjSrc7I49rWKkQCxpl9eLNZ";
String signString = "PUT\n0c791a8c18017c7ad1675936d12bae5d\ntext/plain\nThu, 13 Jul 2017 02:37:31 GMT\n 
                     x-jss-server-side-encryption:false\n/oss-test/sign.txt";
SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"),"HmacSHA1");
Mac mac = Mac.getInstance("HmacSHA1");
mac.init(signingKey);
byte[] rawHmac = mac.doFinal(signString.getBytes("UTF-8"));
String signature =  new String(Base64.encodeBase64(rawHmac), "UTF-8");
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control/Signature-In-Header.md
```
PUT /sign.txt   HTTP/1.1
  Content-Type: text/plain
  Content-MD5: 0c791a8c18017c7ad1675936d12bae5d
  x-jss-server-side-encryption: false
  Date: Thu, 13 Jul 2017 02:37:31 GMT
  Authorization: jingdong qbS5QXpLORrvdrmb: xvj2Iv7WcSwnN26XYnTq/c2YBQs=
  Content-Length: 20
  Host: oss.cn-north-1.jcloudcs.com
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control/Signature-In-URL.md
```
http://s.jcloud.com/mybucket/public/index.html?Expires=1369191796&AccessKey=9c379f079214447fad2959c4621cd6feVb797oH1&Sigature=tzEQUA%2Bj%2BUHcEp%2FBUMKeMd5bqGc%3D
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control/Signature-In-URL.md
```
Signature=URL-Encode(Base64(HMAC-SHA1(UTF-8-Encoding-Of(SecretKey,StringToSign))));

StringToSign =HTTP-Verb + "\n"

                        +Content-MD5 +"\n"

                        +Content-Type +"\n"

                        +Expires +"\n"

                        + CanonicalizedHeaders

                        +CanonicalizedResource;
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control/Signature-In-URL.md
```
import javax.crypto.Mac;

import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;


String secretKey =   "41oUzT1opT69jpedWVg1vFTb31FvrewWSXnnZ7i1";

String signString = "GET\n\n\n1369191796\n/mybucket/index.html";

SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"),   "HmacSHA1");

Mac mac = Mac.getInstance("HmacSHA1");

mac.init(signingKey);

byte[] rawHmac =   mac.doFinal(signString.getBytes("UTF-8"));

String signature =  new   String(Base64.encodeBase64(rawHmac), "UTF-8");
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Access-Control/Signature-In-URL.md
```
http://mybucket.s.jcloud.com/index.html?Expires=1369191796&AccessKey=9c379f079214447fad2959c4621cd6feVb797oH1&Signature=mBb1uuC3y2GeyeqlW5+gN/tla6s=Host: s.jcloud.com
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/DeleteBucket-1.md
```
DELETE / HTTP/1.1
Host: BucketName. s-bj.jcloud.com
Date: GMT Date
Authorization: signatureValue
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/DeleteBucket-1.md
```
DELETE / HTTP/1.1
Date: Tue, 11 Jul 2017   07:01:25 GMT
Authorization: jingdong   qbS5QXpLORrvdrmb:he65YAWaAh7cV1D2RmaKABAu9dk=
Host: oss-test.s-bj.jcloud.com
Connection: Keep-Alive
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/DeleteBucket-1.md
```
HTTP/1.1 204 No   Content
Server: nginx
Date: Tue, 11 Jul 2017   07:01:24 GMT
Connection: keep-alive
x-jss-request-id:   8DFE3EA7D288983C
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/GetBucket.md
```
GET / HTTP/1.1
Host: BucketName. s.jcloud.com
Date: GMT   Date     
Authorization:   signatureValue#请参照“访问控制”
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/GetBucket.md
```
GET / HTTP/1.1
Host:   oss-example.s-bj.jcloud.com
Date: Tue, 11 Jul 2017   07:54:41 GMT    
Authorization: jingdong   qbS5QXpLORrvdrmb:3xo8IxIXSkA280C0Z5+lkowaAA8=
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/GetBucket.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Tue, 11 Jul 2017   07:54:41 GMT
Content-Type:   application/json;charset=UTF-8
Content-Length: 900
Connection: keep-alive
Vary: Accept-Encoding
Vary: Accept-Encoding
x-jss-request-id:   99D8C1866CAC92D0
X-Trace: 200-1499759681772-0-0-19-42-42
 
{
      "Name": "oss-example",
      "Prefix": null,
      "Marker": null,
      "NextMarker":null,
      "Delimiter": null,
      "MaxKeys": 1000,
      "HasNext": false,
      "HasCommonPrefix": true,
      "Contents": [
          {
              "Key": "jingdong/dir/file",
              "LastModified": "Mon, 17 Jul 2017 12:12:39 GMT",
              "ETag": "77abd5a162ef88440102129fffbb404c",
              "Size": 2884006,
              "StorageClass": "STANDARD"
          },
          {
              "Key": "jingdong/dir/file2",
              "LastModified": "Mon, 17 Jul 2017 12:14:49 GMT",
              "ETag": "77abd5a162ef88440102129fffbb404c",
              "Size": 2884006,
              "StorageClass": "STANDARD"
          },
          {
              "Key": "jingdong/test.jpg",
              "LastModified": "Mon, 17 Jul 2017 12:12:17 GMT",
              "ETag":   "77abd5a162ef88440102129fffbb404c",
              "Size": 2884006,
              "StorageClass": "STANDARD"
          },
          {
              "Key": "test.jpg",
              "LastModified": "Mon, 17 Jul 2017 12:11:56 GMT",
              "ETag": "77abd5a162ef88440102129fffbb404c",
              "Size": 2884006,
              "StorageClass": "STANDARD"
          }
    ],
      "CommonPrefixes": [ ]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/GetBucket.md
```
GET   /?prefix=jingdong%2F HTTP/1.1
Host:   oss-example.s-bj.jcloud.com
Date: Tue, 11 Jul 2017   08:01:09 GMT    
Authorization: jingdong   qbS5QXpLORrvdrmb:FQZNWlNAraOLgreEflrurbNojJE= 
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/GetBucket.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Tue, 11 Jul 2017   08:01:09 GMT
Content-Type: application/json;charset=UTF-8
Content-Length: 613
Connection: keep-alive
Vary: Accept-Encoding
Vary: Accept-Encoding
x-jss-request-id:   9CCEA5403AA5ED6E
X-Trace:   200-1499760069435-0-0-20-45-45
 
{
      "Name": "oss-example",
      "Prefix": "jingdong/",
      "Marker":   null,
      "NextMarker":null,
      "Delimiter": null,
      "MaxKeys": 1000,
      "HasNext": false,
      "HasCommonPrefix": true,
      "Contents": [
          {
              "Key": "jingdong/dir/file",
              "LastModified": "Mon, 17 Jul 2017 12:12:39 GMT",
              "ETag": "77abd5a162ef88440102129fffbb404c",
              "Size": 2884006,
              "StorageClass": "STANDARD"
          },
          {
              "Key": "jingdong/dir/file2",
              "LastModified": "Mon, 17 Jul 2017 12:14:49 GMT",
              "ETag": "77abd5a162ef88440102129fffbb404c",
              "Size": 2884006,
              "StorageClass": "STANDARD"
          },
          {
              "Key": "jingdong/test.jpg",
              "LastModified": "Mon, 17 Jul 2017 12:12:17 GMT",
              "ETag": "77abd5a162ef88440102129fffbb404c",
              "Size": 2884006,
              "StorageClass": "STANDARD"
          }
    ],
      "CommonPrefixes": [ ]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/GetBucket.md
```
GET   /?prefix=jingdong%2F&delimiter=%2F HTTP/1.1
Host: oss-example.s-bj.jcloud.com
Date: Tue, 11 Jul 2017   08:05:13 GMT    
Authorization: jingdong   qbS5QXpLORrvdrmb:jXw8QQvs6IS+JJ2EpiFMUGtgNEM=
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/GetBucket.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Tue, 11 Jul 2017   08:05:13 GMT
Content-Type: application/json;charset=UTF-8
Content-Length: 456
Connection: keep-alive
Vary: Accept-Encoding
Vary: Accept-Encoding
x-jss-request-id:   96F2C2E9FC9B3BE5
X-Trace:   200-1499760313279-0-0-20-45-45
 
{
      "Name": "oss-example",
      "Prefix": "jingdong/",
      "Marker": null,
      "NextMarker":null,
      "Delimiter": "/",
      "MaxKeys": 1000,
      "HasNext": false,
      "HasCommonPrefix": false,
      "Contents": [
          {
              "Key": "jingdong/test.jpg",
              "LastModified": "Mon, 17 Jul 2017 12:12:17 GMT",
              "ETag": "77abd5a162ef88440102129fffbb404c",
              "Size": 2884006,
              "StorageClass": "STANDARD"
          }
    ],
      "CommonPrefixes": [
          "jingdong/dir"
    ]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/GetBucketReferer.md
```
GET   /?bucketReferer HTTP/1.1
Host: BucketName.s-bj.jcloud.com
Date: GMT Date
Authorization: signatureValue
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/GetBucketReferer.md
```
GET   /?bucketReferer HTTP/1.1
Date: Tue, 11 Jul 2017   09:12:11 GMT
Authorization: jingdong   qbS5QXpLORrvdrmb:x7J06zQT3CJ5qF3CXKTKWjVBLvc=
Host: oss-test.s-bj.jcloud.com
Connection: Keep-Alive
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/GetBucketReferer.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Tue, 11 Jul 2017   09:12:10 GMT
Content-Type:   application/json;charset=UTF-8
Content-Length: 43
Connection: keep-alive
x-jss-request-id:   A84C875C916A1E24
{"AllowNull":false,"Effect":"ALLOW","Value":["www.abc.com","www.*.com"]}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/GetBucketReferer.md
```
HTTP/1.1 204 No   Content
Server: nginx
Date: Tue, 11 Jul 2017   09:52:11 GMT
Connection: keep-alive
x-jss-request-id: A4EA285FA0BCED06
{"AllowNull":false,"Effect":"ALLOW","Value":[]}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/PutBucket-1.md
```
PUT / HTTP/1.1
Date: GMT Date
Authorization: signatureValue
Host: BucketName.s-bj.jcloud.com 
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/PutBucket-1.md
```
PUT / HTTP/1.1
Date: GMT Date
Authorization: signatureValue
Host: BucketName.s-bj.jcloud.com 
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/PutBucket-1.md
```
HTTP/1.1 201   Created
Server: nginx
Date: Tue, 11 Jul 2017   07:28:28 GMT
Content-Length: 0
Connection: keep-alive
x-jss-request-id:   AC661DAB5260B409
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/PutBucketReferer.md
```
PUT /  ?bucketReferer
&Effect=
&RefererList =
&IsAllowNull=
Date: GMT Date
Authorization: SignatureValue
Host: BucketName.s-bj.jcloud.com
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/PutBucketReferer.md
```
PUT   /?bucketReferer&Effect=ALLOW&RefererList=%5B%5D&IsAllowNull=false   HTTP/1.1
Date: Tue, 11 Jul 2017   13:39:32 GMT
Authorization: jingdong qbS5QXpLORrvdrmb:AcXz2BHxhfC/z5T5YX/rvdS/2z4=
Host: oss-test.s-bj.jcloud.com
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/PutBucketReferer.md
```
PUT   /?bucketReferer&Effect=ALLOW&RefererList=%5B%22+www.baidu.com%22%2C%22+www.google.com%22%5D& 
IsAllowNull=false  HTTP/1.1
Date: Tue, 11 Jul 2017   13:43:53 GMT
Authorization: jingdong   qbS5QXpLORrvdrmb:Nd8NwDDzyj28M1jfGrTC7DGc1cg=
Host: oss-test.s-bj.jcloud.com
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Bucket-Operations/PutBucketReferer.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Tue, 11 Jul 2017   13:43:52 GMT
Content-Length: 0
Connection: keep-alive
x-jss-request-id:   8B5EDFD33A8FA3DB
X-Trace: 200-1499780632726-0-0-19-47-47
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/AbortMultipartUpload.md
```
DELETE /BucketName/ObjectName?uploadId=UploadIdHTTP/1.1
Host: BucketName. s-bj.jcloud.com
Date: GMT Date
Authorization: signatureValue
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/AbortMultipartUpload.md
```
DELETE   /oss-test-mul?uploadId=8BE181320822A189 HTTP/1.1
Date: Wed, 12 Jul 2017   13:36:37 GMT
Authorization: jingdong   298718BEDE59FF1B2E96A3152937D37B:FGic1+W0ggmbzXiwwwfbnJrQEkE=
Host: oss-test.s-bj.jcloud.com
Connection: Keep-Alive
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/AbortMultipartUpload.md
```
HTTP/1.1 204 No   Content
Server: nginx
Date: Wed, 12 Jul 2017   13:36:36 GMT
Connection: keep-alive
x-jss-request-id:   A27711FCD88D6666
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/CompleteMultipartUpload.md
```
POST   /ObjectName?uploadId= UploadId HTTP/1.1
Host: BucketName. s.jcloud.com
Content-Length: Size
Date: GMT   Date     
Authorization:   signatureValue#请参照“访问控制”
 
{
      "Part": [
          {
              "PartNumber": PartNumber,
              "ETag": " ETag"
          },
 
. . . . . . ,
                                
          {
              "PartNumber": PartNumber,
              "ETag": " ETag"
          }
    ]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/CompleteMultipartUpload.md
```
POST   /multipart.data?uploadId=9FFFFF35C1535F7B HTTP/1.1
Host: oss-example.s-bj.jcloud.com
Content-Length: 187
Date: Wed, 12 Jul 2017   12:47:57 GMT  
Authorization: jingdong qbS5QXpLORrvdrmb:/Qq9QFSIEzaPPL5YgAkbHoXkTKc=
 
{
      "Part": [
          {
              "PartNumber": 1,
              "ETag": "9223eed2740a549634ac58688d33b614"
          },
          {
              "PartNumber": 2,
              "ETag": "aa286070fe65d16d39fb8997143ea564"
          },
          {
              "PartNumber": 3,
              "ETag": "3b586f704fcd6b714fde125aeffc3e74"
          }
    ]
}       
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/CompleteMultipartUpload.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Wed, 12 Jul 2017   12:47:58 GMT
Content-Type:   application/json;charset=UTF-8
Content-Length: 83
Connection: keep-alive
x-jss-request-id:   B7C62B29F77E2132
X-Trace:   200-1499863677959-0-0-20-58-58
 
{"Bucket":"youhe","Key":"multipart.data","ETag":"4e456c2fc34928a3e2fa202acf71870a"}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/InitiateMultipartUpload.md
```
POST  /ObjectName?uploads HTTP/1.1
Host: BucketName.s.jcloud.com
x-jss-storage-class: STANDARD or REDUCED_REDUNDANCY       
Date: GMT  Date     
Authorization:  signatureValue#请参照"访问控制"     
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/InitiateMultipartUpload.md
```
POST /multipart.data?uploads   HTTP/1.1
Host: oss-example.s-bj.jcloud.com
x-jss-storage-class:   STANDARD      
Date: Wed, 12 Jul 2017 07:45:27   GMT  
Authorization: jingdong qbS5QXpLORrvdrmb:wYoTTKpqU1mZu4Dy3IlTRbCUx0w=   
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/InitiateMultipartUpload.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Wed, 12 Jul 2017   07:45:27 GMT
Content-Type:   application/json;charset=UTF-8
Content-Length: 71
Connection: keep-alive
x-jss-request-id:   9891344770AD7F37
X-Trace: 200-1499845527038-0-0-18-46-46
 
{"Bucket":"youhe","Key":"multipart.data","UploadId":"9E417328F6B89F0B"}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/ListMultipartUploads.md
```
GET /BucketName?uploads HTTP/1.1
Host: BucketName.s-bj.jcloud.com
Date: GMT Date
Authorization: signatureValue
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/ListMultipartUploads.md
```
GET   /?uploads HTTP/1.1
Date:   Wed, 12 Jul 2017 13:58:14 GMT
Authorization:   jingdong   298718BEDE59FF1B2E96A3152937D37B:YVbn+CqITQzQNRWzVKcxPq3V0PY=
Host: oss-test.s-bj.jcloud.com
Connection:   Keep-Alive
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/ListMultipartUploads.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Wed, 12 Jul 2017   13:58:14 GMT
Content-Type:   application/json;charset=UTF-8
Content-Length: 714
Connection: keep-alive
x-jss-request-id:   A9E0EE26B6EF677E
 
{"Bucket":"oss-test","Prefix":null,"Upload":[{"Key":"oss-test-mul1","UploadId":"97D11DAE98672320",
"Initiated":"Wed,   12 Jul 2017 13:58:02 GMT","Enable-Encryption":"false","Summary":null,"StorageClass":"STANDARD"},
{"Key":"oss-test-mul2","UploadId":"8238F7E35F3FFCFE","Initiated":"Wed,   12 Jul 2017 13:58:02   GMT",
"Enable-Encryption":"false","Summary":null,"StorageClass":"STANDARD"},{"Key":"oss-test-mul3",
"UploadId":"90895A4BB2A635DF","Initiated":"Wed,   12 Jul 2017 13:58:02   GMT",
"Enable-Encryption":"false","Summary":null,"StorageClass":"STANDARD"},
{"Key":"oss-test-mul4","UploadId":"857A7712C57EA243","Initiated":"Wed,   12 Jul 2017 13:58:02   GMT",
"Enable-Encryption":"false","Summary":null,"StorageClass":"STANDARD"}]}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/ListParts.md
```
GET   /ObjectName?uploadId=UploadId HTTP/1.1
Host: BucketName. s.jcloud.com
Date: GMT   Date     
Authorization:   signatureValue#请参照“访问控制”
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/ListParts.md
```
GET   /multipart.data?uploadId=9E417328F6B89F0B HTTP/1.1
Host: oss-example.s-bj.jcloud.com
Date: Tue, 11 Jul 2017   12:40:40 GMT    
Authorization: jingdong   qbS5QXpLORrvdrmb:Ihjb1BaIk2pNGk11OCqBogLLL4c= 
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/ListParts.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Tue, 11 Jul 2017   12:40:40 GMT
Content-Type:   application/json;charset=UTF-8
Content-Length: 466
Connection: keep-alive
Vary: Accept-Encoding
Vary: Accept-Encoding
x-jss-request-id:   9206E7FB00121B2F
X-Trace:   200-1499776840209-0-0-19-45-45
 
{
      "Bucket": "youhe",
      "Key": "multipart.data",
      "UploadId": "9E417328F6B89F0B",
      "Part": [
          {
              "PartNumber": 1,
              "LastModified": "Tue, 11 Jul 2017 12:39:15 GMT",
              "ETag": "72cfb19c8e2791bd502ce951ebc64ad8",
              "Size": 204800
          },
          {
              "PartNumber": 2,
              "LastModified": "Tue, 11 Jul 2017 12:39:28 GMT",
              "ETag": "a2a8ab7bd93851a715c8137ea5d4c720",
              "Size": 409600
          },
          {
              "PartNumber": 3,
              "LastModified": "Tue, 11   Jul 2017 12:39:42 GMT",
              "ETag": "b0721b50ee0cb102eb1f0d8216c94848",
              "Size": 614400
          }
    ],
      "StorageClass": "STANDARD"
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/UploadPart.md
```
PUT   /ObjectName?uploadId=UploadId&partNumber=PartNumber HTTP/1.1
Date: GMT Date
Authorization: jingdong   qbS5QXpLORrvdrmb:AdBNNN+uUP+qRcPJn5m4ezrbRwI=
Content-Length: size
Host: BucketName.s-bj.jcloud.com
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/UploadPart.md
```
PUT  /multiSS?uploadId=9B2BF313C3E998E9&partNumber=1 HTTP/1.1
Date: Wed, 12 Jul 2017   09:22:16 GMT
Authorization: jingdong   qbS5QXpLORrvdrmb:AdBNNN+uUP+qRcPJn5m4ezrbRwI=
Content-Length: 3
Host: oss-test.s-bj.jcloud.com
Connection: Keep-Alive
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/MultipartUpload-Operations/UploadPart.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Wed, 12 Jul 2017   09:39:01 GMT
Content-Length: 0
Connection: keep-alive
x-jss-request-id:   999D38C52D6C2B58
ETag:   "202cb962ac59075b964b07152d234b70"
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/DeleteObject.md
```
DELETE  /ObjectName HTTP/1.1
Host: BucketName. s.jcloud.com
Date: GMT  Date     
Authorization:   signatureValue#请参照“访问控制”
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/DeleteObject.md
```
DELETE /example.jpg HTTP/1.1
Host: oss-example.s-bj.jcloud.com
Date: Tue, 11 Jul 2017 07:37:23   GMT    
Authorization: jingdong   qbS5QXpLORrvdrmb:Qt+ThnjyLwBb9xMZ8PZG3wsj3qU=
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/DeleteObject.md
```
HTTP/1.1 204 No   Content
Server: nginx
Date: Tue, 11 Jul 2017   07:37:23 GMT
Connection: keep-alive
x-jss-request-id:   80EC9E2F4D29D732
X-Trace:   204-1499758643347-0-0-19-50-5
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/GetObject.md
```
GET /ObjectName   HTTP/1.1
Host: BucketName. s.jcloud.com
Date: GMT   Date     
Authorization:   signatureValue#请参照“访问控制”
Range: bytes=ByteRange(可选)
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/GetObject.md
```
GET /example.jpg HTTP/1.1
Host: oss-example.s-bj.jcloud.com
Date: Tue, 11 Jul 2017   07:28:01 GMT    
Authorization: jingdong qbS5QXpLORrvdrmb:Ctm+uA40JmY3T3LvCZ6CkKkANXs=
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/GetObject.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Tue, 11 Jul 2017   07:28:01 GMT
Content-Type: text/plain
Content-Length: 13
Connection: keep-alive
x-jss-request-id:   95CB505F50E9341D
Cache-Control:   max-age=2592000
Content-Disposition: inline;   filename="example.jpg"
Accept-Ranges: bytes
ETag:   "6457646542258052f767868fd686d74d"
Last-Modified: Tue, 11 Jul   2017 07:27:15 GMT
x-jss-storage-class: STANDARD
X-Trace: 200-1499758081049-0-0-19-45-45
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/GetObject.md
```
GET example.jpg HTTP/1.1
Host: oss-example.s-bj.jcloud.com
Range: bytes=0-9   
Date: Tue, 11 Jul 2017 07:34:11   GMT    
Authorization: jingdong qbS5QXpLORrvdrmb:/Aaawoo0xVq4XVMei/yK1UqhoFc=
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/GetObject.md
```
HTTP/1.1 206   Partial Content
Server: nginx
Date: Tue, 11 Jul 2017   07:34:11 GMT
Content-Type: text/plain
Content-Length: 10
Connection: keep-alive
Content-Range: bytes 0-9/13
x-jss-request-id:   A0D975825710D969
Cache-Control:   max-age=2592000
Content-Disposition: inline;   filename="example.jpg"
Accept-Ranges: bytes
ETag:   "6457646542258052f767868fd686d74d"
Last-Modified: Tue, 11 Jul   2017 07:27:15 GMT
x-jss-storage-class: STANDARD
X-Trace:   206-1499758451594-0-0-20-44-44
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/PutObject.md
```
PUT /ObjectName HTTP/1.1
Content-Length:ContentLength
Content-Type: ContentType
Content-MD5: Content-MD5
Host: BucketName. s.jcloud.com
x-jss-server-side-encryption:   true or false      
x-jss-storage-class: STANDARD   or REDUCED_REDUNDANCY
Date: GMT  Date     
Authorization: signatureValue#请参照"访问控制"
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/PutObject.md
```
PUT /example.jpg HTTP/1.1
Host: oss-example.s-bj.jcloud.com
Content-Length: 13
Content-Type: text/plain
Content-MD5: 6457646542258052f767868fd686d74d 
x-jss-server-side-encryption:   false 
Date: Tue, 11 Jul 2017   07:13:32 GMT    
Authorization: jingdong   qbS5QXpLORrvdrmb:cQ63NndHAoEBmjZHehSuNWG/Jns=
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/PutObject.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Tue, 11 Jul 2017   07:13:32 GMT
Content-Length: 0
Connection: keep-alive
x-jss-request-id:   8E4FC95C05EC1A4C
ETag:   "6457646542258052f767868fd686d74d"
X-Trace:   200-1499757212162-0-0-20-50-50
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/PutObject.md
```
PUT /example.jpg HTTP/1.1
Host:   oss-example.s-bj.jcloud.com
x-jss-server-side-encryption:   true  
Date: Thu, 13 Jul 2017   02:12:02 GMT    
Authorization: jingdong     qbS5QXpLORrvdrmb:S2ZHyLfdZml/bRjD/TEQ+ftJXBA=
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Object-Operations/PutObject.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Thu, 13 Jul 2017   02:12:13 GMT
Content-Length: 0
Connection: keep-alive
x-jss-request-id: 9457B50779BA6947
ETag: "77abd5a162ef88440102129fffbb404c"
X-Trace: 200-1499911919867-0-12790-12809-13303-13303
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Response-To-Errors/Response-Structure.md
```
{“code”   :”AccessDenied”,”message”:”Access   Denied”,”resource”:”/mybucket/public/index.html”,
”requestId”:”71515159-E06D-406F-81C4-E03FA635B831”}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Service-Operations/GetService.md
```
GET / HTTP/1.1
Date: GMT Date
Authorization: SignatureValue
Host:s-bj.jcloud.com
``` 


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Service-Operations/GetService.md
```
GET / HTTP/1.1
Date: Wed, 12 Jul 2017 10:38:35 GMT
Authorization: jingdong   298718BEDE59FF1B2E96A3152937D37B:mIdihnpi2ZtWTHaji555S0BBEBA=
Host: s-bj.jcloud.com
Connection: Keep-Alive
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/API-Reference/Service-Operations/GetService.md
```
HTTP/1.1 200 OK
Server: nginx
Date: Wed, 12 Jul 2017 10:38:35 GMT
Content-Type: application/json;charset=UTF-8
Content-Length: 462
Connection: keep-alive
x-jss-request-id: A2FC27C60E0BC115
 
{"Buckets":[{"maxAge":0,"crrStatus":0,"Name":"oss-test-cn-north-1",
"CreationDate":"Mon,   10 Jul 2017 08:49:15   GMT","Location":""},
{"maxAge":0,"crrStatus":0,"Name":"sanitytest-object-hb","CreationDate":"Mon,   
10 Jul 2017 13:47:57 GMT","Location":""},
{"maxAge":0,"crrStatus":0,"Name":"video-test","CreationDate":"Tue,   11 Jul 2017 10:03:07   GMT","Location":""},
{"maxAge":0,"crrStatus":0,"Name":"oss-test","CreationDate":"Wed,   12 Jul 2017 07:40:46 GMT","Location":""}]}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Access-Control-And-Permission-Management/Access-Management-Practices.md
```
{
	"Statement": [{
		"Action": [
			"oss:PutObject",
			"oss:GetObject"
		],
		"Effect": "Allow",
		"Resource": [
			"jrn:oss:::bucketA/test/*",
			"jrn:oss:::bucketB/test/*"
		]
	}, {
		"Action": [
			"jcq:*"
		],
		"Effect": "Allow",
		"Resource": [
			"*"
		]
	}],
	"Version": "3"
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Access-Control-And-Permission-Management/Cross-Account-Access-Overview.md
```
 {
	"Version": "2012-10-17",
	"Id": "BucketId",
	"Statement": [{
		"Sid": "OtherAccountAllow",
		"Effect": "Allow",
		"Principal": {
			"AWS": [
				"arn:aws:iam::123334444455:root"
			]
		},
		"Action": ["s3:GetObject", "s3:PutObject"],
		"Resource": "arn:aws:s3:::Bucket1/dir1/Object1"
	}]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Access-Control-And-Permission-Management/Cross-Account-Access-Overview.md
```
 {
	"Version": "2012-10-17",
	"Id": "BucketId",
	"Statement": [{
		"Sid": "SubAccountAllow",
		"Effect": "Allow",
		"Principal": {
			"AWS": [
				"arn:aws:iam::123456789012:user/user1"
			]
		},
		"Action": ["s3:GetObject", "s3:PutObject"],
		"Resource": "arn:aws:s3:::Bucket1/*"
	}]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Access-Control-And-Permission-Management/Cross-Account-Access-Overview.md
```
{
	"Version": "2012-10-17",
	"Id": "BucketId",
	"Statement": [{
		"Sid": "OtherAccountAllow",
		"Effect": "Allow",
		"Principal": {
			"AWS": [
				"arn:aws:iam::123334444455:root"
			]
		},
		"Action": [
			"s3:GetObject",
			"s3:PutObject"
		],
		"Resource": "arn:aws:s3:::Bucket1/dir1/*"
	}]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Access-Control-And-Permission-Management/Cross-Account-Access-Overview.md
```
{
	"Statement": [{
		"Action": [
			"oss:GetObject",
			"oss:PutObject",
			"oss:AbortMultipartUpload"
		],
		"Effect": "Allow",
		"Resource": ["jrn:oss:*:*:Bucket1/dir/*"]
	}],
	"Version": "3"
}

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Bucket-Policy.md
```
{
    "Statement":[
        {
            "Condition":{
                "StringLike":{
                    "aws:Referer":[
                        "",
                        "www.abc.com",
                        "*.123.com"
                    ]
                }
            },
            "Resource":[
                "arn:aws:s3:::ztctest1/*"
            ],
            "Action":[
                "s3:GetObject"
            ],
            "Principal":{
                "AWS":"*"
            },
            "Sid":"Refereracl",
            "Effect":"Allow"
        }
    ],
    "Id":"referer-acl",
    "Version":"2012-10-17"
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/CORS.md
```
curl http://test-cors.oss.cn-east-1.jcloudcs.com/cors.html
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/CORS.md
```
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script>
function loadXMLDoc() {
        var xmlhttp;
        if (window.XMLHttpRequest) {
                xmlhttp=new XMLHttpRequest();
        }
        else {
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        
        xmlhttp.onreadystatechange=function()
        if (xmlhttp.readyState==4 && xmlhttp.status==200) {
              document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
        }
        
        xmlhttp.open("GET","http://test-cors.oss.cn-east-1.jcloudcs.com/cors.html",true);
        xmlhttp.setRequestHeader('test','GET');
        xmlhttp.send("");
}
</script>
</head>

<body>
<h2>Test CORS</h2>
<button type="button" onclick="loadXMLDoc()">请求数据</button>
<div id="myDiv"></div>
</body>
</html>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Data-Migration-Tool.md
```
pip install requests
pip install qiniu
pip install boto3
pip install -U cos-python-sdk-v5
pip install oss2
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Data-Migration-Tool.md
```
#port: 指定该worker使用的端口号，默认值是6262;
#is-continue: True/False,是否继续上次未完成的任务，默认只为True。
port=1234
is-continue=True
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Data-Migration-Tool.md
```
nohup python worker.py &
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Data-Migration-Tool.md
```
nohup python master.py  &
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Data-Migration-Tool.md
```
python probe.py -h
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Data-Migration-Tool.md
```
python probe.py -ip_port ip:port
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Data-Migration-Tool.md
```
python probe.py -f config-master
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Migration-Tool.md
```
jobType: listObject
sourceType: s3file
src.access.id : XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
src.secret.key: YYYYYYYYYYYYYYYYYYYYYYYYYYYYY
src.endpoint : https://s3.cn-north-1.jcloudcs.com
src.bucket : yourbucket
src.prefix :
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Migration-Tool.md
```
jobType: listObject
sourceType: aliyunfile
src.access.id : AAAAAAAAAAAAAAAAAAAAAAAAA
src.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBB
src.endpoint : https://oss-cn-beijing.aliyuncs.com
src.bucket : yourbucket
src.prefix :
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Migration-Tool.md
```
jobType: listObject
sourceType: diskfile
filePath: /yourpath

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Migration-Tool.md
```
jobType: transfer
sourceType: s3file

src.access.id : XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
src.secret.key: YYYYYYYYYYYYYYYYYYYYYYYYYYYYY
src.endpoint : https://s3.cn-north-1.jcloudcs.com
src.bucket : yourbucket
src.prefix :

des.access.id : AAAAAAAAAAAAAAAAAAAAAAAAAAAA
des.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBBBBB
des.endpoint : https://s3.cn-north-1.jcloudcs.com
des.bucket : yourbucket
des.prefix:

#非必填项

task.limit.threadCount: 20
task.limit.qps: 50

transfer.coverFile: true
transfer.put.maxsize: 33554432
transfer.multipart.partsize: 33554432
transfer.multipart.threads: 5

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Migration-Tool.md
```
jobType: transfer
sourceType: aliyunfile

src.access.id : XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
src.secret.key: YYYYYYYYYYYYYYYYYYYYYYYYYYYYY
src.endpoint : https://oss-cn-beijing.aliyuncs.com
src.bucket : yourbucket
src.prefix :

des.access.id : AAAAAAAAAAAAAAAAAAAAAAAAAAA
des.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBBBB
des.endpoint : https://s3.cn-north-1.jcloudcs.com
des.bucket : yourbucket
des.prefix:

#非必填项

task.limit.threadCount: 20
task.limit.qps: 50

transfer.coverFile: true
transfer.put.maxsize: 33554432
transfer.multipart.partsize: 33554432
transfer.multipart.threads: 5

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Migration-Tool.md
```

jobType: transfer
sourceType: diskfile

filePath: /yourpath

 

des.access.id : AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
des.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
des.endpoint : https://s3.cn-north-1.jcloudcs.com
des.bucket : yourbucket
des.prefix:

urlFilePrefix: 1

 #urlFilePrefix设置为1，因为文件系统key如果以“/”开始，则京东云OSS不支持
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Migration-Tool.md
```
jobType: transfer
sourceType: urlfile
filePath: /path/onlyurl.txt
urlType: onlyUrl
urlFilePrefix: 35

des.access.id : AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
des.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
des.endpoint : https://s3.cn-north-1.jcloudcs.com
des.bucket : yourbucket

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Migration-Tool.md
```
jobType: transfer
sourceType: s3file

src.access.id : XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
src.secret.key: YYYYYYYYYYYYYYYYYYYYYYYYYYYYY
src.endpoint : https://s3.cn-north-1.jcloudcs.com
src.bucket : yourbucket
src.prefix :

 

des.access.id : AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
des.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
des.endpoint : https://s3.cn-north-1.jcloudcs.com
des.bucket : yourbucket
des.prefix:

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Migration-Tool.md
```
java -jar transfer-tools-java-1.0.0.jar --Dspring.config.location=application.yml

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Migration-Tool.md
```
grep "1$" audit-0.log*
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/OSS-Verification-Tool.md
```
wget http://downloads.s3.cn-north-1.jcloudcs.com/tools/oss_verification_tool.tar.gz
tar -xzvf oss_verification_tool.tar.gz
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/OSS-Verification-Tool.md
```
test_all_regions.sh
test_cn-east-1_internal.sh
test_cn-east-1.sh
test_cn-east-2_internal.sh
test_cn-east-2.sh
test_cn-north-1_internal.sh
test_cn-north-1.sh
test_cn-south-1_internal.sh
test_cn-south-1.sh
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/OSS-Verification-Tool.md
```
shest/test_suites/test_<region_id>.sh
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/OSS-Verification-Tool.md
```
shest/test_suites/test_cn-north-1.sh // 对华北区各公网域名进行基本功能测试
shest/test_suites/test_cn-north-1_internal.sh // 对华北区各内网域名进行基本功能测试
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/OSS-Verification-Tool.md
```
Test log: /root/shest/log/test_cn-east-1.log
--------------------------------------------------------------------------------
TC tc_oss_basic_test START @ 10/09/18-14:17:18.141
TP: tp_host_resolve  s3.cn-east-1.jcloudcs.com ... PASS
TP: tp_host_resolve  generic.s3.cn-east-1.jcloudcs.com ... PASS
TP: tp_vip_connectivity  222.187.243.43 ... PASS
TP: tp_put_object  s3.cn-east-1.jcloudcs.com/cn-east-1-simple-test ... PASS
TP: tp_put_object  cn-east-1-simple-test.s3.cn-east-1.jcloudcs.com ... PASS
TP: tp_get_object  s3.cn-east-1.jcloudcs.com/cn-east-1-simple-test/hosts ... PASS
TP: tp_get_object  cn-east-1-simple-test.s3.cn-east-1.jcloudcs.com/hosts ... PASS
TC tc_oss_basic_test END - 5 of 5 passed
--------------------------------------------------------------------------------
TC tc_oss_basic_test START @ 10/09/18-14:17:19.609
TP: tp_host_resolve  oss.cn-east-1.jcloudcs.com ... PASS
TP: tp_host_resolve  generic.oss.cn-east-1.jcloudcs.com ... PASS
TP: tp_vip_connectivity  222.187.243.43 ... PASS
TP: tp_vip_connectivity  222.187.243.47 ... PASS
TP: tp_put_object  oss.cn-east-1.jcloudcs.com/cn-east-1-simple-test ... PASS
TP: tp_put_object  cn-east-1-simple-test.oss.cn-east-1.jcloudcs.com ... PASS
TP: tp_get_object  oss.cn-east-1.jcloudcs.com/cn-east-1-simple-test/hosts ... PASS
TP: tp_get_object  cn-east-1-simple-test.oss.cn-east-1.jcloudcs.com/hosts ... PASS
TC tc_oss_basic_test END - 6 of 6 passed
--------------------------------------------------------------------------------
11 of 11 passed
Test log: /root/shest/log/test_cn-east-1.log
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/OSS-Verification-Tool.md
```
test_throughput_cn-east-1.sh
test_throughput_cn-east-2.sh
test_throughput_cn-north-1.sh
test_throughput_cn-south-1.sh
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/OSS-Verification-Tool.md
```
shest/test_suites/test_throughput_<region_id>.sh
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/OSS-Verification-Tool.md
```
shest/test_suites/test_throughput_cn-north-1.sh // 对华北区公网域名进行带宽测试
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/OSS-Verification-Tool.md
```
Test log: /root/shest/log/test_throughput.log
--------------------------------------------------------------------------------
TC tc_oss_throughput_no_delete START @ 09/29/18-20:34:22.691
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 1 ... 13 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 1 ... 38 MB/s - PASS
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 1 ... 17 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 1 ... 94 MB/s - PASS
TC tc_oss_throughput_no_delete END - 4 of 4 passed
--------------------------------------------------------------------------------
TC tc_oss_throughput START @ 09/29/18-20:34:30.533
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 10 ... 91 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 10 ... 104 MB/s - PASS
TP: tp_del_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 10 ... PASS
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 10 ... 142 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 10 ... 223 MB/s - PASS
TP: tp_del_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 10 ... PASS
TC tc_oss_throughput END - 6 of 6 passed
--------------------------------------------------------------------------------
TC tc_oss_throughput START @ 09/29/18-20:34:44.495
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 20 ... 148 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 20 ... 89 MB/s - PASS
TP: tp_del_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 10485760 20 ... PASS
TP: tp_put_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 20 ... 233 MB/s - PASS
TP: tp_get_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 20 ... 221 MB/s - PASS
TP: tp_del_object_concurrent  s3.cn-north-1.jcloudcs.com/cn-north-1-simple-test 104857600 20 ... PASS
TC tc_oss_throughput END - 6 of 6 passed
--------------------------------------------------------------------------------
16 of 16 passed
Test log: /root/shest/log/test_throughput.log
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/OSS-Verification-Tool.md
```
run_tc tc_oss_simple_test s3.cn-north-1.jcloudcs.com cn-north-1
run_tc tc_oss_simple_test oss.cn-north-1.jcloudcs.com cn-north-1
run_tc tc_oss_simple_test s3.cn-south-1.jcloudcs.com cn-south-1
run_tc tc_oss_simple_test oss.cn-south-1.jcloudcs.com cn-south-1
run_tc tc_oss_simple_test s3.cn-east-1.jcloudcs.com cn-east-1
run_tc tc_oss_simple_test oss.cn-east-1.jcloudcs.com cn-east-1
run_tc tc_oss_simple_test s3.cn-east-2.jcloudcs.com cn-east-2
run_tc tc_oss_simple_test oss.cn-east-2.jcloudcs.com cn-east-2
run_tc tc_oss_throughput s3.cn-south-1.jcloudcs.com cn-east-1 1 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-south-1.jcloudcs.com cn-east-1 10 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-north-1.jcloudcs.com cn-east-1 1 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-north-1.jcloudcs.com cn-east-1 10 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-east-1.jcloudcs.com cn-east-1 1 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-east-1.jcloudcs.com cn-east-1 10 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-east-2.jcloudcs.com cn-east-1 1 $(( 10 * MB )) $(( 100 * MB ))
run_tc tc_oss_throughput s3.cn-east-2.jcloudcs.com cn-east-1 10 $(( 10 * MB )) $(( 100 * MB ))
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3cmd.md
```
Python 2.7.12 (default, Dec  4 2017, 14:50:18) 
[GCC 5.4.0 20160609] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3cmd.md
```
git clone https://github.com/jdcloud-cmw/s3cmd.git
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3cmd.md
```
sudo cp -rf s3cmd/ /usr/local/
sudo ln -s /usr/local/s3cmd/s3cmd /usr/bin/s3cmd
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3cmd.md
```
[default]
access_key = [you access key]
secret_key = [you secret key]
access_token = 
add_encoding_exts = 
add_headers = 
bucket_location = cn
ca_certs_file = 
cache_file = 
check_ssl_certificate = True
check_ssl_hostname = True
cloudfront_host = cloudfront.amazonaws.com
default_mime_type = binary/octet-stream
delay_updates = False
delete_after = False
delete_after_fetch = False
delete_removed = False
dry_run = False
enable_multipart = True
encrypt = False
expiry_date = 
expiry_days = 
expiry_prefix = 
follow_symlinks = False
force = False
get_continue = False
gpg_command = /usr/bin/gpg
gpg_decrypt = %(gpg_command)s -d --verbose --no-use-agent --batch --yes --passphrase-fd %(passphrase_fd)s -o %(output_file)s %(input_file)s
gpg_encrypt = %(gpg_command)s -c --verbose --no-use-agent --batch --yes --passphrase-fd %(passphrase_fd)s -o %(output_file)s %(input_file)s
gpg_passphrase = 
guess_mime_type = True
host_base = s3.cn-north-1.jcloudcs.com
host_bucket = %(bucket)s.s3.cn-north-1.jcloudcs.com
human_readable_sizes = False
invalidate_default_index_on_cf = False
invalidate_default_index_root_on_cf = True
invalidate_on_cf = False
kms_key = 
limit = -1
limitrate = 0
list_md5 = False
log_target_prefix = /home/eric/jcloud/s3.log
long_listing = False
max_delete = -1
mime_type = 
multipart_chunk_size_mb = 15
multipart_max_chunks = 10000
preserve_attrs = True
progress_meter = True
proxy_host = 
proxy_port = 0
put_continue = False
recursive = False
recv_chunk = 65536
reduced_redundancy = False
requester_pays = False
restore_days = 1
restore_priority = Standard
send_chunk = 65536
server_side_encryption = False
signature_v2 = False
simpledb_host = sdb.amazonaws.com
skip_existing = False
socket_timeout = 300
stats = False
stop_on_error = False
storage_class = 
urlencoding_mode = normal
use_http_expect = False
use_https = True
use_mime_magic = True
verbosity = WARNING
website_endpoint = http://%(bucket)s.s3.%(location)s.amazonaws.com/
website_error = 
website_index = index.html
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3fs.md
```
sudo yum install automake fuse fuse-devel gcc-c++ git libcurl-devel libxml2-devel make openssl-devel
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3fs.md
```
sudo apt-get install automake autotools-dev fuse g++ git libcurl4-openssl-dev libfuse-dev libssl-dev libxml2-dev make pkg-config
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3fs.md
```
git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse
./autogen.sh
./configure
make
sudo make install
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3fs.md
```
echo Access_Key_ID:Access_Key_Secret > ~/.passwd-s3fs
chmod 600 ~/.passwd-s3fs
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3fs.md
```
mkdir /new
s3fs bucketname /new -o passwd_file=~/.passwd-s3fs -o url="https://s3.cn-north-1.jcloudcs.com"
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3fs.md
```
df -h
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3fs.md
```
yum install automake gcc-c++ git libcurl-devel libxml2-devel make openssl-devel

wget https://github.com/libfuse/libfuse/releases/download/fuse_2_9_4/fuse-2.9.2.tar.gz
tar -zxvf fuse-2.9.2.tar.gz
cd fuse-2.9.2
./configure --prefix=/usr
make
make install
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/lib64/pkgconfig/
ldconfig
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3fs.md
```
git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse
./autogen.sh
./configure --prefix=/usr/local
PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/libxml2/lib/pkgconfig"
make
sudo make install
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/S3fs.md
```
sudo s3fs bucketname /new -o passwd_file=~/.passwd-s3fs -o url="https://s3.cn-north-1.jcloudcs.com" -o uid=11111 -o gid=11111
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Setting-Signature-Authentication-For-Callback-Server.md
```
 VERB + "\n"
+ CONTENT-MD5 + "\n"
+ CONTENT-TYPE + "\n"
+ DATE + "\n"
+ CanonicalizedNSHeaders
+ CanonicalizedResource
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Setting-Signature-Authentication-For-Callback-Server.md
```
POST
ZDgxNjY5ZjFlMDQ5MGM0YWMwMWE5ODlmZDVlYmQxYjI=
text/xml;charset=utf-8
Wed, 25 May 2016 10:46:14 GMT
x-jdcloud-request-id:57458276F0E3D56D7C00054B
x-jdcloud-signing-cert-url:aHR0cDovL25zdGVzdC5vc3MuY24tbm9ydGgtMS5qY2xvdWRjcy5jb20veDUwOV9wdWJsaWNfY2VydGlmaWNhdGUucGVtCg==
x-jdcloud-version:2015-06-06
/notifications
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Setting-Signature-Authentication-For-Callback-Server.md
```
public class SignDemo {
      private Boolean authenticate(String method, String uri, Map<String, String> headers) {
          try {
              //获取证书的URL
              if (!headers.containsKey("x-jdcloud-signing-cert-url")) {
                  System.out.println("x-jdcloud-signing-cert-url Header not found");
                  return false;
              }
             String cert = headers.get("x-jdcloud-signing-cert-url");
             if (cert.isEmpty()) {
                 System.out.println("x-jdcloud-signing-cert-url empty");
                 return false;
             }
             cert = new String(Base64.decodeBase64(cert));
             System.out.println("x-jdcloud-signing-cert-url:\t" + cert);
  
             //根据URL获取证书，并从证书中获取公钥
             URL url = new URL(cert);
             HttpURLConnection conn = (HttpURLConnection) url.openConnection();
             DataInputStream in = new DataInputStream(conn.getInputStream());
             CertificateFactory cf = CertificateFactory.getInstance("X.509");
             Certificate c = cf.generateCertificate(in);
             PublicKey pk = c.getPublicKey();
  
             //获取待签名字符串
             String str2sign = getSignStr(method, uri, headers);
             System.out.println("String2Sign:\t" + str2sign);
  
             //对Authorization字段做Base64解码
             String signature = headers.get("Authorization");
             byte[] decodedSign = Base64.decodeBase64(signature);
  
             //认证
             java.security.Signature signetcheck = java.security.Signature.getInstance("SHA1withRSA");
             signetcheck.initVerify(pk);
             signetcheck.update(str2sign.getBytes());
             Boolean res = signetcheck.verify(decodedSign);
             return res;
         } catch (Exception e) {
             e.printStackTrace();
             return false;
         }
     }
  
     private String getSignStr(String method, String uri, Map<String, String> headers) {
         StringBuilder sb = new StringBuilder();
         sb.append(method);
         sb.append("\n");
         sb.append(safeGetHeader(headers, "Content-md5"));
         sb.append("\n");
         sb.append(safeGetHeader(headers, "Content-Type"));
         sb.append("\n");
         sb.append(safeGetHeader(headers, "Date"));
         sb.append("\n");
  
         List<String> tmp = new ArrayList<String>();
         for (Map.Entry<String, String> entry : headers.entrySet()) {
             if (entry.getKey().startsWith("x-jdcloud-")) {
                 tmp.add(entry.getKey() + ":" + entry.getValue());
             }
         }
         Collections.sort(tmp);
  
         for (String kv : tmp) {
             sb.append(kv);
             sb.append("\n");
         }
  
         sb.append(uri);
         return sb.toString();
     }
  
     private String safeGetHeader(Map<String, String> headers, String name) {
         if (headers.containsKey(name)) {
             return headers.get(name);
         } else {
             return "";
         }
     }
  
     public static void main(String[] args) {
         SignDemo sd = new SignDemo();
         Map<String, String> headers = new HashMap<String, String>();
         headers.put("Authorization", "Mko2Azg9fhCw8qR6G7AeAFMyzjO9qn7LDA5/t9E+6X5XURXTqBUuhpK+K55UNhrnlE2UdDkRrwDxsaDP5ajQdg==");
         headers.put("Content-md5", "M2ViOTE2ZDEyOTlkODBjMjVkNzM4YjNhNWI3ZWQ1M2E=");
         headers.put("Content-Type", "text/xml;charset=utf-8");
         headers.put("Date", "Tue, 23 Feb 2016 09:41:06 GMT");
         headers.put("x-jdcloud-request-id", "56CC2932F0E3D5BD530685CB");
         headers.put("x-jdcloud-signing-cert-url", "aHR0cDovL25zdGVzdC5vc3MuY24tbm9ydGgtMS5qY2xvdWRjcy5jb20veDUwOV9wdWJsaWNfY2VydGlmaWNhdGUucGVtCg==");
         Boolean res = sd.authenticate("POST", "/notifications", headers);
         System.out.println("Authenticate result:" + res);
     }
 }
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Signature-In-URL-1.md
```
<dependency>
<groupId>com.amazonaws</groupId>
<artifactId>aws-java-sdk</artifactId>
<version>1.11.136</version>
</dependency>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Signature-In-URL-1.md
```
import java.net.URL;
import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.SDKGlobalConfiguration;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.S3ClientOptions;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
 
public class GeneratePresignUrl {   
   static AmazonS3 createS3Client(String accessKey, String secretKey, String endpoint) {
      System.setProperty(SDKGlobalConfiguration.ENABLE_S3_SIGV4_SYSTEM_PROPERTY, "true");
      AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey,secretKey);
      ClientConfiguration config = new ClientConfiguration();
      config.setProtocol(Protocol.HTTP);
      AmazonS3 s3 = new AmazonS3Client(awsCredentials,config);
      s3.setEndpoint(endpoint);
      S3ClientOptions options = new S3ClientOptions();
      options.withChunkedEncodingDisabled(true); // Must have
      s3.setS3ClientOptions(options);
      return s3;
   }
   static public URL generatePresignUrl(String accessKey, String secretKey, String endpoint,String bucketName,String keyName) {
      AmazonS3 s3 = createS3Client(accessKey,secretKey,endpoint);
      GeneratePresignedUrlRequest request = new GeneratePresignedUrlRequest(bucketName, keyName);
      return s3.generatePresignedUrl(request);
   }
   static public void main(String []str) {
      final String accessKey = "<your accessKey>";
      final String secretKey = "<your secretKey>";
      final String endpoint = "<your endpoint>";
      final String bucketName = "<your bucketname>";
      final String keyName = "<your keyname>";
      System.out.println(generatePresignUrl(accessKey, secretKey, endpoint, bucketName, keyName));
   }  
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Transfer-For-Mobile-Apps.md
```
import java.net.URL;
import java.util.Date;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.HttpMethod;
import com.amazonaws.Protocol;
import com.amazonaws.SDKGlobalConfiguration;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.S3ClientOptions;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;

public class PresignUrl {
    static AmazonS3 createS3Client(String accessKey, String secretKey, String endpoint) {
        System.setProperty(SDKGlobalConfiguration.ENABLE_S3_SIGV4_SYSTEM_PROPERTY, "true");
        AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey,secretKey);
        ClientConfiguration config = new ClientConfiguration();
        config.setProtocol(Protocol.HTTP);
        AmazonS3 s3 = new AmazonS3Client(awsCredentials,config);
        s3.setEndpoint(endpoint);
        S3ClientOptions options = new S3ClientOptions();
        options.withChunkedEncodingDisabled(true); // Must have
        s3.setS3ClientOptions(options);
        return s3;
    }
    static public URL generatePresignUrl(String accessKey, String secretKey, String endpoint, String bucketName, String keyName, HttpMethod method, Date expiration) {
        AmazonS3 s3 = createS3Client(accessKey,secretKey,endpoint);
        GeneratePresignedUrlRequest request = new GeneratePresignedUrlRequest(bucketName, keyName)
                .withMethod(method)
                .withExpiration(expiration);
        return s3.generatePresignedUrl(request);
    }
    static public void main(String [ ]str) {
        final String accessKey = "<your accessKey>";
        final String secretKey = "<your secretKey>";
        final String endpoint = "<your endpoint>";
        final String bucketName = "<your bucketname>";
        final String keyName = "<your keyname>";
        final HttpMethod method = HttpMethod.PUT;  //此处设置您的PresignUrl允许的HTTP方法
        final Integer expireInSeconds = 100;  //此处设置您的PresignUrl有效的时间段，以秒为单位
        final Date expiration = new Date(System.currentTimeMillis() + expireInSeconds * 1000);

        URL url = generatePresignUrl(accessKey, secretKey, endpoint, bucketName, keyName, method, expiration);
        System.out.println("Pre-Signed URL: " + url);
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Transfer-For-Mobile-Apps.md
```
http://testbucket.s3.cn-north-1.jcloudcs.com/testkey
?X-Amz-Algorithm=AWS4-HMAC-SHA256
&X-Amz-Date=20190117T061845Z
&X-Amz-SignedHeaders=host
&X-Amz-Expires=98
&X-Amz-Credential=59E6DC72927457BDEBF36A56EE616B07
%2F20190117%2Fcn-north-1%2Fs3%2Faws4_request
&X-Amz-Signature=cc379e30731236473de05dcb7a3ad1b275fb0d6af58ecfdbd06e2dd051dd57ed
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Transfer-For-Mobile-Apps.md
```
curl -X PUT -T testfile "http://testbucket.s3.cn-north-1.jcloudcs.com/testkey?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20190117T044444Z&X-Amz-SignedHeaders=host&X-Amz-Expires=98&X-Amz-Credential=59E6DC72927457BDEBF36A56EE616B07%2F20190117%2Fcn-north-1%2Fs3%2Faws4_request&X-Amz-Signature=a21204debab7c0b0c4ba334e6a9f76d5b6ce3328591acc29890540ddee513dcf" -v
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Best-Practices/Transfer-For-Mobile-Apps.md
```
import org.springframework.http.HttpHeaders;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.*;
import java.nio.charset.StandardCharsets;

@RestController
public class SubscriptionTest {

    //简单格式的消息通知
    @RequestMapping("/notifications1")
    public String notifications1(@RequestBody String message
            , @RequestHeader HttpHeaders headers) {
		
        if (headers.get("x-jdcloud-message-type").get(0).equals("SubscriptionConfirmation")) {
			//设置时对url的校验，需要对message进行base64编码并返回
            return Base64Utils.encodeToString(message.getBytes(StandardCharsets.UTF_8));
        } else {
            //消息通知处理  your code，处理完毕后需要返回 http code 200，body不做校验
            return "";
        }
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-Bucket-Policy.md
```
    //单个账号

    "Principal":{"AWS":"arn:aws:iam::123456789012:root"}
 

    //多个账号

    "Principal": {
    "AWS": [
    "arn:aws:iam::123456789012:root",
    "arn:aws:iam::123456789010"
    ]
    }  

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-Bucket-Policy.md
```
    //单个IAM 子用户
    "Principal": { "AWS": "arn:aws:iam::123456789012:user/user-name" }  
    //多个IAM 子用户
    "Principal": {
    "AWS": [
        "arn:aws:iam::123456789012:user/user-name-1",
        "arn:aws:iam::111111111111:user/UserName2"
     ]
    }

``` 


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-Bucket-Policy.md
```
  "Principal":{"AWS":"*"}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-Bucket-Policy.md
```
"Effect" : "Allow"
//或者
"Effect" : "Deny"

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-Bucket-Policy.md
```
arn:aws:s3:::relative-id
//示例：
arn:aws:s3:::bucket_name 
arn:aws:s3:::bucket_name/key_name
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-Bucket-Policy.md
```
 "Condition": {
         "IpAddress": {"aws:SourceIp": "54.240.143.0/24"},
         "NotIpAddress": {"aws:SourceIp": "54.240.143.188/32"} 
      } 

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-Bucket-Policy.md
```
  "Condition":{
        "StringLike":{"aws:Referer":["http://www.example.com/*","http://example2.com"]}
      }

```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-Bucket-Policy.md
```

{
	"Statement": [{
		"Sid": "allowReferer",
		"Effect": "Allow",
		"Principal": {
			"AWS": "*"
		},
		"Action": [
			"s3:PutObject",
			"s3:GetObject"
		],
		"Resource": [
			"arn:aws:s3:::yourbucket/*"
		],
		"Condition": {
			"StringLike": {
				"aws:Referer": [
					"www.abcxxx.com"
				]
			}
		}
	}],
	"Id": "20190125114348155",
	"Version": "2012-10-17"
}


```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-Bucket-Policy.md
```
 {
	"Version": "2012-10-17",
	"Id": "BucketId",
	"Statement": [{
		"Sid": "OtherAccountAllow",
		"Effect": "Allow",
		"Principal": {
			"AWS": [
				"arn:aws:iam::123456789012:root"
			]
		},
		"Action": ["s3:GetObject", "s3:PutObject"],
		"Resource": "arn:aws:s3:::testbucket/image.png"
	}]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-IAM-Policy.md
```
//示例：
jrn:oss:*:*:bucket_name
jrn:oss:*:*:bucket_name/key_name
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-IAM-Policy.md
```
{
    "Statement": [
        {
            "Action": [
                "oss:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ],
    "Version": "3"
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-IAM-Policy.md
```
{
    "Statement": [
        {
            "Action": [
                "oss:GetObject",
                "oss:ListBucket"
            ],
            "Effect": "Allow",
            "Resource": [
                "jrn:oss:*:*:app-base-oss/*",
                "jrn:oss:*:*:app-base-oss"
            ]
        }
    ],
    "Version": "3"
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-IAM-Policy.md
```
{
    "Statement": [
        {
            "Action": [
                "oss:GetObject",
                "oss:ListBucket"
            ],
            "Effect": "Allow",
            "Resource": [
                "jrn:oss:*:*:app-base-oss/myuser1/*",
                "jrn:oss:*:*:app-base-oss"
            ]
        }
    ],
    "Version": "3"
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-IAM-Policy.md
```
{
    "Statement": [
        {
            "Action": [
                "oss:PutObject"
            ],
            "Effect": "Allow",
            "Resource": [
                "jrn:oss:*:*:app-base-oss/myuser1/*"
            ]
        }
    ],
    "Version": "3"
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-IAM-Policy.md
```
{
    "Statement": [
        {
            "Action": [
                "oss:PutObject"
            ],
            "Effect": "Allow",
            "Resource": [
                "jrn:oss:*:*:app-base-oss/*"
            ]
        }
    ],
    "Version": "3"
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-IAM-Policy.md
```
{
    "Statement": [
        {
            "Action": [
                "oss:GetObject",
                "oss:PutObject",
                "oss:DeleteObject",
                "oss:ListBucket",
                "oss:AbortMultipartUpload"
            ],
            "Effect": "Allow",
            "Resource": [
                "jrn:oss:*:*:app-base-oss/*",
                "jrn:oss:*:*:app-base-oss"
            ]
        }
    ],
    "Version": "3"
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Access-Control/Access-Control-Base-On-IAM-Policy.md
```
{
    "Statement": [
        {
            "Action": [
                "oss:GetObject",
                "oss:PutObject",
                "oss:DeleteObject",
                "oss:ListBucket",
                "oss:AbortMultipartUpload"
            ],
            "Effect": "Allow",
            "Resource": [
                "jrn:oss:*:*:app-base-oss/myuser1/*",
                "jrn:oss:*:*:app-base-oss"
            ]
        }
    ],
    "Version": "3"
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Image-Service-Guide/Obtain-Image-Information.md
```
{"FileType":"JPEG","FileSize":"38539","ImageWidth":"350","ImageHeight":"236","Make":"Canon","Model":"Canon EOS 1100D","Software":"www.meitu.com","ExposureTime":"1/200","ExifOffset":"118","ExposureTime":"1/200","FNumber":"5/1","ISOSpeedRatings":"160, 0","DateTimeOriginal":"2013:05:17 16:21:36","Flash":"16, 0","FocalLength":"140/1","LensModel":"EF75-300mm f/4-5.6"}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Image-Service-Guide/Response-To-Errors.md
```
{"code":"BadRequest","message":"BadRequest","resource":"/zsytest/example.jpg","requestId":"ADDB2C69B9FB23E9"}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/Callback-Notification-2.md
```
    <NotificationConfiguration>
        <TopicConfiguration>
            <Id>ConfigurationId</Id>  
            <Filter>
                <S3Key>
                    <FilterRule>
                        <Name>prefix</Name>
                        <Value>prefix-value</Value>
                    </FilterRule>
                    <FilterRule>
                        <Name>suffix</Name>
                        <Value>suffix-value</Value>
                    </FilterRule>
               </S3Key>
            </Filter>
            <Topic>NS:endpoint1,endpoint2</Topic>
            <Event>event-type</Event>
            <Event>event-type</Event>
            ...
        </TopicConfiguration>
        ...
    </NotificationConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/Callback-Notification-2.md
```
"callBackVar": {
    "callBackVars": {                 
	"a":["test1"],
	"b":["test2"]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/Callback-Notification-2.md
```
{  
   "Records":[  
      {  
         "eventVersion":"1.0",  //版本号，目前为"1.0"
         "eventSource":"oss",  //事件源，固定为"oss"
         "awsRegion":"cn-north-1",  //Bucket所在region
         "eventTime":Mon, 06 Aug 2018 10:19:51 GMT,  //事件触发时间
         "eventName":"event-type",  //事件类型
         "userIdentity":{  
            "principalId":"userId-of-the-user-who-caused-the-event"  //触发事件用户ID
         },
         "requestParameters":{  
            "sourceIPAddress":"domain-name-where-request-came-from"  //发起事件请求的域名
         },
         "responseElements":{  
            "x-amz-request-id":"OSS generated request ID"  //发起事件的请求ID
         },
         "s3":{  
            "s3SchemaVersion":"1.0",  //通知内容版本号，目前为"1.0"
            "configurationId":"ID found in the bucket notification configuration",  //事件通知配置中ConfigurationId
            "bucket":{  
               "name":"bucket-name",  //Bucket名称
               "ownerIdentity":{  
                  "principalId":"userId-of-the-bucket-owner"  //Bucket owner用户ID
               }
            },
            "object":{  
               "key":"object-key",  //Object名称
               "eTag":"object eTag"  //Object的etag，与GetObject请求返回的ETag头的内容相同
            }
         },
	"callBackVar": {  //回调通知配置中的自定义参数
	    "callBackVars": {                 
		"var1":["value1","value3"],
		"var2":["value2"]
	    }
         }
      }
   ]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/Callback-Notification-2.md
```
import org.springframework.http.HttpHeaders;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.*;
import java.nio.charset.StandardCharsets;

@RestController
public class SubscriptionTest {

    //简单格式的消息通知
    @RequestMapping("/notifications1")
    public String notifications1(@RequestBody String message
            , @RequestHeader HttpHeaders headers) {
		
        if (headers.get("x-jdcloud-message-type").get(0).equals("SubscriptionConfirmation")) {
			//设置时对url的校验，需要对message进行base64编码并返回
            return Base64Utils.encodeToString(message.getBytes(StandardCharsets.UTF_8));
        } else {
            //消息通知处理  your code，处理完毕后需要返回 http code 200，body不做校验
            return "";
        }
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/Lifecycle.md
```
<LifecycleConfiguration>
  <Rule>
    <ID>id1</ID>
    <Filter>
       <Prefix>log1/</Prefix>
    </Filter>
    <Status>Enabled</Status>
    <Expiration>
       <Days>365</Days>
    </Expiration>
  </Rule>
  <Rule>
    <ID>id2</ID>
    <Filter>
       <Prefix>log2/</Prefix>
    </Filter>
    <Status>Enabled</Status>
    <Expiration>
       <Date>2020-01-01T00:00:00.000Z</Date>
    </Expiration>
  </Rule>  
  ...
</LifecycleConfiguration>
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/Manage-Origin-Retrieval-Settings-2.md
``` 
Content-Type
Content-Encoding
Content-Disposition
Cache-Control
Expires
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/Manage-Origin-Retrieval-Settings-2.md
```
    GET /object
    host : bucket.s3.cn-north-1.jcloudcs.com
    a-header : 111
    b-header : 222
    c-header : 333
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/Manage-Origin-Retrieval-Settings-2.md
```
    GET /object
    host : source.com
    a-header : 111
    c-header : 000
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/Set-Custom-Domain-Name-2.md
```<BucketName>.<Endpoint>```
[外网域名- endpoint ](../../API-Reference-S3-Compatible/Regions-And-Endpoints.md)



自定义域名绑定成功后，OSS中存储文件的访问地址可使用自定义域名。例如，您的存储空间example位于华北-北京，对象文件名称为test.jpg，绑定的自定义域名为hello-world.com，则该对象访问地址为：

* 未绑定之前：example.oss.cn-north-1.jcloudcs.com /test.jpg
* 绑定成功后：hello-world.com/test.jpg
  您可以通过控制台将自定义域名绑定到OSS外网域名上实现自定义域名访问存储空间下的文件。

## 绑定域名操作步骤
1.登入控制台->对象存储->空间管理->进入某个Bucket->空间设置，点击“自定义域名”。

2.单击添加域名按钮，打开绑定用户域名页面，如下图所示：

![图片](https://github.com/jdcloudcom/cn/blob/edit/image/Object-Storage-Service/OSS-094.jpg)
 
3.绑定域名

 *  在用户域名框中，输入要绑定的域名名称。
 *  如果需要CDN加速，通过单击自定义域名tab 也的提示文案，前往京东云CDN控制台开通CDN加速。
 
4.单击提交。

**说明**
 
*  一个域名只能绑定相同地域中一个Bucket，每个Bucket最多绑定20个域名。
*  您绑定的域名需在工信部备案，否则域名访问将会受到影响。
*  建议您将自定义的域名访问绑定在属于自己的Bucket上面。域名绑定成功后，为了使用域名正常访问OSS，还需要需要用户到域名解析商处添加CNAME记录指向OSS访问域名。
*  如果您的用户域名需要通过HTTPS的方式访问OSS服务，必须购买相应的数字证书。并通过工单提交您的证书，并通过京东云OSS托管您的证书，详见[自定义域名支持HTTPS访问 OSS 服务](../../Best-Practices/Custom-Domain-Name-Guidance.md)。
*  如果您输入的域名已经被其他用户恶意绑定，系统将提示域名被绑定。您可以单击提交工单的方式，按照OSS的验证方案，完成验证域名所有权，如果通过域名所有权验证，即可绑定域名，同时解除此域名与之前存储空间的绑定关系。
*  目前仅支持使用自定义域名下载文件，如您需上传文件或对Bucket进行各种操作请使用京东云OSS访问域名。


## 域名解析操作步骤（以京东云云解析为例）

登录京东云云解析DNS 控制台进入域名解析列表页面。
单击目标域名或右侧的解析按钮进入域名解析页面。
单击添加解析后，打开添加解析页面。
在记录类型下拉列表中，选择CNAME；在记录值框中，填写对应的存储空间外网域名（即Bucket域名，如BucketName.oss.cn-north-1.jcloudcs.com）。
单击确认，域名解析完成。
具体参考[京东云云解析DNS-添加解析记录](https://docs.jdcloud.com/cn/jd-cloud-dns/domain-record-add)
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/edgeStorage.md
```
x-jdcloud-request-id: "97eef699115c2d3ab60c5c5055d5a989",
x-jdcloud-pin: "userPin"
x-jdcloud-userId: "526595513548"
migrationType: 1
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/edgeStorage.md
```
{
  "group": "pictures",
  "ossRegion": "cn-north-1",
  "ossBucket": "pictures",
  "items": [
    {
      "objectKey": "son/cute.jpg",
      "ossKey": "son/cute.jp"
    },
    {
      "objectKey": "wife/pretty.jpg",
      "ossKey": "wife/pretty.jpg"
    }
  ]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/edgeStorage.md
```json
{
  "requestId": "xxxx",
  "result": {
    "taskIds": [
      "taskId1-xxx",
      "taskId2-xxx"
    ]
  }
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/edgeStorage.md
```
x-jdcloud-request-id: "97eef699115c2d3ab60c5c5055d5a989",
x-jdcloud-pin: "userPin"
x-jdcloud-userId: "526595513548"
migrationType: 2
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/edgeStorage.md
```
{
  "group": "pictures",
  "ossRegion": "cn-north-1",
  "ossBucket": "pictures",
  "items": [
    {
      "objectHash": "Qmxxx",
      "ossKey": "son/cute.jp"
    }
    {
      "objectHash": "Qmxxx",
      "ossKey": "wife/pretty.jpg"
    }
  ]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/edgeStorage.md
```json
{
  "requestId": "xxxx",
  "result": {
    "taskIds": [
    "taskId1-xxx",
    "taskId2-xxx"
    ]
  }
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/edgeStorage.md
```
x-jdcloud-request-id: "97eef699115c2d3ab60c5c5055d5a989",
x-jdcloud-pin: "henry",
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/edgeStorage.md
```
{
   "requestId": "xxxx",
   "result": {
        "fileInfos": [
            {
                "id": "xxxx"
                "pin": "henry",
                "region": "cn-north-1",
                "group": "pictures",
                "objectKey": "self_in_beijing.jpg",
                "objectCid": "xxxxx",
                "objectSize": 1024,
                "createdTime": "2018-11-29 11:51:52",
                "deleteTime": "2018-11-29 11:51:52",
            },
            {
                "id": "xxxx"
                "pin": "henry",
                "region": "cn-north-1",
                "group": "pictures",
                "objectKey": "child_in_beijing.jpg",
                "objectCid": "xxxxx",
                "objectSize": 2048,
                "createdTime": "2018-11-28 11:51:52",
                "deleteTime": "2018-11-29 11:51:52",
            },
        ],
         "marker": "child_in_beijing.jpg",
         "totalCount":2
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/edgeStorage.md
```
x-jdcloud-request-id: "97eef699115c2d3ab60c5c5055d5a989",
x-jdcloud-pin: "userPin"
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/edgeStorage.md
```json
{
    "requestId": "test-request-id",
    "result": {
        "lastMarker": "5c125c558309dcc3e3503522",
        "totalCount": 2,
        "taskInfos": [
            {
                "userId": "808973897732",
                "pin": "oss-test-01",
                "taskId": "5c1345ab8309dc86f7f7fab3",
                "migrationType": 1,
                "state": 4,
                "errorMsg": "NotFound: Not Found\n\tstatus code: 404, request id: , host id: ",
                "group": "test-group",
                "objectKey": "migration-worker-ut-wrong",
                "objectHash": "",
                "ossRegion": "cn-int-1",
                "ossBucket": "epn-int-1",
                "ossKey": "migration-worker-ut-wrong",
                "createdTime": "2018-12-14 05:54:51",
                "finishedTime": "2018-12-14 07:07:34"
            },
            {
                "userId": "808973897732",
                "pin": "oss-test-01",
                "taskId": "5c125c558309dcc3e3503522",
                "migrationType": 1,
                "state": 3,
                "errorMsg": "",
                "group": "epn-int-1",
                "objectKey": "migration-worker-ut3",
                "objectHash": "QmSJT66hcriFyovZxLQWLQHAqahfs7jP4C7D1giFUhwrcV",
                "ossRegion": "cn-int-1",
                "ossBucket": "epn-int-1",
                "ossKey": "migration-worker-ut3",
                "createdTime": "2018-12-14 05:54:51",
                "finishedTime": "2018-12-14 07:07:34"
            }
        ]
    }
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Object/Post-Object-1.md
```
 { "expiration": "2018-12-01T12:00:00.000Z",
  "conditions": [
    {"bucket": "myBucketName" },
    ["starts-with", "$key", "user/yuyu/"],
  ]
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Create-Video-Transcoding.md
```
PUT /bucket/object?pretreatmentStrategyV2&expires=<expires value>&policy=<policy string>  HTTP/1.1
Content-MD5: 
Content-Disposition: 
Host: oss.cn-north-1.jcloudcs.com
Date: date
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Create-Video-Transcoding.md
```
PUT /bucket/object?pretreatmentStrategyV2&expires=3600&policy={"persistentOps":"video_mp4_480x360_440kbps","saveas":"kkk:aaaa.wmv","targetSaveas":"a2trOmFhYWEud212"} HTTP/1.1
   Date: Mon, 22 Feb 2016 03:35:32 GMT
   Authorization: jingdong   NcB3e3VUn45NtjV3:A0LcbZin1FhRnSH697Q0D+64t8E=
   Content-Length: 0
   Host: oss.cn-north-1.jcloudcs.com
   Connection: Keep-Alive
User-Agent: JSS-SDK-JAVA/1.2.0 (Java 1.8.0_45; Vendor Oracle Corporation; Windows 7 6.1; HttpClient 4.2.1)
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Create-Video-Transcoding.md
```
HTTP/1.1 200 OK
x-jss-request-id: 8CEF3204E1AD1C2D
Server: JSS/1.0
ETag: "a0eb630d0cab1a1240b2bae67410cdb7"
Content-Type: application/json;charset=UTF-8
Content-Length: 34
Date: Tue, 15 Dec 2015 13:10:50 GMT
{“taskId”: "0a354cca27994b398931b205bbf96985"}   
错误返回信息：
{"code":"NoSuchKey","message":" The specified file used for video transcoding does not exist, file name = Wildlifetest.wmv","resource":"/test-bucket13/Wildlifetest.wmv","requestId":"8764E879D8AEE8BF"}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Delete-Video-Task.md
```
DELETE deleteVideoTask&taskId= taskId
Host: oss.cn-north-1.jcloudcs.com
Date: date
Authorization: signatureValue#请参照《安全认证》
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Delete-Video-Task.md
```
DELETE deleteVideoTask&taskId=78fbb093de19fc HTTP/1.1
Date: Tue, 15 Dec 2015 12:55:54 GMT
Authorization: jingdong 2sTXh1AoApNv5x8p:X/CQ6sMZWPFun1k9k3rUZL/Psgw=
Content-Length: 0
Host: oss.cn-north-1.jcloudcs.com
Connection: Keep-Alive
User-Agent: JFS-JCLOUD-SDK-JAVA/1.0.0 (Java 1.8.0_45; Vendor Oracle Corporation; Windows 7 6.1; HttpClient 4.2.1)
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Delete-Video-Task.md
```
HTTP/1.1 200 OK
x-jss-request-id: BBDC82A4C4B61A5F
Server: JSS/1.0
Content-Type: application/json;charset=UTF-8
Content-Length: 4
Date: Tue, 15 Dec 2015 13:08:06 GMT
true
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Get-Video-Task.md
```
GET searchVideoList&videoTaskQuery=videoTaskQuery HTTP/1.1
Host: oss.cn-north-1.jcloudcs.com
Date: date
Authorization: signatureValue#请参照《安全认证》
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Get-Video-Task.md
```
GET http://oss.cn-north-1.jcloudcs.com/?searchVideoList&videoTaskQuery=%7B%22flag%22%3A0%2C%22mysqlPage%22%3A0%2C%22orderCloumn%22%3A%22update_time%22%2C%22orderType%22%3A%22desc%22%2C%22page%22%3A1%2C%22pageSize%22%3A10%2C%22status%22%3A0%7DHTTP/1.1
Date: Tue, 15 Dec 2015 12:59:11 GMT
Authorization: jingdong 2sTXh1AoApNv5x8p:opNHt6cimASzR20CcsglKbpSaxQ=
Content-Length: 0
Host: oss.cn-north-1.jcloudcs.com
Connection: Keep-Alive
User-Agent: JFS-JCLOUD-SDK-JAVA/1.0.0 (Java 1.8.0_45; Vendor Oracle Corporation; Windows 7 6.1; HttpClient 4.2.1)
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Get-Video-Task.md
```
HTTP/1.1 200 OK
x-jss-request-id: AF4C3B343F152E1A
Server: JSS/1.0
Content-Type: application/json;charset=UTF-8
Content-Length: 504
Date: Tue, 15 Dec 2015 13:09:03 GMT
{"total":2,"page":1,"videoResultList":[{"taskId":"03a81cda7ac841d69191b5666687cdb5","status":1,"bucket":"jfs-m3","objectKey":"fidd.wmv","options":"av/fmt/mp4/s/1920/1080/vb/1500000/ab/128000/saveas/a2trOmFiYy53bXY","updateTime":1449166599000,"taskOutputObjectList":null},{"taskId":"11311576e2ee46d3b11dd4672d8e13c4","status":1,"bucket":"jfs-m3","objectKey":"fidd.wmv","options":"av/fmt/mp4/s/1920/1080/vb/1500000/ab/128000/saveas/a2trOmFiYy53bXY","updateTime":1449166260000,"taskOutputObjectList":null}]}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Query-Video-Task.md
```
GET getVideoTask&taskId= taskId
Host: oss.cn-north-1.jcloudcs.com
Date: date
Authorization: signatureValue#请参照《安全认证》
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Query-Video-Task.md
```
GET getVideoTask&taskId=11311576e2ee46d3b11dd4672d8e13c4 HTTP/1.1
Date: Tue, 15 Dec 2015 12:43:24 GMT
Authorization: jingdong 2sTXh1AoApNv5x8p:AsYj3qfR2lhnwZT+5ZweZG0JgOs=
Host: oss.cn-north-1.jcloudcs.com
Connection: Keep-Alive
User-Agent: JFS-JCLOUD-SDK-JAVA/1.0.0 (Java 1.8.0_45; Vendor Oracle Corporation; Windows 7 6.1; HttpClient 4.2.1)
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/Query-Video-Task.md
```
HTTP/1.1 200 OK
x-jss-request-id: 99AC4715136F3038
Server: JSS/1.0
Content-Type: application/json;charset=UTF-8
Content-Length: 325
Date: Tue, 15 Dec 2015 13:09:03 GMT
{"taskId":"702d79de74494ec9ac47693e946093b7","status":1,"bucket":"jfs-m3","objectKey":"IVTT.mp4","options":"av/fmt/mp4/s/480/360/vb/440000/ab/48000/saveas/a2trOmFhYWEud212","updateTime":1450108357000,"taskOutputObjectList":[{"tId":1023,"objectKey":"IVT.mp4","bucket":"abc"},{"tId":1023,"objectKey":"ITT.mp4","bucket":"abc"}]}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/User-Signature-Authentication.md
```
Authorization ="jingdong" + " " + AccessKey + ":" + Signature;
Signature =base64(HMAC-SHA1(AccessKeySecret, UTF-8-Encoding-Of( StringToSign ) ) )
StringToSign =HTTP-Verb + "\n"
                       + Content-MD5 + "\n"
                       + Content-Type + "\n"
                       + Date + "\n"
                       + CanonicalizedHeaders
                       + CanonicalizedResource;
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/User-Signature-Authentication.md
```
import javax.crypto.Mac;
  
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
 
String secretKey = "1MYaiNh3NeN9SuxaqFjSrc7I49rWKkQCxpl9eLNZ";

String signString = "PUT\n0c791a8c18017c7ad1675936d12bae5d\ntext/plain\nThu, 13 Jul 2017 02:37:31 GMT\n 
                     x-jss-server-side-encryption:false\n/oss-test/sign.txt";

SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"),"HmacSHA1");

Mac mac = Mac.getInstance("HmacSHA1");

mac.init(signingKey);

byte[] rawHmac = mac.doFinal(signString.getBytes("UTF-8"));

String signature =  new String(Base64.encodeBase64(rawHmac), "UTF-8");
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Video-Service-Guide/User-Signature-Authentication.md
```
PUT /sign.txt   HTTP/1.1
  Content-Type: text/plain
  Content-MD5: 0c791a8c18017c7ad1675936d12bae5d
  x-jss-server-side-encryption: false
  Date: Thu, 13 Jul 2017 02:37:31 GMT
  Authorization: jingdong qbS5QXpLORrvdrmb: xvj2Iv7WcSwnN26XYnTq/c2YBQs=
  Content-Length: 20
  Host: oss.cn-north-1.jcloudcs.com
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Create-Bucket-3.md
```
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endpoint = "oss.cn-north-1.jcloudcs.com";  
//您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey = "<yourAccessKey>";  
String SecretKey = "<yourSecretKey>";  
   
// 创建JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
//默认配置文件。如用户需要个别配置，则自行配置。例:config.setMaxConnections(20);  
ClientConfig config = new ClientConfig();  
JingdongStorageService jss= new JingdongStorageService (credential, config);  
//设置Endpoint  
jss.setEndpoint(endpoint);  
       
// 创建bucket  
String bucketName = "<your-bucket-name>";  
jss.createBucket(bucketName);  
//关闭jss  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Delete-Bucket-3.md
```
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endpoint = "oss.cn-north-1.jcloudcs.com";  
//您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey = "<yourAccessKey>";  
String SecretKey = "<yourSecretKey>";  
      
// 创建JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
//默认配置文件。如用户需要个别配置，则自行配置。例:config.setMaxConnections(20);  
ClientConfig config = new ClientConfig();  
JingdongStorageService jss= new JingdongStorageService (credential, config);  
//设置Endpoint  
jss.setEndpoint(endpoint);  
      
// 删除bucket  
jss.deleteBucket("<bucketName>");  
// 关闭jss  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Delete-Object-3.md
```
//您的AccessKey和SecretKey可以登录到京东云存储的控制台，在【Access Key 管理】中查看。    
String accessKey =  "<yourAccessKeyId>";    
String secreteKey = "<yourSecretKey>";         
// endpoint以华北为例，其它region请按实际情况填写    
String endPoint = "oss.cn-north-1.jcloudcs.com";    
String bucketName = "<yourBucketName>";    
String objectName = "<yourObjectName>";        
//ClientConfig当前为默认配置，用户可根据需要自行配置，如设置连接超时时间等    
ClientConfig config = new ClientConfig();       
     
//构造JingdongStorageService实例    
Credential credential = new Credential(accessKey, secreteKey);    
JingdongStorageService jss = new JingdongStorageService(credential,config); 
//配置endPoint    
jss.setEndpoint(endPoint);    
            
//创建objectService实例    
ObjectService objectService = jss.bucket(bucketName).object(objectName);    
//删除object    
objectService.delete();            
    
//JingdongStorageService对象内部维护一组HTTP连接池，在不使用该对象之前需要调用其destroy方法关闭连接池，    
//请注意，一旦调用destroy方法，该对象就不能再次被使用，否则将会抛出异常。    
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Initialization-3.md
```
 //访问京东云的accessKey  
String accessKey = "<yourAccessKeyId>";  
String secreteKey = "<yoursecretKeyId>";    
//endpoint以华北-北京为例  
String endpoint = "oss.cn-north-1.jcloudcs.com";  
 
//创建JingdongStorageService实例  
JingdongStorageService jss=new JingdongStorageService(accessKey,secreteKey);
jss.setEndpoint(endpoint);  
  
//使用对象存储  
  
//销毁JingdongStorageService实例  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Initialization-3.md
```
//访问京东云的accessKey  
String accessKey =  "<yourAccessKeyId>";  
String secreteKey = "<yourSecretKey>";   
//endpoint以华北-北京为例  
String endpoint = "oss.cn-north-1.jcloudcs.com";  
 
//创建ClientConfig实例  
ClientConfig clientConfig=new ClientConfig();  
//设置最大连接数，默认为128  
clientConfig.setMaxConnections(300);  
//设置请求超时时间，默认是50s  
clientConfig.setSocketTimeout(15000);  
//设置失败请求重试次数，默认是3次  
clientConfig.setMaxErrorRetry(6);  

//创建JingdongStorageService实例  
JingdongStorageService jss=new JingdongStorageService(accessKey,secreteKey);
jss.setEndpoint(endpoint);  
 
//使用对象存储  
  
//销毁JingdongStorageService实例  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/List-Buckets-3.md
```
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endpoint = "oss.cn-north-1.jcloudcs.com";  
//您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey = "<yourAccessKey>";  
String SecretKey = "<yourSecretKey>";  
  
// 创建JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
//默认配置文件。如用户需要个别配置，则自行配置。例:config.setMaxConnections(20);  
ClientConfig config = new ClientConfig();  
JingdongStorageService jss= new JingdongStorageService (credential, config);  
//设置Endpoint  
jss.setEndpoint(endpoint);  
      
// 列举bucket  
List<Bucket> buckets = jss.listBucket();  
for (Bucket bucket : buckets) {  
    System.out.println(" - " + bucket.getName());  
}  
// 关闭jss  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
//您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey =  "<yourAccessKeyId>";  
String secreteKey = "<yourSecretKey>";       
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endPoint = "oss.cn-north-1.jcloudcs.com";  
String bucketName = "<yourBucketName>";  
  
//ClientConfig当前为默认配置，用户可根据需要自行配置，如设置连接超时时间等  
ClientConfig config = new ClientConfig();   
  
//构造JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
JingdongStorageService jss = new JingdongStorageService(credential,config); 
//配置endPoint  
jss.setEndpoint(endPoint);  
          
//创建BucketService实例  
BucketService bucketService = jss.bucket(bucketName);  
//列出bucket下满足条件的文件和文件夹  
ObjectListing objectList = bucketService.listObject();  
//列出指定条件下的object名称  
for (ObjectSummary objectSummary : objectList.getObjectSummaries()) {  
    System.out.println("objectName : "+objectSummary.getKey());  
}  

//JingdongStorageService对象内部维护一组HTTP连接池，在不使用该对象之前需要调用其destroy方法关闭连接池，  
//请注意，一旦调用destroy方法，该对象就不能再次被使用，否则将会抛出异常。  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
//创建BucketService实例  
BucketService bucketService = jss.bucket(bucketName);  
//指定返回最大条数为10  
bucketService.maxKeys(10);  
//列出bucket下满足条件的文件和文件夹  
ObjectListing objectList = bucketService.listObject();  
//列出指定条件下的object名称  
for (ObjectSummary objectSummary : objectList.getObjectSummaries()) {  
     System.out.println("objectName : "+objectSummary.getKey());  
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
//创建BucketService实例  
BucketService bucketService = jss.bucket(bucketName);  
//指定返回前缀  
bucketService.prefix("file");  
//列出bucket下满足条件的文件和文件夹  
ObjectListing objectList = bucketService.listObject();  
//列出指定条件下的object名称  
for (ObjectSummary objectSummary : objectList.getObjectSummaries()) {  
     System.out.println("objectName : "+objectSummary.getKey());  
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
//创建BucketService实例  
BucketService bucketService = jss.bucket(bucketName);  
//返回"file"后以字典序排序的Object信息，结果中不包含"file"  
bucketService.marker("file");  
//列出bucket下满足条件的文件和文件夹  
ObjectListing objectList = bucketService.listObject();  
//列出指定条件下的object名称  
for (ObjectSummary objectSummary : objectList.getObjectSummaries()) {  
     System.out.println("objectName : "+objectSummary.getKey());  
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
String marker = null;  
ObjectListing objectList = null;  
do {  
     System.out.println(".................page....................");  
      //创建BucketService实例  
     BucketService bucketService = jss.bucket(bucketName);  
     //返回marker后以字典序排序的Object信息，结果中不包含marker  
    bucketService.marker(marker);  
    //指定返回最大条数为5  
    bucketService.maxKeys(5);  
    //列出bucket下满足条件的文件和文件夹  
    objectList = bucketService.listObject();  
    //列出指定条件下的object名称  
    List<ObjectSummary> objectSummaries = objectList.getObjectSummaries();  
    for (ObjectSummary objectSummary : objectSummaries) {  
         System.out.println("objectName : "+objectSummary.getKey());  
    }  
    marker = objectSummaries.get(objectSummaries.size()-1).getKey();  
} while (objectList.isHasNext());
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
//分页获取"file"后以字典序排序的Object信息，结果中不包含"file"  
String marker = "file";  
ObjectListing objectList = null;  
do {  
    System.out.println(".................page....................");  
    //创建BucketService实例  
    BucketService bucketService = jss.bucket(bucketName);  
    //返回marker后以字典序排序的Object信息，结果中不包含marker  
    bucketService.marker(marker);  
    //指定返回最大条数为5  
    bucketService.maxKeys(5);  
    //列出bucket下满足条件的文件和文件夹  
    objectList = bucketService.listObject();  
    //列出指定条件下的object名称  
    List<ObjectSummary> objectSummaries = objectList.getObjectSummaries();  
    for (ObjectSummary objectSummary : objectSummaries) {  
        System.out.println("objectName : "+objectSummary.getKey());  
    }  
    marker = objectSummaries.get(objectSummaries.size()-1).getKey();  
} while (objectList.isHasNext());
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
String marker = null;  
ObjectListing objectList = null;  
do {  
    System.out.println(".................page....................");  
    //创建BucketService实例  
    BucketService bucketService = jss.bucket(bucketName);  
    //指定返回前缀的object  
    bucketService.prefix("file");  
    //返回marker后以字典序排序的Object信息，结果中不包含marker  
    bucketService.marker(marker);  
    //指定返回最大条数为5  
    bucketService.maxKeys(5);  
    //列出bucket下满足条件的文件和文件夹  
    objectList = bucketService.listObject();  
    //列出指定条件下的object名称  
    List<ObjectSummary> objectSummaries = objectList.getObjectSummaries();  
    for (ObjectSummary objectSummary : objectSummaries) {  
        System.out.println("objectName : "+objectSummary.getKey());  
    }  
    marker = objectSummaries.get(objectSummaries.size()-1).getKey();  
} while (objectList.isHasNext());
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
//创建BucketService实例  
BucketService bucketService = jss.bucket(bucketName);  
//列出bucket下满足条件的文件和文件夹  
ObjectListing objectList = bucketService.listObject();  
//列出指定条件下的object名称  
System.out.println("objectName : ");  
for (ObjectSummary objectSummary : objectList.getObjectSummaries()) {  
    System.out.println(objectSummary.getKey());  
}  
//列出指定条件下的文件夹  
System.out.println("\nCommonPrefixes : ");  
for (String commonPrefixes : objectList.getCommonPrefixes()) {  
    System.out.println(commonPrefixes);  
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
objectName :   
jingdong/dir/file1  
jingdong/dir/file2  
jingdong/file  
oss.jpg  
  
CommonPrefixes :
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
//创建BucketService实例  
BucketService bucketService = jss.bucket(bucketName);  
//获取"jingdong/"下所有的文件  
bucketService.prefix("jingdong/");  
//列出bucket下满足条件的文件和文件夹  
ObjectListing objectList = bucketService.listObject();  
//列出指定条件下的object名称  
System.out.println("objectName : ");  
for (ObjectSummary objectSummary : objectList.getObjectSummaries()) {  
    System.out.println(objectSummary.getKey());  
}  
//列出指定条件下的文件夹  
System.out.println("\nCommonPrefixes : ");  
for (String commonPrefixes : objectList.getCommonPrefixes()) {  
    System.out.println(commonPrefixes);  
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
objectName :   
jingdong/dir/file1  
jingdong/dir/file2  
jingdong/file  
  
CommonPrefixes :
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
//创建BucketService实例  
BucketService bucketService = jss.bucket(bucketName);  
//列出"jingdong/"下的文件和子目录,需要注意的是hasCommonPrefix必须为true才生效
bucketService.prefix("jingdong/").delimiter("/").hasCommonPrefix(true);  
//列出bucket下满足条件的文件和文件夹  
ObjectListing objectList = bucketService.listObject();  
//列出指定条件下的object名称  
System.out.println("objectName : ");  
for (ObjectSummary objectSummary : objectList.getObjectSummaries()) {  
     System.out.println(objectSummary.getKey());  
}  
//列出指定条件下的文件夹  
System.out.println("\nCommonPrefixes : ");  
for (String commonPrefixes : objectList.getCommonPrefixes()) {  
    System.out.println(commonPrefixes);  
}
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Manage-Objects-3.md
```
objectName :   
jingdong/file  
 
CommonPrefixes :   
jingdong/dir
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Move-Object-3.md
```
//您的AccessKey和SecretKey可以登录到京东对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey =  "<yourAccessKeyId>";  
String secreteKey = "<yourSecretKey>";       
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endPoint = "oss.cn-north-1.jcloudcs.com";  
String sourceBucketName = "< yourSourceBucketName >";//moveObject的源bucket  
String sourceKey = "<yourSourceKey>";//moveObject的源object key     
String destinationBucketName = "<yourDestinationBucketName>";//moveObject的目的bucket  
String destinationKey = "yourDestinationKey";//moveObject的目的object key  
//ClientConfig当前为默认配置，用户可根据需要自行配置，如设置连接超时时间等  
ClientConfig config = new ClientConfig();  
  
//构造JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
JingdongStorageService jss = new JingdongStorageService(credential,config);  
//配置endPoint  
jss.setEndpoint(endPoint);    
  
//创建objectService实例  
ObjectService MoveObjectService = jss.bucket(destinationBucketName).object(destinationKey);  
//将sourceBucket下的sourceObject移动到destinationBucket下的destinationObject,返回移动后object的etag和lastModified  
MoveObjectResult moveObjectResult = MoveObjectService.moveFrom(sourceBucketName, sourceKey).move();  
System.out.println("LastModified : "+moveObjectResult.getLastModified());  
System.out.println("Etag : "+moveObjectResult.getEtag());  
    
//JingdongStorageService对象内部维护一组HTTP连接池，在不使用该对象之前需要调用其destroy方法关闭连接池，  
//请注意，一旦调用destroy方法，该对象就不能再次被使用，否则将会抛出异常。  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Multipart-Upload-3.md
```
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endpoint = "oss.cn-north-1.jcloudcs.com";  
//您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey = "<yourAccessKey>";  
String SecretKey = "<yourSecretKey>";  
String bucketName = "<yourBucketName>";  
String key = "<yourObjcetkey>";  
// 创建JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
//默认配置文件。如用户需要个别配置，则自行配置。例:config.setMaxConnections(20);  
ClientConfig config = new ClientConfig();  
JingdongStorageService jss= new JingdongStorageService (credential, config);  
//设置Endpoint  
jss.setEndpoint(endpoint);  
String storageClass =  StorageClass.ReducedRedundancy.toString();  
    
//使用低冗余存储，则使用该句代码  
//jss.bucket(bucketName).object(key).getBuilder().getHeaders().put(JssHeaders.X_JSS_STORAGE_CLASS, StorageClass.ReducedRedundancy.toString());  
InitMultipartUploadResult initResult = jss.bucket(bucketName).object(key).initMultipartUpload();  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Multipart-Upload-3.md
```
List<UploadPartResult> uploadPartResults= new ArrayList<UploadPartResult>();  
InputStream inputStream = new FileInputStream(new File("<localFile>"));  
// 设置分片大小  
Long partSize = 700*1024;  
// 设置分片号，范围是1~10000，  
int partNum = 1;  
// 设置文件偏移量,第一个文件偏移为 0  
int fileOffset = 0;  
ByteStreams.skipFully(inputStream, fileOffset);  
  
UploadPartResult uploadPartResult = jss.bucket(bucketName).object(key).entity(partSize, inputStream).uploadPart(initResult.getUploadId(), partNum); 
uploadPartResults.add(uploadPartResult);
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Multipart-Upload-3.md
```
Collections.sort(uploadPartResults, new Comparator<UploadPartResult>() {  
    @Override  
    public int compare(UploadPartResult p1, UploadPartResult p2) {  
        return p1.getPartNumber() - p2.getPartNumber();  
    }  
});  
String eTag = jss.bucket(bucketName).object(key).completeMultipartUpload(initResult.getUploadId(), uploadPartResults);
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Multipart-Upload-3.md
```
// endpoint以华北为例，其它region请按实际情况填写  
String endpoint = "s-bj.jcloud.com";  
//您的AccessKey和SecretKey可以登录到京东云存储的控制台，在【Access Key 管理】中查看。  
String accessKey = "<yourAccessKey>";  
String SecretKey = "<yourSecretKey>";  
String bucketName = "<your bucketName>";  
String key = "<your objcetkey>";  
 
// 创建JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
//默认配置文件。如用户需要个别配置，则自行配置。例:config.setMaxConnections(20);  
ClientConfig config = new ClientConfig();  
JingdongStorageService jss= new JingdongStorageService (credential, config);
//设置Endpoint  
jss.setEndpoint(endpoint);  
 
// 取消分片上传，其中uploadId来自于initiateMultipartUpload  
jss.bucket(bucketName).object(key).abortMultipartUpload("<uploadId>");  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Multipart-Upload-3.md
```
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endpoint = "oss.cn-north-1.jcloudcs.com";  
// 您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey = "<your accessKey>";  
String secretKey = "<your secretKey>";  
String bucketName = "<your bucketName>";  
String key = “<you objectKey>”;  
       
// 创建JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
//默认配置文件。如用户需要个别配置，则自行配置。例:config.setMaxConnections(20);  
ClientConfig config = new ClientConfig();  
JingdongStorageService jss= new JingdongStorageService (credential, config);
//设置Endpoint  
jss.setEndpoint(endpoint);  
  
// 获取已上传分片，其中initResult来自于initiateMultipartUpload  
ListPartsResult partList = jss.bucket(bucketName).object(key).listParts(initResult.getUploadId());  
for (PartSummary part : partListing.getParts()) {  
 // 分片号，上传的时候指定  
    part.getPartNumber();  
    // 分片数据大小  
    part.getSize();  
    // Part的ETag  
    part.getETag();  
    // Part的最后修改上传  
    part.getLastModified();  
}  
// 关闭client  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Multipart-Upload-3.md
```
// endpoint以华北为例，其它region请按实际情况填写  
String endpoint = "oss.cn-north-1.jcloudcs.com";  
// 您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey = "<your accessKey>";  
String secretKey = "<your secretKey>";  
String bucketName = "<your bucketName>";  
      
// 创建JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
//默认配置文件。如用户需要个别配置，则自行配置。例:config.setMaxConnections(20);  
ClientConfig config = new ClientConfig();  
JingdongStorageService jss= new JingdongStorageService (credential, config);
//设置Endpoint  
jss.setEndpoint(endpoint);  
// 列举分片上传事件  
BucketService bucketService = jss.bucket(bucketName);  
//增加前缀匹配  
//bucketService.prefix("<your perfix>");  
MultipartUploadListing multipartUploadListing = bucketService.listMultipartUploads();

for (Upload upload : multipartUploadListing.getUploads()) {  
        //Upload Id  
        upload.getUploadId();  
        //key  
        upload.getKey();  
        //date of initiate multipart ipload  
        upload.getInitiated();  
}  
// 关闭client  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Quick-Start-3.md
```
//访问京东云的accessKey  
String accessKey = "<yourAccessKeyId>";  
String secreteKey = "<yoursecretKeyId>";    
//endpoint以华北-北京为例  
String endpoint = "oss.cn-north-1.jcloudcs.com";  
 
//创建JingdongStorageService实例  
JingdongStorageService jss= new JingdongStorageService(accessKey,secreteKey);  
jss.setEndpoint(endpoint);  
 
//使用对象存储  
  
//销毁JingdongStorageService实例  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Quick-Start-3.md
```
// 创建bucket  
String bucketName = "<your-bucket-name>";  
jss.createBucket(bucketName);
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Quick-Start-3.md
```
File file = new File("D:/test");
String bucketName =  "<your-bucket-name>";
String objectName =  "<your-object-name>";
ObjectService objectService = jss.bucket(bucketName).object(objectName);
//获取输入流  
InputStream inputStream = new FileInputStream(file);  
//获取流长度  
long contentLength = file.length();  
//设置上传文件Content-type为"text/html"。函数返回上传数据的Etag  
String md5 = objectService.entity(contentLength,inputStream).contentType("text/html").put();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Quick-Start-3.md
```
String bucketName =  "<your-bucket-name>";
String objectName =  "<your-object-name>";

//创建objectService实例  
ObjectService objectService = jss.bucket(bucketName).object(objectName);  

//获取object对象  
StorageObject storageObject = objectService.get();  
// 读Object内容  
System.out.println("Object content:");  
BufferedReader reader = new BufferedReader(new InputStreamReader(storageObject.getInputStream()));  
String tempString = null;  
// 一次读入一行，直到读入null为文件结束  
while ((tempString = reader.readLine()) != null) {  
    System.out.println(tempString);  
}  
 
reader.close();       
storageObject.close();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Quick-Start-3.md
```
//创建BucketService实例  
BucketService bucketService = jss.bucket(bucketName);  
//列出bucket下满足条件的文件和文件夹  
ObjectListing objectList = bucketService.listObject();  
//列出指定条件下的object名称  
for (ObjectSummary objectSummary : objectList.getObjectSummaries()) {  
     System.out.println("objectName : "+objectSummary.getKey());  
 }
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Quick-Start-3.md
```
String bucketName =  "<your-bucket-name>";
String objectName =  "<your-object-name>";
 
//创建objectService实例    
ObjectService objectService = jss.bucket(bucketName).object(objectName);    
//删除object    
ObjectService.delete();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Range-Download-3.md
```
//您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey =  "<yourAccessKeyId>";  
String secreteKey = "<yourSecretKey>";       
//endpoint以华北为例，其它region请按实际情况填写  
String endPoint = "oss.cn-north-1.jcloudcs.com";  
String bucketName = "<yourBucketName>";  
String objectName = "<yourObjectName>";    
//ClientConfig当前为默认配置，用户可根据需要自行配置，如设置连接超时时间等  
ClientConfig config = new ClientConfig();  
  
//构造JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
JingdongStorageService jss = new JingdongStorageService(credential,config); 
//配置endPoint  
jss.setEndpoint(endPoint);    
   
//创建objectService实例  
ObjectService objectService = jss.bucket(bucketName).object(objectName);  
//获取object，其中数据返回第0到第1000个字节的数据，包括第1000个，共1001字节的数据  
StorageObject storageObject = objectService.range(0, 1000).get();  
//获取object,其中返回数据跳过前1000个字节，其余部分下载到本地文件” localFile”中  
//StorageObject storageObject = objectService.range(1000).get();  
//将文件下载到本地文件中，如下示例是将指定的object下载到"localFile"中  
storageObject.toFile(new File("<localFile>"));    
 
//JingdongStorageService对象内部维护一组HTTP连接池，在不使用该对象之前需要调用其destroy方法关闭连接池，  
//请注意，一旦调用destroy方法，该对象就不能再次被使用，否则将会抛出异常。  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Range-Download-3.md
```
byte[] buf = new byte[1024];  
InputStream in = storageObject.getInputStream();  
for (int n = 0; n != -1; ) {  
    n = in.read(buf, 0, buf.length);  
}  
in.close();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Range-Download-3.md
```
byte[] buf = new byte[64 * 1024];  
InputStream in = storageObject.getInputStream();  
in.read(buf, 0, buf.length);  
in.close();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Simple-Download-3.md
```
//您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey =  "<yourAccessKeyId>";  
String secreteKey = "<yourSecretKey>";       
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endPoint = "oss.cn-north-1.jcloudcs.com";  
String bucketName = "<yourBucketName>";  
String objectName = "<yourObjectName>";  
//ClientConfig当前为默认配置，用户可根据需要自行配置，如设置连接超时时间等  
ClientConfig config = new ClientConfig();  
 
//构造JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
JingdongStorageService jss = new JingdongStorageService(credential,config); 
//配置endPoint  
jss.setEndpoint(endPoint);    
  
//创建objectService实例  
ObjectService objectService = jss.bucket(bucketName).object(objectName);  
 
//获取object对象  
StorageObject storageObject = objectService.get();  
// 读Object内容  
System.out.println("Object content:");  
BufferedReader reader = new BufferedReader(new InputStreamReader(storageObject.getInputStream()));  
String tempString = null;  
// 一次读入一行，直到读入null为文件结束  
while ((tempString = reader.readLine()) != null) {  
    System.out.println(tempString);  
}  

reader.close();       
storageObject.close();  
 /JingdongStorageService对象内部维护一组HTTP连接池，在不使用该对象之前需要调用其destroy方法关闭连接池，  
//请注意，一旦调用destroy方法，该对象就不能再次被使用，否则将会抛出异常。  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Simple-Download-3.md
```
byte[] buf = new byte[1024];  
InputStream in = storageObject.getInputStream();  
for (int n = 0; n != -1; ) {  
    n = in.read(buf, 0, buf.length);  
}  
in.close();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Simple-Download-3.md
```
byte[] buf = new byte[64 * 1024];  
InputStream in = storageObject.getInputStream();  
in.read(buf, 0, buf.length);  
in.close();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Simple-Download-3.md
```
//您的AccessKey和SecretKey可以登录到京东云存储的控制台，在【Access Key 管理】中查看。  
String accessKey =  "<yourAccessKeyId>";  
String secreteKey = "<yourSecretKey>";       
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endPoint = "oss.cn-north-1.jcloudcs.com";  
String bucketName = "<yourBucketName>";  
String objectName = "<yourObjectName>";   
//ClientConfig当前为默认配置，用户可根据需要自行配置，如设置连接超时时间等  
ClientConfig config = new ClientConfig();  
  
//构造JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
JingdongStorageService jss = new JingdongStorageService(credential,config); 
//配置endPoint  
jss.setEndpoint(endPoint);    
  
//创建objectService实例  
ObjectService objectService = jss.bucket(bucketName).object(objectName);  

//获取object对象  
StorageObject storageObject = objectService.get();  
//将文件下载到本地文件中，如下示例是将指定的object下载到"localFile"中  
storageObject.toFile(new File("<localFile>"));  

 
//JingdongStorageService对象内部维护一组HTTP连接池，在不使用该对象之前需要调用其destroy方法关闭连接池，  
//请注意，一旦调用destroy方法，该对象就不能再次被使用，否则将会抛出异常。  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Simple-Upload-3.md
```
//您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey =  "<yourAccessKeyId>";  
String secreteKey = "<yourSecretKey>";       
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endPoint = "oss.cn-north-1.jcloudcs.com";  
File file = new File("<localFile>");   
String bucketName = "<yourBucketName>";  
String objectName = "<yourObjectName>";   
//ClientConfig当前为默认配置，用户可根据需要自行配置，如设置连接超时时间等  
ClientConfig config = new ClientConfig();  
  
//构造JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
JingdongStorageService jss = new JingdongStorageService(credential,config); 
//配置endPoint  
jss.setEndpoint(endPoint);    
  
//创建objectService实例  
ObjectService objectService = jss.bucket(bucketName).object(objectName);  
//使用低冗余存储，则使用该句代码  
//objectService.getBuilder().getHeaders().put(JssHeaders.X_JSS_STORAGE_CLASS, StorageClass.ReducedRedundancy.toString());  
  
//获取输入流  
InputStream inputStream = new FileInputStream(file);  
//获取流长度  
long contentLength = file.length();  
//设置上传文件Content-type为"text/html"。函数返回上传数据的Etag,目前Etag的值为上传数据的MD5  
String md5 = objectService.entity(contentLength,inputStream).contentType("text/html").put();  
//若对上传文件进行加密，则使用该句代码  
//String md5 = objectService.entity(contentLength,inputStream).contentType("text/html").put(true);  
System.out.println(md5);  
  
//JingdongStorageService对象内部维护一组HTTP连接池，在不使用该对象之前需要调用其destroy方法关闭连接池，  
//请注意，一旦调用destroy方法，该对象就不能再次被使用，否则将会抛出异常。  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Simple-Upload-3.md
```
//您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey =  "<yourAccessKeyId>";  
String secreteKey = "<yourSecretKey>";       
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endPoint = "oss.cn-north-1.jcloudcs.com";  
File file = new File("<localFile>");   
String bucketName = "<yourBucketName>";  
String objectName = "<yourObjectName>";    
//ClientConfig当前为默认配置，用户可根据需要自行配置，如设置连接超时时间等  
ClientConfig config = new ClientConfig();   

//构造JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
JingdongStorageService jss = new JingdongStorageService(credential,config); 
//配置endPoint  
jss.setEndpoint(endPoint);    
 
//创建objectService实例  
ObjectService objectService = jss.bucket(bucketName).object(objectName);  
//使用低冗余存储，则使用该句代码  
//objectService.getBuilder().getHeaders().put(JssHeaders.X_JSS_STORAGE_CLASS, StorageClass.ReducedRedundancy.toString());  
 
//设置上传文件Content-type为"text/html"。函数返回上传数据的Etag,目前Etag的值为上传数据的MD5  
String md5 = objectService.entity(file).contentType("text/html").put();  
//若对上传文件进行加密，则使用该句代码  
//String md5 = objectService.entity(file).contentType("text/html").put(true);  
System.out.println(md5);  
 
//JingdongStorageService对象内部维护一组HTTP连接池，在不使用该对象之前需要调用其destroy方法关闭连接池，  
//请注意，一旦调用destroy方法，该对象就不能再次被使用，否则将会抛出异常。  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/User-Signature-Authentication-3.md
```
// endpoint以华北-北京为例，其它region请按实际情况填写  
String endpoint = "oss.cn-north-1.jcloudcs.com";  
//您的AccessKey和SecretKey可以登录到对象存储的控制台，在【Access Key 管理】中查看。  
String accessKey = "<your accessKey>";  
String secretKey = "<your secretKey>";  
String bucketName = "<your bucketName>";  
String key = “<you objectKey>”;  
       
// 创建JingdongStorageService实例  
Credential credential = new Credential(accessKey, secreteKey);  
//默认配置文件。如用户需要个别配置，则自行配置。例:config.setMaxConnections(20);  
ClientConfig config = new ClientConfig();  
JingdongStorageService jss= new JingdongStorageService (credential, config);  
//设置Endpoint  
jss.setEndpoint(endpoint);  
      
//生成URL，可以通过浏览器直接访问，过期时间是1小时  
URI signatureUrl = jss.bucket(bucketName).object(key)
                   .generatePresignedUrl(3600);  
// 打印URL  
System.out.println(signatureUrl.toString());  
// 关闭jss  
jss.destroy();
```


#### 当前代码: documentation/Storage-and-CDN/Object-Storage-Service/SDK-Reference/Java-SDK/Video-Transcoding.md
```
String accesskey = "your ak";
String secretkey = "your sk";
String endpoint = "oss.cn-north-1.jcloudcs.com";

String sourceBucket = "source bucket";
String sourceKey = "source key";

String targetBucket = "target bucket";
String targetKey = "target key";

//转码参数
String persistentOps = "video_mp4_480x360_440kbps";

//凭证
Credential credential = new Credential(accesskey, secretkey);
JingdongStorageService jss = new JingdongStorageService(credential);
jss.setEndpoint(endpoint);

//创建任务
String createTaskResult = jss.bucket(sourceBucket).object(sourceKey).pretreatmentStrategy(3600, new StringMap().put("saveas", targetBucket + ":" + targetKey).put("persistentOps", persistentOps), false).put();
System.out.println("createTaskResult: " + createTaskResult);

//解析taskId
JSONObject createTaskResultJson = JSON.parseObject(createTaskResult);
String taskId = createTaskResultJson.getString("persistentId");
System.out.println("taskId: " + taskId);

//根据taskId获取任务
VideoTaskInfo videoTaskInfo = jss.getVideoTask(taskId);
System.out.println("videoTaskInfo: " + JSON.toJSONString(videoTaskInfo));
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Installation-Configuration.md
```
accessKeyID：xxxxxxxxxxxxxxxx
accessKeySecret: xxxxxxxxxxxxxxxx
endpoint：http://s3.cn-north-1.jcloudcs.com   //endpoint须使用http://或https://开头
bucket：bucketname
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Installation-Configuration.md
```
auto_fdisk.sh /dev/vdb /cache ext4
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Installation-Configuration.md
```
gw start
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Installation-Configuration.md
```
gw restart
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Operation-Maintenance.md
```
wget https://buildlogs.centos.org/c7.1611.u/kernel/20170704132018/3.10.0-514.26.2.el7.x86_64/kernel-3.10.0-514.26.2.el7.x86_64.rpm
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Operation-Maintenance.md
```
yum install kernel-3.10.0-514.26.2.el7.x86_64.rpm
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Operation-Maintenance.md
```
grub2-set-default 0
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Operation-Maintenance.md
```
reboot
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Operation-Maintenance.md
```
uname -r
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Use-Storage-Gateway.md
```
CentOS: sudo yum install nfs-utils
Ubuntu 或 Debian: sudo apt-get install nfs-common
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Use-Storage-Gateway.md
```
mount -t nfs <IP>:/gw <local-directory> 
```


#### 当前代码: documentation/Storage-and-CDN/Storage-Gateway/Operation-Guide/Use-Storage-Gateway.md
```
umount <local-directory>
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Create-Video-Transcoding-3.md
```
PUT /bucket/object?pretreatmentStrategyV2&expires=<expires value>&policy=<policy string>  HTTP/1.1
Content-MD5: 
Content-Disposition: 
Host: oss.cn-north-1.jcloudcs.com
Date: date
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Create-Video-Transcoding-3.md
```
PUT /bucket/object?pretreatmentStrategyV2&expires=3600&policy={"persistentOps":"video_mp4_480x360_440kbps","saveas":"kkk:aaaa.wmv","targetSaveas":"a2trOmFhYWEud212"} HTTP/1.1
   Date: Mon, 22 Feb 2016 03:35:32 GMT
   Authorization: jingdong   NcB3e3VUn45NtjV3:A0LcbZin1FhRnSH697Q0D+64t8E=
   Content-Length: 0
   Host: oss.cn-north-1.jcloudcs.com
   Connection: Keep-Alive
User-Agent: JSS-SDK-JAVA/1.2.0 (Java 1.8.0_45; Vendor Oracle Corporation; Windows 7 6.1; HttpClient 4.2.1)
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Create-Video-Transcoding-3.md
```
HTTP/1.1 200 OK
x-jss-request-id: 8CEF3204E1AD1C2D
Server: JSS/1.0
ETag: "a0eb630d0cab1a1240b2bae67410cdb7"
Content-Type: application/json;charset=UTF-8
Content-Length: 34
Date: Tue, 15 Dec 2015 13:10:50 GMT
{“taskId”: "0a354cca27994b398931b205bbf96985"}   
错误返回信息：
{"code":"NoSuchKey","message":" The specified file used for video transcoding does not exist, file name = Wildlifetest.wmv","resource":"/test-bucket13/Wildlifetest.wmv","requestId":"8764E879D8AEE8BF"}
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Delete-Video-Task.md
```
DELETE deleteVideoTask&taskId= taskId
Host: oss.cn-north-1.jcloudcs.com
Date: date
Authorization: signatureValue#请参照《安全认证》
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Delete-Video-Task.md
```
DELETE deleteVideoTask&taskId=78fbb093de19fc HTTP/1.1
Date: Tue, 15 Dec 2015 12:55:54 GMT
Authorization: jingdong 2sTXh1AoApNv5x8p:X/CQ6sMZWPFun1k9k3rUZL/Psgw=
Content-Length: 0
Host: oss.cn-north-1.jcloudcs.com
Connection: Keep-Alive
User-Agent: JFS-JCLOUD-SDK-JAVA/1.0.0 (Java 1.8.0_45; Vendor Oracle Corporation; Windows 7 6.1; HttpClient 4.2.1)
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Delete-Video-Task.md
```
HTTP/1.1 200 OK
x-jss-request-id: BBDC82A4C4B61A5F
Server: JSS/1.0
Content-Type: application/json;charset=UTF-8
Content-Length: 4
Date: Tue, 15 Dec 2015 13:08:06 GMT
true
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Get-Video-Task.md
```
GET searchVideoList&videoTaskQuery=videoTaskQuery HTTP/1.1
Host: oss.cn-north-1.jcloudcs.com
Date: date
Authorization: signatureValue#请参照《安全认证》
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Get-Video-Task.md
```
GET http://oss.cn-north-1.jcloudcs.com/?searchVideoList&videoTaskQuery=%7B%22flag%22%3A0%2C%22mysqlPage%22%3A0%2C%22orderCloumn%22%3A%22update_time%22%2C%22orderType%22%3A%22desc%22%2C%22page%22%3A1%2C%22pageSize%22%3A10%2C%22status%22%3A0%7DHTTP/1.1
Date: Tue, 15 Dec 2015 12:59:11 GMT
Authorization: jingdong 2sTXh1AoApNv5x8p:opNHt6cimASzR20CcsglKbpSaxQ=
Content-Length: 0
Host: oss.cn-north-1.jcloudcs.com
Connection: Keep-Alive
User-Agent: JFS-JCLOUD-SDK-JAVA/1.0.0 (Java 1.8.0_45; Vendor Oracle Corporation; Windows 7 6.1; HttpClient 4.2.1)
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Get-Video-Task.md
```
HTTP/1.1 200 OK
x-jss-request-id: AF4C3B343F152E1A
Server: JSS/1.0
Content-Type: application/json;charset=UTF-8
Content-Length: 504
Date: Tue, 15 Dec 2015 13:09:03 GMT
{"total":2,"page":1,"videoResultList":[{"taskId":"03a81cda7ac841d69191b5666687cdb5","status":1,"bucket":"jfs-m3","objectKey":"fidd.wmv","options":"av/fmt/mp4/s/1920/1080/vb/1500000/ab/128000/saveas/a2trOmFiYy53bXY","updateTime":1449166599000,"taskOutputObjectList":null},{"taskId":"11311576e2ee46d3b11dd4672d8e13c4","status":1,"bucket":"jfs-m3","objectKey":"fidd.wmv","options":"av/fmt/mp4/s/1920/1080/vb/1500000/ab/128000/saveas/a2trOmFiYy53bXY","updateTime":1449166260000,"taskOutputObjectList":null}]}
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Query-Video-Task.md
```
GET getVideoTask&taskId= taskId
Host: oss.cn-north-1.jcloudcs.com
Date: date
Authorization: signatureValue#请参照《安全认证》
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Query-Video-Task.md
```
GET getVideoTask&taskId=11311576e2ee46d3b11dd4672d8e13c4 HTTP/1.1
Date: Tue, 15 Dec 2015 12:43:24 GMT
Authorization: jingdong 2sTXh1AoApNv5x8p:AsYj3qfR2lhnwZT+5ZweZG0JgOs=
Host: oss.cn-north-1.jcloudcs.com
Connection: Keep-Alive
User-Agent: JFS-JCLOUD-SDK-JAVA/1.0.0 (Java 1.8.0_45; Vendor Oracle Corporation; Windows 7 6.1; HttpClient 4.2.1)
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/Query-Video-Task.md
```
HTTP/1.1 200 OK
x-jss-request-id: 99AC4715136F3038
Server: JSS/1.0
Content-Type: application/json;charset=UTF-8
Content-Length: 325
Date: Tue, 15 Dec 2015 13:09:03 GMT
{"taskId":"702d79de74494ec9ac47693e946093b7","status":1,"bucket":"jfs-m3","objectKey":"IVTT.mp4","options":"av/fmt/mp4/s/480/360/vb/440000/ab/48000/saveas/a2trOmFhYWEud212","updateTime":1450108357000,"taskOutputObjectList":[{"tId":1023,"objectKey":"IVT.mp4","bucket":"abc"},{"tId":1023,"objectKey":"ITT.mp4","bucket":"abc"}]}
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/User-Signature-Authentication.md
```
Authorization ="jingdong" + " " + AccessKey + ":" + Signature;
Signature =base64(HMAC-SHA1(AccessKeySecret, UTF-8-Encoding-Of( StringToSign ) ) )
StringToSign =HTTP-Verb + "\n"
                       + Content-MD5 + "\n"
                       + Content-Type + "\n"
                       + Date + "\n"
                       + CanonicalizedHeaders
                       + CanonicalizedResource;
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/User-Signature-Authentication.md
```
import javax.crypto.Mac;
  
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
 
String secretKey = "1MYaiNh3NeN9SuxaqFjSrc7I49rWKkQCxpl9eLNZ";

String signString = "PUT\n0c791a8c18017c7ad1675936d12bae5d\ntext/plain\nThu, 13 Jul 2017 02:37:31 GMT\n 
                     x-jss-server-side-encryption:false\n/oss-test/sign.txt";

SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"),"HmacSHA1");

Mac mac = Mac.getInstance("HmacSHA1");

mac.init(signingKey);

byte[] rawHmac = mac.doFinal(signString.getBytes("UTF-8"));

String signature =  new String(Base64.encodeBase64(rawHmac), "UTF-8");
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/API-Reference/Video-Transcoding-API/User-Signature-Authentication.md
```
PUT /sign.txt   HTTP/1.1
  Content-Type: text/plain
  Content-MD5: 0c791a8c18017c7ad1675936d12bae5d
  x-jss-server-side-encryption: false
  Date: Thu, 13 Jul 2017 02:37:31 GMT
  Authorization: jingdong qbS5QXpLORrvdrmb: xvj2Iv7WcSwnN26XYnTq/c2YBQs=
  Content-Length: 20
  Host: s-bj.jcloud.com
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/SDK-Reference/Thumbnail.md
```
<dependency>
    <groupId>com.jdcloud.sdk</groupId>
    <artifactId>core</artifactId>
    <version>1.0.0</version>
</dependency>
<dependency>
    <groupId>com.jdcloud.sdk</groupId>
    <artifactId>mps</artifactId>
    <version>0.3.6</version>
</dependency>
```


#### 当前代码: documentation/Video-Service/Media-Processing-Service/SDK-Reference/Thumbnail.md
```
package com.jdcloud.mps.client;

import com.jdcloud.sdk.auth.StaticCredentialsProvider;
import com.jdcloud.sdk.http.HttpRequestConfig;
import com.jdcloud.sdk.http.Protocol;
import com.jdcloud.sdk.service.mps.client.MpsClient;
import com.jdcloud.sdk.service.mps.model.*;

public class MpsClientExample {
    public static void main(String[] args) {
        // 以下参数均为必填项
        String region = "cn-north-1"; // cn-north-1/cn-south-1/cn-east-1/cn-east-2
        String sourceBucketName = ""; // 源bucket
        String sourceObjectKey = ""; // 源bucket中要截图的文件
        String destBucketName = ""; // 截图放置的目标bucket
        String accessKey = ""; // 用户AccessKey
        String secretKey = ""; // 用户SecretKey
   
        MpsClient client = MpsClient.builder()
                .credentialsProvider(new StaticCredentialsProvider(accessKey, secretKey))
                .httpRequestConfig(new HttpRequestConfig.Builder().protocol(Protocol.HTTP).build())
                .build();
   
        // 创建任务
        ThumbnailTaskSource createSource = new ThumbnailTaskSource().bucket(sourceBucketName).key(sourceObjectKey);
        ThumbnailTaskTarget createTarget = new ThumbnailTaskTarget().destBucket(destBucketName);
        
        // 设置截图规则，默认可不设置
        ThumbnailTaskRule rule = new ThumbnailTaskRule();
        rule.setCount(1); // 截图数量, mode=single时不可选. default:1
        rule.setStartTimeInSecond(1); // 截图在视频中开始时间（秒）, default: 0
        rule.setEndTimeInSecond(10); // 截图在视频中结束时间（秒）, default:-1(代表视频时长)
        rule.setKeyFrame(true); // 是否开启关键帧截图, default: true
        rule.setMode("multi"); // 截图模式 单张: single 多张: multi 平均: average default: single
        CreateThumbnailTaskRequest createRequest = new CreateThumbnailTaskRequest().source(createSource).target(createTarget).rule(rule).regionId(region);
        CreateThumbnailTaskResult createResult = client.createThumbnailTask(createRequest).getResult();
   
        // 获取任务
        GetThumbnailTaskRequest getRequest = new GetThumbnailTaskRequest().taskId(createResult.getTaskID()).regionId(region);
        GetThumbnailTaskResult getResult = client.getThumbnailTask(getRequest).getResult();
   
        // 任务列表
        ListThumbnailTaskRequest listRequest = new ListThumbnailTaskRequest().regionId(region);
        ListThumbnailTaskResult listResult = client.listThumbnailTask(listRequest).getResult();
    }
}
```

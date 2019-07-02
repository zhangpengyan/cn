## 安装可用性监控插件

### 1.登录京东云Linux主机。

![](https://raw.githubusercontent.com/jdcloudcom/cn/edit/image/Cloud-Monitor/Usability-Monitor/agent1.jpg)

### 2.根据云主机所在地域，复制安装命令至云主机上。

地域 | 安装命令
-- |--
**华北-北京** | `wget -c http://devops-hb.oss-internal.cn-north-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.403.a81f9eb.20181127121007.bin -O installer && sh installer -- -a jcmagent /usr/local/share/jdcloud/ifrit && rm -f installer`
**华东-上海** | `wget -c http://devops-hd.oss-internal.cn-east-2.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.403.a81f9eb.20181127121007.bin -O installer && sh installer  -- -a jcmagent /usr/local/share/jdcloud/ifrit && rm -f installer`
**华东-宿迁** | `wget -c http://devops-sq.oss-internal.cn-east-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.403.a81f9eb.20181127121007.bin -O installer && sh installer -- -a jcmagent /usr/local/share/jdcloud/ifrit && rm -f installer`
**华南-广州** | `wget -c http://devops.oss-internal.cn-south-1.jcloudcs.com/ifrit/ifrit-agent-external-v0.01.403.a81f9eb.20181127121007.bin -O installer && sh installer -- -a jcmagent  /usr/local/share/jdcloud/ifrit && rm -f installer`

![](https://raw.githubusercontent.com/jdcloudcom/cn/monitoring/image/Cloud-Monitor/Usability-Monitor/agent2.jpg)

### 3.点击回车，执行安装命令。

![](https://raw.githubusercontent.com/jdcloudcom/cn/edit/image/Cloud-Monitor/Usability-Monitor/agent3.jpg)

### 4. 执行安装命令后，等待1-3分钟使用ps -ef|grep jcmagent 命令确认jcmagent进程是否启动。

![](https://raw.githubusercontent.com/jdcloudcom/cn/edit/image/Cloud-Monitor/Usability-Monitor/agent4.jpg)

### 5.如安装失败，1-3分钟后重新执行安装命令。多次失败，请联系客服。

### 6. 配置credential文件  
#### 根据当前执行agent安装操作的用户来创建monitor_credentials.yml文件存放目录。  
  - 使用root用户安装agent，执行操作：  
    ```
    mkdir -p /root/.jdcloud/  
    ```  
    其完整的monitor_credentials.yml文件存放路径为：/root/.jdcloud/monitor_credentials.yml  
    
  - 非root用户安装agent,执行操作：  
    ```
    mkdir -p /home/{USER}/.jdcloud/  
    ```  
    其完整的monitor_credentials.yml文件存放路径为 ：/home/{USER}/.jdcloud/monitor_credentials.yml  
    注：{USER}需要替换为实际执行agent安装操作的用户名
    
   注：请按照以上路径创建文件，路径错误则agent无法正常工作，导致无监控数据。 
   
#### 编缉并保存monitor_credentials.yml文件，文件内容为：  

   ```
   ak: xxxxxxx(填写YourAccessKeyID)   
   sk: xxxxxxx(填写YourAccessKeySecret) 
   ```

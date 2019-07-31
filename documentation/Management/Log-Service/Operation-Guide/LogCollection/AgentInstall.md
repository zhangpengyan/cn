## 安装业务应用日志采集插件 

选择需要采集业务应用日志的云主机（仅支持Linux类主机），登录该云主机。
1. 配置credential文件     
- 创建 ~/.jdcloud/logs_credentials.yml 文件     
- 编缉并保存logs_credentials.yml文件，文件内容为：        
ak: xxxxxxx(填写YourAccessKeyID)       sk: xxxxxxx(填写YourAccessKeySecret)         
**注： ak（键值对之间必须要有空格），否则会读取ak。如: ak:(空格)xxxxxx**

2.复制安装命令至云主机。  

`curl -fsSL https://deploy-code-vpc.jdcloud.com/dl-ifrit-agents/install | bash -s jdcloud-logs-agent`

3.敲击回车键，执行安装操作。   
 	
 ![image](https://raw.githubusercontent.com/jdcloudcom/cn/zhangwenjie-only/image/LogService/LogCollection/logs-agent-install-1.png)
  
4.等待1-3分钟，执行以下命令验证agent是否安装成功。

`ps -ef | grep jdcloud-logs-agent`

5.进程存在则说明安装成功。 示例如下： 

 ![image](https://raw.githubusercontent.com/jdcloudcom/cn/zhangwenjie-only/image/LogService/LogCollection/logs-agent-install-2.png)

**注：如果安装失败，1-3分钟后重新执行安装命令。多次失败，请联系客服。**

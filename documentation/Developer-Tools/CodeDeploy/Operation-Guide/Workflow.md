## 部署工作流

**滚动部署（不使用负载均衡）**


1、部署

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/line21.png)


1）下载程序包：缓存到${root dir}/app-${app id}/group-${group id}/deploy-${deploy id}/

2）执行停止脚本：对应表单填写中的“停止脚本”，对应yaml文件中“hooks”下的“ApplicationStop”

3）执行部署前置脚本：对应yaml文件中“hooks”下的“BeforeInstall”

4）部署：对应yaml文件中的“files”和“permisssions”

5）执行部署后置脚本：对应yaml文件中“hooks”下的“AfterInstall”

6）执行启动脚本：对应表单填写中的“启动脚本”，对应yaml文件中“hooks”下的“ApplicationStart”

7）执行检查脚本：对应表单填写中的“检查脚本”，对应yaml文件中“hooks”下的“ValidateService”


2、回滚

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/line22.png)


1）执行停止脚本：对应表单填写中的“停止脚本”，对应yaml文件中“hooks”下的“ApplicationStop”

2）执行部署前置脚本：对应yaml文件中“hooks”下的“BeforeInstall”

3）部署：对应yaml文件中的“files”和“permisssions”

4）执行部署后置脚本：对应yaml文件中“hooks”下的“AfterInstall”

5）执行启动脚本：对应表单填写中的“启动脚本”，对应yaml文件中“hooks”下的“ApplicationStart”

6）执行检查脚本：对应表单填写中的“检查脚本”，对应yaml文件中“hooks”下的“ValidateService”


回滚的并发度即为部署时的并发度。

**滚动部署（使用负载均衡）**



1、部署

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/line23.png)


1）下载程序包：缓存到${root dir}/app-${app id}/group-${group id}/deploy-${deploy id}/

2）执行取消注册的前置脚本：对应yaml文件中“hooks”下的“BeforeBlockTraffic”

3）在负载均衡中取消注册：在负载均衡虚拟服务器组中，将相应云主机删除

4）执行取消注册的后置脚本：对应yaml文件中“hooks”下的“AfterBlockTraffic”

5）执行停止脚本：对应表单填写中的“停止脚本”，对应yaml文件中“hooks”下的“ApplicationStop”

6）执行部署前置脚本：对应yaml文件中“hooks”下的“BeforeInstall”

7）部署：对应yaml文件中的“files”和“permisssions”

8）执行部署后置脚本：对应yaml文件中“hooks”下的“AfterInstall”

9）执行启动脚本：对应表单填写中的“启动脚本”，对应yaml文件中“hooks”下的“ApplicationStart”

10）执行检查脚本：对应表单填写中的“检查脚本”，对应yaml文件中“hooks”下的“ValidateService”

11）执行注册的前置脚本：对应yaml文件中“hooks”下的“BeforeAllowTraffic”

12）在负载均衡中注册：将相应云主机添加进负载均衡虚拟服务器组中

13）执行注册的后置脚本：对应yaml文件中“hooks”下的“AfterAllowTraffic”


2、回滚

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/line24.png)


1）执行取消注册的前置脚本：对应yaml文件中“hooks”下的“BeforeBlockTraffic”

2）在负载均衡中取消注册：在负载均衡虚拟服务器组中，将相应云主机删除

3）执行取消注册的后置脚本：对应yaml文件中“hooks”下的“AfterBlockTraffic”

4）执行停止脚本：对应表单填写中的“停止脚本”，对应yaml文件中“hooks”下的“ApplicationStop”

5）执行部署前置脚本：对应yaml文件中“hooks”下的“BeforeInstall”

6）部署：对应yaml文件中的“files”和“permisssions”

7）执行部署后置脚本：对应yaml文件中“hooks”下的“AfterInstall”

8）执行启动脚本：对应表单填写中的“启动脚本”，对应yaml文件中“hooks”下的“ApplicationStart”

9）执行检查脚本：对应表单填写中的“检查脚本”，对应yaml文件中“hooks”下的“ValidateService”

10）执行注册的前置脚本：对应yaml文件中“hooks”下的“BeforeAllowTraffic”

11）在负载均衡中注册：将相应云主机添加进负载均衡虚拟服务器组中

12）执行注册的后置脚本：对应yaml文件中“hooks”下的“AfterAllowTraffic”


回滚的并发度即为部署时的并发度。


**蓝绿部署**




1、部署

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/line25.png)


1）下载程序包：缓存到${root dir}/app-${app id}/group-${group id}/deploy-${deploy id}/

2）执行停止脚本：对应表单填写中的“停止脚本”，对应yaml文件中“hooks”下的“ApplicationStop”

3）执行部署前置脚本：对应yaml文件中“hooks”下的“BeforeInstall”

4）部署：对应yaml文件中的“files”和“permisssions”

5）执行部署后置脚本：对应yaml文件中“hooks”下的“AfterInstall”

6）执行启动脚本：对应表单填写中的“启动脚本”，对应yaml文件中“hooks”下的“ApplicationStart”

7）执行检查脚本：对应表单填写中的“检查脚本”，对应yaml文件中“hooks”下的“ValidateService”

8）切换流量：将指定后端服务关联的虚拟服务器组进行替换

注意，在蓝绿部署时，将跳过“执行取消注册的前置脚本”、“执行取消注册的后置脚本”、“执行注册的前置脚本”、“执行注册的后置脚本”这四个步骤。

2、回滚

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/line26.png)

1）切换流量：将指定后端服务关联的虚拟服务器组进行替换

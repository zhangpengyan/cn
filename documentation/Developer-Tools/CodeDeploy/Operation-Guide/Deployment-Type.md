## 部署类型

**滚动部署**

滚动部署，是一种依次更替版本并路由流量的部署方式。以“使用负载均衡”选项选择“是”为例，具体来说：

1）上线前部署组中全部主机承接流量，提供服务。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/rollingdeploy1.png)

2）开始部署，按照所配置的“并发度”，选取组中的部分主机，将其从指定负载均衡后端服务所关联的虚拟服务器组列表中取消注册。即这部分主机暂定对外提供服务。这里我们以并发度为1台为例。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/rollingdeploy2.png)

3）对已不承接流量的主机进行新版本的部署。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/rollingdeploy3.png)

4）部署成功后，将已更新部署版本的这部分主机再次注册到负载均衡后端服务所关联的虚拟服务器组列表中。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/rollingdeploy4.png)

5）依次进行上面的2-4步，直至全部主机部署新版本并承接流量，提供服务。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/rollingdeploy5.png)


对于初次部署的情况，会自动创建名为deploy_R_${group id}_${random string}的虚拟服务器组，并与指定负载均衡后端服务相关联。

由于一个负载均衡后端服务仅可关联一个虚拟服务器组，因此，在新建/编辑部署组时，请确保已选负载均衡后端服务未关联与部署组无关的虚拟服务器组。

初次部署时：

1）上线前部署组中全部主机未承接流量，提供服务。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/rollingdeploy6.png)

2）开始部署，按照所配置的“并发度”，选取组中的部分主机，进行新版本的部署。这里我们以并发度为1台为例。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/rollingdeploy7.png)

3）部署成功后，创建名为deploy_R_${group id}_${random string}的虚拟服务器组（在指定负载均衡实例中），将这部分主机注册到虚拟服务器组中，并将此虚拟服务器组与指定负载均衡后端服务相关联。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/rollingdeploy8.png)

4）依次进行上面的2-3步，直至全部主机部署新版本并承接流量，提供服务。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/rollingdeploy9.png)

以上为滚动部署的具体情况，下面来介绍下另一种部署类型：

**蓝绿部署**

蓝绿部署，是一种蓝组和绿组交替更替版本，只一个分组承载流量的部署方式。具体来说：

1）在上线前，仅蓝组或绿组中的一组（比如蓝组），通过负载均衡，承接流量，对外提供服务。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/bluegreendeploy1.png)

2）开始部署，对未承接流量的组（比如绿组）进行新版本的部署。此时，蓝组仍然继续提供服务。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/bluegreendeploy2.png)

3）当绿组部署完毕，将绿组主机注册到指定负载均衡后端服务所关联的虚拟服务器组列表中，此虚拟服务器组为自动新建，名称为deploy_G_${group id}_${random string}。

与此同时，将蓝组所在的，名称为deploy_B_${group id}_${random string}的虚拟服务器组删除。即将流量由路由到蓝组改为路由到绿组，蓝组不再提供服务，绿组提供服务。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/bluegreendeploy3.png)

在此之后，再次部署时，会将蓝组更新为V4，并承接流量，绿组不承接流量。

请注意，云部署仅会对您在本次新建部署页面中，已指定的负载均衡后端服务所关联的特定虚拟服务器组进行操作。

由于一个负载均衡后端服务仅可关联一个虚拟服务器组，因此，在发起部署时，请确保已选负载均衡后端服务未关联与部署组无关的虚拟服务器组。

对于初次部署的情况，会自动创建名为deploy_B_${group id}_${random string}的虚拟服务器组，并与指定负载均衡后端服务相关联：



1）上线前部署组（蓝组、绿组）中全部主机未承接流量，提供服务。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/bluegreendeploy4.png)

2）开始部署，蓝组中的主机，进行新版本的部署。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/bluegreendeploy5.png)

3）部署成功后，创建名为deploy_B_${group id}_${random string}的虚拟服务器组（在指定负载均衡中），将蓝组主机注册到虚拟服务器组中，并将此虚拟服务器组与指定负载均衡后端服务相关联。至此，蓝组承接流量，提供服务。绿组未操作。

![Alt text](https://github.com/jdcloudcom/cn/blob/codedeploy/image/CodeDeploy/bluegreendeploy6.png)


**自动创建的负载均衡虚拟服务器组命名规则**

deploy_R_${group id}_${random string}：滚动部署时的虚拟服务器组

deploy_B_${group id}_${random string}：蓝绿部署时蓝组对应的虚拟服务器组

deploy_G_${group id}_${random string}：滚动部署时绿组对应的虚拟服务器组

其中的变量说明如下：

| 变量      |    解释 |
| :--------: | :--------:|
| ${group id}  | 部署组ID，可在应用详情页查看 |
| ${random string}  | 随机数 |

**请注意**，由于负载均衡在添加虚拟服务器组或向已有虚拟服务器组中添加云主机时，会先进行健康检查，而后再开放流量，因此，会有一定的时间间隔，可依据实际情况决定是否开启健康检查。

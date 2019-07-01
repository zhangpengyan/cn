# 操作类型-部署

部署是将软件包/镜像部署至云主机或者Kubernetes集群上，提供部署服务。目前流水线集成了[京东云-云部署](../../../Developer-Tools/CodeDeploy/Introduction/Product-Overview.md)和[京东云-Kubernetes集群](../../../Elastic-Compute/JCS-for-Kubernetes/Introduction/Product-Overview.md)。



## 参数说明-云部署

参数名称|参数说明
:---|:---
操作类型|部署
操作名称|根据操作类型默认生成操作名，如部署-默认-1.一条流水线里面，操作名保持唯一
操作提供方|部署系统。以选择[云部署](../../../Developer-Tools/CodeDeploy/Introduction/Product-Overview.md)为例
部署来源|指云部署的部署来源。目前仅支持构建类型为应用包的云编译任务。了解云编译的[构建类型](../../../Developer-Tools/CodeBuild/Operation-Guide/Build-Storage.md)
部署应用|选择用户创建的云部署应用
部署组|选择部署应用下的部署组，在该部署组内的云主机上部署
部署命令|提供服务启停、健康检查脚本
手动确认|选择流转到下一阶段的方式。如果选择手动流转，本阶段会在用户点击确认后执行



## 参数说明-Kubernetes集群

参数名称|参数说明
:---|:---
操作类型|部署
操作名称|根据操作类型默认生成操作名，如部署-默认-1.一条流水线里面，操作名保持唯一
操作提供方|部署系统。以选择[Kubernetes集群](../../../Elastic-Compute/JCS-for-Kubernetes/Introduction/Product-Overview.md)为例
目标集群|选择用户创建的目标集群。将在该集群内部署应用。
创建应用方式|用户可以选择以表单化的方式创建应用或上传yaml文件的方式创建部署应用
应用名|集群内创建的部署应用名称
镜像来源|选择云编译表示将编译产出的镜像部署到k8s集群内。选择自定义表示用户可以部署任意公开镜像，如Nginx
容器组数量|replicas副本数
镜像拉取保密字典|当用户选择部署云编译的产出镜像时，需要配置imagePullSecrets字段。参见[创建自动定期获取临时令牌,长期有效](../../../Elastic-Compute/Container-Registry/Best-Practices/Deploy-Application.md)。
手动确认|选择流转到下一阶段的方式。如果选择手动流转，本阶段会在用户点击确认后执行

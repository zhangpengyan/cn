# decribeContainer


## 描述
获取 pod 中某个容器的详情

## 请求方式
GET

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/pods/{podId}/containers/{containerName}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**podId**|String|True| |Pod ID|
|**containerName**|String|True| |container name|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**container**|Container| |
### Container
|名称|类型|描述|
|---|---|---|
|**name**|String|容器名称|
|**command**|String[]|容器执行命令，如果不指定默认是docker镜像的ENTRYPOINT。总长度256个字符。|
|**args**|String[]|容器执行命令的参数，如果不指定默认是docker镜像的CMD。总长度2048个字符。|
|**env**|EnvSpec[]|容器执行的环境变量；如果和镜像中的环境变量Key相同，会覆盖镜像中的值。长度范围：[0-100]|
|**image**|String|镜像名称 </br> 容器镜像名字。 nginx:latest。长度范围：[1-500] 1. Docker Hub官方镜像通过类似nginx, mysql/mysql-server的名字指定 </br> 2. repository长度最大256个字符，tag最大128个字符，registry最大255个字符 </br>|
|**secret**|String|镜像仓库secret名字。如果目前不传，默认选择dockerHub镜像|
|**tty**|Boolean|容器是否分配tty。默认不分配|
|**workingDir**|String|容器的工作目录。如果不指定，默认是根目录（/）；必须是绝对路径；长度范围：[0-1024]|
|**livenessProbe**|ProbeSpec|容器存活探针配置|
|**readinessProbe**|ProbeSpec|容器服务就绪探针配置|
|**resources**|ResourceRequestsSpec|容器计算资源配置|
|**systemDisk**|CloudDiskSpec|容器计算资源配置|
|**volumeMounts**|VolumeMount[]|容器计算资源配置|
|**containerStatus**|ContainerStatus|容器状态信息|
### ContainerStatus
|名称|类型|描述|
|---|---|---|
|**name**|String|容器名称|
|**restartCount**|Integer|容器被重新启动的次数|
|**ready**|Boolean|容器是否通过了就绪探针探测|
|**state**|ContainerState|关于容器当前状态详细信息|
|**lastState**|ContainerState|关于容器最后一次termination详细信息|
### ContainerState
|名称|类型|描述|
|---|---|---|
|**running**|ContainerStateRunning|容器running的详细信息|
|**terminated**|ContainerStateTerminated|容器Terminated的详细信息|
|**waiting**|ContainerStateWaiting|容器waiting的详细信息|
### ContainerStateWaiting
|名称|类型|描述|
|---|---|---|
|**reason**|String|（简要）容器还没有运行原因。<br><br>eg ContainerCreating     <br>|
|**message**|String|容器还没有运行的详细信息。|
### ContainerStateTerminated
|名称|类型|描述|
|---|---|---|
|**signal**|Integer|容器被termination的信号。|
|**exitCode**|Integer|容器被termination的退出码。|
|**reason**|String|（简要）容器被termination的原因。|
|**message**|String|容器被termination的详细信息。|
|**finishedAt**|String|容器被termination的时间。|
|**startedAt**|String|容器开始执行的时间。|
### ContainerStateRunning
|名称|类型|描述|
|---|---|---|
|**startedAt**|String|容器最后一次重启或启动的时间。|
### VolumeMount
|名称|类型|描述|
|---|---|---|
|**name**|String|必须使用pod volume名称|
|**mountPath**|String|容器内挂载点，绝对路径，不得重复和嵌套挂载，不得挂载到根目录("/")。长度范围：[1-1024]|
|**readOnly**|Boolean|是否以只读方式挂载。默认 读写模式|
### CloudDiskSpec
|名称|类型|描述|
|---|---|---|
|**volumeId**|String|云盘id，使用已有云盘|
|**name**|String|云盘名称|
|**snapshot**|String|云盘快照id，根据云盘快照创建云盘。|
|**diskType**|String|云盘类型：ssd,premium-hdd,hdd.std1,ssd.gp1,ssd.io1|
|**sizeGB**|Integer|云盘size,单位 GB,要求|
|**fsType**|String|指定volume文件系统类型，目前支持[xfs, ext4]；如果新创建的盘，不指定文件系统类型默认格式化成xfs|
|**autoDelete**|Boolean|是否随pod删除。默认：true|
### ResourceRequestsSpec
|名称|类型|描述|
|---|---|---|
|**requests**|RequestSpec|容器必需的计算资源|
|**limits**|RequestSpec|容器使用计算资源上限|
### RequestSpec
|名称|类型|描述|
|---|---|---|
|**cpu**|String|容器必需的计算资源|
|**memoryMB**|String|容器使用计算资源上限|
### ProbeSpec
|名称|类型|描述|
|---|---|---|
|**initialDelaySeconds**|Integer|容器启动多长时间后，触发探针。默认值：10秒；范围:[0-300]|
|**periodSeconds**|Integer|探测的时间间隔。默认值 10秒，范围:[1-300]|
|**timeoutSeconds**|Integer|探测的超时时间。默认值 1秒；范围:[1-300]|
|**failureThreshold**|Integer|在成功状态后，连续探活失败的次数，认为探活失败。默认值 3次；范围 1-10|
|**successThreshold**|Integer|在失败状态后，连续探活成功的次数，认为探活成功。默认值 1次；范围 1-10|
|**exec**|Exec|在容器内执行指定命令；如果命令退出时返回码为 0 则认为诊断成功。|
|**httpGet**|Hg|对指定的端口和路径上的容器的 IP 地址执行 HTTP Get 请求。<br><br>如果响应的状态码大于等于200 且小于 400，则诊断被认为是成功的。 <br>|
|**tcpSocket**|TcpSocketSpec|对指定端口上的容器的 IP 地址进行 TCP 检查；如果端口打开，则诊断被认为是成功的。|
### TcpSocketSpec
|名称|类型|描述|
|---|---|---|
|**port**|Integer|范围：[1-65535]|
### Hg
|名称|类型|描述|
|---|---|---|
|**scheme**|String|默认值： http；可选值 http, https|
|**host**|String|连接到pod的host信息，默认使用pod_ip，满足hostname或者ipv4格式|
|**port**|Integer|范围：[1-65535]|
|**path**|String|HTTP的路径。范围：[1-256]|
|**httpHeader**|Hh[]|对指定的端口和路径上的容器的 IP 地址执行 HTTP Get 请求。<br><br>如果响应的状态码大于等于200 且小于 400，则诊断被认为是成功的。 |
### Hh
|名称|类型|描述|
|---|---|---|
|**name**|String|http header key，需满足http的规则|
|**value**|String|容器探活方式|
### Exec
|名称|类型|描述|
|---|---|---|
|**command**|String[]|执行的命令,总长度256个字符。 s|
### EnvSpec
|名称|类型|描述|
|---|---|---|
|**name**|String|环境变量名称（ASCII）。范围：[1-64]。必须为字母、数字、下划线()，正则为`[a-zA-Z0-9]*$`。|
|**value**|String|环境变量取值。范围：[0-1024]|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

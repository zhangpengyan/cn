# rebuildPod


## 描述
对 pod 中的容器使用新的镜像进行重置，pod 需要处于关闭状态。


## 请求方式
POST

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/pods/{podId}:rebuild

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**podId**|String|True| |Pod ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**containers**|RebuildContainerSpec[]|True| |重置容器相关参数|

### RebuildContainerSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |容器名称|
|**command**|String[]|False| |容器执行命令，如果不指定默认是docker镜像的ENTRYPOINT。总长度256个字符。|
|**args**|String[]|False| |容器执行命令的参数，如果不指定默认是docker镜像的CMD。总长度2048个字符。|
|**env**|EnvSpec[]|False| |容器执行的环境变量；如果和镜像中的环境变量Key相同，会覆盖镜像中的值。长度范围：[0-100]|
|**image**|String|True| |镜像名称 </br><br>容器镜像名字。 nginx:latest。长度范围：[1-639]<br>1. Docker Hub官方镜像通过类似nginx, mysql/mysql-server的名字指定 </br> <br>2. repository长度最大256个字符，tag最大128个字符，registry最大255个字符 </br> <br>|
|**secret**|String|False| |镜像仓库认证信息。如果目前不传，默认选择dockerHub镜像|
|**tty**|Boolean|False| |容器是否分配tty。默认不分配|
|**workingDir**|String|False| |容器的工作目录。如果不指定，默认是根目录（/）；必须是绝对路径；长度范围：[0-1024]|
|**livenessProbe**|ProbeSpec|False| |容器存活探针配置|
|**readinessProbe**|ProbeSpec|False| |容器服务就绪探针配置|
|**volumeMounts**|VolumeMountSpec[]|False| |云盘挂载信息|
### VolumeMountSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |要挂载的云盘，必须使用pod volumeSpec.name。|
|**mountPath**|String|True| |容器内挂载点，绝对路径，不得重复和嵌套挂载，不得挂载到根目录("/")。长度范围：[1-1024]|
|**readOnly**|Boolean|False| |是否以只读方式挂载。默认 读写模式|
### ProbeSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**initialDelaySeconds**|Integer|False| |容器启动多长时间后，触发探针。默认值：10秒；范围:[0-300]|
|**periodSeconds**|Integer|False| |探测的时间间隔。默认值 10秒，范围:[1-300]|
|**timeoutSeconds**|Integer|False| |探测的超时时间。默认值 1秒；范围:[1-300]|
|**failureThreshold**|Integer|False| |在成功状态后，连续探活失败的次数，认为探活失败。默认值 3次；范围:[1-10]|
|**successThreshold**|Integer|False| |在失败状态后，连续探活成功的次数，认为探活成功。默认值 1次；范围:[1-10]|
|**exec**|ExecSpec|False| |在容器内执行指定命令；如果命令退出时返回码为 0 则认为诊断成功。|
|**httpGet**|HgSpec|False| |对指定的端口和路径上的容器的 IP 地址执行 HTTP Get 请求。<br><br>如果响应的状态码大于等于200 且小于 400，则诊断被认为是成功的。 <br>|
|**tcpSocket**|TcpSocketSpec|False| |对指定端口上的容器的 IP 地址进行 TCP 检查；如果端口打开，则诊断被认为是成功的。|
### TcpSocketSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**port**|Integer|True| |端口号，范围：[1-65535]|
### HgSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**scheme**|String|False| |默认值：http；可选值 http, https, HTTP, HTTPS。|
|**host**|String|False| |连接到pod的host信息，默认使用pod_ip，满足hostname或者ipv4格式. 长度范围:[0-253]|
|**port**|Integer|True| |端口号。范围：[1-65535]|
|**path**|String|True| |HTTP的路径。范围：[1-256]|
|**httpHeader**|HhSpec[]|False| |自定义Http headers|
### HhSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |http header 键，需满足http的规则。长度范围:[1-64]|
|**value**|String|True| |http header 值|
### ExecSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**command**|String[]|True| |执行的命令，总长度256个字符。|
### EnvSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |环境变量名称（ASCII）。范围：[1-64]。必须为字母、数字、下划线(_)，正则为`[a-zA-Z0-9]*$`。|
|**value**|String|False| |环境变量取值。范围：[0-1024]|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

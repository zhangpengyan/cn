# rebuildContainer


## 描述
重置原生容器，对已有原生容器使用新的镜像重置。
原容器 id 不变，不涉及计费变动，暂不支持修改实例类型，不会改变原生容器所在的物理节点，也不支持修改已经使用的系统盘和数据盘以及网络相关参数。
- 镜像
    - 容器的镜像通过镜像名称来确定
    - nginx:tag 或 mysql/mysql-server:tag 这样命名的镜像表示 docker hub 官方镜像
    - container-registry/image:tag 这样命名的镜像表示私有仓储的镜像
    - 私有仓储必须兼容 docker registry 认证机制，并通过 secret 来保存机密信息
- 其他
    - rebuild 之前容器必须处于关闭状态
    - rebuild 完成后，容器仍为关闭状态


## 请求方式
POST

## 请求地址
https://nativecontainer.jdcloud-api.com/v1/regions/{regionId}/containers/{containerId}:rebuild

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**containerId**|String|True| |Container ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**image**|String|True| |镜像名称 </br> 1. Docker Hub官方镜像通过类似nginx, mysql/mysql-server的名字指定 </br> </br> repository长度最大256个字符，tag最大128个字符，registry最大255个字符 </br> 下载镜像超时时间：10分钟|
|**secret**|String|False| |镜像仓库认证信息；使用Docker Hub和京东云CR的镜像不需要secret|
|**command**|String[]|False| |容器启动执行的命令, 如果不指定默认是镜像的ENTRYPOINT. 数组字符总长度范围：[0-256]|
|**args**|String[]|False| |容器启动执行命令的参数, 如果不指定默认是镜像的CMD. 数组字符总长度范围：[0-2048]|
|**tty**|Boolean|False| |容器是否分配tty。默认不分配|
|**workingDir**|String|False| |容器的工作目录。如果不指定，默认是根目录（/），必须是绝对路径。字符长度范围：[0-1024]|
|**envs**|EnvVar[]|False| |容器执行的环境变量；如果和镜像中的环境变量Key相同，会覆盖镜像中的值；</br> 最大100对|

### EnvVar
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |环境变量名称|
|**value**|String|False| |环境变量的值|

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

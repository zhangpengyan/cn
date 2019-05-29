# 云物理服务器


## 简介
云物理服务器相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**applyElasticIps**|PUT|申请弹性公网IP<br>|
|**associateElasticIp**|PUT|绑定弹性公网IP<br>|
|**createInstances**|PUT|创建一台或多台指定配置的云物理服务器<br/><br>- 地域与可用区<br/><br>  \- 调用接口（describeRegiones）获取云物理服务器支持的地域与可用区<br/><br>- 实例类型<br/><br>  \- 调用接口（describeDeviceTypes）获取物理实例类型列表<br/><br>  \- 不能使用已下线、或已售馨的实例类型<br/><br>- 操作系统<br/><br>  \- 可调用接口（describeOS）获取云物理服务器支持的操作系统列表<br/><br>- 存储<br/><br>  \- 数据盘多种RAID可选，可调用接口（describeDeviceRaids）获取服务器支持的RAID列表<br/><br>- 网络<br/><br>  \- 网络类型目前支持basic、vpc<br/><br>  \- 线路目前只支持bgp<br/><br>  \- 支持不启用外网，如果启用外网，带宽范围[1,200] 单位Mbps<br/><br>- 其他<br/><br>  \- 购买时长，可按年或月购买：月取值范围[1,9], 年取值范围[1,3]<br/><br>  \- 密码设置参考公共参数规范<br/><br>|
|**createSubnet**|PUT|创建子网|
|**createVpc**|PUT|创建私有网络|
|**deleteSubnet**|DELETE|删除子网|
|**deleteVpc**|DELETE|删除私有网络<br>|
|**describeBasicSubnet**|GET|查询基础网络子网|
|**describeDeviceRaids**|GET|查询某种实例类型的云物理服务器支持的RAID类型，可查询系统盘RAID类型和数据盘RAID类型|
|**describeDeviceTypes**|GET|查询云物理服务器实例类型|
|**describeElasticIp**|GET|查询弹性公网IP详情|
|**describeElasticIps**|GET|查询弹性公网IP列表<br/><br>支持分页查询，默认每页20条<br/><br>|
|**describeInstance**|GET|查询单台云物理服务器详细信息|
|**describeInstanceName**|GET|查询云物理服务器名称|
|**describeInstanceRaid**|GET|查询单个云物理服务器已安装的RAID信息，包括系统盘RAID信息和数据盘RAID信息|
|**describeInstanceStatus**|GET|查询单个云物理服务器硬件监控信息|
|**describeInstances**|GET|批量查询云物理服务器详细信息<br/><br>支持分页查询，默认每页20条<br/><br>|
|**describeOS**|GET|查询云物理服务器支持的操作系统|
|**describeRegiones**|GET|查询云物理服务器地域列表|
|**describeSubnet**|GET|查询子网详情|
|**describeSubnets**|GET|查询子网列表|
|**describeVpc**|GET|查询私有网络详情|
|**describeVpcs**|GET|查询私有网络列表|
|**disassociateElasticIp**|PUT|解绑弹性公网IP<br>|
|**modifyBandwidth**|PUT|升级云物理服务器外网带宽，只能操作running或者stopped状态的服务器<br/><br>- 不支持未启用外网的服务器升级带宽<br>- 外网带宽不支持降级<br>|
|**modifyElasticIpBandwidth**|PUT|修改弹性公网IP带宽<br>|
|**modifyInstance**|POST|修改云物理服务器部分信息，包括名称、描述|
|**modifySubnet**|POST|修改子网|
|**modifyVpc**|POST|修改私有网络<br>|
|**reinstallInstance**|PUT|重装云物理服务器，只能重装stopped状态的服务器<br/><br>- 可调用接口（describeOS）获取云物理服务器支持的操作系统列表<br>|
|**restartInstance**|PUT|重启单台云物理服务器，只能重启running状态的服务器|
|**startInstance**|PUT|对单台云物理服务器执行开机操作，只能启动stopped状态的服务器|
|**stopInstance**|PUT|对单台云物理服务器执行关机操作，只能停止running状态的服务器|

# 限制说明

- 一个region最多可以创建5个NAT网关
- 每个网关默认绑定一个公网IP，不能解绑，也不能追加绑定更多IP
- 用户不能为NAT网关关联安全组
- 用户无法通过VPC对等连接，专线网关将流量路由到NAT网关
- 不支持IP报文分片(fragment)
- 目前应用层网关(ALG)只支持ICMP
- 一个源IP通过NAT网关向一个唯一目的IP端口发起连接，最多可以建立65535条并发连接
- NAT会话超时分为4种，超时时间如下，超时后后续数据报文会被静默丢弃
  - TCP已建立连接超时时间(TCP Established Connection Idle Timeout): 1800秒
  - TCP中间态连接超时时间(TCP Transitory Connection Idle Timeout): 60秒
  - UDP连接超时时间(UDP Mapping Idle Timeout): 60秒
  - ICMP连接超时时间(ICMP Mapping Idle Timeout): 60秒

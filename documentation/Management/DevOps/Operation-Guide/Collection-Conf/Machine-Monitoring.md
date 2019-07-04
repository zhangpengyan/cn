# 机器监控

机器监控的目的是监控机器的cpu/物理内存/swap分区/磁盘等资源的使用情况。用户无需配置，agent会自动采集。

## CPU
以下为cpu相关监控指标，可参考/proc/stat 理解各项指标含义

| 监控项名称    | 监控项含义                  | 单位 | 说明 |
| --------------- | --------------------------- | ---- | ---- |
| cpu.idle        | 空闲CPU百分比               | %    |      |
| cpu.user        | 用户空间占用CPU百分比       | %    |      |
| cpu.sys         | 内核空间占用CPU百分比       | %    |      |
| cpu.iowait      | 等待IO操作的CPU百分比       | %    |      |
| cpu.nice        | nice(优先级抢占)cpu消耗占比 | %    |      |
| cpu.irq         | 硬中断处理程序占用cpu百分比 | %    |      |
| cpu.softIrq     | 软中断处理程序占用cpu百分比 | %    |      |
| cpu.steal       | 虚cpu等待真实cpu时间占比    | %    |      |
| cpu.guest       | 虚cpu运行时间占比           | %    |      |
| cpu.idle.min    | cpu.idle单核中最小值        | %    |      |
| cpu.iowait.max  | cpu.iowait单核中最大值      | %    |      |
| cpu.softIrq.max | cpu.softIrq单核中最大值     | %    |      |
| cpu.sys.max     | cpu.sys单核中最大值         | %    |      |
| cpu.user.max    | cpu.user单核中最大值        | %    |      |
| cpu.use         | cpu的使用率，可能会超过100  | %    |      |
| cpu.use.max     | cpu.use单核中最大值         | %    |      |



## 内存

内存相关监控指标，可参考/proc/meminfo 理解各项指标含义。单位KB = kilobytes

| 监控项名称         | 监控项含义           | 单位 | 说明                              |
| ------------------ | -------------------- | ---- | --------------------------------- |
| mem.free.KB        | 剩余物理内存量       | KB   | free                              |
| mem.free.percent   | 剩余物理内存百分比   | %    | free/total                        |
| mem.usable.KB      | 可用物理内存         | KB   | free + buffers + cached           |
| mem.usable.percent | 可用物理内存百分比   | %    | (free + buffers + cached) / total |
| mem.buffers.KB     | buffer占用物理内存   | KB   |                                   |
| mem.cached.KB      | cache占用物理内存    | KB   |                                   |
| mem.total.KB       | 物理内存总量         | KB   |                                   |
| mem.use.KB         | 消耗的物理内存       | KB   |                                   |
| mem.use.percent    | 消耗的物理内存百分比 | %    |                                   |
| swap.free.KB       | swap分区空闲大小     | KB   |                                   |
| swap.free.percent  | swap分区空闲百分比   | %    |                                   |
| swap.total.KB      | swap分区总量         | KB   |                                   |
| swap.use.KB        | swap分区使用大小     | KB   | 与mem.free.*对应                  |
| swap.use.percent   | swap分区使用百分比   | %    |  与mem.free.*对应                   |

```sql
注：如果内核支持Available，则mem.usable.* = MemAvailable
若不支持，mem.usable.* = MemFree + Buffers + Cached
```
## 负载

系统平均负载相关监控指标，可参考/proc/loadavg 理解各项指标含义。监控项数值越高代表系统越繁忙

| 监控项名称     | 监控项含义               | 单位 | 说明 |
| -------------- | ------------------------ | ---- | ---- |
| load.avg_1min  | 过去1分钟的系统平均负载  |      |      |
| load.avg_5min  | 过去5分钟的系统平均负载  |      |      |
| load.avg_15min | 过去15分钟的系统平均负载 |      |      |



## 磁盘

disk相关监控指标，可参考/proc/self/mounts 理解各项指标含义。
tag表示某具体挂载点的使用情况，例如disk.io.read_merged tags: device=sda

| 监控项名称               | 监控项含义          | 单位 | 说明 |
| ------------------------ | ------------------- | ---- | ---- |
| disk.free.KB             | 磁盘空闲量          | KB   |      |
| disk.free.percent        | 磁盘空闲百分比      | %    |      |
| disk.free.inodes         | 磁盘inode空闲量     | 个数 |      |
| disk.free.inodes.percent | 磁盘inode空闲百分比 | %    |      |
| disk.total.KB            | 磁盘总量            | KB   |      |
| disk.total.inodes        | 磁盘inode总量       | 个数 |      |
| disk.use.KB              | 磁盘使用量          | KB   |      |
| disk.use.percent         | 磁盘使用百分比      | %    |      |
| disk.use.inodes          | 磁盘inode使用量     | 个数 |      |
| disk.use.inodes.percent  | 磁盘inode使用百分比 | %    |      |



disk io相关监控指标，可参考/proc/diskstats 理解各项指标含义。

| 监控项名称         | 监控项含义               | 单位 | 说明         |
| ------------------ | ------------------------ | ---- | ------------ |
| disk.io.read.KBps  | 磁盘每秒读取的字节数     | KB/s |              |
| disk.io.write.KBps | 磁盘每秒写入的字节数     | KB/s |              |
| disk.io.avgrq_sz   | 磁盘io请求的平均(块)大小 |      |              |
| disk.io.avgqu_sz   | 磁盘io请求队列长度       | 个数 |              |
| disk.io.await      | 磁盘io请求平均处理时间   | 毫秒 | 包含等待时间 |
| disk.io.svctm      | 磁盘io请求平均处理时间   | 毫秒 |              |
| disk.io.util       | 磁盘io利用率             | %    |              |



## 网络

可参考/proc/net/dev 理解各项指标含义。
tag表示某具体网卡的使用情况，例如net.in.bps: iface=eth0

iface: 网卡名

- bps = bits per second
- pps = packets per second
- ps = per second

```
    PS: 当前默认采集以下几种开头的网卡，如需采集其他网卡，可通过修改网卡名的方式实现
    
    1. eth
    2. em
    3. bond
    4. en
    5. vEth
    6. Ethernet
```

| 监控项名称              | 监控项含义                           | 单位 | 说明 |
| ----------------------- | ------------------------------------ | ---- | ---- |
| net.in.bps              | 网络流入速度                         | bps  |      |
| net.in.pps              | 网络流入包速度                       | pps  |      |
| net.out.bps             | 网络流出速度                         | bps  |      |
| net.out.pps             | 网络流出包速度                       | pps  |      |
| net.speed.bps           | 网络速度                             | bps  |      |
| net.in.errors.ps        | 网络流入错误/每秒                    | 个   |      |
| net.in.dropped.ps       | 设备驱动程序入口丢弃的数据包总数     | 个   |      |
| net.in.fifo.errs.ps     | FIFO缓冲区错误的数量                 | 个   |      |
| net.in.frame.errs.ps    | 分组帧错误的数量                     | 个   |      |
| net.in.compressed.ps    | 设备驱动程序接受压缩数据包数         | 个   |      |
| net.in.multicast.ps     | 设备驱动程序发送或接收的多播帧数     | 个   |      |
| net.out.errors.ps       | 网络流出错误/每秒                    | 个   |      |
| net.out.dropped.ps      | 设备驱动程序出口丢弃的数据包总数     | 个   |      |
| net.out.fifo.errs.ps    | FIFO缓冲区错误的数量                 | 个   |      |
| net.out.collisions.ps   | 接口上检测到的冲突数                 | 个   |      |
| net.out.carrier.errs.ps | 由设备驱动程序检测到的载波损耗的数量 | 个   |      |
| net.out.compressed.ps   | 设备驱动程序发送压缩数据包数         | 个   |      |



## socket

可参考/proc/net/sockstat理解各项指标含义。

| 监控项名称      | 监控项含义                 | 单位 | 说明 |
| --------------- | -------------------------- | ---- | ---- |
| net.socket.used | 已使用的所有协议套接字总量 | 个   |      |



## TCP
可参考/proc/net/netstat和/proc/net/snmp理解各项指标含义。

| 监控项名称                  | 监控项含义                                                   | 单位  | 说明                                                         |
| --------------------------- | ------------------------------------------------------------ | ----- | ------------------------------------------------------------ |
| net.socket.tcp.inuse        | 正在使用（正在侦听）的TCP套接字数量。                        | 个    | 其值≤ netstat –lnt                                           |
| net.tcp.curr_estab          | tcp当前链接数                                                | 个    |                                                              |
| net.socket.tcp.orphan       | 无主（不属于任何进程）的TCP连接数                            | 个    | 无用、待销毁的TCP socket数                                   |
| net.socket.tcp.tw           | 等待关闭的TCP连接数                                          | 个    | netstat –ant                                                 |
| net.socket.tcp.alloc        | 已分配（已建立、已申请到sk_buff）的TCP套接字数量             | 个    | 等于netstat –ant                                             |
| net.socket.tcp.mem          | 套接字缓冲区使用量                                           |       |                                                              |
| net.tcp.listen_overflows.ps | 三路握手最后一步完成之后，接受队列超过上限时加１             | 个/秒 | 完全连接队列，其大小为min(/proc/sys/net/core/somaxconn, backlog) |
| net.tcp.listen_drops.ps     | 任何原因，包括Accept queue超限，创建新连接，继承端口失败等，加１ | 个/秒 |                                                              |
| net.tcp.loss.ps             | tcp协议栈丢失数据包而进行恢复的次数                          | 个/秒 |                                                              |
| net.tcp.abort_on_syn.ps     | 接收到错误的syn包(序号错误)导致连接被reset的次数             | 个/秒 |                                                              |
| net.tcp.abort_on_data.ps    | 当sock状态在TCP_FIN_WAIT1或TCP_FIN_WAIT2状态已经进入半连接但还是接收到数据而引起连接被reset的次数 | 个/秒 |                                                              |
| net.tcp.abort_on_close.ps   | 当sock关闭时还有相关数据未读的次数.                          | 个/秒 |                                                              |
| net.tcp.abort_on_memory.ps  | 当sock关闭时由于内存不足而直接被reset的次数                  | 个/秒 |                                                              |
| net.tcp.abort_on_timeout.ps | tcp协议栈各定时器超时重复次数超过最大限制而关闭sock的次数    | 个/秒 |                                                              |
| net.tcp.abort_on_linger.ps  | 当sock关闭时状态是TCP_FIN_WAIT2状态直接被reset的次数         | 个/秒 |                                                              |
| net.tcp.abort_failed.ps     | tcp协议栈在发送reset包而发送失败的次数                       | 个/秒 |                                                              |
| net.tcp.in_errs.ps          | 网络流入错误/每秒                                            | 个/秒 |                                                              |
| net.tcp.in_segs.ps          | tcp协议层收到的数据包个数                                    | 个/秒 |                                                              |
| net.tcp.out_segs.ps         | tcp协议层发出的数据包个数                                    | 个/秒 |                                                              |
| net.tcp.retrans_segs.ps     | TCP重传数/每秒                                               | 个/秒 |                                                              |
| net.tcp.active_opens.ps     | TCP主动打开数/每秒                                           | 个/秒 |                                                              |



## UDP

可参考/proc/net/snmp理解各项指标含义。

| 监控项名称               | 监控项含义                 | 单位  | 说明 |
| ------------------------ | -------------------------- | ----- | ---- |
| net.socket.used          | 已使用的所有协议套接字总量 | 个数  |      |
| net.socket.tcp.inuse     | 已使用的TCP协议套接字总量  | 个数  |      |
| net.udp.rcvbuf_errors.ps | UDP接收缓冲区错误/每秒     | 个/秒 |      |
| net.udp.sndbuf_errors.ps | UDP发送缓冲区错误/每秒     | 个/秒 |      |



## netfilter

可参考/proc/sys/net/netfilter理解各项指标含义。

| 监控项名称             | 监控项含义                                                   | 单位 | 说明 |
| ---------------------- | ------------------------------------------------------------ | ---- | ---- |
| net.nf.conntrack.count | 当前连接跟踪表大小 /proc/sys/net/nf_conntrack_count          |      |      |
| net.nf.conntrack.usage | 连接跟踪表的使用率 nf_conntrack_count/nf_conntrack_max * 100 |      |      |


# 计费说明

本文主要介绍京东云对象存储 OSS 服务费用的各项组成部分及计费方式，您可以通过本文了解 OSS 服务费用收取详情。

* [计费方式](Billing-Rules#user-content-1)
* [费用组成](Billing-Rules#user-content-2)
* [存储费用](Billing-Rules#user-content-3)
* [流量费用](Billing-Rules#user-content-4)
* [请求费用](Billing-Rules#user-content-5)
* [数据取回费用](Billing-Rules#user-content-6)
* [云端数据处理费用](Billing-Rules#user-content-7)

## 计费方式

<div id="user-content-1"></div>

京东云对象存储所有地域均采用按量后付费的计费模式，根据用户实际用量按天推送账单，每天按照账单收取前一天的费用。

**说明**：
标准存储类型为您在全地域提供了免费额度，请参见[免费额度](https://docs.jdcloud.com/cn/object-storage-service/free-tier-for-oss)。

### 费用组成

<div id="user-content-2"></div>

OSS 服务费用由存储费用、流量费用、请求费用、数据取回费用、云端处理费用几部分组成：

![计费组成](../../../../image/Object-Storage-Service/OSS-156.png)


## 计费项

OSS服务费用由存储费用、流量费用、请求费用、数据取回费用、云端数据处理费用几部分组成：

<table>
<tr>
    <td colspan="2">计费项</td>
    <td>释义</td>
    <td>计费公式</td>
    <td>说明</td>
</tr>
<tr>
    <td rowspan="2">存储容量</td>
    <td>实际存储空间占用</td>
    <td>实际存储空间占用量包括：<br>1.标准存储类型的数据占用量<br>2.低冗余类型的数据占用量</td>
    <td>当前存储容量（GB）* 对应存储类型的每天单价</td>
    <td>具体价格请查阅价格总览</td>
</tr>
<tr>
    <td>数据取回量</td>
    <td>对于低冗余存储类型数据的访问，会按照读取文件的大小计算数据取回量，不区分内、外网。</td>
    <td>数据取回量费用 = 数据取回量（GB） * 每 GB 单价<br>例：假如您需要从低冗余存储类型的Bucket中下载10个文件，每个文件10GB。那么数据取回的费用 = 10 * 10 * 每GB的数据取回单价</td>
    <td>目前免费</td>
</tr>
<tr>
    <td rowspan="6">访问流量</td>
    <td>内网流入流量</td>
    <td>通过京东云内网从云主机等内部服务上传数据到对象存储所产生的上行流量</td>
    <td>-</td>
    <td>免费</td>
</tr>
<tr>
    <td>内网流出流量</td>
    <td>通过京东云内网从对象存储下载数据到云主机等内部服务所产生的下行流量</td>
    <td>-</td>
    <td>免费</td>
</tr>
<tr>
    <td>外网流入流量</td>
    <td>通过公网从本地端上传数据到京东云对象存储所产生的上行流量</td>
    <td>-</td>
    <td>免费</td>
</tr>
<tr>
    <td>外网流出流量</td>
    <td>通过公网从京东云对象存储下载数据到本地端所产生的下行流量</td>
    <td>每天累计外网流出流量（GB） * 每 GB 单价</td>
    <td>具体价格请查阅价格总览</td>
</tr>
<tr>
    <td>CDN回源流出流量</td>
    <td>通过CDN服务层下载 OSS 的数据所产生的回源下行流量</td>
    <td>每天累计 CDN 回源流出流量（GB） * 每 GB 单价跨区域复制流量</td>
    <td>具体价格请查阅价格总览</td>
</tr>
<tr>
    <td>跨区域复制流量</td>
    <td>使用跨区域复制功能将源 Bucket 的数据同步复制到目标 Bucket 时所产生的流出流量</td>
    <td>每天累计跨区域复制流量（GB） * 每 GB 单价</td>
    <td>目前免费</td>
</tr>
<tr>
    <td rowspan="2">请求次数</td>
    <td>GET请求</td>
    <td>对象存储OPEN API当中全部GET请求</td>
    <td>每天累计GET请求总数/10000 * 每万次请求单价</td>
    <td>目前免费</td>
</tr>
<tr>
    <td>PUT请求</td>
    <td>对象存储OPEN API当中全部PUT请求</td>
    <td>每天累计PUT请求总数/10000 * 每万次请求单价</td>
    <td>目前免费</td>
</tr>
<tr>
    <td rowspan="2">云端数据处理</td>
    <td>音视频转码时长</td>
    <td>使用音视频转码服务的输出文件时长</td>
    <td>每天累计输出文件时长 * 每分钟转码单价</td>
    <td>具体价格请查阅价格总览</td>
</tr>
<tr>
    <td>视频截图张数</td>
    <td>使用视频截图服务的截图张数</td>
    <td>每天累计截图张数/1000 * 每千张单价</td>
    <td>具体价格请查阅价格总览</td>
</tr>
</table>



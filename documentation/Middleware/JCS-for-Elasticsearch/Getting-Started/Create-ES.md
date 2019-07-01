## 创建集群
您可以在云搜索Elasticsearch控制台新建集群，关于实例的计费说明请参见“[价格总览](../Pricing/Price-Overview.md)”、“[计费规则](../Pricing/Billing-Rules.md)”。
## 前提条件
- 已注册京东云账号，并完成实名认证。如果还没有账号请 [注册](https://accounts.jdcloud.com/p/regPage?source=jdcloud&ReturnUrl=https%3a%2f%2fuc.jdcloud.com%2fpassport%2fcomplete%3freturnUrl%3dhttps%3a%2f%2fwww.jdcloud.com)，或 [实名认证](https://uc.jdcloud.com/account/certify)。
- 如计费类型选择按配置计费，请确认您的账户余额（包括代金券）能满足您的使用。
## 操作步骤

1.登录[云搜索Elasticsearch 控制台](https://es-console.jdcloud.com/clusters)。</br>

2.在实例列表页面单击“创建集群”，进入“创建集群”页面。</br>
![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/创建ES-01.png)
![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/configes_10.png)

3.进入“创建集群”页面后，指定集群“地域”和“可用区”。</br>

* “地域”：目前工作区域支持“华北-北京”、“华东-上海”。</br>
* “可用区”：可用区是使用独立电源和网络资源的物理区域。通过内部网络互联，再以物理方式进行隔离，提高了应用程序的可用性。不同可用区不互通，创建后不可更改。</br> 
 ![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/配置ES-01.png)
 
4.设置集群基本信息，选择“集群版本”，并输入“集群名称”。</br>

* “集群版本”：当前版本支持5.6.9和6.5.4。</br>
* “集群名称”：自定义的集群名称，名称不可为空，只支持数字、大小写字母、英文下划线“_”及中划线“-”，以字母开头且不能超过32字符。</br>
 ![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/配置ES-02.png)
 
5.设置集群的主机规格相关参数。</br>

* “节点规格”：当前支持六种规格，包括：1核2G、2核4G、2核8G、4核16G、8核32G、16核64G。可以根据具体业务情况选择不同云主机规格，其中1核2G只适用于测试，不适用于生产环境。</br>
* “单点存储规格”：单点存储规格范围20-4000GB，步长为10GB，可输入整数。</br>
* “节点数量”：支持工单方式提升节点配额。</br>
  ![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/配置ES-031.png)
  
6.设置专有主节点，开启专有主节点可以提高集群的稳定性，建议开启。

* “专有主节点规格”：支持2核8G、4核16G、8核32G三种规格。</br>
* “专有主节点数量”：对于大多数实例，三个专用主节点很适用。</br>
* “专有主节点存储”：固定为20G。</br>
![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/configes_11.png)

7.指定集群的网络规格相关参数，包括“私有网络”、“子网”。</br>

* “私有网络”： 显示当前VPC列表，默认选择最新创建的VPC。单击列表后“新建私有网络”跳转至私有网络（VPC）页面。</br>
* “子网”： 显示当前子网列表，默认选择最新创建的子网。单击列表后“新建子网”跳转至私有网络-子网页面。</br>
  ![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/配置ES-04.png)
8.已选配置列表显示当前已选配置信息，未选项显示默认配置。单击“立即购买”，进入规格确认界面。</br>

9.规格确认完成后，单击“立即开通”开始创建集群。</br>
  ![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/配置ES-06.png)
  
10.跳转支付确认页面成功付款后返回集群列表页面。您创建的集群将展现在集群列表中。且集群状态为“创建中”，耐心等待几分钟，创建成功后集群状态会变为“运行”。如果集群创建失败，请根据界面提示，重新创建集群。</br>
  ![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/配置ES-07.png)
  ![查询1](https://github.com/jdcloudcom/cn/blob/Elasticsearch/image/Internet-Middleware/JCS%20for%20Elasticsearch/配置ES-08.png)

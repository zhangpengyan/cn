# JDCLOUD CDN Operation And Query API


## 简介
API related to CDN instances


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**batchCreate**|POST|创建点播加速域名|
|**batchDeleteDomainGroup**|POST|批量删除域名组|
|**createCacheRule**|POST|添加缓存规则|
|**createDomain**|POST|创建点播加速域名|
|**createDomainGroup**|POST|创建域名组|
|**createLiveDomain**|POST|创建直播域名|
|**deleteCacheRule**|DELETE|删除缓存规则|
|**deleteDomain**|DELETE|删除加速域名|
|**deleteHttpHeader**|DELETE|删除httpHeader|
|**getDomainDetail**|GET|查询加速域名详情|
|**getDomainList**|GET|查询加速域名接口|
|**operateIpBlackList**|PUT|设置ip黑名单状态|
|**operateLiveDomainIpBlackList**|POST|开启或关闭ip黑名单|
|**operateShareCache**|POST|泛域名共享缓存|
|**previewCertificate**|POST|预览证书|
|**queryAccesskeyConfig**|GET|查询url鉴权|
|**queryDefaultHttpHeaderKey**|GET|查询默认http header头部参数列表|
|**queryDomainConfig**|GET|查询域名配置信息|
|**queryDomainGroupDetail**|GET|查询域名组详情|
|**queryDomainGroupList**|GET|查询域名组接口|
|**queryDomainsNotInGroup**|GET|查询未分组域名|
|**queryHttpHeader**|GET|查询http header头|
|**queryIpBlackList**|GET|查询ip黑名单|
|**queryLiveDomainDetail**|GET|查询直播域名详情|
|**queryMonitor**|GET|查询源站监控信息|
|**queryOssBuckets**|GET|查询oss存储域名|
|**queryStatisticsData**|POST|查询统计数据|
|**queryStatisticsDataGroupByArea**|POST|分地区及运营商查询统计数据|
|**queryStatisticsDataGroupSum**|POST|查询统计数据并进行汇总加和|
|**queryStatisticsTopIp**|POST|查询TOP IP|
|**queryStatisticsTopUrl**|POST|查询TOP Url|
|**queryUserAgent**|GET|设置userAgent信息|
|**setAccesskeyConfig**|POST|设置url鉴权|
|**setHttpHeader**|POST|添加httpHeader|
|**setHttpType**|POST|设置http协议|
|**setIgnoreQueryString**|POST|设置忽略参数|
|**setIpBlackList**|POST|设置ip黑名单|
|**setLiveDomainAccessKey**|POST|设置URL鉴权|
|**setLiveDomainBackSource**|POST|设置直播域名回源信息|
|**setLiveDomainBackSourceHost**|POST|设置直播域名回源host|
|**setLiveDomainIpBlackList**|POST|设置直播域名ip黑名单|
|**setLiveDomainRefer**|POST|设置域名refer防盗链|
|**setMonitor**|POST|设置源站监控信息|
|**setProtocolConvert**|POST|设置转协议|
|**setRange**|POST|设置range参数|
|**setRefer**|POST|设置域名refer|
|**setSource**|POST|设置源站信息|
|**setUserAgentConfig**|POST|设置userAgent信息|
|**setVideoDraft**|POST|设置视频拖拽|
|**startDomain**|POST|启动加速域名|
|**stopDomain**|POST|停止加速域名|
|**stopMonitor**|POST|停止源站监控|
|**updateCacheRule**|PUT|修改缓存规则|
|**updateDomainGroup**|POST|更新域名组|

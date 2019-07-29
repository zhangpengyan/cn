# Video-on-Demand


## 简介
视频点播相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**batchDeleteVideos**|POST|批量删除视频，调用该接口会同时删除与指定视频相关的所有信息，包括转码任务信息、转码流数据等，同时清除云存储中相关文件资源。|
|**batchSubmitTranscodeJobs**|POST|批量提交转码作业|
|**batchUpdateVideos**|POST|批量修改视频信息|
|**createCategory**|POST|添加分类|
|**createDomain**|POST|添加域名|
|**createImageUploadTask**|POST|获取图片上传地址和凭证|
|**createTranscodeTemplate**|POST|创建转码模板|
|**createVideoUploadTask**|POST|获取视频上传地址和凭证|
|**createWatermark**|POST|添加水印|
|**deleteCategory**|DELETE|删除分类|
|**deleteDomain**|DELETE|删除域名，执行该操作之前，需确保域名已被停用。|
|**deleteHeader**|POST|删除域名访问头参数|
|**deleteNotifyConfigs**|DELETE|删除回调配置|
|**deleteTranscodeTemplate**|DELETE|删除转码模板|
|**deleteVideo**|DELETE|删除视频，调用该接口会同时删除与指定视频相关的所有信息，包括转码任务信息、转码流数据等，同时清除云存储中相关文件资源。|
|**deleteVideoStreams**|POST|删除视频转码流|
|**deleteWatermark**|DELETE|删除水印|
|**disableDomain**|POST|停用域名|
|**enableDomain**|POST|启用域名|
|**getCategory**|GET|查询分类|
|**getCategoryWithChildren**|GET|查询分类及其子分类，若指定的分类ID为0，则返回一个根分类及其子分类（即一级分类）.|
|**getDomain**|GET|查询域名|
|**getIPRule**|GET|查询CDN域名IP黑名单规则配置|
|**getRefererRule**|GET|查询CDN域名Referer防盗链规则配置|
|**getTranscodeTemplate**|GET|查询转码模板|
|**getURLRule**|GET|查询CDN域名URL鉴权规则配置|
|**getVideo**|GET|查询单个视频信息|
|**getVideoPlayInfo**|GET|获取视频播放信息|
|**getWatermark**|GET|查询水印|
|**listAllCategories**|GET|查询所有分类|
|**listCategories**|GET|查询分类列表，按照分页方式，返回分类列表信息<br>|
|**listDomains**|GET|查询域名列表|
|**listHeaders**|GET|查询域名访问头参数列表|
|**listTranscodeTemplates**|GET|查询转码模板列表。<br>允许通过条件过滤查询，支持的过滤字段如下：<br>  \- source[eq] 按模板来源精确查询<br>  \- templateType[eq] 按模板类型精确查询<br>|
|**listVideos**|GET|查询视频列表信息。<br>允许通过条件过滤查询，支持的过滤字段如下：<br>  \- status[eq] 按视频状态精确查询<br>  \- categoryId[eq] 按分类ID精确查询<br>  \- videoId[eq] 按视频ID精确查询<br>  \- name[eq] 按视频名称精确查询<br>|
|**listWatermarks**|GET|查询水印列表|
|**refreshVideoUploadTask**|GET|刷新视频上传地址和凭证|
|**setDefaultDomain**|POST|设为默认域名|
|**setHeader**|POST|设置域名访问头参数|
|**setIPRule**|POST|设置CDN域名IP黑名单规则|
|**setRefererRule**|POST|设置CDN域名Referer防盗链规则|
|**setURLRule**|POST|设置CDN域名URL鉴权规则|
|**submitTranscodeJob**|POST|提交转码作业|
|**updateCategory**|PUT|修改分类|
|**updateTranscodeTemplate**|PUT|修改转码模板|
|**updateVideo**|PUT|修改视频信息|
|**updateWatermark**|PUT|修改水印|

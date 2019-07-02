# Live-Video


## 简介
视频直播相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**addCustomLiveStreamRecordTemplate**|POST|添加直播录制模板|
|**addCustomLiveStreamSnapshotTemplate**|POST|添加直播截图模板|
|**addCustomLiveStreamTranscodeTemplate**|POST|添加自定义转码模板|
|**addCustomLiveStreamWatermarkTemplate**|POST|添加直播水印模板|
|**addLiveApp**|POST|添加直播APP|
|**addLiveDomain**|POST|添加直播域名|
|**addLiveRecordTask**|POST|添加录制打点任务</br>  \- 您可以调用此接口精确提取已录制的文件中所需要的部分</br>|
|**addLiveRestartDomain**|PUT|添加回看域名|
|**addLiveStreamAppRecord**|POST|添加APP录制配置|
|**addLiveStreamAppSnapshot**|POST|添加APP直播截图配置|
|**addLiveStreamAppTranscode**|POST|添加APP转码配置|
|**addLiveStreamAppWatermark**|POST|添加APP水印配置|
|**addLiveStreamDomainRecord**|POST|添加域名录制配置|
|**addLiveStreamDomainSnapshot**|POST|添加域名直播截图配置|
|**addLiveStreamDomainTranscode**|POST|添加域名转码配置|
|**addLiveStreamDomainWatermark**|POST|添加域名水印配置|
|**closeLiveRestart**|PUT|关闭回看|
|**closeLiveTimeshift**|PUT|关闭时移|
|**deleteCustomLiveStreamRecordTemplate**|DELETE|删除用户自定义录制模板|
|**deleteCustomLiveStreamSnapshotTemplate**|DELETE|删除用户自定义直播截图模板|
|**deleteCustomLiveStreamTranscodeTemplate**|DELETE|删除用户自定义转码模板|
|**deleteCustomLiveStreamWatermarkTemplate**|DELETE|删除用户自定义水印模板|
|**deleteLiveApp**|DELETE|删除APP|
|**deleteLiveDomain**|DELETE|删除直播域名|
|**deleteLiveStreamAppRecord**|DELETE|删除APP录制配置|
|**deleteLiveStreamAppSnapshot**|DELETE|删除APP截图配置|
|**deleteLiveStreamAppTranscode**|DELETE|删除APP转码配置|
|**deleteLiveStreamAppWatermark**|DELETE|删除APP水印配置|
|**deleteLiveStreamDomainRecord**|DELETE|删除域名录制配置|
|**deleteLiveStreamDomainSnapshot**|DELETE|删除域名截图配置|
|**deleteLiveStreamDomainTranscode**|DELETE|删除域名转码配置|
|**deleteLiveStreamDomainWatermark**|DELETE|删除域名水印配置|
|**deleteLiveStreamNotifyConfig**|DELETE|删除直播流状态通知|
|**deleteLiveStreamRecordNotifyConfig**|DELETE|删除录制回调配置|
|**deleteLiveStreamSnapshotNotifyConfig**|DELETE|删除截图回调配置|
|**describeCustomLiveStreamRecordConfig**|GET|查询录制配置|
|**describeCustomLiveStreamRecordTemplates**|GET|查询录制模板列表|
|**describeCustomLiveStreamSnapshotConfig**|GET|查询直播截图配置|
|**describeCustomLiveStreamSnapshotTemplates**|GET|查询直播截图模板列表|
|**describeCustomLiveStreamTranscodeTemplate**|GET|查询用户自定义转码模板详情|
|**describeCustomLiveStreamTranscodeTemplates**|GET|查询用户自定义转码模板列表|
|**describeCustomLiveStreamWatermarkConfig**|GET|查询水印配置|
|**describeCustomLiveStreamWatermarkTemplates**|GET|查询水印模板列表|
|**describeLiveApp**|GET|查询域名下的APP列表|
|**describeLiveDomainDetail**|GET|查询指定域名相关信息|
|**describeLiveDomains**|GET|查询域名列表|
|**describeLivePlayAuthKey**|GET|查询播放鉴权KEY|
|**describeLivePornData**|GET|查询直播鉴黄张数数据|
|**describeLiveRecordData**|GET|查询直播录制时长数据|
|**describeLiveRestartConfigs**|GET|查询回看配置|
|**describeLiveSnapshotData**|GET|查询直播截图张数数据|
|**describeLiveStreamNotifyConfig**|GET|查询直播流状态通知|
|**describeLiveStreamOnlineList**|GET|查看域名下所有的正在推的流的信息|
|**describeLiveStreamPublishList**|GET|查看域名下推流记录|
|**describeLiveStreamRecordNotifyConfig**|GET|查询录制回调配置|
|**describeLiveStreamSnapshotNotifyConfig**|GET|查询截图回调配置|
|**describeLiveStreamTranscodeConfig**|GET|查询转码模板配置|
|**describeLiveTimeshiftConfigs**|GET|查询时移配置|
|**forbidLiveStream**|PUT|禁止直播流推送|
|**openLiveRestart**|PUT|开启回看|
|**openLiveTimeshift**|PUT|开启时移|
|**resumeLiveStream**|PUT|恢复直播流推送|
|**setLivePlayAuthKey**|POST|设置播放鉴权KEY|
|**setLiveStreamNotifyConfig**|POST|设置推流回调配置|
|**setLiveStreamRecordNotifyConfig**|POST|设置录制回调通知|
|**setLiveStreamSnapshotNotifyConfig**|POST|设置截图回调通知|
|**startLiveApp**|PUT|启用APP|
|**startLiveDomain**|PUT|启动域名|
|**stopLiveApp**|PUT|停用APP|
|**stopLiveDomain**|PUT|停用域名|

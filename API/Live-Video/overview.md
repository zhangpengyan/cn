# Live-Video


## 简介
视频直播相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**addCustomLiveStreamRecordTemplate**|添加用户自定义直播录制模板<br>|
|**addCustomLiveStreamSnapshotTemplate**|添加直播截图模板|
|**addCustomLiveStreamTranscodeTemplate**|添加自定义转码模板<br>- 系统为您预设了标准转码模板,如果不能满足您的转码需求,可以通过此接口添加自定义转码模板<br>- 系统标准转码模板<br>    ld (h.264/640*360/15f)<br>    sd (h.264/960*540/25f)<br>    hd (h.264/1280*720/25f)<br>    shd (h.264/1920*1080/30f)<br>    ld-265 (h.265/640*360/15f)<br>    sd-265 (h.265/960*540/25f)<br>    hd-265 (h.265/1280*720/25f)<br>    shd-265 (h.265/1920*1080/30f)<br>|
|**addCustomLiveStreamWatermarkTemplate**|添加用户自定义水印模板<br>|
|**addLiveApp**|添加直播应用名<br>- 需要提前在应用(app)级别绑定功能模板时才需要提前新建应用名<br>- 新的应用名可以推流时自动创建<br>|
|**addLiveDomain**|添加直播域名<br>- 创建直播域名之前,必须先开通直播服务<br>- 直播域名必须已经备案完成<br>|
|**addLiveRecordTask**|添加打点录制任务<br>- 您可以调用此接口精确提取已录制的文件中所需要的部分<br>|
|**addLiveRestartDomain**|添加回看域名<br>|
|**addLiveStreamAppRecord**|添加应用级别直播录制配置<br>- 添加应用级别的直播录制模板配置<br>|
|**addLiveStreamAppSnapshot**|添加应用截图配置<br>- 添加应用级别的截图模板配置<br>|
|**addLiveStreamAppTranscode**|添加应用转码配置<br>- 添加应用级别的转码模板配置<br>|
|**addLiveStreamAppWatermark**|添加应用级别水印配置<br>|
|**addLiveStreamDomainRecord**|添加域名级别直播录制配置<br>- 添加域名级别的直播录制模板配置<br>|
|**addLiveStreamDomainSnapshot**|添加域名截图配置<br>- 添加域名级别的截图模板配置<br>|
|**addLiveStreamDomainTranscode**|添加域名级别转码配置<br>- 添加域名级别的转码模板配置<br>|
|**addLiveStreamDomainWatermark**|添加域名水印配置<br>|
|**addLiveStreamRecord**|添加流的录制模板配置<br>|
|**checkDomainIcp**|校验域名是否备案|
|**closeLiveRestart**|关闭回看|
|**closeLiveTimeshift**|关闭时移|
|**deleteCustomLiveStreamRecordTemplate**|删除用户自定义录制模板<br>- 删除用户自定义录制模板之前必须先删除此模板在各域名、应用、流级别的录制设置<br>|
|**deleteCustomLiveStreamSnapshotTemplate**|删除用户自定义直播截图模板<br>- 删除截图模板前,请先删除此模板相关的截图配置,否则将会影响线上业务<br>|
|**deleteCustomLiveStreamTranscodeTemplate**|删除用户自定义转码模板<br>- 删除用户自定义转码模板之前必须先删除此模板在各域名、应用、流级别的转码设置<br>|
|**deleteCustomLiveStreamWatermarkTemplate**|删除用户自定义水印模板<br>- 删除用户自定义水印模板之前必须先删除此模板在各域名、应用、流级别的水印设置<br>|
|**deleteLiveDomain**|删除直播域名<br>- 请慎重操作（建议在进行域名删除前到域名解析服务商处恢复域名A记录），以免导致删除操作后此域名不可访问。<br>  deleteLiveDomain调用成功后将删除本条直播域名的全部相关记录，对于仅需要暂停使用该直播域名，推荐stopLiveDomain接口<br>|
|**deleteLiveRecordFiles**|删除录制文件<br>|
|**deleteLiveSnapshots**|删除截图<br>|
|**deleteLiveStreamAppRecord**|删除应用级别录制模板配置<br>- 删除应用级别的录制模板配置,重新推流后生效<br>|
|**deleteLiveStreamAppSnapshot**|删除APP截图配置|
|**deleteLiveStreamAppTranscode**|删除应用级别转码模板配置<br>- 删除应用级别的转码模板配置,重新推流后生效<br>|
|**deleteLiveStreamAppWatermark**|删除应用级别水印模板配置<br>- 删除应用级别的水印模板配置,重新推流后生效<br>|
|**deleteLiveStreamDomainRecord**|删除域名级别录制模板配置<br>- 删除域名级别录制模板配置,重新推流后生效<br>|
|**deleteLiveStreamDomainSnapshot**|删除域名截图配置<br>- 删除域名级别的截图模板配置,重新推流后生效<br>|
|**deleteLiveStreamDomainTranscode**|删除域名级别转码模板配置<br>- 删除域名级别转码模板配置,重新推流后生效<br>|
|**deleteLiveStreamDomainWatermark**|删除域名级别水印模板配置<br>- 删除域名级别水印模板配置,重新推流后生效<br>|
|**deleteLiveStreamNotifyConfig**|删除直播流状态回调地址|
|**deleteLiveStreamRecord**|删除流级别录制模板配置<br>- 删除流级别录制模板配置,重新推流后生效<br>|
|**deleteLiveStreamRecordNotifyConfig**|删除录制回调配置<br>|
|**deleteLiveStreamSnapshot**|删除流级别截图模板配置<br>- 删除流级别截图模板配置,重新推流后生效<br>|
|**deleteLiveStreamSnapshotNotifyConfig**|删除截图回调配置<br>|
|**deleteLiveStreamTranscode**|删除流级别转码模板配置<br>- 删除流级别转码模板配置,重新推流后生效<br>|
|**deleteLiveStreamWatermark**|删除流级别水印模板配置<br>- 删除流级别水印模板配置,重新推流后生效<br>|
|**describeCustomLiveStreamRecordConfig**|查询直播直播录制配置<br>- 录制模板配置按照 域名,应用,流 3级配置添加,以最小的粒度配置生效<br>- 域名、应用、流 依次粒度递减 即: 域名>应用>流<br>- 该查询旨在查询域名、应用、流最终生效的录制模板配置,并非各级的模板绑定情况<br>|
|**describeCustomLiveStreamRecordTemplates**|查询用户自定义直播录制模板列表<br>|
|**describeCustomLiveStreamSnapshotConfig**|查询直播截图配置<br>- 截图模板配置按照 域名,应用,流 3级配置添加,以最小的粒度配置生效<br>- 域名、应用、流 依次粒度递减 即: 域名>应用>流<br>- 该查询旨在查询域名、应用、流最终生效的截图模板配置,并非各级的模板绑定情况<br>|
|**describeCustomLiveStreamSnapshotTemplates**|查询直播截图模板列表|
|**describeCustomLiveStreamTranscodeTemplate**|查询用户自定义转码模板详情<br>- 查询用户自定义转码模板详情<br>- 系统标准转码模板<br>      ld (h.264/640*360/15f)<br>      sd (h.264/960*540/24f)<br>      hd (h.264/1280*720/25f)<br>      shd (h.264/1920*1080/30f)<br>      ld-265 (h.265/640*360/15f)<br>      sd-265 (h.265/960*540/24f)<br>      hd-265 (h.265/1280*720/25f)<br>      shd-265 (h.265/1920*1080/30f)<br>|
|**describeCustomLiveStreamTranscodeTemplates**|查询用户自定义转码模板列表<br>|
|**describeCustomLiveStreamWatermarkConfig**|查询直播水印配置<br>- 水印模板配置按照 域名,应用,流 3级配置添加,以最小的粒度配置生效<br>- 域名、应用、流 依次粒度递减 即: 域名>应用>流<br>- 该查询旨在查询域名、应用、流最终生效的水印模板配置,并非各级的模板绑定情况<br>|
|**describeCustomLiveStreamWatermarkTemplates**|查询用户定义水印模板列表<br>|
|**describeDomainOnlineStream**|查询在线流列表|
|**describeDomainsLog**|日志下载|
|**describeLiveApp**|查询域名下的APP列表|
|**describeLiveDomainDetail**|查询指定域名相关信息|
|**describeLiveDomainRecordConfig**|查询域名下的录制模板配置<br>|
|**describeLiveDomainSnapshotConfig**|查询域名下的截图模板配置<br>|
|**describeLiveDomainTranscodeConfig**|查询域名下的转码模板配置<br>|
|**describeLiveDomainWatermarkConfig**|查询域名下的水印模板配置<br>|
|**describeLiveDomains**|查询域名列表|
|**describeLiveFileStorageData**|查询存储空间数据|
|**describeLivePlayAuthKey**|查询播放鉴权KEY|
|**describeLivePornData**|查询直播鉴黄张数数据|
|**describeLivePublishStreamNum**|查询直播推流数|
|**describeLiveRecordData**|查询直播录制时长数据|
|**describeLiveRecordFileUrl**|获取录制文件地址<br>|
|**describeLiveRecordFiles**|查询录制文件列表<br>|
|**describeLiveRestartConfigs**|查询回看配置|
|**describeLiveServiceStatus**|查询服务开通状态|
|**describeLiveSnapshotData**|查询直播截图张数数据|
|**describeLiveSnapshotUrl**|获取截图地址<br>|
|**describeLiveSnapshots**|查询截图列表<br>|
|**describeLiveStatisticGroupByArea**|查询地域分组统计数据|
|**describeLiveStatisticGroupByAreaIsp**|查询地域/运营商分组统计数据|
|**describeLiveStatisticGroupByStream**|查询流分组统计数据|
|**describeLiveStreamBandwidthData**|查询带宽数据<br>- 查询某个时间段内的带宽数据（平均带宽）<br>- 查询1分钟粒度的数据时，时间跨度不超过7天，其他粒度时时间跨度不超过30天<br>|
|**describeLiveStreamHistoryUserNum**|查询直播流历史在线人数|
|**describeLiveStreamInfo**|查询直播实时流信息<br>|
|**describeLiveStreamList**|查询直播流信息|
|**describeLiveStreamNotifyConfig**|查询直播流状态回调地址|
|**describeLiveStreamOnlineList**|查询直播中的流的信息|
|**describeLiveStreamPlayerRankingData**|查询直播流播放人数排行|
|**describeLiveStreamPublishBandwidthData**|查询推流带宽<br>- 查询某个时间段内的推流上行带宽数据<br>- 查询1分钟粒度的数据时，时间跨度不超过7天，其他粒度时时间跨度不超过30天<br>|
|**describeLiveStreamPublishList**|查看推流历史记录|
|**describeLiveStreamPublishTrafficData**|查询推流上行流量数据<br>- 查询某个时间段内的流量数据。<br>- 查询1分钟粒度的数据时，时间跨度不超过7天，其他粒度时时间跨度不超过30天<br>|
|**describeLiveStreamRecordNotifyConfig**|查询录制回调配置<br>|
|**describeLiveStreamSnapshotNotifyConfig**|查询截图回调配置<br>|
|**describeLiveStreamTrafficData**|查询流量数据<br>- 查询某个时间段内的流量数据。<br>- 查询1分钟粒度的数据时，时间跨度不超过7天，其他粒度时时间跨度不超过30天<br>|
|**describeLiveStreamTranscodeConfig**|查询转码模板配置<br>- 转码模板配置按照 域名,应用,流 3级配置添加,以最小的粒度配置生效原则<br>- 域名、应用、流 依次粒度递减 即: 域名>应用>流<br>- 该查询旨在查询域名、应用、流最终生效的转码模板配置,并非各级的模板绑定情况<br>|
|**describeLiveTimeshiftConfigs**|查询时移配置|
|**describeLiveTranscodeStreamBandwidth**|查询转码流播放带宽<br>- 查询1分钟粒度的数据时，时间跨度不超过7天，其他粒度时时间跨度不超过30天<br>|
|**describeLiveTranscodeStreamList**|查询转码流信息|
|**describeLiveTranscodeStreamNum**|查询转码流数量|
|**describeLiveTranscodeStreamPlayerUserNum**|查询转码流观看人数|
|**describeLiveTranscodingDurationData**|查询转码时长数据|
|**describePlayAuthConfig**|查询播放鉴权配置|
|**describePublishAuthConfig**|查询推流鉴权配置|
|**describePublishStreamInfoData**|查询推流监控数据|
|**describeRecordBinding**|查询录制模板绑定<br>|
|**describeSnapshotBinding**|查询截图模板绑定<br>|
|**describeSystemLiveStreamTranscodeTemplates**|查询系统默认转码模板列表<br>|
|**describeTranscodeBinding**|查询转码模板绑定<br>|
|**describeUrlRanking**|查询URL播放排行|
|**describeWatermarkBinding**|查询水印模板绑定<br>|
|**exportLiveSnapshotData**|导出直播截图张数数据|
|**exportLiveStreamBandwidthData**|导出带宽数据<br>- 查询某个时间段内的带宽数据（平均带宽）<br>- 查询1分钟粒度的数据时，时间跨度不超过7天，其他粒度时时间跨度不超过30天<br>|
|**exportLiveStreamTrafficData**|导出流量数据<br>- 查询某个时间段内的流量数据。<br>- 查询1分钟粒度的数据时，时间跨度不超过7天，其他粒度时时间跨度不超过30天<br>|
|**exportLiveTranscodingDurationData**|导出转码时长数据|
|**exportPublishStreamInfoData**|导出推流监控数据|
|**forbidLiveStream**|禁止直播流推送|
|**interruptLiveStream**|中断直播流推送<br>- 中断操作1秒后可以继续推流<br>|
|**openLiveRestart**|开启回看<br>1、直播回看文件格式仅支持m3u8。<br>2、回看时长用户可以配置，最大支持7天，即用户请求回看内容，最多可以请求最近7天的直播回看内容。<br>3、域名格式：http://{restartDomain}/{appName}/{streamName}/index.m3u8?starttime=1527756680&endtime=1527760280 (unix时间戳)<br>4、starttime-endtime最长可支持24小时，可跨天<br>|
|**openLiveService**|开通直播服务|
|**openLiveTimeshift**|开启时移<br>直播支持最大4小时的HLS时移，使用方式为在播放域名后增加时移参数来实现，参数类型支持指定开始时间和时间偏移量2种方式进行时移。 开启直播时移后，重新推流生效，使用播放域名带相应参数访问即可播放<br>- 域名格式：<br>1、http://{playDomain}/{appName}/{streamName}/index.m3u8?timeshift=400（秒，指从当前时间往前时移的偏移量）<br>2、http://{playDomain}/{appName}/{streamName}/index.m3u8?starttime=1529223702 (unix时间戳)<br>|
|**resumeLiveStream**|恢复直播流推送|
|**setLivePlayAuthKey**|设置播放鉴权KEY|
|**setLiveStreamNotifyConfig**|设置直播流状态回调地址|
|**setLiveStreamRecordNotifyConfig**|设置直播录制回调通知<br>|
|**setLiveStreamSnapshotNotifyConfig**|设置直播截图回调通知地址<br>|
|**setPlayAuthConfig**|设置播放鉴权KEY|
|**setPlayAuthIPConfig**|设置播放鉴权IP黑名单|
|**setPlayAuthRefererConfig**|设置播放鉴权referer|
|**setPublishAuthConfig**|设置推流鉴权KEY|
|**setPublishAuthIPConfig**|设置推流鉴权IP黑名单|
|**startLiveApp**|启用应用<br>- 启用 停用 状态的应用<br>|
|**startLiveDomain**|启动域名<br>- 启用状态为 停用 的直播域名对(推流域名,播放域名)将DomainStatus变更为online<br>|
|**stopLiveApp**|停用 运行中 状态的应用<br>- 停用应用之后,不能再用此应用名推流<br>|
|**stopLiveDomain**|停用域名<br>- 停用直播域名对(推流域名,播放域名),将DomainStatus变更为offline<br>- 停用该直播域名对后,直播域名信息仍保留,但用户将不能再用该推流域名推流或播放域名播放<br>|
|**updateCustomLiveStreamRecordTemplate**|修改用户自定义直播录制模板<br>|
|**updateCustomLiveStreamSnapshotTemplate**|修改直播截图模板|
|**updateCustomLiveStreamTranscodeTemplate**|修改自定义转码模板<br>|
|**updateCustomLiveStreamWatermarkTemplate**|修改用户自定义水印模板<br>|

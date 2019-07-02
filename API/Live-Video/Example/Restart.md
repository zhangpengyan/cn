# 描述

直播支持最长7天的HLS内容回看，直播回看不能与直播播放使用同一个域名，因此使用直播回看功能，需要新建回看域名。完成域名新建后，可开启、关闭直播回看功能。新增直播回看域名接口见“addLiveRestartDomain”。开启直播回看后，使用回看域名带相应参数访问即可生效。

回看域名格式：DomainName/{AppName}/{StreamName}.m3u8?startTime=2019-03-12T10:10:00&endTime=2019-03-13T10:10:00；startTime-endTime最长可支持24小时，可跨天。

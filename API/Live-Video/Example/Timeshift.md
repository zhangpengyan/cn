# 描述

直播支持最大4小时的HLS时移，使用方式为在播放域名后增加时移参数来实现，
参数类型支持指定开始时间和时间偏移量2种方式进行时移。开启直播时移后，使用播放域名带相应参数访问即可生效。

域名格式：
1、http://{domainName}/live/{streamName}/index.m3u8?timeshift=400（秒，指从当前时间往前时移的偏移量）
2、http://{domainName}/live/{streamName}/index.m3u8?starttime=1529223702 (unix时间戳)


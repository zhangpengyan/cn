# 描述
 
直播转码的配置分为两个步骤：1.创建转码模板；2.添加转码配置。
系统为您预设了标准质量模板，如果不能满足您的转码需求，请先新建转码模板后再添加域名转码配置，
接口名：addCustomLiveStreamTranscodeTemplate

访问转码流的地址规则为：

转码地址规则：直播域名 + AppName + StreamName_转码模板后缀
转码地址示例：
        rtmp://域名/{AppName}/{StreamName}_hd
        http://域名/{AppName}/{StreamName}_hd.flv
        http://域名/{AppName}/{StreamName}_hd.m3u8


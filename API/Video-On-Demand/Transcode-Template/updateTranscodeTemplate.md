# updateTranscodeTemplate


## 描述
修改转码模板

## 请求方式
PUT

## 请求地址
https://vod.jdcloud-api.com/v1/transcodeTemplates/{templateId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**templateId**|Long|True| |模板ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| |模板名称。长度不超过128个字符。UTF-8编码。<br>|
|**video**|Video|False| |视频参数配置|
|**audio**|Audio|False| |音频参数配置|
|**encapsulation**|Encapsulation|False| |封装配置|
|**definition**|String|False| |清晰度规格标记。取值范围：<br>  SD - 标清<br>  HD - 高清<br>  FHD - 超清<br>  2K<br>  4K<br>|
|**templateType**|String|False| |模板类型。取值范围：<br>  jdchd - 京享超清<br>  jdchs - 极速转码<br>|

### Encapsulation
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**format**|String|False| |封装格式|
### Audio
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**codec**|String|False| |音频编码。取值范围：aac|
|**bitrate**|Integer|False| |音频目标码率。取值范围：[8，1000]，单位为 Kbps|
|**sampleRate**|Integer|False| |音频采样率。取值范围：8000、11025、12000、16000、22050、24000、32000、44100、48000、64000、88200、96000|
|**channels**|Integer|False| |音频声道数：1、2|
|**comfortable**|Boolean|False| |是否开启舒适音频：true、false|
### Video
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**codec**|String|False| |视频编码。取值范围：h265、h264|
|**bitrate**|Integer|False| |视频码率。取值范围 [128、10000]，单位为 Kbps|
|**fps**|Integer|False| |视频帧率。取值范围为 [1、60]，单位为 fps|
|**width**|Integer|False| |视频输出宽度。取值范围 [128，4096] 整数。<br>当值为空时，若 height 也为空，则 width 和 height 与原视频保持一致；若 height 不为空，则 width 按照原视频的分辨率等比缩放。<br>|
|**height**|Integer|False| |视频输出高度。取值范围 [128，4096] 整数。<br>当值为空时，若 width 也为空，则 width 和 height 与原视频保持一致；若 width 不为空，则 height 按照原视频的分辨率等比缩放。<br>|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|修改转码模板信息结果|
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**id**|Long|模板ID|
|**name**|String|模板名称。长度不超过128个字符。UTF-8编码。<br>|
|**video**|Video|视频参数配置|
|**audio**|Audio|音频参数配置|
|**encapsulation**|Encapsulation|封装配置|
|**definition**|String|清晰度规格标记。取值范围：<br>  SD - 标清<br>  HD - 高清<br>  FHD - 超清<br>  2K<br>  4K<br>|
|**source**|String|模板来源。取值范围：<br>  system - 系统预置<br>  custom - 用户自建<br>|
|**templateType**|String|模板类型。取值范围：<br>  jdchd - 京享超清<br>  jdchs - 极速转码<br>|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|
### Encapsulation
|名称|类型|描述|
|---|---|---|
|**format**|String|封装格式|
### Audio
|名称|类型|描述|
|---|---|---|
|**codec**|String|音频编码。取值范围：aac|
|**bitrate**|Integer|音频目标码率。取值范围：[8，1000]，单位为 Kbps|
|**sampleRate**|Integer|音频采样率。取值范围：8000、11025、12000、16000、22050、24000、32000、44100、48000、64000、88200、96000|
|**channels**|Integer|音频声道数：1、2|
|**comfortable**|Boolean|是否开启舒适音频：true、false|
### Video
|名称|类型|描述|
|---|---|---|
|**codec**|String|视频编码。取值范围：h265、h264|
|**bitrate**|Integer|视频码率。取值范围 [128、10000]，单位为 Kbps|
|**fps**|Integer|视频帧率。取值范围为 [1、60]，单位为 fps|
|**width**|Integer|视频输出宽度。取值范围 [128，4096] 整数。<br>当值为空时，若 height 也为空，则 width 和 height 与原视频保持一致；若 height 不为空，则 width 按照原视频的分辨率等比缩放。<br>|
|**height**|Integer|视频输出高度。取值范围 [128，4096] 整数。<br>当值为空时，若 width 也为空，则 width 和 height 与原视频保持一致；若 width 不为空，则 height 按照原视频的分辨率等比缩放。<br>|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|

## 请求示例
PUT
```
https://vod.jdcloud-api.com/v1/transcodeTemplates/1

```
```
{
    "audio": {
        "bitrate": 200, 
        "channels": 2, 
        "codec": "ACC", 
        "comfortable": true, 
        "sampleRate": 44100
    }, 
    "definition": "HD", 
    "encapsulation": {
        "format": "FLV"
    }, 
    "name": "我的转码模板", 
    "templateType": "jdchd", 
    "video": {
        "bitrate": 1080, 
        "codec": "h264", 
        "fps": 20, 
        "height": 240, 
        "width": 320
    }
}
```

## 返回示例
```
{
    "requestId": "bgvmivir54gddpgi764se9f4kfr7ge41", 
    "result": {
        "audio": {
            "bitrate": 200, 
            "channels": 2, 
            "codec": "ACC", 
            "comfortable": true, 
            "sampleRate": 44100
        }, 
        "createTime": "2019-04-16T15:51:32Z", 
        "definition": "HD", 
        "encapsulation": {
            "format": "FLV"
        }, 
        "id": 1, 
        "name": "我的转码模板", 
        "source": "custom", 
        "templateType": "jdchd", 
        "updateTime": "2019-04-16T15:51:32Z", 
        "video": {
            "bitrate": 1080, 
            "codec": "h264", 
            "fps": 20, 
            "height": 240, 
            "width": 320
        }
    }
}
```

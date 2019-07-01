# 直播回调

视频直播服务支持直播回调功能，包含推流回调、录制回调和截图回调，推流回调可以将用户推流和断流的实时状态返回给客户，尤其在主播使用开源推流工具（如OBS），客户可通过该功能了解主播状态；录制回调在录制文件生成时会通知客户，客户可实时获取录制文件；截图回调在截图完成后会通知客户，客户可以实时获取图片文件。

使用该功能需要您添加一个接收回调的URL地址，并保证地址可用，该操作可在控制台中完成。

## 1.开启回调

登录直播控制台，进入“域名管理”页面，选择要查看播放地址的一组域名，点击右侧的“管理”进入“回调配置”页面

![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/12%E6%96%B0%E5%BB%BA%E8%BD%AC%E7%A0%81%E9%85%8D%E7%BD%AE.png)

在回调配置页面，按需滑动滑钮打开推流、录制或截图回调

![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/17%E5%9B%9E%E8%B0%83%E9%85%8D%E7%BD%AE.png)

点击推流或录制回调后的“编辑”按钮填写接收信息的回调地址，点击“确定”完成设置

![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/18%E5%9B%9E%E8%B0%83%E9%85%8D%E7%BD%AE.png)

## 2.关闭回调

登录直播控制台，进入“域名管理”页面，选择要查看播放地址的一组域名，点击右侧的“管理”进入“基本信息”页面

![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/12%E6%96%B0%E5%BB%BA%E8%BD%AC%E7%A0%81%E9%85%8D%E7%BD%AE.png)

在回调配置页面，滑动滑钮关闭推流或者录制、截图回调

![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/19%E5%9B%9E%E8%B0%83%E9%85%8D%E7%BD%AE.png)



## 通知回调信息样例

<table>
<tr>
    <td>类型<br/>
    <td>消息体</td>
    <td>消息字段说明</td>
</tr>
<tr>
    <td>推流开始回调<br/>
    <td> {<br>  
        "version": "v1.1",<br>  
        "publishDomain": "push.yourdomain.com",<br>   
        "appName": "live",<br> "streamName": "350802", <br>"event": "publish_started",<br> "status": "success", <br>"clientIp": "12.11.112.34", <br>"eventTime": 12312312312, <br>"pushParams": { <br>"a": "aaa",<br> "b": "bbb",<br> "c": "ccc"<br> }<br> }<br> 
</td>
    <td>version:消息体版本号<br>  
publishDomain:推流域名<br>  
appName:应用名称<br>  
streamName:流名称<br>  
event:事件[publish_started,publish_ ]done, record_done<br>  
status:状态[success]<br>  
eventTime:触发时间,毫秒数<br>  
pushParams:推流参数<br></td>
</tr>
<tr>
    <td>推流结束回调<br/>
    <td> 
	{<br/>
	"version": "v1.1",<br/> 
	"publishDomain": "push.yourdomain.com",<br/>
	"appName": "live",<br/>
	"streamName": "350802",<br/>
	"event": "publish_done",<br/>
	"status": "success",<br/>
	"eventTime": 12312312312<br/>
	}<br/>
</td>
    <td>version:消息体版本号<br>  
publishDomain:推流域名<br>  
appName:应用名称<br>  
streamName:流名称<br>  
event:事件[publish_started,publish_ ]done, record_done<br>  
status:状态[success]<br>  
</td>
</tr>
<tr>
    <td>自动录制回调<br/>
    <td> {<br/>
	"version": "v1.1",<br/>
	"publishDomain": "push.yourdomain.com",<br/>
	"appName": "live",<br/>
	"streamName": "350802",<br/>
	"format": "flv",<br/>
	"duration": "18439.0",<br/>
	"fileSize": "6007851133",<br/>
	"beginTime": 1553741853968,<br/>
	"endTime": 1553741935867,<br/>
	"event": "record_done",<br/>
	"downloadUrl": "http://s3.cn-north-1.jcloudcs.com/jd-video-formal/record/20190319/57/live/<br>
	    62caee8d6c595e9441be/20190319175419_20190319175422.flv "<br/>
	“status": "success"<br/>
	}<br/>
</td>
    <td>version:消息体版本号<br>  
publishDomain:推流域名<br>  
appName:应用名称<br>  
streamName:流名称<br>  
event:事件[publish_started,publish_ ]done, record_done<br>  
status:状态[success]<br>
format:录制格式<br>
startTime:录制开始时间<br>
stopTime:录制结束时间<br>
downloadUrl:可下载地址<br>  
</td>
</tr>
<tr>
    <td>打点录制回调<br/>
    <td>{<br>
	"version": "v1.1",<br>
	"publishDomain": "push.yourdomain.com",<br>
	"appName": "live",<br>
	"streamName": "350802",<br>
	"duration": "18439.0",<br>
	"event": "record_done",<br>
	"fileSize": "6007851133",<br>
	"format": "flv",<br>
	"status": "success",<br>
	"group": [<br>
	{<br>
	"beginTime": "1553228747000",<br>
	"endTime": "1553228747100"<br>
	},<br>
	{<br>
	"beginTime": "1553228747200",<br>
	"endTime": "1553228747300"<br>
	}<br>
	],<br>
	"downloadUrl": "http://s3.cn-north-1.jcloudcs.com/ngwcloud1oss/record/20190322/jdpush.jd.com<br>
	    /live/347031/20190322122547_20190322173152.mp4”,<br>
	"taskExternalId": "163594946396839936"<br>
	}<br>
</td>
    <td>version:消息体版本号<br>  
publishDomain:推流域名<br>  
appName:应用名称<br>  
streamName:流名称<br>  
event:事件[publish_started,publish_ ]done, record_done<br>  
status:状态[success]<br>
duration:录制文件时长(毫秒)<br>
fileSize:文件大小(kb)<br>
group:录制时间段<br>
downloadUrl:可下载地址<br>
vodTaskId: 录制外部ID<br>  
</td>
</tr>
<tr>
    <td>截图回调<br/>
    <td>{<br>
	"version": "v1.1",<br>
	"publishDomain": "push.yourdomain.com",<br>
	"appName": "jw",<br>
	"streamName": "210235T85E3188001452",<br>
	"snapshotTime": 1553826618026,<br>
	"downloadUrl": "http://s3.cn-north-1.jcloudcs.com/jd-video-formal/<br>
	    snapshot/20190328/43/jw/210235T85E3188001452.jpg",<br>
	"status": "success"<br>
	}<br>
</td>
    <td>version:消息体版本号<br>  
publishDomain:推流域名<br>  
appName:应用名称<br>  
streamName:流名称<br>  
snapshotTime:截图文件生成时间<br>  
downloadUrl:可下载地址<br>
status:状态[success]<br>
</td>
</tr>
</table>

# 直播录制


视频直播服务支持录制功能，可以把直播流录制成文件，存放在对象存储中。要使用此功能需要开通京东云的对象存储服务，并在华北区域（目前视频直播只支持华北）创建对应的Bucket空间，当直播结束后会自动生成文件，客户可以根据存储路径查看和下载视频文件。  
```
录制文件存储路径：  
record/{Date}/{SourceId}/{AppName}/{StreamName}/{StartTime}_{EndTime}。
{Date} 为直播流录制日期

{SourceID} Source ID是一组域名关联的唯一任务ID，对于同一组推流和播放域名来说，SourceId是随机生成的、唯一的，不会变化。
一组域名的ID号在控制台“域名管理”-“基本信息”可查。

{AppName} 为直播应用名称

{StreamName} 为直播流名称

{StartTime} 为录制开始时间

{EndTime} 为录制结束时间
```  
直播录制的配置分为两个步骤：1.创建录制模板；2.添加录制配置。   
请先新建录制模板后再添加域名录制配置，录制配置完成后，对于新推上来的直播流生效。录制配置可绑定域名、APP、流三个级别，配置按最小粒度生效，举例：对于域名rtmp://abc.com/live/123，可在APP“live”级绑定录制模板A，在流“123”级绑定录制模板B，那么A模板对于APP“live”下除“123”外的其他所有流都生效，B模板对于流“123”生效。

## 步骤1.新建录制模板

登录直播控制台，进入“模板管理”-“录制模板管理”页面，点击“添加录制模板”  
按照您的实际录制需求，填写相应的录制文件参数，点击“立即创建”即可成功创建录制模板。创建成功的录制模板会展示在录制模板列表当中。    
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/29%E5%BD%95%E5%88%B6%E7%AE%A1%E7%90%86.png) 
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/30%E5%BD%95%E5%88%B6%E7%AE%A1%E7%90%86.png) 
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/31%E5%BD%95%E5%88%B6%E7%AE%A1%E7%90%86.png) 
## 步骤2.新建录制配置  

在控制台左侧菜单栏点击“域名管理”，找到需要做录制配置的直播域名组，点击“管理”，进入“录制配置”页面。  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/12%E6%96%B0%E5%BB%BA%E8%BD%AC%E7%A0%81%E9%85%8D%E7%BD%AE.png)
在录制配置页面，点击“新建录制配置”，进入录制配置页面：  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/32%E5%BD%95%E5%88%B6%E7%AE%A1%E7%90%86.png) 
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/33%E5%BD%95%E5%88%B6%E7%AE%A1%E7%90%86.png)
选择“全部AppName”则配置对于所有APP也就是对于整个域名生效，如果自定义指定AppName，则需要填入需要配置录制的APP名称，并可以继续选择生效范围为“全部StreamName”或自定义指定StreamName，如果自定义指定StreamName，则需要填入需要配置录制的StreamName名称。然后选择相应的录制模板。点击“立即创建”，即可完成录制配置。录制配置创建完成后，在录制配置列表即可看到刚才创建的录制配置规则。此条配置对于新推的直播流生效。    

在录制配置列表中，AppName列的ALL表示刚刚创建的录制配置对于所有AppName生效即对于域名级别生效，StreamName列的ALL表示刚刚创建的录制配置对于所有StreamName生效，即对于APP级别生效。  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/34%E5%BD%95%E5%88%B6%E7%AE%A1%E7%90%86.png)   

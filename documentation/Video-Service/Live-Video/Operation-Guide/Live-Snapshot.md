# 直播截图

视频直播服务支持直播截图，可以对视频流按照设置的间隔时间进行图片截取，存放到对象存储中，图片格式为jpg、png，要使用此功能需要开通京东云的对象存储服务，并在华北区域（目前视频直播只支持华北）创建对应的Bucket空间，当直播开始后，截图动作会自动开始，图片生成后，客户可以根据存储路径查看和下载图片文件文件。
```
截图文件存储路径：  
覆盖模式：snapshot/{Date}/{SourceID}/{AppName}/{StreamName}.{Format}
顺序模式：snapshot/{Date}/{SourceID}/{AppName}/{StreamName}/{SnapshotTime}.{Format}
{Date} 为截图日期
{SourceID} Source ID是一组域名关联的唯一任务ID，对于同一组推流和播放域名来说，SourceId是随机生成的、唯一的，不会变化。
一组域名的ID号在控制台“域名管理”-“基本信息”可查。
{AppName} 为直播应用名称
{StreamName} 为直播流名称
{SnapshotTime}为截图生成的时间
{Format} 为图片格式
```  

直播截图的配置分为两个步骤：1.创建截图模板；2.添加截图配置。   
请先新建截图模板后再添加域名截图配置，截图配置完成后，对于新推上来的直播流生效。截图配置可绑定域名、APP、流三个级别，配置按最小粒度生效，举例：对于域名rtmp://abc.com/live/123，可在APP“live”级绑定截图模板A，在流“123”级绑定截图模板B，那么A模板对于APP“live”下除“123”外的其他所有流都生效，B模板对于流“123”生效。

## 步骤1.新建截图模板

登录直播控制台，进入“模板管理”-“截图模板管理”页面，点击“添加截图模板”  
按照您的实际截图需求，填写相应的截图文件参数，点击“立即创建”即可成功创建截图模板。创建成功的截图模板会展示在截图模板列表当中。    
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/35%E6%88%AA%E5%9B%BE%E7%AE%A1%E7%90%86.png) 
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/36%E6%88%AA%E5%9B%BE%E7%AE%A1%E7%90%86.png) 
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/37%E6%88%AA%E5%9B%BE%E7%AE%A1%E7%90%86.png) 

## 步骤2.新建截图配置  

在控制台左侧菜单栏点击“域名管理”，找到需要做截图配置的直播域名组，点击“管理”，进入“截图配置”页面。  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/12%E6%96%B0%E5%BB%BA%E8%BD%AC%E7%A0%81%E9%85%8D%E7%BD%AE.png)
在截图配置页面，点击“新建截图配置”，进入截图配置页面：  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/38%E6%88%AA%E5%9B%BE%E7%AE%A1%E7%90%86.png) 
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/39%E6%88%AA%E5%9B%BE%E7%AE%A1%E7%90%86.png)
选择“全部AppName”则配置对于所有APP也就是对于整个域名生效，如果自定义指定AppName，则需要填入需要配置截图的APP名称，并可以继续选择生效范围为“全部StreamName”或自定义指定StreamName，如果自定义指定StreamName，则需要填入需要配置截图的StreamName名称。然后选择相应的截图模板。点击“立即创建”，即可完成截图配置。截图配置创建完成后，在截图配置列表即可看到刚才创建的截图配置规则。此条配置对于新推的直播流生效。    

在截图配置列表中，AppName列的ALL表示刚刚创建的截图配置对于所有AppName生效即对于域名级别生效，StreamName列的ALL表示刚刚创建的截图配置对于所有StreamName生效，即对于APP级别生效。  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/40%E6%88%AA%E5%9B%BE%E7%AE%A1%E7%90%86.png)   



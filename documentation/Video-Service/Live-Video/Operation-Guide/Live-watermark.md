# 直播水印  
视频直播服务支持为直播流添加水印，可以把需要添加的水印图片上传到水印模板，然后将需要配置水印的转码流进行配置即可实现水印的添加。  
```
提示：水印配置的使用以开启转码配置为前置条件，已配置转码的直播流重新推流后水印配置即可生效，  
     对于无转码的直播流，水印配置不会生效。  
```  

直播水印的配置分为两个步骤：1.创建水印模板；2.添加水印配置。   
请先新建水印模板后再添加域名水印配置，水印配置完成后，对于新推上来的直播流生效。水印配置可绑定域名、APP、流三个级别，配置按最小粒度生效，举例：对于域名rtmp://abc.com/live/123，可在APP“live”级绑定水印模板A，在流“123”级绑定水印模板B，那么A模板对于APP“live”下除“123”外的其他所有流都生效，B模板对于流“123”生效。

## 步骤1.新建水印模板

登录直播控制台，进入“模板管理”-“水印模板管理”页面，点击“添加水印模板”  
按照您的实际水印需求，填写相应的水印文件参数，点击“立即创建”即可成功创建水印模板。创建成功的水印模板会展示在水印模板列表当中。    
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/42%E6%B7%BB%E5%8A%A0%E6%B0%B4%E5%8D%B0%E6%A8%A1%E6%9D%BF.png) 
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/43%E6%B7%BB%E5%8A%A0%E6%B0%B4%E5%8D%B0%E6%A8%A1%E6%9D%BF.png) 
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/44%E6%B7%BB%E5%8A%A0%E6%B0%B4%E5%8D%B0%E6%A8%A1%E6%9D%BF.png) 
## 步骤2.新建水印配置  

在控制台左侧菜单栏点击“域名管理”，找到需要做水印配置的直播域名组，点击“管理”，进入“水印配置”页面。  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/12%E6%96%B0%E5%BB%BA%E8%BD%AC%E7%A0%81%E9%85%8D%E7%BD%AE.png)
在水印配置页面，点击“新建水印配置”，进入水印配置页面：  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/45%E6%96%B0%E5%BB%BA%E6%B0%B4%E5%8D%B0%E9%85%8D%E7%BD%AE.png) 
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/46%E6%96%B0%E5%BB%BA%E6%B0%B4%E5%8D%B0%E9%85%8D%E7%BD%AE.png)
选择“全部AppName”则配置对于所有APP也就是对于整个域名生效，如果自定义指定AppName，则需要填入需要配置水印的APP名称，并可以继续选择生效范围为“全部StreamName”或自定义指定StreamName，如果自定义指定StreamName，则需要填入需要配置水印的StreamName名称。然后选择相应的水印模板。点击“立即创建”，即可完成水印配置。水印配置创建完成后，在水印配置列表即可看到刚才创建的水印配置规则。此条配置对于新推的直播流生效。    

在水印配置列表中，AppName列的ALL表示刚刚创建的水印配置对于所有AppName生效即对于域名级别生效，StreamName列的ALL表示刚刚创建的水印配置对于所有StreamName生效，即对于APP级别生效。  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/47%E6%96%B0%E5%BB%BA%E6%B0%B4%E5%8D%B0%E9%85%8D%E7%BD%AE.png)

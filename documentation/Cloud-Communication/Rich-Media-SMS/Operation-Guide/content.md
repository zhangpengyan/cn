## 创建富媒体短信<br> 

登录富媒体短信服务后, 首先您要先创建应用. <br><br>
![创建应用](../../../../image/Cloud-Communication/Rich-Media-SMS/rms-003.png)<br><br>
创建应用后, 在短信签名TAB页, 点选 ‘短信内容’, 如下图<br><br>
![创建应用](../../../../image/Cloud-Communication/Rich-Media-SMS/rms-008.png)<br><br>
点击 “创建短信内容” 后进入到富媒体短信内容创建页面.<br><br>
![短信内容创建](../../../../image/Cloud-Communication/Rich-Media-SMS/rms-009.png)<br><br>
短信主题: <br>
手机用户收到富媒体短信时显示的主题内容. 其中主题中必须已【签名】开始,如:<br>
【京东云】为您定制短信服务<br><br>
短信描述: <br>
短信描述不会出现在手机用户短信, 仅供企业备忘使用. <br><br>
签名资质:<br>
根据提示内容填写并上传资料证明<br>
![签名资质](../../../../image/Cloud-Communication/Rich-Media-SMS/rms-010.png)<br><br>
短信内容上传:<br>
![短信内容上传](../../../../image/Cloud-Communication/Rich-Media-SMS/rms-011.png)<br><br>
您可以上传图片, 音频, 视频, 点击上传后, 附件将进入到右侧编辑区域, 可以上传多次附件, 但上传附件的总量不能超过 1.9MB. <br><br>
附件要求如下:<br>
图片要求：<br>
格式：JPG、PNG、GIF<br>
分辨率建议：横版640px * 480px，竖版405px * 720px<br><br>
音频要求：<br>
格式：MP3<br>
音频建议：比特率32kbs，时长:60秒<br>
大小：200K+<br><br>
视频要求：<br>
格式：MP4<br>
视频建议：视频+音频总比特率410kbps，时长：33秒，帧大小576*240，帧速率：15<br>
大小：1.67M左右<br><br>
文本内容:<br>
文本内容支持变量, 变量格式为  &#36;{1} &#36;{2}…<br>
如内容含变量,只能通过API或SDK调用方式发送, 如果通过控制台进行发送, 变量内容将无法正常显示.<br><br>
短信内容编辑:<br>
 ![短信内容编辑](../../../../image/Cloud-Communication/Rich-Media-SMS/rms-012.png)<br><br>
上传后的附件都会在短信内容编辑区显示, 您可以通过调节附件上下位置进行排版.<br> 
注: 不通手机机型显示会有所不同:<br>
- iOS预览居左显示，短信标题加粗<br>
- Android预览居左显示，短信标题加粗，每个短信内容之间有数字分隔<br>

短信编辑完成后, 点击保存返回列表页. 提交审批后您可以在短信列表页查看审核状态, 审核通过后的短信, 才能用于发送<br>
![短信内容列表](../../../../image/Cloud-Communication/Rich-Media-SMS/rms-013.png)<br><br>

# SDK-PHP

## 安装

安装AWS SDK-php的方法有很多，我们推荐一种最简单的方法：

a.从地址http://docs.aws.amazon.com/aws-sdk-php/v3/download/aws.zip 下载软件包；

b.解压aws.zip到一个目录，如’C:\mydir\;

c.在使用sdk-php时，您只要添加下面的语句就可以了
```
require 'C:\mydir\aws\aws-autoloader.php';
```
更多安装sdk-php的方法，您可以参考文档：http://docs.aws.amazon.com/aws-sdk-php/v3/guide/getting-started/installation.html

## 创建client

我们仍然通过创建一个client来帮助您快速入手，更多用法请参考：http://docs.aws.amazon.com/aws-sdk-php/v3/guide/getting-started/index.html

```PHP
<?php    
require 'C:\mydir\aws\aws-autoloader.php';    
use Aws\S3\S3Client;    
    
$s3 = new S3Client([    
    'version'=>'latest',    
    'region'=>'cn-north-1',    
    'endpoint' => 'http://s3.cn-north-1.jdcloud-oss.com',    
    'signature_version' => 'v4',    
     'credentials' => [    
       'key'    => 'your accesskey',    
       'secret' => 'your secretkey',    
          ],    
     ]);     
//use s3 client to create bucket、put object....    
?>
```

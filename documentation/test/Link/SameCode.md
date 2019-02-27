# 代码渲染：
### Python:
```Python
# 快排的主函数，传入参数为一个列表，左右两端的下标-=
def QuickSort(list, low, high):
    if high > low:
        # 传入参数，通过Partitions函数，获取k下标值
        k = Partitions(list, low, high)
        # 递归排序列表k下标左侧的列表
        QuickSort(list, low, k - 1)
        # 递归排序列表k下标右侧的列表
        QuickSort(list, k + 1, high)


def Partitions(list, low, high):
    left = low
    right = high
    # 将最左侧的值赋值给参考值k
    k = list[low]
    # 当left下标，小于right下标的情况下，此时判断二者移动是否相交，若未相交，则一直循环
    while left < right:
        # 当left对应的值小于k参考值，就一直向右移动
        while list[left] <= k:
            left += 1
        # 当right对应的值大于k参考值，就一直向左移动
        while list[right] > k:
            right = right - 1
        # 若移动完，二者仍未相遇则交换下标对应的值
        if left < right:
            list[left], list[right] = list[right], list[left]
    # 若移动完，已经相遇，则交换right对应的值和参考值
    list[low] = list[right]
    list[right] = k
    # 返回k值
    return right


list_demo = [6, 1, 2, 7, 9, 3, 4, 5, 10, 8]
# print(list_demo)
QuickSort(list_demo, 0, 9)
print(list_demo)
```

### Java:
```Java
    public static BufferedImage toBufferedImage(Image image) {
        if (image instanceof BufferedImage) {
            return (BufferedImage) image;
        }
        // This code ensures that all the pixels in the image are loaded
        image = new ImageIcon(image).getImage();
        BufferedImage bimage = null;
        GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
        try {
            int transparency = Transparency.OPAQUE;
            GraphicsDevice gs = ge.getDefaultScreenDevice();
            GraphicsConfiguration gc = gs.getDefaultConfiguration();
            bimage = gc.createCompatibleImage(image.getWidth(null), image.getHeight(null), transparency);
        } catch (HeadlessException e) {
            // The system does not have a screen
        }
        if (bimage == null) {
            // Create a buffered image using the default color model
            int type = BufferedImage.TYPE_INT_RGB;
            bimage = new BufferedImage(image.getWidth(null), image.getHeight(null), type);
        }
        // Copy image to buffered image
        Graphics g = bimage.createGraphics();
        // Paint the image onto the buffered image
        g.drawImage(image, 0, 0, null);
        g.dispose();
        return bimage;
    }


    public static byte[] File2byte(String filePath) {
        byte[] buffer = null;
        try {
            File file = new File(filePath);
            FileInputStream fis = new FileInputStream(file);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] b = new byte[1024];
            int n;
            while ((n = fis.read(b)) != -1) {
                bos.write(b, 0, n);
            }
            fis.close();
            bos.close();
            buffer = bos.toByteArray();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return buffer;
    }
```

### JSON：
```Java
{
   "min_position": "int(3,4,5-9)",
   "has_more_items": "bool",
   "items_html": "string('Bus','Car','Bike')",
   "new_latent_count": "int",
   "data": {
      "length": "int(20-30)",
      "text": "string"
   },
   "numericalArray": [
      "repeat[5]",
      "int(20,23-33)"
   ],
   "StringArray": [
      "repeat[4]",
      "string('Carbon','Nitrogen','Oxygen')"
   ],
   "multipleTypesArray": [3,"Hello",5,true],
   "objArray": [
      "repeat[5]",
      {
         "class": "string('middle','upper','lower')",
         "age": "int"
      }
   ]
}
```

### SQL：
```SQL
SELECT   
   soh.OrderDate AS [Date],   
   soh.SalesOrderNumber AS [Order],   
   pps.Name AS Subcat, pp.Name as Product,    
   SUM(sd.OrderQty) AS Qty,  
   SUM(sd.LineTotal) AS LineTotal  
FROM Sales.SalesPerson sp   
   INNER JOIN Sales.SalesOrderHeader AS soh   
      ON sp.BusinessEntityID = soh.SalesPersonID  
   INNER JOIN Sales.SalesOrderDetail AS sd   
      ON sd.SalesOrderID = soh.SalesOrderID  
   INNER JOIN Production.Product AS pp   
      ON sd.ProductID = pp.ProductID  
   INNER JOIN Production.ProductSubcategory AS pps   
      ON pp.ProductSubcategoryID = pps.ProductSubcategoryID  
   INNER JOIN Production.ProductCategory AS ppc   
      ON ppc.ProductCategoryID = pps.ProductCategoryID  
GROUP BY ppc.Name, soh.OrderDate, soh.SalesOrderNumber, pps.Name, pp.Name,   
   soh.SalesPersonID  
HAVING ppc.Name = 'Clothing'
```


### SHELL
```SQL
[root@localhost ~]#name=dangxu    //定义一般变量 
[root@localhost ~]# echo ${name} 
dangxu 
[root@localhost ~]# cat test.sh   //验证脚本，实例化标题中的./*.sh 
#!/bin/sh 
echo ${name} 
[root@localhost ~]# ls -l test.sh  //验证脚本可执行 
-rwxr-xr-x 1 root root 23 Feb 6 11:09 test.sh 
[root@localhost ~]# ./test.sh    //以下三个命令证明了结论一 
[root@localhost ~]# sh ./test.sh 
[root@localhost ~]# bash ./test.sh 
[root@localhost ~]# . ./test.sh   //以下两个命令证明了结论二 
dangxu 
[root@localhost ~]# source ./test.sh 
dangxu 
[root@localhost ~]# 
```
    

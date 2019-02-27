相同的两段代码=->>>>：

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
```
# 快排的主函数，传入参数为一个列表，左右两端的下标
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

Java:
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

JSON
```SQL
[
  '{{repeat(5, 7)}}',
  {
    _id: '{{objectId()}}',
    index: '{{index()}}',
    guid: '{{guid()}}',
    isActive: '{{bool()}}',
    balance: '{{floating(1000, 4000, 2, "$0,0.00")}}',
    picture: 'http://placehold.it/32x32',
    age: '{{integer(20, 40)}}',
    eyeColor: '{{random("blue", "brown", "green")}}',
    name: '{{firstName()}} {{surname()}}',
    gender: '{{gender()}}',
    company: '{{company().toUpperCase()}}',
    email: '{{email()}}',
    phone: '+1 {{phone()}}',
    address: '{{integer(100, 999)}} {{street()}}, {{city()}}, {{state()}}, {{integer(100, 10000)}}',
    about: '{{lorem(1, "paragraphs")}}',
    registered: '{{date(new Date(2014, 0, 1), new Date(), "YYYY-MM-ddThh:mm:ss Z")}}',
    latitude: '{{floating(-90.000001, 90)}}',
    longitude: '{{floating(-180.000001, 180)}}',
    tags: [
      '{{repeat(7)}}',
      '{{lorem(1, "words")}}'
    ],
    friends: [
      '{{repeat(3)}}',
      {
        id: '{{index()}}',
        name: '{{firstName()}} {{surname()}}'
      }
    ],
    greeting: function (tags) {
      return 'Hello, ' + this.name + '! You have ' + tags.integer(1, 10) + ' unread messages.';
    },
    favoriteFruit: function (tags) {
      var fruits = ['apple', 'banana', 'strawberry'];
      return fruits[tags.integer(0, fruits.length - 1)];
    }
  }
]
```

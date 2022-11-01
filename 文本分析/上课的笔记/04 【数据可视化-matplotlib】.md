05 【数据可视化】

# 什么是Matplotlib

> Matplotlib是一个Python 2D 绘图库，它可以在各种平台 上以各种硬拷贝格式和交互式环境生成出具有出版品质的图形。

Matplotlib试图让简单的事情变得更 简单，让无法实现的事情变得可能实 现。也是Python中最常用的可视化工 具之一，它的功能非常强大，可以通 过调用函数轻松方便地绘制数据分析 中常见的各种图像，比如折线图、条 形图、柱状图、散点图、饼图等。

# 常见图形种类及意义

在我们将数据的可视化之前，需要根据图形的特点来 选择绘制数据的图形，从而让我们快速发现数据的特点。





## 折线图：

以折线的上升或下降来表示统计数量的增减变化的 统计图

特点：能够显示数据的变化趋势，反映事物的变化情况。(变 化)

![image.png](https://s2.loli.net/2022/09/29/IlNZnJYvtfT9AcD.png)

## 散点图：

用两组数据构成多个坐标点，考察坐标点的分布,判断两变量之间是否存在某种关联或总结坐标点的分布模式。

散点图是判断变量之间是否存在数量关联趋势,展示离群点。每个点的坐标位置由变量的值决定，并由一组不连接的点完成，用于观察两种变量的相关性。 例如，身高—体重、温度—维度。

 特点：判断变量之间是否存在数量关联趋势,展示离群点(分 布规律)。

![image.png](https://s2.loli.net/2022/09/29/I9NRlZHWhFa1bT8.png)

绘制散点图使用plt.scatter()函数：

```python
plt.scatter(x,y,s,c,marker,alpha,linewidths)
```

先来了解一下函数的常用参数：

- x,y：数组 
- s：散点图中点的大小，可选 
- c：散点图中点的颜色，可选 
- marker：散点图的形状，可选 
- alpha：表示透明度，在 0~1 取值，可选 
- linewidths：表示线条粗细，可选



## 柱状图：

排列在工作表的列或行中的数据可以绘制到柱状图 中。 

柱状图适用场合是**二维数据集**（每个数据点包括两个值x和 y），但只有一个维度需要比较。例如：年销售额就是二维数据， ”年份”和”销售额”就是它的两个维度，但只需要比较”销售额”这一个维度。

特点：绘制离散的数据,能够一眼看出各个数据的大小,比较 数据之间的差别。(统计/对比)

![image.png](https://s2.loli.net/2022/09/29/wHCBGF1vx3jUKYn.png)

现在，需要绘制一张柱形图，用来描述每个电影的票房总数之间的对比。

```python
plt.bar(x,height,width,color)
```

先来了解一下函数的常用参数： 

- x：记录x轴上的标签 
- height：记录每个柱形的高度 
- width：设置柱形的宽度 
- color：设置柱形的颜色，传入颜色值的 列表，例如：['blue','green','red']。

```python
import matplotlib.pyplot as plt
import pandas as pd
%matplotlib inline
plt.rcParams['font.sans-serif'] = 'SimHei'
x = ['流浪地球','疯狂的外星人','飞驰人生','大黄蜂','熊出没·原始时代','新喜剧之王']
y =[38.13,19.85,14.89,11.36,6.47,5.93]

plt.figure(figsize=(20,8),dpi=80)
rects = plt.bar(x,y,width=0.3,color='pink')
plt.xticks(x,fontsize=19)
plt.yticks(range(0,41,5),range(0,41,5))
for rect in rects:
    height = rect.get_height()
    plt.text(rect.get_x() + rect.get_width()/2,height+0.3,str(height),ha ="center",fontsize=19)
    
plt.show()
```

在柱状图上画出数据的另一个写法：

```python
for x,y in enumerate(y):
    print(x,y)
    plt.text(x,y+0.3,y,ha='center',fontsize=19)
```

![image.png](https://s2.loli.net/2022/10/11/VUz1qxn6NkOEMTc.png)

### 数据标注

我们将柱形的高度数据标注在了柱形的上方。没错，我们使用了`plt.text( )`函数为每个柱形标注高度数值。

```python
plt.text(x,y,s,ha,va)
```

函数中前两个参数分别为标注数 据的坐标，x 和 y坐标，参数s记录标注的内容，参数ha 和va分别用 设置**水平**和**垂直**方向的对齐方式。

> ha有三个选择：right,center,left
>
> va有四个选择：'top', 'bottom', 'center', 'baseline'

rects 是`plt.bar()`的返回值，里面包含了每一个柱形为每个柱形添加数值标注需要逐个添加，所以我们设置了一个循环来完成这项操作。

```python
for rect in rects:
    height = rect.get_height()
    plt.text(rect.get_x() + rect.get_width()/2,height+0.3,str(height),ha ="center",fontsize=19)
```

通过get_height() 、get_x() 、 rect.get_width()等方法可以分别拿到柱形图的高度，左侧边的 x值， 柱子的宽度。然后，使用plt.text 添加上文字，这样就可以清晰地看出每个柱形的高度了。

- get_height()：拿到柱形图的高度
- get_x()：拿到柱形图的左侧边的 x值
- rect.get_width()：拿到柱形图的柱子的宽度

## 直方图：

由一系列高度不等的纵向条纹或线段表示数据分布的情况。 一般用横轴表示数据范围，纵轴表示分布情况。 

直方图一般用来描述等距数据，柱状图一般用来描述名称 （类别）数据或顺序数据。直观上，直方图各个长条形是衔 接在一起的，表示数据间的数学关系；条形图各长条形之间 留有空隙，区分不同的类。

特点：绘制连续性的数据展示一组或者多组数据的分布状况 (统计)。

![image.png](https://s2.loli.net/2022/09/29/fcmrQWC2u85xTpY.png)

绘制直方图使用plt.hist()函数：

```python
plt.hist(data, bins, facecolor, edgecolor)
```

先来了解一下函数的常用参数： 

- data：绘图用到的数据 
- bins：控制直方图中的区间个数 
- facecolor：矩形的填充颜色 
- edgecolor：条形的边框颜色

那么直方图和柱形图究竟有什么区别呢?

> 第一，柱形图中用柱形的高度 表示各类别的**数值，**横轴表示类别，宽度是固定的；而直方图是用矩形的高度表示每一组的**频数或频率**，宽度则表示各组的组距，**因此其高度与宽度均有意义**。
>
> 第二，直方图主要用于展示**连续型数值型数据**，所以各矩形通常是连续排列的；而柱形图主要用于展示分类型数据，常常是分开排列的。

## 饼图：

用于表示不同分类的占比情况，通过弧度大小来对比各种分类。 

饼图是展示 分类数据的占比情况，就是反映某个部分占整体的比重，比如贫穷人口占总人口的百分比。 饼图的整个圆代表总数据，各个扇形表示每项数据，我们可以根据扇形的角度清楚地看出每个扇形占总数据的比例。

特点：分类数据的占比情况(占比)

![image.png](https://s2.loli.net/2022/09/29/nP36fYwtZ95N4Wm.png)

绘制饼图我们使用plt.pie( )函数:

```python
plt.pie(x, labels, autopct, shadow,startangle)
```

先来了解一下函数的常用参数:

- x：绘制用到的数据 
- labels：用于设置饼图中每一个扇形外侧 的显示说明文字 
- autopct：设置饼图内百分比数据，可以使用format字符串或者format function， 例如’%.1f%%’指小数点后保留1位小数 
- shadow：表示是否在饼图下面画阴影，默 认值：False，即不画阴影 
- startangle：设置起始绘制角度，默认图是从x轴正方向逆时针画起，如果设定 startangle=90，则从y轴正方向画起

plt.pie()会有三个返回值 

==patches==: matplotlib.patches.Wedge 列表(扇形实例) 

==l_text==：label matplotlib.text.Text 列表(标签实例) 

==p_text==：label matplotlib.text.Text 列表(百分比标签实例)

所以，在每一个扇形外侧显示中文的时候，需要获取到每一个标签实例，然后通过 `set_fontproperties()`方法 设置自定义字体。

```python
patches,l_text,p_text = plt.pie(num,labels = num.index,autopct='%.1f%%',shadow=False)
for i in l_text:
    t.set_fontproperties(my_font)
```

# 认识Matplotlib图像结构

### Matplotlib的图像的结构图：

![image.png](https://s2.loli.net/2022/09/29/SI5nChVgKqz1svY.png)

通常情况下，我们可以将一张Matplotlib图像分成三层结构:

- 第一层是底层的 容器层，主要包 括Canvas、 Figure、Axes；
- 第二层是辅助显示层， 主要包括axis、 spines、grid、 legend、title等；
- 第三层为图像层， 即通过plot、 scatter等方法绘制 的图像。



### 容器层主要由Canvas、 Figure、Axes组成:

- Canvas是位于最底层的系统层，在绘图的过程中充当画板的角色，即放置画布 (Figure)的工具，**用户一般接触不到**。
- Figure是Canvas上方的第一层，也是需要用户来操作的应用层的第一层，在绘图的过程中充当画布的角色，我们可以设置画布的大小和分辨率等。
- Axes是应用层的第二层，在绘图的过程中相当于画布上的绘图区的角色。一 个Figure对象可以包含多个Axes对象，每个Axes都是一个独立的坐标系，绘图过程中的所有图像都是基于坐标系绘制的。



### 辅助显示层:

为Axes(绘图区)内的除了根据数据绘制出的图像以外的内容，主要包括Axes外观(facecolor)、边框线 (spines)、坐标轴(axis)、坐标轴名称(axis label)、坐标轴刻度(tick)、坐标轴刻度标签(tick label)、网格线 (grid)、图例(legend)、标题(title)等内容。 该层的设置可使图像显示更加直观更加容易被用户理解， 但又不会对图像产生实质的影响。

![image.png](https://s2.loli.net/2022/09/29/xIfK5bdYqiHonvL.png)



### 图像层:

指Axes内通过plot、scatter、bar、histogram、pie 等函数根据数据绘制出的图像。

![image.png](https://s2.loli.net/2022/09/29/jpkCarmu13Y5VB4.png)



> 总结得出:
>
> -  Canvas（画板）位于最底层，用户一般接触不到 
> - Figure（画布）建立在Canvas之上 
> - Axes（绘图区）建立在Figure之上 
> - 坐标轴（axis）、图例（legend）等辅助显 示层以及图像层都是建立在Axes之上



# 绘制图

## 导入库：

我们从matplotlib包中导 入了pyplot模块并将其改 名为plt，编写代码时，直接使用plt调用方法即可

```python
from matplotlib import pyplot as plt
```

在 使 用 jupyter notebook 时调用 `matplotlib.pyplot`的绘图函数`plot()`进行绘图的 时候，或者生成一个figure画布的时候,需要加上 `%matplotlib inline`

## 代码分解

```python
from matplotlib import pyplot as plt

x = range(1,8)
y = [17,3,2,4,75,24,13]
plt.plot(x,y,color='green',alpha=0.7,linestyle='-',linewidth=4,marker='o')
plt.show()
```



- color='green'：设置线的颜色
- alpha=0.5：设置线的透明度
- linestyle='—'：设置线的样式， - 实线(solid)、-- 短线 (dashed)、-. 短点相间线 (dashdot)、：虚点线(dotted)
- linewidth=3：设置线的宽度
- marker='o'：设置折点的样式，默认是什么都没有

| 符号 | 样式     | 符号 | 样式        |
| ---- | -------- | ---- | ----------- |
| '-'  | 直线     | '3'  | 三角向左    |
| '--' | 虚线     | '4'  | 三角向右    |
| '-.' | 点划线   | 's'  | 正方形标记  |
| ':'  | 点虚线   | 'p'  | 五边形标记  |
| '.'  | 点标记   | '*'  | 星标        |
| ','  | 像素标记 | 'h'  | 六边形1标记 |
| 'v'  | 三角向下 | 'H'  | 六边形2标记 |
| '^'  | 三角向上 | '+'  | 加号标记    |
| '<'  | 三角向左 | 'x'  | x标记       |
| '>'  | 三角向右 | 'D'  | 钻石标记    |
| '1'  | 三角向下 | 'd'  | 薄钻石标记  |
| '2'  | 三角向上 | 'I'  | v线标记     |
| 'o'  | 圆标记   | '_'  | h线标记     |

### 设置标题：

对一个图形最重要的是内容的绘制，其次就是标题，我们需要让其他人清楚这张图的含义是什么，图中 x 轴表示什么，y轴表示什么，这个时候我们就需要为图像添加一些标题。

这些标题信息就需要我们在绘制的时候，将标题 信息绘制在图片上，运行下面的代码，我们一起看一下如何添加标题：

```python
plt.title("")
plt.xlabel("")
plt.ylabel("")
```

# 显示中文

```python
plt.rcParams['font.sans-serif']=['SimHei']
plt.rcParams['axes.unicode_minus']=False
```

设置自定义字体：

```python
from matplotlib import font_manager
my_font = font_manager.FontProperties(fname='/data/course_data/data_analysis/STSONG.TTF')
```

- `from matplotlib import font_manager`导入字体管理模块，`font_manager.FontProperties()`使用这个方法根据我提供的字体文件创建字体对象。
- fname 后面跟着的是所使用的字体的存储路径，在需要中文显示的地方，添加字体属性就可以了

# **自定义X轴刻度**

> 当x轴刻度值全都折叠在一起了如何解决？

首先，分析原因：

- 刻度的文字过长，但是图片的宽度不够
- x轴和y轴刻度会默认根据x值和y值生成，并且Matplotlib 默认会生成他认为合适的刻度间距。

## 方法一 改变画布大小

代码:`plt.figure(figsize=(a, b),dpi=dp)`

其中：figsize 设置图形的大小， a 为图形的宽， b 为图形的高，单位为英寸 ，dpi 为设置图形每英寸的点数，即每英寸多少个像素

问题：使用这个方法可以增大图片的大小在一定程度上缓解重叠的问题，但是还是有些字体被遮挡，无法完全解决问题，现在需要寻找另一个方法来解决。



## 方法二 设置x轴刻度

使用`plt.xticks()`这个方法自定义x轴的刻度

```python
plt.xticks(locs,[labels],**kwargs)
```

locs参数为数组参数，表示x-axis的刻度线显示标注的地方，即ticks放置的地方，第二个参数也为数组参数，表示在locs数组表示的位置添加的标签。

```python
plt.xticks(range(0,len(x),3),x[::3],rotation=45)
```

- `range(0,len(x),3)`为`xticks()`的第一个参数，根据x值的个数调整x轴的刻度疏密程度。
- x[::3]为`xticks()`的第二个参数，还是使用x的值作为刻度的标签值，但是这里获取了其中的一部分，确保第一个参数和第二个参数的个数相同。
- rotation=45默认刻度的值是横向书写的，这样会有一定的重叠，所以我们将文字进行旋转操作，45位旋转的度数。

# **一图多线**

多次使用`plt.plot()`可以在一个图上绘制多个线

`plt.legend()`方法就是图形添加图例的方法，但是这个方法比较特殊，一共需要两步才能成功的添加上图例

`plt.legend(prop=my_font)`是添加图例的方法，prop=my_font参数是设置图例上中文显示的属性，另外一个比较重要的是，图例上显示的文字我们需要添加在plt.plot(x,y,label='开盘价')方法的label属性中。

**绘制网格：**

`plt.grid(alpha=0.4)`

这行代码就是添加网格的效果，这里面的alpha=0.4是设置网格线的透明度，范围是（0~1）。

在之前做的数据分析项目练习中，图例的标注需要注意顺序。

![image.png](https://s2.loli.net/2022/10/04/BPbvjfAeTIRG2d8.png)



# 一图多个坐标系子图

> 一个画布上是可以分成多个区域，每个区域都可以绘制一个图像，这里的每个图像称为一个子图。调用`plt.subplot()`函数就可以在

调用`plt.subplot()`函数就可以在画布上创建一个子图，plt.subplot()的使用方法如下：

```python
plt.subplot(nrows,ncols,index)
```

- 函数的 nrows 参数指定将数据图区域分成多少行；
- ncols 参数指定将数据图区域分成多少列；
- index 参数指定获取第几个区域。

![image.png](https://s2.loli.net/2022/10/04/JsOcdgDzIm4uj2Z.png)

![image.png](https://s2.loli.net/2022/10/04/fArWYDF8t2TCJse.png)





# 绘制双Y轴坐标系

> 在进行数据分析时，有时候我们需要在同一个坐标图中比较**两种数据**在**时间序列上的关系**。由于两种数据的单位和数据并不统一，也是不同的类型的数据，因此我们不能用一个Y轴来共同衡量两类不同的数据，这时候我们就需要绘制双Y轴图。

引例：

使用某上市公司股票日线部分数据来绘制双坐标图（我手头上也没有数据）

我们的目的是研究二月份某公司的**每日收盘价**以及**对应的成交量**，所以方便分析，需要在一 个双Y轴坐标图中同时绘制出收盘价和成交量的时间序列图。

首先，需要将日期列设置 成数据的索引，方便我们 后续按照日期获取数据。

```python
datas.index = pd.to_datatime(datas["日期"])
```

然后，将二月份的数据获取出来。

```python
fed_datas = datas['2015-02']
```

接下来看看双y轴绘制的关键函数：twinx()。

`twinx()`函数表示**共享x轴**，共享表示的就是**x轴使用同一刻度线**。

接下来，我们先把每日收盘价的折线图绘制出来：

```python
import pandas as pd
from matplotlib import pyplot as plt
from matplotlib import font_manager

my_font =font_manager.FontProperties(fname='/data/course_data/data_analysis/STSONG.TTF',size=18)

# 获取数据
datas =pd.read_excel('/data/course_data/data_analysis/600001SH.xlsx')
datas.index = pd.to_datetime(datas['日期'])
feb_datas = datas['2015-02']

# 绘制图形
fig = plt.figure(figsize=(20,8),dpi=80)
ax = fig.add_subplot(111)
lin1 = ax.plot(feb_datas.index.tolist(),feb_datas['开盘价(元)'].values.tolist(),label='开盘价',color='red')
ax.legend(prop=my_font,loc=0)
ax.set_ylabel("开盘价(元)",fontproperties=my_font)
ax.set_xlabel("日期",fontproperties=my_font)

ax2 = ax.twinx()
lin2 = ax2.plot(fed_datas.index.strftime('%Y-%m-%d').tolist().fed_datas['成交量（股）'])

ax2.legend(prop=my_font)
ax2.set_ylabel("成交量(股)",fontproperties=my_font)
ax.set_ylabel("开盘价(元)",fontproperties=my_font)
ax.set_xlabel("日期",fontproperties=my_font)
# 合并图例
lns = lin1+lin2
labs = [l.get_label() for l in lns]
ax2.legend(lns, labs, prop=my_font)
# 绘制网格
ax.grid()
plt.show()

plt.show()
```

![image.png](https://s2.loli.net/2022/10/11/i97uElkFTXSspVK.png)

使用 `add_subplot`添加了Axes坐标轴实例:`ax = fig.add_subplot(111)`

因为，我们会使用这个Axes坐标轴实例去调用`twinx()`函数，从而实现两个Y轴共享 一个X轴的效果。

代码片段：`ax2 = ax.twinx()`



因为是共享X轴，所以只用 `ax.set_xlabel()`就可以设置X轴的标题。

由于Y轴不共享，所以每一个坐标系的Y轴 标题都要使用`set_ylabel()`方法设置一次

合并图例的方法就是仅使用一 个轴的legend()函数：`ax.legend(lns,labs,prop=my_font)`

legend()方法可以指定图例中有哪些值，第一个参数lns表示将图中的多个线以列表的形式传进去，第二个参数labs表示将图 例的名字以列表的形式传进去。



上图中，一个是Matplotlib默认绘制出的图像，另一个是修改了Matplotlib的一些默认显示方式。 经过前面的学习我们发现， Matplotlib在绘制图形的时候会默认显示上面和右侧的边框，以及坐标轴的颜色默认是黑色。

## 去除边框

如果想要去掉默认的边框，通过`plt.gca()` 获得当前的Axes对象：`ax = plt.gca()`

使用spines属性获取到对应的边框：`ax.spines['right’]`

right右边框、left左边框、 top上边框、bottom下边框。

通过set_color('none')方法可以设置边框的颜色：`ax.spines['right'].set_color('none ')`

对于颜色的设置，none表示无色，也可以用red、blue等样式的英语单词或者是十六进制的颜色值#0000FF。

```python
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')
ax.spines['bottom'].set_color('red')
ax.spines['left'].set_color('#0000FF')
```

# 移动坐标轴位置

如果想要X轴的0点，和Y 轴的0点交叉，需要使用 `set_position`方法移动坐标轴的位置。

```python
ax.spines['bottom'].set_position(('data', 0))
ax.spines['left'].set_position(('data', 0))
```

设置底边的移动范围， 移动到Y轴的0位置。

data:移动轴的位置 到交叉轴的指定坐标。

![image.png](https://s2.loli.net/2022/10/11/y9pCxVHoBDeAZG4.png)

# 练习

## 一图多子图，绘制函数

```python
from matplotlib import pyplot as plt
import numpy as np

# 定义x的取值范围
x = np.linspace(-np.pi,np.pi,256,endpoint=True)

# 定义函数
C = np.cos(x)
S = np.sin(x)
y = 1/x
z = np.tan(x)

# 绘制函数
plt.subplot(221)
plt.plot(x,C)
plt.title("cos(x)")

plt.subplot(222)
plt.plot(x,S)
plt.title("sin(x)")

plt.subplot(223)
plt.plot(x,y)
plt.title("1/x")

plt.subplot(224)
plt.plot(x,z)
plt.title("tan(x)")

plt.show()
```

![image.png](https://s2.loli.net/2022/10/04/T8JRU5Og92MDHto.png)



### 子图的调整

`matplotlib.pyplot.subplots_adjust（函数名）`

`matplotlib.pyplot.subplots_adjust(left=None,bottom=None,right=None,top=None,wspace=None, hspace=None)`（前四个含义——单独子图的参数调整：左、下、右、上预留距离，默认为无。）（后两个含义——子图之间的参数调整：横向间隔距离、纵向间隔距离）

Unset parameters are left unmodified;initial values are given by rcParams[“figure.subplot.[name]”].（未设置的参数保持不变；初始值由 给出 rcParams[“figure.subplot.[name]”]。）

这里涉及到 rcParams的设置，我也不太懂，可以设置字体语言和样式这些，比如：

`plt.rcParams[‘font.sans-serif’] =[‘Microsoft YaHei’]`  

`plt.rcParams[‘axes.unicode_minus’] = False）`



好了，我们对子图的参数进行调整：

```python
plt.subplots_adjust(left=None,bottom=None,right=None,top=None,wspace=0.5,hspace=0.5)
```

效果：

![image.png](https://s2.loli.net/2022/10/04/2DurcakCVBiEb1m.png)



## 星巴克店铺排名

> 利用pandas对数据进行预处理然后再使用matplotlib对处理后的数据进行数据可视化是数据分析中常用的方法

```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = 'SimHei'
%matplotlib inline

# 读取数据
data = pd.read_csv("./directory(1).csv")
#3、对数据进行分组统计，再进行再按照Brand进行排序，取前十条数据并设置X轴和Y轴
data1 =data.groupby(by=['Country']).count().sort_values(by='Brand',ascending=False)["Brand"][:10]
x = data1.index
y = data1.values

#4、设置绘图的大小10*8，清晰度为80
# 用X轴的长度设置X轴刻度间隔，设置标题和X轴的名称和Y轴的名称，并且显示这个图

plt.figure(figsize = (10,8),dpi = 80)
plt.bar(range(len(x)),y,width=0.5)
plt.xticks(range(len(x)),x)
plt.xlabel("国家")
plt.ylabel("店铺数")
plt.title("星巴克咖啡店店铺数排行前10的国家",size=20)
plt.show()
```

![image.png](https://s2.loli.net/2022/10/06/cM8NDkyJ3HCL6ho.png)



## 食物

数据连接：[点击跳转](https://github.com/morang-chun/study-note/blob/main/%E6%96%87%E6%9C%AC%E5%88%86%E6%9E%90/code/food%E5%8F%AF%E8%A7%86%E5%8C%96/FoodsData(1).csv)

### 1、绘制柱状图

> 题目要求：请根据给出的FoodsData.csv文件，将其中的名称作为横轴，钙的含量作为纵轴，绘制出柱状图，并正常显示中文，增加配置
>
> - 1、在柱子上方标记处每种食物对应的具体数值
> - 2、自定义柱子的颜色(三种颜色以上)

```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = 'SimHei'
plt.rcParams['axes.unicode_minus']=False
%matplotlib inline

data = pd.read_csv("./FoodsData(1).csv")
# 将其中的名称作为横轴，钙的含量作为纵轴，绘制出柱状图，并正常显示中文刻度
plt.figure(figsize=(30,10),dpi=80)
y = data["钙"]
x = data["名称"]
plt.bar(x,y,width=0.4,color=["pink","skyblue","brown"])

for x,y in enumerate(y):
#     print(x,y)
    plt.text(x,y+0.1,y,ha='center',fontsize=15)

plt.xlabel("食物名称",fontsize=20)
plt.ylabel("钙的含量",fontsize=20)
plt.title("食物中钙的含量柱状图",fontsize=30)
plt.show()
```

![image.png](https://s2.loli.net/2022/10/14/Vv8goeztqN42CRr.png)



### 2、绘制直方图

> 题目要求：利用以下数据绘制一个直方图，要求组距为10，增加配置
>
> - 1、自定义设置柱形的填充颜色
> - 2、自定义条形的边框颜色

```python
import random
ist1 = [random.randint(117,427) for i in range(30)]
plt.figure(figsize=(8,8),dpi=80)
plt.hist(ist1,bins=10,facecolor="skyblue",edgecolor="black")
```

![image.png](https://s2.loli.net/2022/10/14/JzC5XYVQyOxt3r9.png)



### 3、绘制散点图

> 题目要求：根据给出的 FoodsData.csv数据，选择卡路里和脂肪分别作为横轴和纵轴的数据，绘制出相应的散点图，要求增加配置
>
> - 1、自定义设置点的大小
>
> - 2、自定义设置点的颜色
> - 3、自定义设置点的形状
> - 4、自定义设置点的透明度
> - 5、自定义设置线条的宽度

```python
plt.figure(figsize=(7,5))
x = data["卡路里"]
y = data["脂肪"]
plt.scatter(x,y,s = 30,color="red",marker="^",alpha=0.5,linewidths=3)
plt.xlabel("脂肪",fontsize=15)
plt.ylabel("卡路里",fontsize=15)
plt.title("脂肪与卡路里含量关系散点图",fontsize=20)
plt.show()
```

![image.png](https://s2.loli.net/2022/10/14/tkmpvRSuDyLIXO1.png)

### 4、绘制饼图

> 题目要求：根据给出的 FoodsData.csv数据，绘制出饼图，要求体现出大分类列每个分类占比总分类的比例是多少，增加配置：
>
> - 1、在图当中显示出各个分类百分比的数量，保留一位小数，比如(4.2%)
> - 2、自定义设置饼图的起始绘制角度

```python
groups = data.groupby(by='大分类').size()
# 绘制饼图
plt.pie(groups,labels=groups.index, autopct='%.1f%%',startangle=90)
plt.title("大分类列每个分类占比总分类的比例",fontsize=20)
plt.show()
```

![image.png](https://s2.loli.net/2022/10/14/Aispq2HVERvGl5m.png)







# 配色表

![](https://img-blog.csdnimg.cn/6b0b4b2e3d614265be635379f234c908.jpg?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA6aOO5be9wrfliZHmn5PmmKXmsLQ=,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)

![](https://img-blog.csdnimg.cn/daf5fe4ba1e643168e291e9df652e592.jpg?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA6aOO5be9wrfliZHmn5PmmKXmsLQ=,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)
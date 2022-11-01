数据可视化-seaborn

# 第一节 Seaborn简介

> > Seaborn 是基于 Python 且非常受欢迎的图形可视化库，并且在 Matplotlib 的基础上，进行了更高级的封装，使得作图更加方便快捷。可以通过极简的代码，做出具有分析价值而又十分美观的图形。

同样在使用Seaborn之前我们需要将其导入：

```python
import seaborn as sns
```

`seaborn.set()`函数

```python
sns.set(context='notebook',style='darkgrid',palette='deep',font='sans-serif',font_scale=1,color_codes=True)
```

- context：参数控制着默认的画幅大小，分别有 {paper, notebook, talk, poster} 四个值。其中，poster > talk > notebook > paper。
- style：参数控制默认样式，分别有 {darkgrid, whitegrid, dark, white, ticks}， 你可以自行更改查看它们之间的不同。
- palette：参数为预设的调色板。分别有 {deep, muted, bright, pastel, dark, colorblind} 等，你可以自行更改查看它们之间的不同
- font : 用于设置字体。
- font_scale= ''：设置 字体大小。
- color_codes=''： 不使用调色板而 采用先前的 'r' 等色彩缩写。

例子：

我们使用`numpy`的`np.linspace()` 函数生成100个0到15的等间隔数列。

```python
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
%matplotlib inline

def sinpolt():
    x = np.linspace(0, 15, 100)
    for i in range(1,3):
        plt.plot(x,np.sin(x+i))
        
sinplot()
```

效果：没有对风格做任何的改变

![image.png](https://s2.loli.net/2022/10/13/UYEMwfLqDn1H4JQ.png)

调用 `sns.set()` 函数来改变 style ，看看效果如何：

![image.png](https://s2.loli.net/2022/10/13/V7KMX2mEp1LWjFG.png)

根据结果，我们添加了`sns.set()`方法后，图形添加了网格，而且隐藏了坐标轴。



seaborn 提供了5种默认的风格，我们在实际绘图中只要选择一种喜欢的风格就可以了，下面我们就看看这5种风格的用法及效果。

```python
sns.set(style='dark')
sinpolt()
```

![image.png](https://s2.loli.net/2022/10/13/3Udt4qwksE9x1Vm.png)

```python
sns.set(style='ticks')
sinpolt()
```

![image.png](https://s2.loli.net/2022/10/13/fCizEpdvsbtGTqr.png)

```python
sns.set(style='white')
sinpolt()
```

![image.png](https://s2.loli.net/2022/10/13/ENUtX2FvkYxSyg9.png)

```python
sns.set(style='whitegrid')
sinpolt()
```

![image.png](https://s2.loli.net/2022/10/13/ENUtX2FvkYxSyg9.png)

```python
sns.set(style='darkgrid')
sinpolt()
```

![image.png](https://s2.loli.net/2022/10/13/5ULsrIF8jaQhoYe.png)

## 移除某个轴

`sns.despine()`函数默认移除了上部和右侧的轴， 当然我们也可以移除其他轴。

对于是否移除某个轴，我们可以设置`sns.despine()`函数的top、 right、left、bottom参数的值来控制，值为True时，会移除该轴，反之，保留该轴。

## 子图呈现不同的风格

可以使用with设置 风格，在with下画的图都可以使用该种风格。

```python
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
%matplotlib inline

def sinpolt():
    x = np.linspace(0, 15, 100)
    for i in range(1,3):
        plt.plot(x,np.sin(x+i))

with sns.axes_style("darkgrid"):
    plt.subplot(211)
    sinpolt()
    
    
plt.subplot(212)
sinpolt()
plt.show()
```

![image.png](https://s2.loli.net/2022/10/13/UdvTzD7uK4YkOsc.png)

我们看到第一个子图的风格成功设 置成了darkgrid，而且在绘制第二个子图的时候并未受到影响。

`sns.axes_style()`的作用是临时设置绘图的参数，也就是只设置使用with 打开的作用域内的绘图，不会对其他 的图造成影响。

这就是常用seaborn库的风格设置，我们 常会使用`sns.set()`设置图形风格，以及使用`with sns.axes_style()`函数给不同 的子图设置不同的风格。

# 第二节:seaborn调色板及颜色设置

- 颜色在可视化中非常重要，用来代表各种特征，并且提高整个图的观赏性。
- 调色板就像是装水彩笔的盒子， 等我们把图绘制完成以后，使用相应颜色的水彩笔涂上颜色就好了。

## color_palette()调色板标题

seaborn的`seaborn.color_palette()` 函数提供了一组定义好的调色板，也 就是我上面所说的装水彩笔的盒子。

下面我们了解一下这个函数：

```python
seaborn.color_palette(palette=None,n_colors=None,desat=None)
```

该函数的返回值： 是一个调色板定义的一个颜色列表。

- palette：调色板，可以不写，可以填写字符串，也可以是一个序列。 
- n_colors：可以指定颜色的数量。 
- desat：按照比例降低每一种颜色的饱和度。

不带任何参数时，表示获取这个盒子里的全部水彩 笔。



## 查看默认调色

color_palette()默 认给我们提供了6种 主题颜色去对应 matplotlib 中的10种 颜色。

6个默认的颜色主题 分别是： deep， muted，pastel， bright，dark， colorblind。

```python
current_palette = sns.color_palette()
sns.palplot(current_palette)
```

![image.png](https://s2.loli.net/2022/10/13/Mi3WGHEFOZ5DNlB.png)

下面我们依次看看每种主题色的效果：

```python
theme_list = ["deep","muted","pastel","bright","dark","colorblind"]
for i in theme_list:
    sns.palplot(sns.color_palette(i))
```

![image.png](https://s2.loli.net/2022/10/13/ZAnD85FTs9dgyhq.png)

注意： 这六种主题形成的颜色列表中，最多含有10种，如果我们设置n_colors的值多余10 中，就会用这10种颜色进行循环增加。 运行下方代码，你会发现12个颜色中，前两个和最后两个是一样的：

```python
sns.palplot(sns.color_palette("deep",12))
```

![image.png](https://s2.loli.net/2022/10/13/2Vz3QBdeY8InlCg.png)

如果我们想用不同的颜色表示不同的类 别，有没有更多的颜色可供我们使用呢？ 

 最常用的方法是使用hls的颜色空间，这是RGB值 的一个简单转换。 `sns.palplot(sns.color_palette("hls", 12)) hls`：大家就可以看做是一个颜色足够丰富的色板。



体验调色板：

```python
import matplotlib.pyplot as plt
%matplotlib inline
import seaborn as sns

a = ['a','b','c','d','e','f']
b = [38,19,14,11,6,5.6]
# plt.figure(figsize=(20,8),dpi=180)
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)
plt.bar(a,b,width=0.2,color = sns.color_palette("hls",6))
for x,y in enumerate(b):
    plt.text(x,y+0.2,y,ha="center",fontsize=12)
```

<img src="https://s2.loli.net/2022/10/14/6a1fj7G5UN4ncXg.png" alt="image.png"  />



我们看到使用调色板成功的设置了条形图的颜色，如果调色板 的颜色少于条形图的个数，将会循环调色板颜色。





# 第三节 单变量分析绘图

单变量其实就是我们通常接触 到的数据集中的**一列数据**。单变量分析是数据分析中最简单的形式，其中被分析的数据只包含一个变量。因为它是一个单一的变量，它不处理原因或关系。**单变量分析的主要目的是描述数据并找出其中存在的模式， 也就是“用最简单的概括形式反映出大量数据资料所容纳的 基本信息”。**



连续型数据一般应用在计算机领域， 在数据挖掘、数据分类时会遇到此 类数据，因其数据不是单独的整十 整百的数字，包含若干位小数且取值密集，故称为连续型数据，例如， 身高、体重、年龄等都是连续变量。

由记录**不同类别**个体的数目所得到的数据，称为离散型数据。例如，某一 类别动物的头数，具有某一特征的种子粒数，血液中不同的细胞数目等。 所有这些数据全部都是整数，而且不能再细分，也不能进一步提高他们的精确度

## 绘制

首先，使用NumPy模块从标准正态分布中随机地抽取 1000个数，作为我们的**连续数值型数据**。

random是NumPy的一个随机模块，在random模块中的 ==normal== 方法表示从**正态分布**中随机产生size个数值。

size=1000，表示**随机**产生1000个数，它们组成的数据是一组**连续型**的数值型数据。 

在seaborn里最常用的观察单变量分布的函数是 `distplot()`

下面，我们根据上面的数据，用seaborn的distplot()绘制出数据的分布的直方图，观察概率密度曲线情况：

```python
import numpy as np
data = np.random.normal(size=1000)
sns.set(style='darkgrid')
sns.distplot(data, kde = True)
# 如果kde=False 时，不显示核密度线
```

<img src="https://s2.loli.net/2022/10/19/DlR4NA9OoqIJX2E.png" alt="image.png" style="zoom:80%;" />

data参数记录绘图所用的数据，而bins参数在绘制直方图时可以进 行设置，用于设置分组的个数，默认值时，会根据数据的情况自动 分为n个组，若是想指定分组的个数，可以设置该参数，然后计算 我们可以增加其数量，来看到更为详细的信息。

在自己机器上运行出现的问题：

目前我的seaborn的版本号：`sns.__version__`：'0.12.0'

我使用老师的代码报的错：他说我的数据有问题，需要换成histograms，即histplot

文档地址：[点击跳转](https://gist.github.com/mwaskom/de44147ed2974457ad6372750bbe5751#file-replacing_seaborn_distplot-ipynb)

我在GitHub中看源代码的介绍，

> Seaborn's [`distplot`](https://seaborn.pydata.org/generated/seaborn.distplot.html) function was deprecated in v0.11.0, a release that included several new functions for plotting data distributions. Calling `distplot` on v0.11.0 or later issues a warning urging the user to update their code with one of two new functions: either [`displot`](https://seaborn.pydata.org/generated/seaborn.displot.html) (note, no `t`) or [`histplot`](https://seaborn.pydata.org/generated/seaborn.histplot.html).

然后我看到了介绍里面也有和我类似的错误：

![image.png](https://s2.loli.net/2022/10/19/KcSRzytnXJYaigm.png)

文档分析了distplot,histplot,displot三者的区别，点击文档可以查看。

以我上面的data数据集来做例子：

```python
import numpy as np
data = np.random.normal(size=1000)
sns.set(style="darkgrid")
sns.distplot(data,kde=True)
```

<img src="https://s2.loli.net/2022/10/19/1XpDrWcOkz4JUgq.png" alt="image.png" style="zoom:50%;" />

```python
import numpy as np
data = np.random.normal(size=1000)
sns.set(style="darkgrid")
sns.histplot(data,kde=True,stat="density")
```

<img src="https://s2.loli.net/2022/10/19/EhsIlpRn1FYdSM3.png" alt="image.png" style="zoom:50%;" />

```python
import numpy as np
data = np.random.normal(size=1000)
sns.set(style="darkgrid")
sns.displot(data,kde=True)
```

<img src="https://s2.loli.net/2022/10/19/CSQ1KNM7wVaYGOB.png" alt="image.png" style="zoom: 67%;" />

**最后三个数据集可视化出来的图形不一样。**



hist和kde参数用于调节是否显示直方图及核密度估计图，默认 hist（条形图）、kde（核密度线）均为True，表示两者都显示。我们可以通过修改参数为 False选择是否将其中之一去掉。

<img src="https://s2.loli.net/2022/10/19/DlR4NA9OoqIJX2E.png" alt="image.png" style="zoom:67%;" />

在上面的结果中，横轴表示数据点的取值，纵轴表示概率密度值。

- 该结果中使用**直方图**描述了数据的分布：将数据分成若干个组，用柱形的高度记录每组中数据所占比率。

- 这条曲线叫做 **概率密度曲线**。 就是采用平滑的峰值函数来拟合观察到的数据点，从而对真实的概率分布进行模拟。
- 从上图中可以看出，在数字0周围，概率密度值是最大的，但是，随着向两侧的逐渐扩展，概率密度逐渐减小。这样的分布也是一个标准正态分布。



概率密度曲线的原理比较简单，在我们知道某 一事物的概率分布的情况下，如果某一个数在观察中出现了，我们可以认为这个数的概率密度很大，和这个数比较近的数的概率密度也会比较大，而那些离这个数远的数的概率密度会比较小。

如果我们只想要显示概率密度曲线，不想显示柱状图，我们也可以使用`sns.kdeplot()`函数绘制数据的概率密度曲线图。

```python
import numpy as np
data = np.random.normal(size=1000)
sns.set(style='darkgrid')
sns.kdeplot(data,shade=False)
```

`sns.kdeplot()`函数的使用方法如下：

`sns.kdeplot(data1, data2, shade = False)`

shade参数用于设置图像下方的部分是否设置阴影，默认值为False，表示不绘制阴影。

![image.png](https://s2.loli.net/2022/10/18/KYpzNCUs5697vkD.png)



以上就是连续数值型**单变量数据**常见的可视化方法，我们常会使用到直方图、核密度图来描述数据的分布。

在Seaborn中**集成了这两种图像**，使用 `sns.distplot()`函数可以将它们绘制在同 一张图中。

# 第四节 绘制双变量联合分布图

> 有时我们不仅需要查看单个变量的分 布，同时也需要查看变量之间的联系， 往往还需要进行预测等。这时就需要用到双变量联合分布了。

下面我们一起来看一下连续数值型数据双变量之间的可视化方法。

在Seaborn中绘制连续数值型双变量我们使用`sns.jointplot()`: 

说明文档：[点击跳转](https://seaborn.pydata.org/generated/seaborn.jointplot.html)

```python
seaborn.jointplot(x, y, data=None, kind='scatter')
```

- x、y：分别记录x轴和y轴的数据名称。 

- data：数据集，data的数据类型为**DataFrame**。

-  kind：用于设置图像的类型，可选的类型有： 'scatter' | 'reg' | 'resid' | 'kde' | 'hex'，分别表示散点图、回归图、残差图、 核密度图和蜂巢图。

## 散点图

如果我们希望看一看数据中**两个变量在二维平面上之间的关系时**， 则可以使用散点图，因为散点图可以帮助我们很容易地发现一些数据的分布规律。

```python
import numpy as np
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt

df =pd.DataFrame({'x':np.random.normal(size=500),
                 'y':np.random.normal(size=500)})
sns.jointplot(x='x',y='y',data=df,kind='reg')
plt.show()
```

双变量散点图：

![image.png](https://s2.loli.net/2022/10/18/kcDFv9agzCPKbuB.png)



- 根据结果我们发现， sns.jointplot()函数可以显示**两个变量之间的联合关系**以及**每个单变量的分布**。
- 我们把函数中的 kind 参数设置为'reg' 就可以做一些简单的**线性模型拟合**。
- 并且在坐标系的**上方和右侧**分别绘制了两个变量的直方图和核密度图。



## 蜂巢图

上面我们根据数据绘制了联合散点图，但是你会发 现两个数据并没有明确的线性关系，并且散点图有 一个问题，就是相同的点会覆盖在一起，导致我们 看不出来浓密和稀疏。 所以我们可以使用蜂巢图查看一下数据的分布情况。

蜂巢图的绘制还是使用seaborn.jointplot()函 数，只是将kind参数更该为hex即可。

```python
import numpy as np
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt

df =pd.DataFrame({'x':np.random.normal(size=500),
                 'y':np.random.normal(size=500)})
sns.jointplot(x='x',y='y',data=df,kind='hex')
plt.show()
```

![image.png](https://s2.loli.net/2022/10/18/YaItDuH7XqdPk5O.png)



> 蜂巢图中每个六边形表示一个范围， 用颜色表示这个范围内的数据量，颜 色越白的地方数据量越小，颜色越深 的地方表示数据量越大。 当数据比较大的时候该种方式，更容易找出数据的分布情况。



## 密度图

在单变量分析的时候，我们绘制了单变量的概率密度曲线， 在双变量中我们也可以使用密度图来分析数据的分布情况。 密度图的绘制还是使用seaborn.jointplot()函数，只是将 kind参数更该为kde即可。

```python
import numpy as np
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt

df =pd.DataFrame({'x':np.random.normal(size=500),
                 'y':np.random.normal(size=500)})
sns.jointplot(x='x',y='y',data=df,kind='kde')
plt.show()
```

![image.png](https://s2.loli.net/2022/10/18/iDqNUcRkj94dTLt.png)

根据图形可以看出，双变量密度图是使用一些封闭 但是不规则的曲线来表示， 数据密度越高的地方颜色越深，数据密度越低的地方颜色越浅。

```python
g = sns.jointplot(data=x_data, x=x, y=y)
g.plot_joint(sns.kdeplot, color="r", zorder=0, levels=6)
g.plot_marginals(sns.rugplot, color="r", height=-.15, clip_on=False)
```

<img src="https://s2.loli.net/2022/10/19/GnqRkXT2xwi7zA4.png" alt="image.png" style="zoom:67%;" />

```python
sns.jointplot(
    data=x_data, x=x, y=y,
    marker="+", s=100, marginal_kws=dict(bins=25, fill=False),
)
```

<img src="https://s2.loli.net/2022/10/19/pYFLOQ8kD57rjzf.png" alt="image.png" style="zoom:67%;" />



# 第五节 多变量关系分布图

我们在做数据分析时面对的数据集中往往有很多列数据，在我们还没有确定针对哪两个变量进行挖掘的时候，比较稳妥的做法就是将数据中的**每两列都考虑一次**，做一个完整的变量关系可视化。

以著名的iris数据集为例，iris数据集有 4个特征，那么每两个**特征**都考虑一 次，就有16种组合

-  sepal length（花萼长度）
-  sepal width（花萼宽度）
-  petal length（花瓣长度）
-  petal width（花瓣宽度）
- species（花朵种类）--> 标签

我们使用seaborn中的`pairplot()`方法，就可以绘制连续数值型多变量关系分布图。 

代码片段:`sns.pairplot(data, hue, vars, kind, diag_kind)`

- **data**表示绘图所用到的数据集
- **hue**参数表示按照某个字段进行分类
- **vars**参数可以用于筛选绘制图像的变量，用**列表**的形式传入列名称
- **kind**参数用于设置变量间 图像的类型，可以选择 'scatter'散点图，或者 'reg'回归图
- **diag_kind**用于设置对角线上的图像类型，可以选择'hist'直方图， 或者'kde'核密度图（kernel density map）

从sklearn 中下载数据集：

```python
from sklearn import datasets
from pandas import DataFrame
import pandas as pd

x_data=datasets.load_iris().data    #特征集
y_data=datasets.load_iris().target  #标签集
print("鸢尾花特征数据集：\n",x_data)
print("鸢尾花标签数据集：\n",y_data)
x_data=DataFrame(x_data,columns=['sepal length','sepal width','petal length','petal width'])
pd.set_option('display.unicode.east_asian_width',True)
print("鸢尾花特征数据集：\n",x_data)


#下面是新增代码
x_data['species']=y_data  #在特征集上新增一列，特征，数据为 标签集 y_data
print("鸢尾花特征数据集：\n",x_data)
```

![image.png](https://s2.loli.net/2022/10/19/XQUf4hd3u9rTbNq.png)

```python
import seaborn as sns
sns.pairplot(x_data)
```

![image.png](https://s2.loli.net/2022/10/19/e6pYwHrId9MSBnA.png)

接下来我们将分类变量species考虑在图中，看看不同类别的鸢尾花的数据有没有明显的差别，将hue参数设置为species。 运行下方代码，查看结果：

```python
sns.pairplot(x_data,hue="species")
```

![image.png](https://s2.loli.net/2022/10/19/e3hRmpzDWObyUGn.png)

从图中可以看出，不同的颜色代表着花的不同种类，同一种的数据聚集在一起，并且与其他类别的数据交集比较少，**表示三 种花有明显的差别**。

我们也可以使用pairplot函数绘制两个变量的关系分布图。 使用kind参数设置两个变量间使用回归图，使用diag_kind 参数设置对角线上的图像类型为密度图。

```python
sns.pairplot(x_data,hue="species",vars=['sepal length', 'sepal width'],kind='reg',diag_kind='kde')
```

![image.png](https://s2.loli.net/2022/10/19/K2El9jS8ce63CvO.png)



# 练习

## 小动物的活跃时间分析

1. 导包并设置中文显示

   1. ```python
      import matplotlib.pyplot as plt
      import pandas as pd
      import numpy as np
      import seaborn as sns
      import matplotlib as mpl
      # windows 电脑中文配置
      mpl.rcParams['font.family'] = 'SimHei'
      ```

2. 读取绘图所需数据 'BCIspeed.csv' 并查看数据

   1. ```python
      df = pd.read_csv("./BCIspeed(1).csv")
      df.head()
      ```

   2. <img src="https://s2.loli.net/2022/10/19/57JfNoG8laUj6I1.png" alt="image.png" style="zoom:67%;" />

3. 我们发现time列的数据需要修改,修改一下time列让每行时间都*24,并查看修改后的数据

   1. ```python
      df['time'] = df['time']*24
      df.head()
      ```

   2. <img src="https://s2.loli.net/2022/10/19/DtdYlfwO2n4ivPZ.png" alt="image.png" style="zoom:67%;" />

4. 绘制出刺豚鼠(agouti)每天活跃的时间段

   1. ```python
      group = df.groupby('species')
      agouti = group.get_group('agouti')
      data = agouti['time']
      sns.set(style='darkgrid',font='SimHei')
      sns.distplot(data,kde=True)
      plt.xlabel('时间')
      plt.ylabel('频率占比')
      plt.title('刺豚鼠活跃时间')
      plt.xticks(range(24)[::2])
      plt.show()
      ```

   2. <img src="https://s2.loli.net/2022/10/19/1OphCUI4TGBsS98.png" alt="image.png" style="zoom:67%;" />

5. 查看刺豚鼠(agouti),南美浣熊(coati),短角小鹿(brocket) 之间的数据对比

   1. >
      > - 首先把豚鼠(agouti),南美浣熊(coati),短角小鹿(brocket) 从表中提取出来
      >     
      >     可以通过 isin 来判断这一列是否是需求的数据,判断这一列是否在列表中, 存在返回True
   
   2. ```python
      # 学到一个从某列中快速取出一些指定数据的方法：用isin:
      # 先把数据表的某一列指定出来，然后用isin 判断，把需要判断的 用一个列表表示出来
      data = df[df['species'].isin(['agouti','coati','brocket'])]
      sns.pairplot(data,hue='species')
      plt.show()
      ```
   
   3. <img src="https://s2.loli.net/2022/10/19/jnF9HUsPDl6ZIYi.png" alt="image.png" style="zoom:80%;" />

数据集地址:[点击跳转GitHub，可以下载](https://github.com/morang-chun/study-note/blob/main/%E6%96%87%E6%9C%AC%E5%88%86%E6%9E%90/code/%E5%B0%8F%E5%8A%A8%E7%89%A9%E4%BB%AC/BCIspeed(1).csv)

源代码地址：[源代码](https://github.com/morang-chun/study-note/blob/main/%E6%96%87%E6%9C%AC%E5%88%86%E6%9E%90/code/%E5%B0%8F%E5%8A%A8%E7%89%A9%E4%BB%AC/Exercises_and_Solutions(1).ipynb)




































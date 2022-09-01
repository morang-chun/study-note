# 机器学习

# 周一

```python
import pandas as pd
import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt
%matplotlib inline

#构建模拟数据
x=[i for i in range(1000)]   #特征
y=[15*x**2 + 3 + random.gauss(0,1) for x in x]

print(x)
print(y)

# 探索性分析
plt.scatter(x,y)

# 构建神经网络模型
model = tf.keras.Sequential()
model.add(tf.keras.layers.Dense(1,input_shape=(1,)))
model.add(tf.keras.layers.Dense(1))
model.add(tf.keras.layers.Dense(1))
#模型编译
model.compile(optimizer = tf.keras.optimizers.Adam(learning_rate=0.001),
             loss = 'mse',
             metrics = ['mse'])

#可视化训练过程
plt.plot(history.epoch[20:],history.history.get('loss')[20:])
```

如果在 X 与 y 的关系中，如果是一次的关系，这个地方是构建一个神经网络模型

```python
# 构建神经网络模型
model = tf.keras.Sequential()
model.add(tf.keras.layers.Dense(1,input_shape=(1,)))
model.add(tf.keras.layers.Dense(1))
```

如果是二次模型的话，就构建两个神经网络模型：

```python
# 构建神经网络模型
model = tf.keras.Sequential()
model.add(tf.keras.layers.Dense(1,input_shape=(1,)))
model.add(tf.keras.layers.Dense(1))
model.add(tf.keras.layers.Dense(1))
```
![xy的关系图](https://user-images.githubusercontent.com/109726121/187837862-96a993fe-f3cf-49ad-81cd-affa73af468a.png)


![二次深度学习可视化图](https://user-images.githubusercontent.com/109726121/187837886-d641f5fb-0f77-4893-9572-fa9c0a823b04.png)


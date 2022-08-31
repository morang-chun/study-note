#python
from pandas import Series,DataFrame

# 创建二维列表存储选手信息
lol_list = [['上单','Theshy',20],
            ['打野','小天',19],
            ['中单','Faker',23],
            ['ADC','Uzi',22],
            ['辅助','Ming',21]]

#创建DataFrame
df = DataFrame(data=lol_list,index=['a','b','c','d','e'],columns = ['位置','ID号','年龄'])
print(df)
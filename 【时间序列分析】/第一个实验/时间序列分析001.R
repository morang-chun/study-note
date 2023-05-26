# import stata file
# 导入包
library(foreign)
library(parallel)
#data <- read.xlsx("D:\data\A1_1.xlsx",
                  sheet="Sheet1")#读入数据
# 对数据进行数据运算
# 求和运算
#data_sum <-  apply(data,2,sum)
# 对数据进行 

df <- read.table('D:\data\A1_1.xlsx',sheet='sheet1')


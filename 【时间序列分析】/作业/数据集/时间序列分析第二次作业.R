# 

# 第一题
# 导入数据
data_1 <- read.table('clipboard',header=T)
data <- data_1$x
data
install.packages(aTSA, lib, repos = getOption("repos"), contriburl = contrib.url(repos, type))
# 导入aTSA包
library(aTSA)
plot(data)


adf.test(data)
Box.test(data)

acf(data)
pacf(data)

fit <- arima(data,order=c(1,0,0),include.mean = F)
fit
ts.diag(fit)

library(forecast)
forecast(fit,h=60)







# 第二题
data_1 <- read.table('clipboard',header=T)
data <- data_1$x
data

# 锟斤拷锟斤拷aTSA锟斤拷
library(aTSA)
plot(data)


adf.test(data)
Box.test(data)

acf(data)
pacf(data)

fit <- arima(data,order=c(0,0,1))
fit

ts.diag(fit)



library(forecast)
forecast(fit,h=60)

#第三题
data_1 <- read.table('clipboard',header=T)
data <- data_1$x
data


library(aTSA)
plot(data)


adf.test(data)
Box.test(data)

acf(data)
pacf(data)

fit <- arima(data,order=c(2,0,0))
fit
ts.diag(fit)


library(forecast)
forecast(fit,h=12)

#第四题
data_1 <- read.table('clipboard',header=T)
data <- data_1$x
data

# 锟斤拷锟斤拷aTSA锟斤拷
library(aTSA)
plot(data)


adf.test(data)
Box.test(data)

acf(data)
pacf(data)

fit <- arima(data,order=c(0,0,1))
fit
ts.diag(fit)

library(forecast)
forecast(fit,h=5)





#第六题
data_1 <- read.table('clipboard',header=T)
data <- data_1$x
data


library(aTSA)
plot(data)


adf.test(data)
Box.test(data)

acf(data)
pacf(data)

fit <- arima(data,order=c(1,0,0))
fit
ts.diag(fit)



library(forecast)
forecast(fit,h=5)


#第七题
data_1 <- read.table('clipboard',header=T)
data <- data_1$x
data


library(aTSA)
plot(data)


adf.test(data)
Box.test(data)

acf(data)
pacf(data)

fit <- arima(data,order=c(1,0,1))
fit
ts.diag(fit)



library(forecast)
forecast(fit,h=5)


#第八题
data_1 <- read.table('clipboard',header=T)
data <- data_1$x
data


library(aTSA)
plot(data)


adf.test(data)
Box.test(data)

acf(data)
pacf(data)

fit <- arima(data,order=c(1,0,1))
fit
ts.diag(fit)


library(forecast)
forecast(fit,h=1)




#第九题
data_1 <- read.table('clipboard',header=T)
data <- data_1$x
data


library(aTSA)
plot(data)


adf.test(data)
Box.test(data)

acf(data)
pacf(data)

fit <- arima(data,order=c(1,0,1))
fit
ts.diag(fit)

install.packages('forecast')
#install.packages('aTSA')

library(forecast)
forecast(fit,h=5)


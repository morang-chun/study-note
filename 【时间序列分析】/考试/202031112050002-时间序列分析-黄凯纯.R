# 202031112050002
# 黄凯纯
# 时间序列分析机考
# 2022-5-23


# 第一题
d1 <- read.table('clipboard',header = T)
d1
co2<-ts(E2_2$co2,start=c(1975,1),frequency = 12)
# 导入包
library(aTSA)
plot(co2,type="o")
acf(co2,lag.max = 24)$acf
adf(co2)


# 第二题
d2 <- read.table('clipboard',header = T)
d2
x<-ts(d2$x)
x
library(aTSA)
plot(x)
adf.test(x)
Box.test(x)
acf(x)
pacf(x)
fit<-arima(x,order=c(1,0,0),include.mean =F)
fit
ts.diag(fit)
library(forecast)
forecast(fit,h=60)

#第三题
# 先导入数据：
d3 <- read.table('clipboard',header = T)
d3
x<-ts(d3$volume,start=1949)
x
#  绘制图形
par(mfrow=c(1,2))
plot(x)
plot(diff(x))
adf.test(diff(x))
Box.test(diff(x))
acf(diff(x))
pacf(diff(x))
fit<-Arima(x,order=c(1,1,0),include.drift=T)
fit
tsdiag(fit)
fore<-forecast(fit,h=5)
fore
par(mfrow=c(1,1))
plot(fore)
lines(fore$fitted,col=2)



# 第四题
d4 <- read.table('clipboard',header = T)
d4
x<-ts(d4$x,start=c(1948,1),frequency =4)
plot(x)
fit1<-HoltWinters(x,gamma=F)
fit1
library(aTSA)
adf.test(diff(x))
adf.test(diff(diff(x)))
acf(diff(diff(x)))
pacf(diff(diff(x)))
fit2<-Arima(x,order=c(0,2,16),transform.pars=F, fixed=c(NA,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NA))
fit2
c(mean((x-fit1$fit[1])^2),mean(fit2$residuals^2))
library(forecast)
fore<-forecast::forecast(fit2,h =20)
plot(fore)
lines(fore$fitted,col=2)




#第五题
d5 <- read.table('clipboard',header = T)
d5
x<-ts(d5$x)
y<-ts(d5$y)
par(mfrow=c(1,2))
plot(x)
plot(y,col=2)
library(aTSA)
adf.test(x)
adf.test(y)
for(i in 1:6) print(Box.test(x,lag=3*i))
adf.test(y)
for(i in 1:6) print(Box.test(y,lag=3*i))




#第六题
d6 <- read.table('clipboard',header = T)
d6
library(forecast)
library(aTSA)
x1<-ts(d6$maize_price,start=1967);
x2<-ts(d6$maize_yield,start=1967);
x3<-ts(d6$pig_price,start=1967);
x4<-ts(d6$pig_yield,start=1967);
x5<-ts(d6$salary,start=1967)
plot(x1)
adf.test(x1)
adf.test(diff(x1))
plot(x2)
adf.test(x2)
adf.test(diff(x2))
plot(x3)
adf.test(x3)
adf.test(diff(x3))
plot(x4)
adf.test(x4)
adf.test(diff(x5))
plot(x5)
adf.test(x5)
adf.test(diff(x5))
X<-data.frame(x1,x2,x3,x4)
X<-as.matrix(X)
coint.test(x5,X,d=1)
fit<-arima(x5,xreg=data.frame(x1,x3,x4),order=c(3,0,0),transform.pars =T,fixed=c(NA,0,NA,NA,NA,NA,NA))
fit
ts.diag(fit)
ecm(x5,as.matrix(data.frame(x1,x3,x4)))


plot(x3)
adf.test(diff(x3))
X <- data.frame(x1,x2,x4,x5)
X <- as.matrix(X)
coint.test(X3,X,d=1)
fit <- arima(x3,xreg = data.frame(x1,x2,x4),older=c(1,0,0),transform.pars = T,
             fixed = c(NA,0,NA,NA,NA,0))
ts.diag(fit)
fit
ecm(x3,as.matrix(data.frame(x1,x2,x4)))






# 老师的邮箱
892593494



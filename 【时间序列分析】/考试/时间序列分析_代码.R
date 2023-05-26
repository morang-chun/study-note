# 时间序列分析

# 第二章
#第一题2.1
x <- 1:20
x <- ts(x)
plot(x,type='o')
adf.test(x)
acf(x)$acf
Box.test(x)
# 答案：
# 1）非平稳，有典型线性趋势
# (2)延迟1-6阶自相关系数如下:
# [1,]  1.00000000
#[2,]  0.85000000
#[3,]  0.70150376
#[4,]  0.55601504
#[5,]  0.41503759
#[6,]  0.28007519
#[7,]  0.15263158

# 3）典型的具有单调趋势的时间序列样本自相关图

# 第二题2.2
#夏威夷火山
#先读入数据文件
#E2_2 <- read.xlsx('D:/computer-b50f111a/cloud/Desktop/时间序列分析/E2_2')
E2_2 <- read.table('clipboard',header = T)
E2_2
co2<-ts(E2_2$co2,start=c(1975,1),frequency = 12)
plot(co2,type="o")
acf(co2)$acf

# 第三题2.3
#先读入数据文件
E2_3 <- read.table('clipboard',header = T)
E2_3
rain<-ts(E2_3$rain,start=c(1945,1),frequency = 12)
plot(rain, type="o")
acf(rain,lag.max=24)$acf
for(i in 1:6) 
  print(Box.test(rain,lag=3*i))

# 第四题2.4
#R命令
Q_test<-function(n,r0){
  k<-length(ro)
  Q=0
  P=0
  for(i in 1:k){
    Qij<-n*sum(ro[1:i]^2)
    P[i]<-1-pchisq(Q[i],df=i)
  }
  return(data.frame(Q,P))
}
ro<-c(0.02,0.05,0.1,-0.02,0.05,0.01,0.12,-0.06,0.08,-0.05,0.02,-0.05)
Q_test(100,ro)
    

# 第五题2.5
E2_5 <- read.table('clipboard',header = T)
E2_5
x<-ts(E2_5$x,star=c(2000,1))
par(mfrow=c(1,2))
plot(x,type="o")
acf(x)
for(i in 1:2) print(Box.test(x,lag=3*i))
  
# 第六题2.6
E2_6 <- read.table('clipboard',header = T)
x<-ts(E2_6$x)
x
plot(x)
acf(x)
library(aTSA)
adf.test(y)
for(i in 1:2) print(Box.test(x,lag=3*i))
y<-diff(x)
adf.test(y)
for(i in 1:2) print(Box.test(y,lag=3*i))


# 第七题2.7
E2_7 <- read.table('clipboard',header = T)
E2_7
x<-ts(E2_7$mortality)
library(aTSA)
par(mfrow=c(1,2))
plot(x)
acf(x,lagmax =24)
adf.test(x)
for(i in 1:2) print(Box.test(x,lag=3*i))
adf.test(diff(x))
for(i in 1:2) print(Box.test(diff(x),lag=3*i))

# 第八题2.8
E2_8 <- read.table('clipboard',header = T)
E2_8
x<-ts(E2_8$wl)
x
par(mfrow=c(1,2))
plot(x,type='o')
library(aTSA)
acf(x,lagmax =24)
adf.test(x)
for(i in 1:2) print(Box.test(x,lag=3*i))
adf.test(diff(x))
for(i in 1:2) print(Box.test(diff(x),lag=3*i))

# 第三章
#第十六题
E2_7 <- read.table('clipboard',header = T)
E2_7
x<-ts(E2_7$mortality)
library(aTSA)
par(mfrow=c(1,2))
plot(x)
acf(x,lagmax =24)
adf.test(x)
for(i in 1:2) print(Box.test(x,lag=3*i))
adf.test(diff(x))
for(i in 1:2) print(Box.test(diff(x),lag=3*i))


#第四章
#第一题4.1
E4_1 <- read.table('clipboard',header = T)
E4_1
x<-ts(E4_1$x)
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
fore <- forecast(fit,h=60)
fore
#plot(fore)

# 4.2 
E4_2 <- read.table('clipboard',header = T)
E4_2
x<-ts(E4_2$x)
x
library(aTSA)
plot(x)
adf.test(x)
Box.test(x)
acf(x)
pacf(x)
fit<-arima(x,order=c(0,0,1))
fit
ts.diag(fit)
library(forecast)
forecast(fit,h=5)

# 4.3
E4_3 <- read.table('clipboard',header = T)
E4_3
x<-ts(E4_3$x)
x
library(aTSA)
plot(x)
adf.test(x)
Box.test(x)
acf(x)
pacf(x)
fit<-arima(x,order=c(2,0,0))
fit
ts.diag(fit)
library(forecast)
forecast(fit,h=12)


#4.4
E4_4 <- read.table('clipboard',header = T)
E4_4
x<-ts(E4_4$x)
x
library(aTSA)
plot(x)
adf.test(x)
Box.test(x)
acf(x)
pacf(x)
fit<-arima(x,order=c(0,0,1))
fit
ts.diag(fit)
library(forecast)
forecast(fit,h=5)

# 4.6
E4_6 <- read.table('clipboard',header = T)
E4_6
x<-ts(E4_6$x)
x
library(aTSA)
plot(x)
adf.test(x)
Box.test(x)
acf(x)
pacf(x)
fit<-arima(x,order=c(1,0,0))
fit
ts.diag(fit)
library(forecast)
forecast(fit,h=5)

# 4.7
E4_7 <- read.table('clipboard',header = T)
E4_7
x<-ts(E4_7$x)
x
library(aTSA)
plot(x)
adf.test(x)
Box.test(x)
acf(x)
pacf(x)
fit<-arima(x,order=c(1,0,1))
fit
ts.diag(fit)
library(forecast)
forecast(fit,h=5)

# 4.8
E4_8 <- read.table('clipboard',header = T)
E4_8
x<-ts(E4_8$x)
library(aTSA)
plot(x)
adf.test(x)
Box.test(x)
acf(x)
pacf(x)
fit<-arima(x,order=c(0,0,1))
fit
ts.diag(fit)
library(forecast)
forecast(fit,h=1)

# 4.9
E4_9 <- read.table('clipboard',header = T)
E4_9
x<-ts(E4_9$x)
x
library(aTSA)
plot(x)
adf.test(x)
Box.test(x)
acf(x)
pacf(x)
fit<-arima(x,order=c(4,0,1),transform.pars = F,fixed=c(0,0,NA,NA,NA,NA))
fit
ts.diag(fit)
library(forecast)
forecast(fit,h=5)

# 5.1
E5_1 <- read.table('clipboard',header = T)
E5_1
x<-ts(E5_1$volume,start=1949)
x
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

# 5.2 
E5_2 <- read.table('clipboard',header = T)
E5_2
x<-ts(E5_2$birth_rate,start=1750)
plot(x)
adf.test(x)
Box.test(x)
par(mfrow=c(1,2))
acf(x)
pacf(x)
fit<-arima(x,order=c(1,0,0))
fit

#5.3
E5_3 <- read.table('clipboard',header = T)
E5_3
x<-ts(E5_3$number,start=1867)
x
par(mfrow=c(1,2))
plot(x)
plot(diff(x))
adf.test(diff(x))
Box.test(diff(x))
acf(diff(x))
pacf(diff(x))
fit1<-Arima(x,order=c(3,1,0),include.drift=T)
fit1
fit2<-arima(x,order=c(3,1,0),transform.pars = F,fixed=c(NA,0,NA))
fit2
tsdiag(fit2)
fore<-forecast(fit2,h=7)
fore
par(mfrow=c(1,1))
plot(fore)
lines(fore$fitted,col=2)

# 5.4 
E5_4 <- read.table('clipboard',header = T)
E5_4
x1<-ts(E5_4$birth_rate,start=1980)
x2<-ts(E5_4$mortality,start=1980)
x3<-ts(E5_4$ngr,start=1980)
x1
x2
x3

par(mfrow=c(1,2))
plot(x1)
plot(diff(x1))
adf.test(diff(x1))
for(i in 1:6) print(Box.test(diff(x1),i))
acf(diff(x1))
pacf(diff(x1))
fit11<-arima(x1,order=c(0,1,0))
fit12<-arima(x1,order=c(0,1,1))
fit13<-arima(x1,order=c(1,1,0))
c(AIC(fit11),AIC(fit12),AIC(fit13),BIC(fit11),BIC(fit12),BIC(fit13))
fit12
fore1<-forecast(fit12,h=10)
fore1

plot(x2)
plot(diff(x2))
adf.test(diff(x2))
for(i in 1:6)print(Box.test(diff(x2),i))
acf(diff(x2))
pacf(diff(x2))
fit21<-arima(x2,order=c(0,1,0))
fit22<-arima(x2order=c(0,1,1))
fit23<-arima(x2,order=c(1,1,0))
c(AIC(fit21),AIC(fit22),AIC(fit23),BIC(fit21),BIC(fit22),BIC(fit23))
fore2<-forecast(fit21,h=10)
fore2

plot(x3)
plot(diff(x3))
adf.test(diff(x3))
for(i in 1:6) print(Box.test(diff(x3),i))
acf(diff(x3))
pacf(diff(x3))
fit31<-arima(x3,order=c(0,1,0))
fit32<-arima(x3,order=c(0,1,1))
fit33<-arima(x3,order=c(1,1,0))
c(AlC(fit31),AIC(fit32),AlC(fit33),BiC(fit31),BIC(fit32),BIC(fit33))
fit32
fore3<-forecast(fit32,h=10)
fore3


# 5.5
E5_5 <- read.table('clipboard',header = T)
E5_5
maize_price <-ts(E5_5$maize_price,start=1867)
maize_yield <-ts(E5_5$maize_yield,start=1867)
wages <-ts(E5_5$wages,start=1867)
pig_price <-ts(E5_5$pig_price,start=1867)
pig_yield <-ts(E5_5$pig_yield,start=1867)

par(mfrow=c(1,2))
plot(maize_price)
plot(maize_yield)
plot(wages)
plot(pig_price)
plot(pig_yield)

plot(diff(maize_price))
plot(diff(maize_yield))
plot(diff(wages))
plot(diff(pig_price))
plot(diff(pig_yield))

adf.test(diff(maize_price))
adf.test(diff(maize_yield))
adf.test(diff(wages))
adf.test(diff(pig_price))
adf.test(diff(pig_yield))

#Box.test(diff(x))
#acf(diff(x))
#pacf(diff(x))
# 对玉米价格拟合序列：
fit1<-Arima(maize_price,order=c(0,1,(7)),transform.pars = F,fixed=c(0,0,0,0,0,0,NA))
fit1
fore1<-forecast(fit1,h=10)
fore1
plot(fore1)
lines(fore1$fitted,col=2)

# 对玉米产量拟合
fit2<-Arima(maize_yield,order=c(0,1,1),include.drift=T)
fit2
fore2<-forecast(fit1,h=10)
fore2
plot(fore2)
lines(fore2$fitted,col=2)

# 对工人薪水预测
fit3<-Arima(wages,order=c(13,1,0),transform.pars = F,fixed=c(NA,0,0,0,0,0,0,0,0,0,0,0,NA))
fit3
fore3<-forecast(fit1,h=10)
fore3
plot(fore3)
lines(fore3$fitted,col=2)

# 对生猪价格预测
fit4<-Arima(pig_price,order=c(3,1,0),include.drift=T)
fit4
fore4<-forecast(fit1,h=10)
fore4
plot(fore4)
lines(fore4$fitted,col=2)

# 对生猪产量预测
fit5<-Arima(pig_yield,order=c(5,1,0),transform.pars = F,fixed=c(0,NA,NA,0,NA))
fit5
fore5<-forecast(fit1,h=10)
fore5
plot(fore5)
lines(fore5$fitted,col=2)


# 6.1
E6_1 <- read.table('clipboard',header = T)
E6_1
x<-ts(E6_1$x,start=c(1962,1),frequency = 12)
x
plot(x)
fit1<-decompose(x)
fit1$trend
plot(fit1$trend)
fit1$figure
plot(1:12,fit$figure,type="o",xlab="Month")
fit2<-HoltWinters(x)
fit2
library(forecast)
fore<-forecast(fit2,h=24)
fore
plot(fore)
lines(fore$fitted,col=2)
acf(diff(x))
pacf(diff(x))
fit3<-arima(x,order=c(1,1,0),seasonal = list(order=c(0,1,1),period=12))
fit3
plot(x)
lines(fitted(fit3),col=2)
c(mean(na.exclude(fit1$random)^2),mean((x-fit2$fit[,1])^2),mean(fit3$residuals^2))

# 6.2
E6_2 <- read.table('clipboard',header = T)
E6_2
x<-ts(E6_2$x,start=c(1962,1),frequency = 12)
x
plot(x)
fit1<-decompose(x)
fit1$trend
plot(fit1$trend)
fit1$figure
plot(1:12,fit$figure,type="o",xlab="Month")
fit2<-HoltWinters(x)
fit2
library(forecast)
fore<-forecast(fit2,h=24)
fore
plot(fore)
lines(fore$fitted,col=2)
acf(diff(x))
pacf(diff(x))
fit3<-arima(x,order=c(1,1,0),seasonal = list(order=c(0,1,1),period=12))
fit3
plot(x)
lines(fitted(fit3),col=2)
c(mean(na.exclude(fit1$random)^2),mean((x-fit2$fit[,1])^2),mean(fit3$residuals^2))


# 6.6 
E6_6 <- read.table('clipboard',header = T)
E6_6
x<-ts(E6_6$x,start=c(1973,1),frequency =12)
x
plot(x)
fit1<-HoltWinters(x,gamma=F)
fit1
acf(diff(x))
pacf(diff(x))
fit2<-arima(x,order=c(1,1,0))
fit2
c(mean((x-fit1$fit[1])^2),mean(fit2$residuals^2))
library(forecast)
fore<-forecast(fit2,h=24)
plot(fore)
lines(fore$fitted,col=2)


# 6.7 
E6_7 <- read.table('clipboard',header = T)
E6_7
x<-ts(E6_7$x,start=c(1948,1),frequency =4)
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
c(mean((x-fit1$fit[1])^2),mean(fit2$residuals^2))library(forecast)
fore<-forecast::forecast(fit2,h =20)
fore
plot(fore)
lines(fore$fitted,col=2)

# 6.8
E6_8 <- read.table('clipboard',header = T)
E6_8
x<-ts(E6_8$x,start=c(1980,1),frequency =12)
plot(x)
fit1<-decompose(x)
plot(fit1)
fit2<-HoltWinters(x)
fit2
library(forecast)
fore1<-forecast::forecast(fit2,h =60)
plot(fore1)
lines(fore1$fitted,col=2)
library(aTSA)
adf.test(diff(diff(x,12)))
fit3<-Arima(x,order=c(2,1,0),seasonal = list(order=c(0,1,1),period=12))
fit3
fore2<-forecast::forecast(fit3,h =60)
plot(fore2)
lines(fore2$fitted,col=2)

# 6.9
E6_9 <- read.table('clipboard',header = T)
E6_9
x<-ts(E6_9$x,start=c(1963,1),frequency = 12)
plot(x)
fit1<-HoltWinters(x,seasonal ="multi")
fit1
library(forecast)
fore1<-forecast::forecast(fit1,h =60)
plot(fore1)
lines(fore1$fitted,col=2)
library(aTSA)
adf.test(diff(diff(x,12)))
fit2<-Arima(x,order=c(1,1,1),seasonal = list(order=c(0,1,1),period=12))
fit2
fore2<-forecast::forecast(fit2,h =60)
plot(fore2)
lines(fore2$fitted,col=2)

# 7.1
E7_1 <- read.table('clipboard',header = T)
E7_1
x<-ts(E7_1$x)
y<-ts(E7_1$y)
par(mfrow=c(1,2))
plot(x)
plot(y,col=2)
library(aTSA)
adf.test(x)
adf.test(y)
for(i in 1:6) print(Box.test(x,lag=3*i))
adf.test(y)
for(i in 1:6) print(Box.test(y,lag=3*i))

# 7.2
E7_2 <- read.table('clipboard',header = T)
E7_2
library(forecast)
library(aTSA)
x<-ts(E7_2$x)
y<-ts(E7_2$y)
plot(x)
lines(y,col=2)
x1<-x[-c(1,2)]
y1<-y[-c(37,38)]
fit<-Arima(y1,xreg=x1,order=c(2,0,0))
fit
tsdiag(fit)
acf(diff(x,10))
pacf(diff(x,10))
fitx<-arima(x,order=c(2,0,0),seasonal = list(order=c(0,1,1),period=10))
fitx
ts.diag(fitx)
forex<-forecast::forecast(fitx,h=14)
forex
plot(forex)
lines(forex$fitted,col=2)
forey<-forecast::forecast(fit,xreg=forex$mean,h=14)
forey
plot(forey)
lines(forey$fitted,col=2)

# 7.3
E7_3 <- read.table('clipboard',header = T)
E7_3
library(forecast)
library(aTSA)
x<-ts(E7_3$x,start=1950)
y<-ts(E7_3$y,start=1950)
plot(x)
lines(y,col=2)
acf(diff(diff(x)))
pacf(diff(diff(x)))
fitx<-arima(x,order=c(0,2,0))
fitx
ts.diag(fitx)
acf(diff(diff(y)))
pacf(diff(diff(y)))
fity<-arima(y,order=c(2,2,0),transform.pars = F,fixed=c(0,NA))
fity
ts.diag(fity)
coint.test(y,x)
fit<-Arima(y,xreg=x,order=c(2,0,0))
fit
tsdiag(fit)
ecm(y,x)

# 7.4
E7_4 <- read.table('clipboard',header = T)
E7_4
library(forecast)
library(aTSA)
x<-ts(E7_4$x,start=1979)
y<-ts(E7_4$y,start=1979)
plot(x)
plot(y)
acf(diff(diff(x)))
pacf(diff(diff(x)))
fitx<-arima(x,order=c(3,2,0),transform.pars = F,fixed=c(0,0,NA))
fitx
ts.diag(fitx)
forex<-forecast::forecast(fitx,h=5)
forex
acf(diff(diff(y)))
pacf(diff(diff(y)))
fity<-arima(y,order=c((2),2,0),transform.pars = Ffixed=c(0,NA))
fity
ts.diag(fity)
forey<-forecast::forecast(fity,h=5)
forey
coint.test(y,x)

# 7.5
E7_5 <- read.table('clipboard',header = T)
E7_5
library(aTSA)
Seatbelts
drivers<-Seatbelts[,2]
drivers
front<-Seatbelts[,3]
rear<-Seatbelts[,4]
kms<-Seatbelts[,5]
petroprice<-Seatbelts[,6]
law<-Seatbelts[,8]
X<-matrix(Seatbelts[c(5,6,8)],ncol=3)
Y<-matrix(Seatbelts[,c(3,4)],ncol=2)
length(drivers)
length(x)
length(y)
coint.test(drivers,X)
fit1<-arima(drivers,xreg=data.frame(petroprice,law),order=c(2,0,0),seasonal =list(order=c(1,1,0),period=12))
fit1
ts.diag(fit1)
coint.test(front,X)
fit2<-arima(front,xreg=data.frame(petroprice,law),order=c(2,0,0),seasonal =list(order=c(1,1,0),period=12))
fit2
ts.diag(fit2)
coint.test(rear,X)
fit3<-arima(rear,xreg=data.frame(kms,petroprice),order=c(1,0,0),seasonal =list(order=c(1,1,0),period=12))
fit3
ts.diag(fit3)
Y<-matrix(Seatbelts[,c(3,4)],ncol=2)
coint.test(drivers,Y)

# 7.6
E7_6 <- read.table('clipboard',header = T)
E7_6
library(forecast)
library(aTSA)
x1<-ts(E7_6$maize_price,start=1967);
x2<-ts(E7_6$maize_yield,,start=1967);
x3<-ts(E7_6$pig_price,start=1967);
x4<-ts(E7_6$pig_yield,start=1967);
x5<-ts(E7_6$salary,start=1967)
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


# 7.7
E7_7 <- read.table('clipboard',header = T)
E7_7
library(forecast)
library(aTSA)
logM1<-ts(E7_7$logM1,start=c(1954,4),frequency=4);
logGDP<-ts(E7_7$logGNP,start=c(1954,4),frequency=4);
sr<--ts(E7_7$sr,start=c(1954,4),frequency=4);
lr<-ts(E7_7$lr,start=c(1954,4),frequency=4);
plot(logM1)
adf.test(logM1)
adf.test(diff(logM1))
acf(diff(logM1))
pacf(diff(logM1))
fit1<-arima(logM1,order=c(1,1,0))
fit1
ts.diag(fit1)
plot(logGDP)
adf.test(logGDP)
adf.test(diff(logGDP))
acf(diff(logGDP))
pacf(diff(logGDP))
fit2<-arima(logGDP,order=c(2,1,1))
fit2
ts.diag(fit2)
plot(sr)adf.test(sr)
adf.test(diff(sr))
acf(diff(sr))
pacf(diff(sr))
fit3<-arima(sr,order=c(7,1,1),transform.pars = F, fixed=c(0,NA,0,0,0,0,NA,NA))
fit3
ts.diag(fit3)
plot(lr)
adf.test(lr)
adf.test(diff(lr))
acf(diff(lr))
pacf(diff(lr))
fit4<-arima(lr,order=c(14,1,0),transform.pars = F,fixed=c(NA,0,0,0,0,0,0,0,0,0,0,0,0,NA))
fit4
ts.diag(fit4)
lagGNP<-lag(logGDP)
y<-logGDP[1:134]
X<-data.frame(logM1[1:134],sr[1:134],lr[1:134],lagGNP[2:135])
X<-as.matrix(X)
coint.test(y,X)
fit<-arima(y,xreg=data.frame(sr[1:134],lr[1:134],lagGNP[2:135]))
fit
ts.diag(fit)
ecm(y,as.matrix(data.frame(sr[1:134],r[1:134],lagNP[2:135])))





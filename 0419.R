6/2
11+3

x <- 10 
y<- 3
x+y
x-y
x1<-c(10,9,"7")
is.numeric(x1)

y2<-c("사과라떼","고구마라떼","딸기라떼")
y2<-1:10 #연속데이터
y2 ; x1

var1 <- c(1,2,5,7)
var1

var2 <- c(1:5)
var2

var1 + var2

var3<- seq(1,5)
var3

var4 <- seq(1,10,by =3)
var4

# A를 세번 반복해라
v1  = rep("A",times = 3); v1
#A,b를 세번 반복해라 
v2 = rep(c("A","b"),times=3) ; v2

print("Hello world")

#머신러닝 트레이닝/ 1부터 10까지 5개 임의로 출력
sample(1:10,5)
# replace 똑같은 숫자가 나와도 됌 True
# prob 비율 끝자리가 가면갈수록 많아짐 
sample(1:7,5, replace=True, prob=1:7)

# as.numeric 하면 문자로되어있는 숫자를 강제로 숫자로 바꿔서 계산 시켜줌
 
x <- c(1,2,3)
x

mean(x)
max(x)
min(x)
summary(x)

#해당 변수를 삭제하는 함수 rm(x) /변수 전부지워 rm(list=ls()) ls는 목록 
# C + L 하면 콘솔창 정리 

x <- c(20:30)
# [] 인덱스
x[1]
x[3]
x[-1] # 1만 빼고 다나와
x[-3:-5]
rm(list=ls())



install.packages("ggplot2")
library(ggplot2)
str(airquality)
ggplot(airquality,aes(x=Day, y=Temp))+ geom_boxplot()

is. #너 문자냐?
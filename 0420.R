is. #너 문자냐?


A<- c(1,4,5,"10")
A
class(A) #class 형식이 뭐냐 
as.numeric(A) #강제로 숫자로 바꿔서 계산해라 근데 A에 덮어쓰지 않아서 
class(A) #이거하면 다시 캐릭터로 나옴 

rm(A) #변수 지우기
rm(list = ls())
ls # 변수 목록 

install.packages("ggplot2") #시각화 패키지 
library(ggplot2)
search() # 현재 로드된/ 설치된 패키지 확인
remove.packages("ggplot2") #패키지 삭제 


setwd() #디렉토리 바꿔주기
setwd("c:/ken/") #\\역슬러시 쓸거면 두 개를 써야함 / 슬러시는 하나도 가능
getwd() #현재 디렉토리 확인
dir() #파일 확인 


# 주석 주석 주석 Ctrl + shift +C
.libPaths() #R의 라이브러리 경로

b <- seq(3,10,by=2) #3에서 10까지 2씩 증가 
plot(b)

#반복 
rep( c("A","B","c"), times=2) #한바퀴(기본 순회)
#ABC ABC
rep( c("A","B","c"), each=3) #각각 순회
#AAA BBB CCC

var1 <- c("새우깡","감자깡","고구마깡","맛동산")
var1[-2:-4] #2번부터 4번까지 2,3,4번 빼줘
var1[-c(1,3)] # 1번 3번 빼줘


#통계
v11<- c(70,80,65,80)
sum(v11) #합계

mean(v11) #평균

median(v11) #중앙값

var(v11) #분산

sd(v11) #표준편차

#기초통계
summary(v11)
#박스플롯
boxplot(v11)

v12<- c(70,80,65,80,NA)
sum(v12,na.rm = T) #결측치를 빼고 계산
mean(v12,na.rm = T)

#1부터 10까지 중복되는 데이터를 임의로 5개 추출
day1 <- sample(1:10,5, replace= T)
day1
sort(day1) #기본값 오름차순 정렬 
sort(day1,decreasing = T ) #내림차순

#5보다 작은 위치 번째 출력
day1
which(day1<=6)
#위치의 인덱스 값(원래의 값) 출력하려면 변수를 앞에 빼고 대괄호로 묶어줌
day1[which(day1<=6)]
#큰 값 위치 출력
which.max(day1)
which.min(day1)

name <-c("김지훈","이유진","박동현","김민지")
eng<-c(90,80,60,70)
math<-c(50,60,100,20)
#데이터 프레임 생성하기/ 숫자를 맞춰야함 4개면 변수 3개 모두 4개 데이터값
table<-data.frame(name,eng,math)
table
str(table)

#table $키값쓰면 값이 나옴
table$name


###엑셀 불러오기
install.packages("readxl")
library(readxl)
#엑셀 읽어오는 함수 사용
excel_ex <-read_excel("c:/ken/data/1.xlsx")
#시트가 여러개있을 때 , sheet=2
excel_ex <-read_excel("c:/ken/data/1.xlsx", sheet =3 )
excel_ex

#행렬 생성하기
x <- c(1,2,3,4,5,6)
matrix(x, nrow=2, ncol =3)
matrix(x, nrow = 3, ncol = 2)

#dim은 면 차원수 array는 배열
y<- c(1,2,3,4,5,6)
array(y,dim= c(2,2,3))

#리스트 list
list1 <- list(c(10,20,30),"Hello")
list1
list1[[1]][3] #[[1]]은 전체를 가져오고, 뒤에 [3]을 붙이면 그 리스트 안에서 두번째꺼 가져오는거
list1[[2]][2] #없으면 결측값이 나옴

a<- 1:10 #벡터 단일 1차원 데이터
b<-matrix(a,ncol=2) #매트릭스 단일 2차원 데이터
c<- data.frame(a,b=11:20) #데이터프레임 다중 2차원
d<-list(a,b,c)
d

#77p 문제
ID<- c("1","2","3","4","5")
MID_EXAM <- c(10,20,100,75,30)
CLASS<-c("1반","2반","3반","1반","2반")

example_test<- data.frame(ID,MID_EXAM,CLASS)
example_test

df_midterm1 <- data.frame(english= c(90,80,60,70),
                          math1 = c(50,60,100,20),
                          class1 = c(1,1,2,2))
#특정행/열 더하기
apply(df_midterm1,1,sum) #행 328 krdi #심플하게 몽땅 더함
apply(df_midterm1,2,sum) #열

#기준열을 통한 합산
aggregate(math1~class1,data=df_midterm1,sum) #~class1(기준)별로 수학점수 합 구하기-> 필드명을 정할수있음
aggregate(math1~class1,data=df_midterm1,mean)#학급별 영어점수 평균을 구하여라 
aggregate(.~class1,data=df_midterm1,mean) #영어점수 수학점수 모두 나옴->학급별 전과목 평균 구하기/ .은 전체  

###### 데이터 샘플링 데이터가 부족할때
rnorm(100,80,5) #랜덤으로 100개 평균 80으로 
round(rnorm(100,80,5)) # round 반올림
rnorm_DB <- round(rnorm(100,80,5),0) #정수로 표현하기

#엑셀로 저장하기
write.csv(rnorm_DB,"data/rnorm_DB.csv",row.names=F) #row.names=F ->불필요한 열 제거

k1<- c(5,40,50:52)
k2<- c(30,5,6:8)

mc<- cbind(k1,k2); mc #cbind 기본 아래
mr<- rbind(k1,k2);mr #오른쪽에 쭉~~

#팩터 변환
rm(list=ls())
#팩터 생성
fe_test <- factor(c("C","B","A")) #알파벳으로 순서를 정하게 됨. 3 2 1 
str(fe_test) #속성은 팩터

a<- factor(fe.factor,levels=c("C","B","A")) #레벨은 순서를 변경함
str(a)
          
is.factor(fe.factor) #이거 팩터야? 팩터인지 체크 
as.numeric(fe.factor) #강제로 계산하게되면 원래 번호로 됨
as.character(fe.factor) #강제 문자로 변환 

data(iris)
head(iris) # 1111은 벡터값임


######################문제 1번 ##########################

v1<- c(1:10)
v2<-v1*2
max_v <-max(v2)
min_v<-min(v2)
avg_v<-mean(v2)
sum_v<-sum(v2)
v3<-v2[-5]

v1
v2
v3
max_v
min_v
avg_v
sum_v

######################문제 2번 ##########################

v4<-seq(1,10,by=2)
v5<-rep(1,4)
v6<-rep (c(1,2,3),time=3)
v7<-rep (c(1,2,3,4),each=2)
v8<-rep (c("A","B"),each=2)

v4
v5
v6
v7
v8

######################문제 3번 ##########################
nums <- sample(1:100,10, replace= F)
which(nums>50)
which(nums<=50)
which.max(nums)
which.min(nums)
sort(nums) 
sort(nums,decreasing = T ) 

######################문제 4번 ##########################
v9<-seq(1,10,by=3)
name<-c("A","B","C","D")
data.frame(name,v9)

######################문제 5번 ##########################
score1 <- sample(1:20,5, replace= F)
Friends<- c("둘리","또치","도우너","희동","듀크")
scores<-data.frame(score1,Friends)
scores


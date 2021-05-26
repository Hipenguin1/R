
#####################rnorm##############################

# 50개의 평균 75 편차 3
rnorm_3 <- rnorm(50,75,3) #랜덤으로 50개 뽑는데, 평균 75로 편차 3
plot(rnorm_3)
hist(rnorm_3)
# 50개 평균 75 편차 15
rnorm_15<- rnorm(50,75,15)
plot(rnorm_15)
hist(rnorm_15)

#par 그래프 모양을 다양하게 조절할수있는 함수

#par(mfrow=c(행의 수,열의 수)) # mfrow한 창에 그래프 다중
#차례대로 입력해줘야함 컨트롤 + 엔터
par(mfrow=c(1,2)) #양쪽으로 그래프 두개 2,1 세로로 두 개 
hist(rnorm_3)
hist(rnorm_15)



#################################################################

nums = round(rnorm(5,75,15),0)
# 48 67 102 74 62

# 50보다 큰 원소들의 값
nums[which(nums>=60)]
# 비교연산자 같지않다 != 엑셀 <> / >= <=

#최소 최대값 인덱스 찾기
which.min(nums)
which.max(nums)

#정렬
sort(nums) #오름
sort(nums,decreasing=T) #내림

#### nums 항목명의 이름 정의 names(변수)를 사용함  ######

names(nums) <- c("A","B","C","D","E")
nums
#객체에 이름만 추출할 때 names(x)

######################문제5#########################

score1<-sample(1:20,5)
Friends<- c("둘리","또치","도우너","희동","듀크")

Friends[which.max(score1)] 
Friends[which.min(score1)]
Friends[which(score1>10)]

#rowdata 원본데이터 반정형데이터


############################0421######################################

exam <- read.csv("data/csv_exam.csv") ; exam
getwd() #현재 작업 디렉토리 경로

#대괄호안 쉽표 기준, 왼쪽에 행번호(인덱스)입력 

exam[] # 조건 없이 전체 데이터 출력 

#인덱스: 데이터의 위치 또는 순서를 의미하는 값
#인덱싱: 인덱스를 이용해 데이터를 추출하는 작업

exam[c(1,4,5)] #1,4,5열만 추출 id eng science
exam[1,] #1행 모두 추출

#조건을 충족하는 행 추출하기

exam[exam$class ==1, ] #class가 1인 행만 추출  # == 같다 != 같지않다
exam[exam$math >= 80, ] #수학점수가 80점 이상인 행 추출
#   원데이터$필드명

#1반이면서 수학점수가 50점 이상인 행만 추출
exam[exam$class == 1 & exam$math >= 50, ]

#영어점수가 90점 미만이거나 과학점수가 50점 미만
exam[exam$english < 90 | exam$science < 50 , ] #하나,둘다 미만인것도 추출. 중복가능



#######################데이터 프레임 만들기#######################

#방법 1
fruit<- c("사과","딸기","수박")
price<- c(1800,1500,3000)
volume<- c(24,38,13)

sales <- data.frame(fruit,price,volume) ;sales

#방법2
sales<- data.frame(fruit= c("사과","딸기","수박"),
                   price=c(1800,1500,3000),
                   volume= c(24,38,13))


###원하는함수(df$키값)#####

# 과일 가격 평균
mean(sales$price)
#판매량 평균 구하기 
mean(sales$volume)


#####################  %in% 필터   ##############

#대상 %in% 범위    #이 범위안에 대상이 있어? T F
var5<- c(1,3,5,7,9)

10 %in% var5
7 %in% var5

###################paste#############################

paste(1,2,3,4)             # " 1 2 3 4" 붙여져서 나옴
paste(1,2,3,4, sep='')     #구분자 없음! -> "1234"
paste(1,2,3,4, sep='-')    #구분자 대쉬 -> "1-2-3-4"

paste('function','in', 'r', sep='    ') #공백 띄우기 "function    in    r"
paste('문자열을','합쳐','주세요', sep='') #공백으로 구분하기 (공백없이)


paste('c',1:10, sep='')  #큰 따옴표/작은 따옴표 결과 같음
paste0('c',1:10)

#A1~A3, B1~3, C1~3 자료 #c(paste(),paste(),paste())
c(  paste0('A',1:3),  paste0('B',1:3),  paste0('C',1:3)  )

####################리스트##########################

#list matrix vector factor array 
#길이가 제각각이어도 된다
#list는 $ 표시가 있음 리스트인걸 알수있음 

# [      list가 포함한 하위list를 뽑아냄
# [[,$   하위 list가 포함한 원소 추출
# list() 함수로 리스트 생성   ->    [,[[,$ 를 통해 부분집합을 뽑아냄 
                      

a<- c(1:3)
b<- c(1:4)
c<- list(a,b)   ;c

#[[1]] 1행
#[[2]] 2행


a<- 1:3 
b<-"a string"
c<- pi
d<- list(-1,-5)

ken<- data.frame(a,b,c,d); ken #길이가 맞지 않는 df라 오류남 

ken_list=list(a= 1:3 ,
               b="a string",
               c= pi,
               d= list(-1,-5)
              )

ken_list[[1]][1]
ken_list[[2]]
ken_list[[3]]
ken_list[[4]][1]

######################메트릭스##########################

#2차원의 벡터 
#동일타입의 데이터만 저장가능
#기본값이 열기준 N (내려가는거) cbind/  apply 2

#dim(m) 행렬이 몇차원인지 체크  nrow(m) ncol(m) -> 매트릭스랑 df에서만 씀 

#colnames(m),rownames(m), rowSums(m),rowMeans(m),colMeans(m)


#회귀분석,상관관계에서는 옵션 생략 안된다

mt <- matrix(1:6,2,3) # 1부터 6까지의 수를 2행 3열로 만듦 
mt+3 #각 값에 3이 더해짐 

rowSums(mt) #행의 합
colSums(mt) #열의 합
rowMeans(mt) #행의 평균
colMeans(mt) #열의 평균 


#행-> 튜플
#열 ->어트리뷰트 속성
#카드너티


######################################

t(mt) #transpose 행/열바꿈 

y<- c(1:6)
array(y,dim = c(2,2,3))
# (1-6),행열개수 =행,열,면  ##설명다시
#1부터 6까지,차원정보 = 행렬을 3면을 만듦 
array(c(행,열,면))

###################연산#####################


#100P 비교연산자
5!=5

#101p 논리 연산자
x<- 1:3
y<-3:1

x>0 & y>1


#########내장 데이터 세트  iris ##############

.libPaths() #경로

#내장 데이터 불러오기
data("iris")
attach(iris) #데이터 불러오기
detach(iris) #데이터 필요없을 때 

my_iris <- iris ; my_iris #내장 데이터를 내 데이터로 만들기 

head(iris,3) #head 기본값 6개 
tail(iris,3) #tail 밑에서 3개 생략하면 아래에서 6개  
dim(iris) # 행*열
nrow(iris) #데이터 프레임의 행의 수
ls(iris) # iris 변수목록 

my_iris <- my_iris[,1:4] ; my_iris #1열부터 4열 중에 
apply(my_iris,2,mean) #2는 열/ 평균 / 어플라이 함수 쓸 때 세로로 합할꺼면 2로 열 가로로 합계는 1로 
apply(my_iris,2,sum) #
lapply(my_iris,mean) #l는 list의 약자 #l붙으면 옵션이 없어도 된다

apply(데이터,1,함수) #함수에 sum mean max min 표준편차 등 내가 원하는 함수를 다쓸수있음 
apply(데이터,2,함수)


View(my_iris)

############## 103p  ##################
#read.csv
#read_excel

library(readxl)
exdata1 <- read_excel("data/Sample1.xlsx") ; exdata1 # read_excel 엑셀 파일 읽기 
View(exdata1) #데이터 세트 확인
str(exdata1) #데이터 세트 속성 확인하기
nrow(exdata1) #행의 개수
dim(exdata1)# 행 열 개수
ls(exdata1) # 변수확인 



install.packages("dplyr")
library(dplyr)

#rename으로 이름 변경하기
exdata1 <- rename(exdata1, Y17_AMT = AMT17, Y16_AMT =AMT16)

#파생변수 만들기
exdata1$AMT<- exdata1$Y17_AMT + exdata1$Y16_AMT
exdata1$CNT<- exdata1$Y17_CNT + exdata1$Y16_CNT
exdata1$AVG_AMT <- exdata1$AMT / exdata1$CNT
View(exdata1)

exdata1


#############문제###################

library(ggplot2)
mpg<- as.data.frame(ggplot2::mpg) #강제로 데이터프레임에 넣어서 co_mpg에 넣음
co_mpg<-mpg ; co_mpg

co_compact<-co_mpg[co_mpg$class == "compact",]
nrow(co_compact)

co_suv<-co_mpg[co_mpg$class == "suv",] ; co_suv
nrow(co_suv)


cty_suv<-apply(co_suv[8],2,sum)
hwy_suv<-apply(co_suv[9],2,sum)
mean_suv<-(cty_suv+hwy_suv)/62 ;mean_suv

cty_compact<-apply(co_compact[8],2,sum)
hwy_compact<-apply(co_compact[9],2,sum)
mean_compact<-(cty_compact+hwy_compact)/47 ;mean_compact

co_mpg$tot<- (co_mpg$cty + co_mpg$hwy) / 2 ;co_mpg$tot
#########답 ############333
??mpg

library(ggplot2)

rm(list=ls())

mpg <- as.data.frame(ggplot2::mpg)

co_mpg <- mpg

co_mpg$tot <- (co_mpg$cty + co_mpg$hwy)/2 # 통합 연비 변수 만들기



co_compact <- co_mpg[co_mpg$class == "compact",] # compact 추출

co_suv <- co_mpg[co_mpg$class == "suv",] # suv 추출



mean(co_compact$tot) # compact의 tot 평균 산출

########## mpg 통합 연비 변수 만들기 ##############

mpg$total<- (mpg$cty + mpg$hwy)/2 ;mpg$total #통합 연비 변수 생성

summary(mpg$total) #요약 통계량 산출

hist(mpg$total) #히스토그램 생성

#con변수를 생성하여(mpg$con) total 25이상 이거나 cty가 20이상이면 "우수", 나머지는"일반"인 조건을 완성해라 

mpg$con<- ifelse(mpg$total>=25 & mpg$drv>= 20,"우수","일반") ; mpg$con
View(mpg)

#필요한 열 추출
sep_mpg<-mpg[ ,c(1,6:9,11:13)]
head(sep_mpg,2)

#csv파일로 저장 
write.csv(sep_mpg,"data/sep_mpg.csv",row.names =F)

table #집계
table(mpg$con)
dev.new() #새창띄우기
qplot(mpg$con) #qplot



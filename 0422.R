#이름 바꾸기 rename(변수,신버전=구버전,신버전=구버전)


######## 칼럼명이 없는 파일을 읽어 올 때 지정하는 법

library(dplyr) #name 함수는 반드시 dplyr 설치 필요 

no_header<-read.csv("data/no.csv") #data불러오기
View(no_header) # 헤더 없고 아래행이 헤더로 올라온 상태


re_name1<-c("class","number","math","english"); re_name1 #헤더지정 변수 만들기

read.csv("data/no.csv",header = F, col.names = re_name1)
#        데이터 불러오기, 헤더없음, 열 이름 옵션 = 지정한 변수


######## header있으나 이름만 변경하고 싶을 때 

read.csv("data/no.csv", col.names = re_name1) #헤더 옵션 빼고 col.names옵션에 변수를 넣어서 이름변경


############# 비정형 데이터 불러오기

txt1 <- readLines("c:/ken/data/data2/구매후기.txt") ; txt1

txt2 <- readLines("c:/ken/data/data2/구매후기_utf8.txt", encoding="UTF-8") ; txt2 #메모장에서 안시로 저장하면 거의 안깨짐

############ 테이블 형식(탭 , ; :)이 있는 데이터 불러오기

txt4<- read.table("c:/ken/data/data2/전공.txt", header = T); txt4 #헤더있으면 안써줘도 되지만 헤더가 없을땐 꼭 F써줘야함

txt6<- read.table("c:/ken/data/data2/전공2.txt", header = T, sep=":"); txt6 #sep분류하기 ":" 콜론으로 => 깔-끔
View(txt6)



#############조건문

data(iris) 

#방법 1
df.1 <- iris[iris$Species == "setosa",   ] ; head(df.1,3) #iris데이터셋의$종 키값이 세토사인걸 df.1에 저장

#방법 2
df.2 <- subset(iris, Species == "setosa") ; head(df.1,3) #subset내장함수

#filter는 디플라이어 설치가 되어있어야함 구조는 subset이랑 같음
library(dplyr)

df.3 <- filter(iris, Species == "setosa") ; head(df.1,3)


#####83p#####

ex_data <- read.table("c:/ken/data/data_ex.txt")
View(ex_data)

ex_data <- read.table("c:/ken/data/data_ex.txt", header = T)
View(ex_data)


ex_data1 <- read.table("C:/ken/data/data_ex.txt",header = T)
View(ex_data1)

#스킵
ex_data2 <- read.table("data/data_ex.txt", header =T, skip=2)

#nrow
ex_data2 <- read.table("data/data_ex.txt", header =T, nrow=7)
View(ex_data2)




#############조건문#####################

#간단한 if문 (조건1, 결과 단순)
#변수<-ifelse(비교할 조건문, 참의 값, 거짓의 값)

#다중 if문 (조건1, 결과 값이 여러개인 경우
#변수<- ifelse(비교할 조건문, 참의 값, 
#               ifelse(비교할 조건문 2, 참의 값,
#                         ifelse(비교할 조건문 3, 참의 값
#                         거짓의 값 실행
#                         )
#                    )
#               )



##page 111
library(readxl)
exdata1 <- read_excel("data/Sample1.xlsx") ; exdata1
#rename으로 이름 변경하기
exdata1 <- rename(exdata1, Y17_AMT = AMT17, Y16_AMT =AMT16)

#파생변수 만들기
exdata1$AMT<- exdata1$Y17_AMT + exdata1$Y16_AMT
exdata1$CNT<- exdata1$Y17_CNT + exdata1$Y16_CNT
exdata1$AVG_AMT <- exdata1$AMT / exdata1$CNT
View(exdata1)

exdata1


exdata1$AGE50_YN <- ifelse(exdata1$AGE >=50, "Y","N")


exdata1$AGE_GR10 <-  ifelse(exdata1$AGE >= 50, "A1.50++",
                            ifelse(exdata1$AGE >= 40, "A2.4039",
                                   ifelse(exdata1$AGE >=30, "A3.3039",
                                          ifelse(exdata1$AGE>=20,"A4.2029",
                                                 "A5.0019"))))

View(exdata1)


#변수를 추출하는 select()함수

exdata1 %>% select(ID)
exdata1 %>% select(ID,AREA,Y17_CNT)

#선택한 변수만 제외하고 추출하기 -변수
exdata1 %>%  select(-AREA)
exdata1 %>%  select(-AREA,-Y17_CNT)

#조건에 만족하는 값만 추출하기
exdata1 %>% filter(AREA== '서울')

exdata1 %>% filter(AREA== '서울' & Y17_CNT >= 10)


#데이터 정렬하기

exdata1 %>% arrange(AGE) #오름차순
exdata1 %>% arrange(desc(Y17_AMT)) #내림차순
exdata1 %>% arrange(AGE, desc(Y17_AMT)) #age는 오름, Y17은 내림 


######데이터 프레임 생성하기

var1<-c(4,3,8)
var2<-c(2,6,1)
df<- data.frame(var1,var2)
df

#파생변수 생성

df$var_sum <- df$var1 + df$var2;df

df$var_mean <- (df$var1 + df$var2) / 2;df

#ifelse
var_con<- ifelse(df$var_mean >=5, "A",
                 ifelse(df$var_mean >= 4,"B",
                        ifelse(df$var_mean >=3, "C",
                               "D")))


조건이 2개 이상인 경우
조건을 모두 만족 &
조건 중 한개라도 만족하면 or |
  
############################# mpg ##########################################################

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
write.csv(sep_mpg,"data/sep_mpg.csv",row.names =F) #row.names 행 이름으로 저장할지

table #집계
table(mpg$con)
dev.new() #새창띄우기
qplot(mpg$con) #qplot

head(sep_mpg,2)

sep_mpg[2,2]<- "auto(90)" #값 대체하기 
sep_mpg[1,6]<- "suv"

################이상치################결측치#############
결측치 누락된 값, 비어있는 값
함수 적용 불가, 분석 결과 왜곡 -> 제거 후 분석 실시 

df<- data.frame(sex=c("M","F",NA,"M","F"),
                score = c(5,4,3,4,NA))
df

is.na(df) #결측치 확인  T / F로 반환 TRUE가 결측치 
sex score
[1,] FALSE FALSE
[2,] FALSE FALSE
[3,]  TRUE FALSE
[4,] FALSE FALSE
[5,] FALSE  TRUE

#결측치 채우기 / 내용수정
df[3,1]<-"M"

table(is.na(df))#결측치 집계(빈도수) 출력

table(is.na(df$sex))

mean(df$score, na.rm=T) #결측값을 지우는걸 TRUE
sum(df$score, na.rm=T) #이건 저장안되고 그냥 보기만 가능 


####단축키 정리###
%>% Ctrl S M
주석처리 : 블럭지정 후 Ctrl S C
마크다운 청크: Ctrl Alt I 
화면 크기: Ctrl +/-
  
########################################

library(dplyr)
df %>% filter(is.na(score)) #score가 NA이면 결측값행 전체를 가져옴 
df %>% filter(!is.na(score)) #score 결측치 제거 / 프린트만한거임 

df_nomiss <- df %>% filter(!is.na(score)) #score 결측치 제거하고 변수저장
#여러변수 동시에 결측치 제거 
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))

#결측치가 하나라도 있으면 제거하기
df_nomiss2<- na.omit(df) #모든 변수의 결측치 제거하기 

nrow(mtcars) #행개수
str(mtcars) #데이터 속성 확인 

filter(mtcars, cyl == 4)

#####################문제#############
# r에서 help 패키지 stringr을 찾고 자 할 때 사용하는 명령어는?

??stringr

# r의 함수 중 iris라는 데이터 세트가 “몇 행과 몇 열” 정보를 알려주는 함수

dim(iris)

# iris의 앞부분의 데이터 6개만 보여주는 명령어

head(iris)

# 기본 통계량을 알려주는 함수

summary(iris)



# 붓꽃 종이 versicolor 이면서 Sepal.Length 이 6이상인 데이터를 color로 저장

flower<-iris
View(flower)

color<-flower[flower$Species =='versicolor' & flower$Petal.Length >= 6, ]
color<-flower %>% filter(Species== 'versicolor' & Petal.Length >= 6)

###답###

color <- subset(iris$Species == "versicolor" & Sepal.Length>= 6)

color<-iris %>% filter(Species== 'versicolor' & Petal.Length >= 6)

# 저장한 변수 중 Sepal.Length과 Petal.Length 열만 저장하여 csv로 저장

data<-flower[ ,c(1,3)]
data

#답

color<- color %>% select(Sepal.Length, Petal.Length) %>%  head(2)
color1<- iris %>% select(c(1,3))  %>%  head(2)

color2<- iris[,c(1,3)] #열만 추출
color2<- head( iris[,c(1,3)],2 ) #헤드로 2개까지만 보여지게 열만 추출



write.csv(data,"data/data_0422.csv",row.names =F) 










# 파일 디렉터리 설정

​setwd

# 작업 디렉터리 설정을 확인하는 명령어

​getwd

# 변수 목록을 확인하는 명령어

​ls()

# 패키지 목록을 확인 하는 명령어

​search()

# 패키지 설치를 설치하는 명령어

​install.packages

# 패키지를 로드하는 명령어

​

# r을 실행하는 단축키

c+R

# r console 창을 리셋하는 명령어

​ C+ L

# 집계를 확인 하는 함수는?

​table()
table(iris$Species)

names(iris) #변수 목록
Cas_iris<- tolower(names(iris)); Cas_iris #소문자로 바꾸기 tolower

renames() 변수명 변경하는 함수 단,dplyr 패키지 로드해야함 


# r의 설치된 패키지 파일경로를 확인하는 명령어

.libPaths()

# stringr 패키지를 설치시 명령문을 작성하시오.

​

# 현재 변수 목록 확인 현재 사용중인 변수중 ex) k1이라는 변수를 삭제하는 방법

​ rm(k1)

# 현재 환경창에 사용중인 변수 모두를 삭제하는 명령어

rm(list=ls)

# 현재 사용중인 패키지 확인



# r에서 help 패키지 stringr을 찾고 자 할 때 사용하는 명령어는?

??stringr

# r의 함수 중 iris라는 데이터 세트가 “몇 행과 몇 열” 정보를 알려주는 함수

dim(iris)
str(iris)
nrow(iris)#행이 몇개인지 

# iris의 앞부분의 데이터 6개만 보여주는 명령어

head(iris)
tail(iris)

# 기본 통계량을 알려주는 함수[출처] 과제 3|작성자 파란장미





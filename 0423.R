library() #설치된 라이브러리 확인 
search() #현재 로드 패키지 확인 

###### 출력함수 print cat #########

print (x,..)
- 구조: print(출력데이터[,옵션들])

print(100)
print(pi)
data<- c("사과","딸기","포도")
print(data)
print(data,quote= FALSE)      # ""del 큰따옴표 없어짐 
print(data,print.gap=3,quote=FALSE) #데이터 사이의 공간이 늘어남남
1+1 #알아서 줄바꿔져서 나옴
print("\n")


cat()
-줄 바꿈 기능이 없다
-구조: cat(..., 옵션들...)

cat(100)
cat(100,200,"\n")
1+1

#논리구조 FALSE
print("a"=="A")




######### if문 #############


#print

x<-20
if(x>10){
  print("x is large number")
  }


#cat

x<-20
if(x>10){
  cat(x,"is large number")
}


#####################################################
제어구문 (반복문): 데이터를 분석하는 과정에서 동일한 일을 반복적으로 실행시 짧은 코딩으로 동일한 일을 처리

for(i in data) {i를 사용할 문장} #data에 들어 있는 각각의 값을 변수 i에 할당 하면서 각각에 있는 블록 안의 문장 수행 
for(variable in vector)

for(i in 1:10) {
  cat(i,"번째 실행중입니다.","\n")                    # \t tab 간격 \n Enter줄띄움 
}


paste0(i,"번째 실행중입니다.") 
for(i in 1:10) {
  cat(paste0(i,"번째 실행중입니다."),"\n") 

vec1<- c(1:100)
for (i in vec1){
  cat(paste0(i,"번째 실행중입니다"),"\n")
}

#구구단 만들기
gg<- 3
for (i in 1:10){
  cat(paste(gg,"x",i,"=",gg*i),"\n") 
}


#1부터 10까지 덧셈
sum<-0
for (i in 1:10) {
  sum<- sum+i
}

sum

# %% 나머지 구하기 짝/홀 구할 때 사용 

a<-7
if (a %% 2 == 0) {
  print(a)
  print("짝수입니다")
} else{
  print(a)
  print("홀수입니다")
}

###switch
data<- c(1:10)

switch(data[5],
       "1"= print("One"),
       "2"= print("Two"),
       "3"= print("Three"),
       print("Null")
       )





# substr(변수, 시작번째, 마지막번째) 엑셀의 mid와 비슷

#미리 만들어놓은걸 호출하는 기능function
user<- function() {
  answer<- readline("Input Data(한영가능) :")
  
    if(substr(answer,1,1)=="n") {cat("아니오")} #앞글자가 n이면 아니오고 나옴
      else
        cat("예")
  }

user()



while(con){조건이 참일 때 수행할 문장} #조건 con이 참일 때 블록 안의 문장을 수행 

repeat{반복해서 수행할 문장} #블럭 안의 문장을 반복해서 수행
break:종료 / next:다음실행




######################
library(dplyr)

distinct(iris,Species) #distinct(데이터세트,열)에서 중복된걸 다 지워라
ls(iris)

if (조건){}

readLines() #각 줄을 문자열로 읽음/  키보드로 부터 입력되는 라인을 읽는 함수


i<- 1
for(i in 1:cnt_txt){
  place<gsub((txt[i]),"",place) #gsub 제거하는 함수 replace비슷
}


####################################################

library(dplyr)
exam <- read.csv("data/csv_exam.csv")
exam

#filter 조건에 맞는 행 추출 데이터셋 %>% filter(조건)

##exam에서 class가1인 경우만 추출하여 출력 

exam %>% filter(class == 1) # select 없이 필터만 쓰면 조건에 맞는 전체 행 가져옴

#1반이 아닌경우
exam %>%  filter(class !=1 )

#수학점수가 50점을 초과한 경우
exam %>%  filter(math > 50)

#수학점수가 50점을 초과한 경우 /2개의 조건
exam %>%  filter(math>50 & english >=90)

#1반이면서 수학점수가 50점 이상인경우
exam %>%  filter(class == 1 & math>=50)

#select(열 이름) %>%  filter(조건)

#id와 영어점수, 과학점수 열만 가지고 아래 데이터를 출력하시오
exam %>%select(id,english,science) %>%
  filter( english<90 | science<50 ) %>% 
  #쉬프트 엔터 들여쓰기- 파이프 연산자 뒤에서 해야함 
  head(2)

#%in% 기호
exam %>%  filter(class %in% c(1,3,5) ) #클래스안에 1,3,5면 뽑아와  


class1<-exam %>%  filter(class == 1 ) %>% 
                  select(math)
          
mean(class1)



class2<- exam %>%  filter(class == 2 ) %>% 
                    select(english)
sum(class2)


###답###

#1반 수학 점수 평균 구하기
class1 <- exam %>% filter(class ==1)
mean(class1$math)

# 2반 영어점수 합계 구하기
class2<- exam %>% filter(class==2)
sum(class2$english)


#exam$파생변수이름 
#mutate로 파생변수 만들기

exam %>%
  mutate(total = math +english + science) %>% #총합 변수 추가
  head  #head를 넣어서 변수 저장을하게되면 6개만 저장이된다

#정렬하기
exam %>%
  mutate(total = math +english + science) %>%
  arrange(total) #arrange(desc(total))

ls(exam) #total 추가 안되어있음

#여러 파생변수 한번에 추가하기
exam_tot<- exam %>% mutate(total = math + english +science,        #총합변수 추가
                            mean =(math + english + science)/3 )  #총평균 변수 추가
exam_tot

#일부추출 mutate()에 ifelse() 적용하기
#result 파생변수를 생성, 과학점수가 70점 이상이면 pass, 아니면 fail을 출력

exam %>% mutate(result = if(science >= 70){cat("pass")},
                          else{cat("fail")}

exam %>% mutate(test = ifelse(science >= 60, "pass","fail"))


exam %>% 
  group_by(class) %>% #class별로 분리
  summarise(mean_math= mean(math), #math 평균산출 #mean_math는 파생변수!
            sum_math =sum(math), #math 합계
            median_math = median(math), #math 중앙값
            n=n()) #학생 수 


exdata1 %>%  summarise(TOT_Y17_AMT = sum(Y17_AMT)) #합계를 도출하는 함수 summarise
exdata1 %>%  group_by(AREA) %>% summarise(SUM_Y17_AMT = sum(Y17_AMT))







#제조사별로 "suv"자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고 1~5위까지 출력하기
mpg<- data.frame(ggplot2::mpg)
mpg

result<-mpg %>% 
  group_by(manufacturer) %>%                        #회사별로 분리
  filter(class == "suv") %>%                        #suv 추출
  mutate(total= cty+hwy) %>%                        #통합 연비 변수 생성 total
  summarise(mean_total= mean(total)) %>%            #통합 연비 평균 산출
  arrange(desc(mean_total)) %>%                     #내림차순 정렬
  head(mean_total,n=5)                      #1~5위까지 출력
result

##############################################################################################


#중간고사 데이터 생성
test1<- data.frame(id = c(1,2,3,4,5),
                   midterm= c(60,80,70,90,85))

#기말고사 데이터 생성
test2<- data.frame(id = c(1,2,3,4,5),
                   final= c(70,83,65,95,80))

test1
test2
#id기준으로 합치기
#left_join(합칠df,합칠df,by=기준 열변수)
total<- left_join(test1, test2, by ="id") #id기준으로 합쳐 total에 할당 #by= 기준인 변수 입력 
total

#엑셀 브이룩업 /if문으로도 가능 
name<- data.frame(class= c(1,2,3,4,5),
                  teacher = c("kim","lee","park","choi","jung"))
name

ifelse(class ==1,"kim",
       ifelse(class ==2,"lee",
              ifelse(class ==3,"park",
                     ifelse(class ==4,"choi",
                            "jung")
                     )
       )
)

exam_new <- left_join(exam,name,by="class") ; exam_new #class를 기준으로 teacher열을 추가하는데 추가할때 클래스에 따라서 추가해줌 


#데이터 생성

#학생 1~5번 시험 데이터 생성
group_a <- data.frame(id = c(1,2,3,4,5),
                      test= c(60,80,70,90,85))

group_a

#학생 6~10번 시험 데이터 생성
group_b <- data.frame(id =c(6,7,8,9,10),
                      test= c(70,66,55,40,60))
group_b

#세로로 데이터 합치기 
#bind_rows(데이터세트1, 데이터세트2)
group_all<- bind_rows(group_a,group_b) #데이터 합쳐서 group_all에 할당
group_all

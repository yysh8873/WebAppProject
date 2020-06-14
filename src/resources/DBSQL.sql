drop database deeper;

create database deeper;
use deeper;

create table userinfo
(uid varchar(20) not null primary key,
 name varchar(16) not null,
 email varchar(30) not null,
 pw varchar(100) not null)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table posts
(cid int not null primary key,
 uid varchar(20) not null,
 gid int not null,
 title varchar(30) not null,
 contents varchar(10000) not null,
 tag varchar(30),
 tdate date not null,
 likes int null default 0)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table groupinfo
(gid int not null primary key,
 gname varchar(16) not null,
 ginfo varchar(500),
 tag varchar(30),
 uid varchar(20) not null)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- isIn 0: 그룹장 1: 그룹원 2: 승인대기
-- 그룹원 정보 테이블에는 그룹장은 쓰지 않음
create table guserinfo
(gid int not null,
 uid varchar(20) not null,
 isIn int not null,
 primary key(gid, uid))ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table likes
(cid int not null,
 uid varchar(20) not null,
 primary key(cid, uid))ENGINE=InnoDB DEFAULT CHARSET=utf8;


show databases;
show tables;

insert into userinfo(uid, name, email, pw) values('test', '테스트','test@hs.ac.kr', '81dc9bdb52d04dc20036dbd8313ed055');
insert into userinfo(uid, name, email, pw) values('so', '이소현', 'so@hs.ac.kr', '50cf4ed21677bd01c4949a5efb3bd2e4');
insert into userinfo(uid, name, email, pw) values('si', '권시연', 'si@hs.ac.kr', '26de6dfe43c2254a87dc531c13d855b3');
insert into userinfo(uid, name, email, pw) values('joo', '우주영', 'joo@hs.ac.kr', '02181d2859fa44abb9f0eb4f3a237fa9');

insert into posts values(1, 'so', 0, '입문 프로그래머가 갖추어야 할 세 가지', '최근에 StackOverflow의 공동 창립자인 Joel Spolsky 인터뷰에 따르면,

프로그래밍에 입문하는 사람들은 경제학, 커뮤니케이션, 그리고 C 프로그래밍을 꼭 배워야 할 세가지라고 합니다.

언뜻 보기에는 왜 꼭 배워야하는 지 의문이 드는데요,

그 이유에 대해서 자세히 알아보도록 하겠습니다.Spolsky는 프로그래밍을 하기 위해서 경제학을 꼭 배우는 것을 강조했습니다.



프로그래머들은 경제학에 대해 잘 알지 못할 뿐만 아니라,



결국 경제학이 비즈니스에 어떻게 가치를 더해주는지 잘 이해하지 못하기 때문입니다.



웹 개발자로써의 주요 역할은 고객들의 비즈니스에 가치를 가져오는 것인데요,



디자이너들과 개발자들은 부당한 요구와 무리한 요청을 하는 고객들에 대해 불평하는 일이 많습니다.



하지만 경제학을 이해한다면, 고객과 개발자 사이의 좋은 업무 관계를 유지할 수 있습니다

', '#입문프로그래머 #경제학', '2020-01-06', 0);
insert into posts values(2, 'so', 1, 'C언어 시작하기1', '프로그래밍 언어는 인간과 컴퓨터가 대화를 하기 위한 언어입니다. 인간이 명령을 내리고 컴퓨터가 실행하기 때문에, 기계어보다는 C 언어처럼 인간이 사용하는 언어와 가까운 고급 언어를 사용하죠

아래의 코드를 코드블록에 직접 작성하고 컴퓨터와의 대화를 시도해봅시다!
-코드블록 설치하기-
#include <stdio.h>
main ()
{
printf ( “Hello world”);
}

위 프로그램을 실행하면 “Hello world”라는 결과가 나타납니다.   ', '#C언어 #C언어입문', '2020-05-06', 0);
insert into posts values(3, 'so', 1, 'C언어 시작하기2', 'main()과 헤더 파일c언어 프로그램을 만들기 위해서는 헤더 파일과 main()이 꼭 있어야 합니다.

그럼 main()과 헤더 파일은 무엇일까요?

main()
c언어 소스 코드에는  main()이 꼭 있어야 하고, 사용하는 명령들의 내용이 미리 기록된 헤더파일을 참조하여 프로그래밍 합니다.
소스 코드 – 사용자가 작성한 코드로 컴파일러에 의해 번역되지 않은 상태의 프로그램 파일(*.c)을 뜻합니다.
컴파일러 – 고급언어 프로그램(C/C++등)을 기계어로 번역하는 프로그램
(우리가 쓰고있는 code::blocks또한 컴파일러에 속하죠)
main()이 왜 꼭 필요한지 알아봅시다.

아래의 코드를 직접 작성하고 실행해 봅시다!


1
main(){}

위 프로그램을 실행하면 오류 없이 실행되고 아무것도 출력되지 않습니다.', '#C언어 #C언어입문', '2020-05-06', 0);
insert into posts values(4, 'so', 1, 'C언어 시작하기3', '컴파일 – 쉽게 말하면 변환을 하는 것이죠 흔히 쓰는 언어(C/C++)들은 컴퓨터가 알아듣지 못하는 인간지향적으로 설계되어 있으며 이것을 컴퓨터가 알아들을 수 있도록 기계지향적 언어(기계어)로 변환하는 방법이 컴파일입니다.

C 언어 프로그램은 main() 함수 내부에 실행해야할 내용들을 작성하는 것이 기본이며 main() 함수에는 C프로그램의 시작부터 종료까지 실행되는 내용들이 작성되어있습니다.
함수 – 여러 명령의 집합을 말합니다. 함수 이름(){실행할 내용}의 구조로 되어있고 종류와 사용법이 다양합니다.

C언어 프로그램은 main() 함수를 기본으로 여러가지 명령과 함수들을 사용하여 작성됩니다. 프로그래밍의 기본은 사용자가 필요한 명령들을 코딩하는 것이고, 여러 명령들을 반복해서 사용할 경우 그것을 함수나 작은  단위의 부프로그램 형태로 코딩하는 것입니다.
부프로그램 – 하나의 프로그램을 구성하는 여러 작은 단위의 프로그램으로 일련의 명령문들을 모아두고, 이를 외부에서 호출할 수 있게한 구조입니다.main()
{ <요놈
    함수 1();
    함수 2();
    여러가지 문법;
     :
} <요놈이 코드블록(블록)이라고 합니다.
C언어 내부의 모든 명령들은 위에서 아래로 작성하며, 각 문장의 끝에는 문장의 마지막을 나타내는 마침표(.)와 같은 의미로 세미콜론(;)이 사용됩니다.​
작은따옴표’ ‘, 큰따옴표” “, 소괄호 ( ), 중괄호{ }, 대괄호[ ]와 같이 쌍으로 사용되는 기호들이 있으며, 실행되는 문장이 2줄 이상일 경우 중괄호{ }를 사용하여 묶어주는데, 이를 코드블록(code block)이라고 합니다.
다음에는 main()함수와 같이 프로그램을 만드는데 필요한 헤더 파일에 대해 알아봅시다.', '#C언어 #C언어입문', '2020-05-07', 0);
insert into posts values(5, 'so', 1, 'C언어 시작하기4', 'main()
{ <요놈
    함수 1();
    함수 2();
    여러가지 문법;
     :
} <요놈이 코드블록(블록)이라고 합니다.
C언어 내부의 모든 명령들은 위에서 아래로 작성하며, 각 문장의 끝에는 문장의 마지막을 나타내는 마침표(.)와 같은 의미로 세미콜론(;)이 사용됩니다.​
작은따옴표’ ‘, 큰따옴표” “, 소괄호 ( ), 중괄호{ }, 대괄호[ ]와 같이 쌍으로 사용되는 기호들이 있으며, 실행되는 문장이 2줄 이상일 경우 중괄호{ }를 사용하여 묶어주는데, 이를 코드블록(code block)이라고 합니다.
다음에는 main()함수와 같이 프로그램을 만드는데 필요한 헤더 파일에 대해 알아봅시다.', '#C언어 #C언어입문', '2020-05-07', 0);

insert into posts values(6, 'si', 0, '자바의 기본개념1', '자바란?

수 많은 자바책에서 자바란? 이라는 제목으로 첫장을 연다.
필자도 몇권의 책을 보았지만 솔직히 처음에는 아무말도 이해가 되지 않았다.
객체지향이니 뭐니 객체지향의 뜻도 모르는데 그걸 지향해서 어쩌라는 말인가!!

아무튼 여차여차 해서 이러쿵 저러쿵 한다는게 자바라고 나와있다.
자세한 것을 원하면 책을 읽어보시라. (필자가 조금 무책임하다;)

필자는 자바를 한마디로 정의하겠다.

"자바란 외국어이다."

세상에 많은 언어가 있듯이 자바 또한 그러한 언어중에 하나이다.
우리가 영어를 배울때 단어를 배우며 문법을 배우듯 자바도 명령어를 외우고 쓰는방법을 배운다.
그리고 쓰면 쓸수록 늘어난다.  객체지향이고 뭐고 쓰다보면 모두다 이해되는것이다.
영어를 모른다고 해도 영어 문법을 모른다고 해도 외국에 나가서 10년을 살면 그사람은 외국어를 할줄안다.

마찬가지이다. 그래서 필자는 최소한의 개념적인 설명을 가지고 문제로써 최대한 이야기를 할려고 한다.
외국어라고 어렵다고 생각하지 마시라~ 영어를 정말 못하는 필자도 자바를 공부하고 있다!

참고로 필자는 자바 명령어를 기호로 생각하며 외우고 있다..
영어를 알고 있으면 더 쉽게 파악가능하다던데 필자는 영어를 정~~~~~말 못한다.

아무튼 최선을 다해서 초보자도 이해할수 있도록 포스트하겠다.

Deeper 이용방법은 간단하다. 순서대로 챕터를 보고난뒤 Java.Q에서 챕터에 맞는 문제를 풀어본다.
(여기서 문제를 복사할려고 생각하지말고 꼭! 하나하나 적어서 풀어보기 바란다.)
그리고 난뒤 Java.A에서 답을 비교해 보라. 최대한 답을 상세하게 설명해 놓을것이다.', '#자바 #JAVA', '2020-05-08', 0);
insert into posts values(7, 'si', 0, '자바의 기본개념2', '변수란 값을 저장하는 공간이며 함수란 값을 계산하는 수식이라고 생각하면 된다.

그럼 클래스는 어떤 기능을 가지고 있을까?
클래스는 함수로 값을 계산하여 그 값을 변수에 저장하거나
변수에 저장된 값을 불러와서 함수로 값을 계산하는 기능을 가지고 있다.

값을 저장하는 성질을 가지고 있는 변수와
값을 계산하는 성질을 가진 함수가 모였으니
그 두가지를 모두가진 클래스는 값을 저장하거나 계산할수 있는것이다.

앞으로 1~5챕터까지는 이 클래스의 구성요소인 변수와 연산자, 제어문에 대해 알아볼것이다.
모든 자바프로그래밍의 기초이자 기본이다.

기초와 기본부터 잘 모르게 된다면 후에 가서 계속 사용은 되는데 알아보지를 못하거나
프로그램을 해석하는 한참 시간을 소비하게 된다. 그러니 확실하게 알아두길 바란다.




자 그럼 Chpater에 들어가기전에 자바 프로그래밍의 기본적인 몇몇 사항을 알아두고 가자.

우선은 필자의 블로그에서 JAVA와 이클립스를 설치하는 방법이 나와있다.
모두 JAVA와 이클립스를 설치하고 난뒤 필자가 적어놓은글을 하나하나 따라하면
필자만큼의 실력을 가질수 있을것이다!
(다시 한번 말하지만 필자는 아직 자바를 배운지 한달이 안됫다 ;;)', '#자바 #JAVA', '2020-05-08', 0);
insert into posts values(8, 'si', 0, '자바 정복하기1', '1. 클래스 선언



자바에서 프로그래밍을 할려면 우선 클래스를 선언해야 한다.

방법은 매우 간단하다.



class ClassName { }



위의 공식이 클래스를 만드는 명령어이다.

Class를 적고 난뒤 한칸 띄우고 클래스 이름을 적어두면 된다.

저 { } 안에 들어가는 모든공식이 ClassName이란 클래스에 속한 공식이 되는것이다.
한마디로 ClassName의 영역이라고 생각하면 된다.





2. 메인 메소드 호출

 (메소드란 함수를 뜻하는것이다. 필자는 영어가 안되서 한참동안 몰랏다..)


class ClassName {



public static void main(String[ ] args){ }



}



1번에 만든 만든 클래스 안에 메인메소드를 호출하였다.

메인메소드를 호출할때 쓰는 명령어들은 차근차근 배울것이니 처음엔 그냥 외우도록 하자.

메인메소드는 프로그램의 시작점이라고 생각하면 된다.

프로그램을 실행하였을때에 메인메소드를 기준으로 실행이 된다.

만약 메인메소드를 호출하지 않고 프로그램을 시작하면 그 프로그램은 시작위치를 몰라서

프로그램실행이 되지 않는다.  물론 좀더 깊게 들어가면 조금은 뜻이 다르지만.

아무튼 메인메소드가 없으면 프로그램이 실행되지 않는다라고 알아두자!

메인메소드 또한 뒤의 { }안에 있는것이 메인메소드에 속한 영역이다.

', '#자바 #JAVA', '2020-05-10', 0);
insert into posts values(9, 'si', 2, '자바 정복하기2', '3.마지막으로 값을 출력하는 프린트메소드!



class ClassName {



Public static void main(String[ ] args) {



System.out.println("Hellow Java World") ;



}

}





이제 메인메소드 안에 값을 출력하는 프린트메소드를 집어 넣었다.

ClassName이라는 프로그램을 완성한것이다!!

이 프로그램을 실행시키면 Hellow Java World 라고 출력될것이다.



자 주의 할점은 ; 표시이다.  ; 표시는 명령어 한줄을 다 적었다라는 뜻으로

프로그램이 서로 겹치지 않게 표시하는것이다.

혹시 빠트리면 프로그램이 실행되지 않으니 주의하자!!







위 3가지는 이제부터 거의 항상 따라오게 될것이다. 이유가 무엇이면



프로그래밍을 할려면 클래스를 만들어야 되고



프로그래밍을 실행할려면 메인메소드를 호출하여야 하고



프로그래밍을 출력할려면 프린트메소드를 실행시켜야 되기때문이다.





모든 프로그래밍의 기본이므로 꼭 기억해두기 바란다.

(기억하기 싫다고 하더라도 앞으로 계속 나오기전에 기억이 될것이다 ;)

', '#자바 #JAVA', '2020-05-10', 0);
insert into posts values(10, 'si', 2, '자바 정복하기3 - 구구단 출력', 'import java.util.Scanner;

public class Gugudan
{
    public static void main(String args[])
    {
        for( ; ; )    // 범위가 벗어났을경우 계속 입력하기위한 무한 반복문 사용
        {
            System.out.print("1부터 9까지의 임의의 숫자를 입력하세요 : ");
            Scanner sDan = new Scanner(System.in);
            int dan = sDan.nextInt();

            if(dan < 10)    // 1 ~ 9까지 범위 일때
            {
                for(int su = 1 ; su < 10 ; su ++)    // 단이 정해지면 계산 및 출력하기위한 반복문
                {
                    System.out.println(dan + " * " + su + " = " + (dan * su) + " ");
                }
                break;    // 계산이 완료되면 STOP!
            }else
            {
                System.out.println("1부터 9까지 다시 입력해주세요.");
                continue;    // 1 ~ 9 까지 범위안에 없을시 다시 for문 처음으로 돌아가기위해 continue 사용
            }
        }
    }
}
', '#자바 #JAVA', '2020-05-11', 0);

insert into posts values(11, 'joo', 0, '자바 - 윤년판별 코드', 'import java.util.Scanner;

public class Calendar
{
    public static void main(String args[])
    {
        System.out.print("년도를 입력하세요 : ");
        Scanner s = new Scanner(System.in);
        int year = s.nextInt();

        // 윤년은 4의 배수''이고(AND)'' 100배수는 ''아니거나(OR)'' 400의 배수이다.
        if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
            System.out.println(year + "년은 윤년입니다.");
        else    // 윤년 아닐시
            System.out.println(year + "년은 윤년이 아닙니다.");
    }
}
', '#자바 #윤년', '2020-05-07', 1);
insert into posts values(12, 'joo', 0, '자바 클래스와 객체1', '- 클래스(class): 사물의 특성을 소프트웨어적으로 추상화하여 모델링 한 것으로 객체를 만들 수 있는 틀(Template)로써 오브젝트의 정적인 상태를 나타냅니다.

- 객체(object): 클래스를 실제 사용할 수 있도록 만든 것으로 메모리 공간을 할당해 놓은 인스턴스(Instance)라고도 하며 클래스의 동적인 상태를 의미합니다.(new 명령어를 통해 생성)



여기서 헷갈려 하실수도있는데 사물에 빗대어 표현하자면 붕어빵틀과 붕어빵 관계라할 수 있습니다. 붕어빵은 붕어빵틀에서 인스턴스화해서 나온 객체입니다.



- 객체지향의 특징

① 상속성(inheritance)

② 다형성(Polymorphism)

③ 캡슐화(encapsulation)

④ 정보은닉 (information hiding)



- 클래스의 구성요소

① 멤버 변수: 클래스의 속성
② 생성자: 객체의 초기화를 담당
③ 메소드: 클래스의 속성을 조작

④ 내포 클래스(Nested Class): 클래스안에 클래스 존재 가능', '#자바 #클래스', '2020-05-08', 1);
insert into posts values(13, 'joo', 0, '자바 클래스와 객체2', '2. 클래스의 정의

- 형식: [접근지정자] + [클래스 종류] + class + class명 + [extends super] + [implements interface]

- [접근지정자] : public, default, protected(내부 클래스 선언시 사용), private등.

- [클래스 종류] : abstract, final

- extends : 상속에서 사용 (Java - 단일상속)

- implements - interface로부터 상속받기 위해 사용(Java - 다중 상속)

- 클래스 표기법

클래스 이름

 멤버 변수(필드)

 멤버 메소드



- 접근 지정자의 표현

- public은 앞에 +

- private는 앞에 -

- protected는 앞에 #

- default는 생략



- abstract는 기울임을 이용, static은 밑줄로 표시



(EX)

class Tape

{

private:

  int id; char title[50];  char director[30];

  char actor[50]; char genre[20]; int price;

public:

  void input(); void input(int ); void display() const;


};

 Tape

 -id

-title

-director

-actor

-genre

-price

 +input():void

+input(int):void

+display():void', '#자바', '2020-05-09', 3);

insert into posts
values(14, 'so', 0, '임베디드 - 인테감지 시, 점등 프로그램', '#include <stdio.h>
#include <stdlib.h>
#include <wiringPi.h>
#include <unistd.h>
#include <time.h>

#define PIR_D 2 // 27
#define LED_RED 7 //4

char pir_flag = 0;

void PIR_interrupt()
{
	pir_flag = 1 ;
}

int main(void){
  	if(wiringPiSetup()==-1)
       	  return -1;
	pinMode(PIR_D,INPUT);
             pinMode(LED_RED,OUTPUT);
	digitalWrite(LED_RED,0);

             wiringPilSR(PIR_D, INT_EDGE_RISING, &PIR_interrupt);

    while(1){
	if(pir_flag == 1) {
	  printf("PIR Detected !! \n");

               digitalWrite(LED_RED,1);
	  pir_flag = 0;
   	}
	else {
	  printf("PIR Not detect !! \n");
	}
	usleep(500000);
             digitalWrite(LED_RED,0);
   }
  return 0;
}
', '#임베디드 #라즈베리파이', '2020-05-09', 3);

insert into posts values(15, 'han', 0, '임베디드 - 클라이언트 서버 활용', 'client ----------------------------------> server----------------------------------> client
감지 정보를 전송					계산				얘한테 줘서 뭐 하도록
(현재 어떤 센서로 감지가 됐다/안 됐다)						명령(부저/경고음)

소리 감지 센서 실습하기 267쪽	main4.c
하나의 값을 아날로그로 읽어옴 ADC (아날로그를 D로 바꿔줌 – 채널 2로 들어옴)

Buzzer 제어 실습하기 274쪽 main5.c
부저센서 14번
client ----------------------------------> server----------------------------------> client
감지 정보를 전송					계산				얘한테 줘서 뭐 하도록
(현재 어떤 센서로 감지가 됐다/안 됐다)						명령(부저/경고음)
이거 인체 감지해서 부저에 불 들어오게', '#임베디드 #서버 #클라이언트', '2020-01-06', 1);
insert into posts values(16, 'han', 1, 'TCP 서버 구조', 'main( ) {
	....

	listen_s = socket(...);
	bind(listen_s, ...);
	listen(listen_s, ...);

	while(1) {
		conn_s = accept(listen_s, ...);
		do_service(conn_s);
		close(conn_s);
	}

	close(listen_s);
}


do_service(int conn_s) {

	// 클라이언트 요청 처리
	read( ) / write( )
	....
}
', '#TCP #서버', '2020-05-06', 1);
insert into posts values(17, 'han', 1, '멀티프로세싱방식의 다중 접속 서버', 'main( ) {
	....
	listen_s = socket(...);
	bind(listen_s, ...);
	listen(listen_s, ...);

	while(1) {
		conn_s = accept(listen_s, ...);

		if((pid = fork( )) > 0) {// 부모 프로세스
		 // 다른 클라이언트의 요청 접수
		   close(conn_s);
		   continue;

		} else if(pid == 0) {// 자식 프로세스:
		   // 클라이언트의 요청 처리
		   close(listen_s);
		   do_service(conn_s);
		   exit(0);
		}
	}
}
do_service(int conn_s) {
	// 클라이언트의 요청 처리 루틴
	....
}
', '#멀티프로세싱', '2020-06-13', 1);
insert into posts values(18, 'han', 1, 'fork 함수를 이용한 다중 접속 서버의 구현', '1   // echo_server_fork.c

~~ 생략 ~~
9   #define PORT 8090
10
11 void do_echo(int);
12
13 main( )
14 {
~~ 생략 ~~
18
19      pid_t	pid;
20
21      listenSock = socket(PF_INET, SOCK_STREAM, 0);
~~ 생략 ~~
27
      if(bind(listenSock, (struct sockaddr *) &s_addr, sizeof(s_addr)) == -1) {
29	printf("Can not Bind\n");
30	return -1;
31      }
32
~~ 생략 ~~
37
38      while(1) {
39
40         len = sizeof(c_addr);
41         connSock = accept(listenSock, (struct sockaddr *) &c_addr, &len);
42

43         if((pid = fork( )) < 0) {
44            printf("echo server can not fork( )\n");
45            return -1;
46         } else if(pid > 0) {
47	          close(connSock);
48	          continue;
49         } else if(pid == 0 ) {
50	          close(listenSock);
51	           do_echo(connSock);
52         }
53      }
54   }
55
56   void
57   do_echo(int connSock) {
58      int	n;
59      char	rcvBuffer[BUFSIZ];
60
61      while((n = read(connSock, rcvBuffer, sizeof(rcvBuffer))) != 0) {
62         printf("child\n");
63         write(connSock, rcvBuffer, n);
}
exit(0);
66   }
', '#fork #다중접속서버', '2020-06-14', 1);
insert into posts values(19, 'so', 1, 'DNS 프로그램', '#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<netdb.h>
#include<arpa/inet.h>
#include <unistd.h>

void error_handling(char *message); // 에러 처리 함수

// 입력 데이터에 따라 주소 변환하기 (ip<->damain)
void main(int argc,char *argv[])
{
	struct hostent *myhost;  	// 도메인 주소에 대한 것
	struct in_addr myinaddr; 	// IP 주소를 저장할 구조체, 주소가 여러 개가 있을 때

	struct hostent *host;		// 도메인 주소
	struct sockaddr_in addr;	// 아이피 주소

	int i;

	// parameter 입력 오류 시
	if(argc < 2 | argc!=2) {
		printf("Usage: %s host_name(domain name or ip)\n", argv[0]);
		// 명령어 뒤에 도메인 주소
		exit(1);
        }


	// 도메인(숫자가 아닌 경우, 숫자로 변환 시, 0) -> IP일 경우
	if(atoi(argv[1]) <= 0) {

		// hostent 구하기
		myhost = gethostbyname(argv[1]); // 도메인 주소 받아와서 넣기
		if(myhost == 0) { // 존재하지 않는 도메인
	        	printf("erro occurs .. at ''gethostbyname''.\n\n\n");
	        	exit(1);
        	}

        	// 호스트 이름 출력 : 존재하는 도메인
    		printf("official host name : \t\t %s\n", myhost->h_name); // 공식이름
		i = 0;
		//호스트 별명 출력
		while(myhost->h_aliases[i] != NULL){
			printf("aliases name : \t\t%s\n", myhost->h_aliases[i]);
			i++;
		}

		//호스트 주소체계 출력
		printf("host address type : \t\t%d\n", myhost->h_addrtype);
		//호스트 주소 길이 출력
		printf("length of host address : \t%d\n", myhost->h_length);
		//호스트 주소를 dotted decimal 형태로 출력
		while(myhost->h_addr_list[i] != NULL){	// 아이피 주소가 여러 개일 경우
			myinaddr.s_addr = *((u_long *)(myhost->h_addr_list[i]));
			printf("address for host:\t\t%s\n", inet_ntoa(myinaddr));
			i++;
		}
	}

	// IP -> 도메인일 경우
	else {
        	memset(&addr, 0, sizeof(addr));
		addr.sin_addr.s_addr = inet_addr(argv[1]);

 		// 아이피에 해당하는 호스트
		host = gethostbyaddr((char*)&addr.sin_addr, 4, AF_INET);

		if(!host) // 없음 에러
	 		error_handling("gethost... error");

		printf("Officially name : %s \n\n", host->h_name); // 이름

		puts("Aliases-----------");
		for(i = 0; host->h_aliases[i]; i++){
			puts(host->h_aliases[i]);
		}

      		printf("Address Type : %s \n", host->h_addrtype == AF_INET? "AF_INET":"AF_INET6");
		puts("IP Address--------");
		for(i = 0; host->h_addr_list[i]; i++) { // 길이는 출력하지 않음
			puts( inet_ntoa( *(struct in_addr*)host->h_addr_list[i] ));
		}

	}


} //end of main

// 에러 처리 함수
void error_handling(char *message){

   fputs(message,stderr);
   fputc(''\n'',stderr);
   exit(1);
}', '#DNS', '2020-05-07', 0);

insert into groupinfo values(1, '개발자 다이어리', '개발 관련 여러 분야 잡 지식 기록용', '#자바 #임베디드 #개발자', 'so');
insert into groupinfo values(2, '자바 개념 잡기', '자바 개념에 대해 알려드립니다', '#자바 #개발', 'si');
insert into groupinfo values(3, '자바 마스터', '자바를 마스터 하고 싶다면 지금 바로 들어오세요', '#자바 #개념', 'joo');

insert into guserinfo values(1, 'so', 0);
insert into guserinfo values(1, 'si', 1);
insert into guserinfo values(1, 'joo', 1);
insert into guserinfo values(1, 'han', 1);
insert into guserinfo values(1, 'test', 2);

insert into guserinfo values(2, 'si', 0);
insert into guserinfo values(2, 'so', 1);
insert into guserinfo values(2, 'joo', 1);
insert into guserinfo values(2, 'han', 1);
insert into guserinfo values(2, 'test', 2);

insert into guserinfo values(3, 'joo', 0);
insert into guserinfo values(3, 'so', 1);
insert into guserinfo values(3, 'si', 2);
insert into guserinfo values(3, 'han', 1);
insert into guserinfo values(3, 'test', 2);

insert into likes values (11, 'so');
insert into likes values (12, 'so');
insert into likes values (13, 'so');
insert into likes values (13, 'si');
insert into likes values (13, 'joo');
insert into likes values (15, 'so');
insert into likes values (16, 'so');
insert into likes values (17, 'so');
insert into likes values (18, 'so');
insert into likes values (19, 'so');

select * from userinfo;
select * from posts;
select * from groupinfo;
select * from guserinfo;
select * from likes;
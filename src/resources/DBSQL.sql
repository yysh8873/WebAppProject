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

-- isIn 1: 그룹원 0: 승인대기
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

insert into posts values(1, 'so', 0, '테스트게시물1', '테스트 게시물1을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트1 #테스트2', '2020-01-06', 0);
insert into posts values(2, 'so', 1, '테스트게시물2', '테스트 게시물2을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트2 #테스트3', '2020-05-06', 0);
insert into posts values(3, 'so', 1, '테스트게시물3', '테스트 게시물3을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트3', '2020-05-06', 0);
insert into posts values(4, 'so', 1, '테스트게시물4', '테스트 게시물4을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트4', '2020-05-07', 0);
insert into posts values(5, 'so', 1, '테스트게시물5', '테스트 게시물5을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트5', '2020-05-07', 0);

insert into posts values(6, 'si', 0, '테스트게시물6', '테스트 게시물6을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트6 #테스트3', '2020-05-08', 0);
insert into posts values(7, 'si', 0, '테스트게시물7', '테스트 게시물7을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트7 #테스트3', '2020-05-08', 0);
insert into posts values(8, 'si', 0, '테스트게시물8', '테스트 게시물8을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트8', '2020-05-10', 0);
insert into posts values(9, 'si', 2, '테스트게시물9', '테스트 게시물9을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트9', '2020-05-10', 0);
insert into posts values(10, 'si', 2, '테스트게시물10', '테스트 게시물10을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트10', '2020-05-11', 0);

insert into posts values(11, 'joo', 0, '테스트게시물11', '테스트 게시물11을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트11 #테스트3', '2020-05-07', 1);
insert into posts values(12, 'joo', 0, '테스트게시물12', '테스트 게시물12을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트12', '2020-05-08', 1);
insert into posts values(13, 'joo', 0, '테스트게시물13', '테스트 게시물13을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트13', '2020-05-09', 3);

insert into posts
values(14, 'so', 0, '에잇(Prod.&Feat. SUGA of BTS)', 'So are you happy now
Finally happy now are you

뭐 그대로야 난
다 잃어버린 것 같아

모든 게 맘대로 왔다가 인사도 없이 떠나
이대로는 무엇도 사랑하고 싶지 않아
다 해질 대로 해져버린
기억 속을 여행해

우리는 오렌지 태양 아래
그림자 없이 함께 춤을 춰
정해진 이별 따위는 없어
아름다웠던 그 기억에서 만나
Forever young

우우우 우우우우 우우우 우우우우
Forever we young
우우우 우우우우
이런 악몽이라면 영영 깨지 않을게

섬 그래 여긴 섬 서로가 만든 작은 섬
예 음 forever young 영원이란 말은 모래성

작별은 마치 재난문자 같지
그리움과 같이 맞이하는 아침
서로가 이 영겁을 지나
꼭 이 섬에서 다시 만나

지나듯 날 위로하던 누구의 말대로 고작
한 뼘짜리 추억을 잊는 게 참 쉽지 않아
시간이 지나도 여전히
날 붙드는 그곳에

우리는 오렌지 태양 아래
그림자 없이 함께 춤을 춰
정해진 안녕 따위는 없어
아름다웠던 그 기억에서 만나

우리는 서로를 베고 누워
슬프지 않은 이야기를 나눠
우울한 결말 따위는 없어
난 영원히 널 이 기억에서 만나
Forever young

우우우 우우우우 우우우 우우우우
Forever we young
우우우 우우우우
이런 악몽이라면 영영 깨지 않을게', '#테스트13', '2020-05-09', 3);

insert into posts values(15, 'so', 0, '테스트게시물15', '테스트 게시물15을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트1 #테스트2', '2020-01-06', 1);
insert into posts values(16, 'so', 1, '테스트게시물16', '테스트 게시물16을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트2 #테스트3', '2020-05-06', 1);
insert into posts values(17, 'so', 1, '테스트게시물17', '테스트 게시물17을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트3', '2020-05-06', 1);
insert into posts values(18, 'so', 1, '테스트게시물18', '테스트 게시물18을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트4', '2020-05-07', 1);
insert into posts values(19, 'so', 1, '테스트게시물19', '테스트 게시물19을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트5', '2020-05-07', 1);
insert into posts values(20, 'so', 0, 'Android - Dialog : 라디오버튼 다이얼로그',
                         '이번에는 라디오 버튼으로 제작했다. 누르는 순간 창이 닫히도록 해두었으니 참고하자.
activity_main.xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
android:layout_width="fill_parent"
android:layout_height="fill_parent"
android:orientation="vertical" >

<TextView
android:id="@+id/textView1"
android:layout_width="match_parent"
android:layout_height="wrap_content"
android:layout_weight="1"
android:text="싱글 초이스\n다이얼로그"
android:gravity="center"
android:textSize="25dp" />'' ||
                         ''
<Button
android:id="@+id/button1"
android:layout_width="match_parent"
android:layout_height="wrap_content"
android:layout_below="@+id/textView1"
android:layout_weight="1"
android:text="싱글 초이스 다이얼로그" />
</LinearLayout> ', 'Android Dialog', '2020-05-17', 0);


insert into groupinfo values(1, '소현이네', '소현이네 그룹입니다', '#테스트1', 'so');
insert into groupinfo values(2, '시연이네', '시연이네 그룹입니다', '#테스트2', 'si');
insert into groupinfo values(3, '주영이네', '주영이네 그룹입니다', '#테스트3', 'joo');

insert into guserinfo values(1, 'so', 0);
insert into guserinfo values(1, 'si', 1);
insert into guserinfo values(1, 'joo', 1);
insert into guserinfo values(1, 'test', 1);

insert into guserinfo values(2, 'si', 0);
insert into guserinfo values(2, 'so', 1);
insert into guserinfo values(2, 'joo', 1);
insert into guserinfo values(2, 'test', 2);

insert into guserinfo values(3, 'joo', 0);
insert into guserinfo values(3, 'so', 1);
insert into guserinfo values(3, 'si', 2);
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

SELECT DISTINCT likes.*
FROM likes, posts
WHERE likes.cid = posts.cid
  AND likes.uid = 'so' AND likes.cid = 13;

SELECT *
FROM likes, posts
WHERE likes.cid = posts.cid
  AND likes.uid = 'so' AND posts.cid = 13;
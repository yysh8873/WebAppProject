create database deeper;

/* 유저정보(유저아이디, 유저이름, 이메일, 비밀번호) */
create table userinfo
	(uid varchar(20) not null primary key,
	name varchar(16) not null,
	email varchar(30) not null,
	pw varchar(100) not null) ;
	
/* 글쓰기(글아이디, 글쓴이아이디, 속한그룹아이디, 제목, 글내용, 해시태그, 날짜, 좋아요 수) 
 * 글쓴이의 이름은 그룹이 있는 경우 그룹원에서 아이디 검색해서 넣고, 없으면 본명 넣는걸로 하면 될 거 같아요!*/
create table post
	(cid int not null primary key,
	uid varchar(20) not null,
	gid varchar(20) null,
	title varchar(30) not null,
	contents varchar(10000) not null,
	tag varchar(30) null,
	tdate date not null,
	ttime time(6) not null,
	likes int null default 0);
	
/* 그룹정보(그룹아이디, 그룹이름, 그룹장아이디, 해시태그) */
create table groupinfo
	(gid varchar(20) not null primary key,
	gname varchar(16) not null,
	uid varchar(20) not null,
	tag varchar(30) null) ;
	
/* 그룹원 정보(그룹아이디, 그룹원아이디, 그릅 내에서의 이름) */
create table guserinfo
	(gid varchar(20) not null,
	uid varchar(20) not null,
	name varchar(16) not null,
	primary key(gid, uid),
	foreign key(gid) references groupinfo(gid),
	foreign key(uid) references userinfo(uid));
	

show databases;
use deeper;
show tables;
drop table post;

select * from userinfo;
select * from post;
select * from groupinfo;
select * from guserinfo;


/* sample data */
insert into userinfo
	values('whs123', '왕한신', 'whs123@hs.ac.kr', '123123asd' );
insert into userinfo
	values('rkdrn59', '오강구', 'ohsmart@gmail.com', 'grt5959' );
insert into userinfo
	values('imwnsdud', '이준영', 'imwnsdud@naver.com', 'lovemyself' );
insert into userinfo
	values('narunaru', '한나루', 'narunaru@gmail.com', 'duck777' );

insert into groupinfo
	values('langStudy', '언어스터디', 'whs123', '#프로그래밍');
insert into groupinfo
	values('excjava', '자바마스터', 'narunaru', '#Java');

insert into guserinfo
	values('langStudy', 'whs123', '한');
insert into guserinfo
	values('langStudy', 'rkdrn59', '갯강구');
insert into guserinfo
	values('excjava', 'narunaru', '나루나루');
insert into guserinfo
	values('excjava', 'whs123', '한');

insert into post
	values(1, 'whs123', 'excjava', 'Java 주석 달기', '주석문은 //를 사용하거나 <!-- -->로 달 수 있습니다', '#Java', '2020-05-01', '12:03:20', 0);
insert into post
	values(2, 'imwnsdud', 'langStudy', '++ 너무 어렵네요', 'i++ ++i 차이를 모르겠습니다', '#프로그래밍', '2020-05-01', '13:00:07', 0);
insert into post
	values(3, 'whs123', null, 'HTML도 언어일까요?', 'HTML은 모르겠지만 JS는 언어죠', '#HTML #JavaScript', '2020-05-07', '02:38:42', 0);
	

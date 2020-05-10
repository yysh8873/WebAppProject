drop database deeper;

create database deeper;
use deeper;

create table userinfo
(uid varchar(20) not null primary key,
 name varchar(16) not null,
 email varchar(30) not null,
 pw varchar(100) not null)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table post
(cid int not null primary key,
 uid varchar(20) not null,
 gid int null,
 title varchar(30) not null,
 contents varchar(10000) not null,
 tag varchar(30) null,
 tdate date not null,
 likes int null default 0)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table groupinfo
(gid int not null primary key,
 gname varchar(16) not null,
 tag varchar(30) null)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table guserinfo
(gid int not null,
 uid varchar(20) not null,
 primary key(gid, uid))ENGINE=InnoDB DEFAULT CHARSET=utf8;


show databases;
show tables;


insert into userinfo(uid, name, email, pw) values('test', '테스트', 'test@hs.ac.kr', 1234);
insert into userinfo(uid, name, email, pw) values('so', '이소현', 'so@hs.ac.kr', 'so11');
insert into userinfo(uid, name, email, pw) values('si', '권시연', 'si@hs.ac.kr', 'si22');
insert into userinfo(uid, name, email, pw) values('joo', '우주영', 'joo@hs.ac.kr', 'joo33');

insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(1, 'so', 0, '테스트게시물1', '테스트 게시물1을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트1 #테스트2', '2020-01-06', 1);
insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(2, 'so', 1, '테스트게시물2', '테스트 게시물2을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트2 #테스트3', '2020-05-06', 1);
insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(3, 'so', 1, '테스트게시물3', '테스트 게시물3을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트3', '2020-05-06', 0);
insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(4, 'so', 1, '테스트게시물4', '테스트 게시물4을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트4', '2020-05-07', 0);
insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(5, 'so', 1, '테스트게시물5', '테스트 게시물5을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트5', '2020-05-07', 1);

insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(6, 'si', 0, '테스트게시물6', '테스트 게시물6을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트6 #테스트3', '2020-05-08', 1);
insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(7, 'si', 0, '테스트게시물7', '테스트 게시물7을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트7 #테스트3', '2020-05-08', 0);
insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(8, 'si', 0, '테스트게시물8', '테스트 게시물8을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트8', '2020-05-10', 1);
insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(9, 'si', 2, '테스트게시물9', '테스트 게시물9을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트9', '2020-05-10', 1);
insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(10, 'si', 2, '테스트게시물10', '테스트 게시물10을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트10', '2020-05-11', 0);

insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(11, 'joo', 3, '테스트게시물11', '테스트 게시물11을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트11 #테스트3', '2020-05-07', 1);
insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(12, 'joo', 3, '테스트게시물12', '테스트 게시물12을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트12', '2020-05-08', 1);
insert into post(cid, uid, gid, title, contents, tag, tdate, likes) values(13, 'joo', 3, '테스트게시물13', '테스트 게시물13을 불러오는데 성공했습니다. 축하합니다^0^', '#테스트13', '2020-05-09', 1);

insert into groupinfo(gid, gname, tag) values(1, '소현이네', '#테스트1');
insert into groupinfo(gid, gname, tag) values(2, '시연이네', '#테스트2');
insert into groupinfo(gid, gname, tag) values(3, '주영이네', '#테스트3');

insert into guserinfo(gid, uid) values(1, 'si');
insert into guserinfo(gid, uid) values(1, 'joo');
insert into guserinfo(gid, uid) values(1, 'test');

insert into guserinfo(gid, uid) values(2, 'so');
insert into guserinfo(gid, uid) values(2, 'joo');

insert into guserinfo(gid, uid) values(3, 'so');

select * from userinfo;
select * from post;
select * from groupinfo;
select * from guserinfo;

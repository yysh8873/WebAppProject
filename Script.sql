create database deeper;
use deeper;

create table userinfo
	(uid varchar(20) not null primary key,
	name varchar(16) not null,
	email varchar(30) not null,
	pw varchar(100) not null) ;
	
create table post
	(cid int not null primary key,
	uid varchar(20) not null,
	gid varchar(20) null,
	title varchar(30) not null,
	contents varchar(10000) not null,
	tag varchar(30) null,
	tdate date not null,
	likes int null default 0);
	
create table groupinfo
	(gid varchar(20) not null primary key,
	gname varchar(16) not null,
	uid varchar(20) not null,
	tag varchar(30) null) ;
	
create table guserinfo
	(gid varchar(20) not null,
	uid varchar(20) not null,
	name varchar(16) not null,
	primary key(gid, uid),
	foreign key(gid) references groupinfo(gid),
	foreign key(uid) references userinfo(uid));
	

show databases;
show tables;

select * from userinfo;
select * from post;
select * from groupinfo;
select * from guserinfo;



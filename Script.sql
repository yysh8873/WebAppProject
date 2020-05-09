create database deeper;

/* ��������(�������̵�, �����̸�, �̸���, ��й�ȣ) */
create table userinfo
	(uid varchar(20) not null primary key,
	name varchar(16) not null,
	email varchar(30) not null,
	pw varchar(100) not null) ;
	
/* �۾���(�۾��̵�, �۾��̾��̵�, ���ѱ׷���̵�, ����, �۳���, �ؽ��±�, ��¥, ���ƿ� ��) 
 * �۾����� �̸��� �׷��� �ִ� ��� �׷������ ���̵� �˻��ؼ� �ְ�, ������ ���� �ִ°ɷ� �ϸ� �� �� ���ƿ�!*/
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
	
/* �׷�����(�׷���̵�, �׷��̸�, �׷�����̵�, �ؽ��±�) */
create table groupinfo
	(gid varchar(20) not null primary key,
	gname varchar(16) not null,
	uid varchar(20) not null,
	tag varchar(30) null) ;
	
/* �׷�� ����(�׷���̵�, �׷�����̵�, �׸� �������� �̸�) */
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
	values('whs123', '���ѽ�', 'whs123@hs.ac.kr', '123123asd' );
insert into userinfo
	values('rkdrn59', '������', 'ohsmart@gmail.com', 'grt5959' );
insert into userinfo
	values('imwnsdud', '���ؿ�', 'imwnsdud@naver.com', 'lovemyself' );
insert into userinfo
	values('narunaru', '�ѳ���', 'narunaru@gmail.com', 'duck777' );

insert into groupinfo
	values('langStudy', '���͵�', 'whs123', '#���α׷���');
insert into groupinfo
	values('excjava', '�ڹٸ�����', 'narunaru', '#Java');

insert into guserinfo
	values('langStudy', 'whs123', '��');
insert into guserinfo
	values('langStudy', 'rkdrn59', '������');
insert into guserinfo
	values('excjava', 'narunaru', '���糪��');
insert into guserinfo
	values('excjava', 'whs123', '��');

insert into post
	values(1, 'whs123', 'excjava', 'Java �ּ� �ޱ�', '�ּ����� //�� ����ϰų� <!-- -->�� �� �� �ֽ��ϴ�', '#Java', '2020-05-01', '12:03:20', 0);
insert into post
	values(2, 'imwnsdud', 'langStudy', '++ �ʹ� ��Ƴ׿�', 'i++ ++i ���̸� �𸣰ڽ��ϴ�', '#���α׷���', '2020-05-01', '13:00:07', 0);
insert into post
	values(3, 'whs123', null, 'HTML�� ����ϱ��?', 'HTML�� �𸣰����� JS�� �����', '#HTML #JavaScript', '2020-05-07', '02:38:42', 0);
	

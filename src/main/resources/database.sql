use glory_db;

drop table if exists tbl_board;
create table tbl_board (
  bno integer auto_increment,
  title varchar(200) not null,
  content text not null,
  writer varchar(50) not null,
  reg_date datetime default now(),
  update_date datetime default now(),
  constraint pk_board primary key(bno)
);


insert into tbl_board(title, content, writer)
values
	('테스트 제목', '테스트 내용', 'user00'),
	('테스트 제목2', '테스트 내용2', 'user00'),
	('테스트 제목3', '테스트 내용3', 'user01');


-- 전체 목록보기
select * from tbl_board
order by bno desc;		-- order by reg_date desc

-- 페이지 목록 보기
select * from tbl_board
order by bno desc
limit 0, 10;	-- offset, count

-- 전체 데이터 건수
select count(*) as total_count from tbl_board;


-- 상세보기
select * from tbl_board 
where bno = 1;

-- 검색(title, content)
select * from tbl_board 
where title like '%내용%' or content like '%내용%'
order by bno desc
limit 0, 10;

-- 수정
update tbl_board 
set
	title = '수정한 타이틀',
	content = '수정한 내용',
	update_date = now()
where bno = 1;
	
select * from tbl_board;

-- 삭제
delete from tbl_board 
where bno = 1;


select * from tbl_board 
order by bno desc 
limit 0 , 10;



select * from tbl_board  
WHERE title like CONCAT('%','새로','%') OR content like CONCAT('%','새로','%') 
order by bno desc
limit 0 , 10; 


drop table if exists tbl_users;
create table tbl_users(
	username varchar(50) primary key,
	password varchar(128) not null,
	email varchar(50) not null
);

drop table if exists tbl_authorities;
create table tbl_authorities(
	username varchar(50) not null,
	authority varchar(50) not null,
	primary key(username, authority),
	constraint fk_authorities_users 
	foreign key (username)
	references tbl_users(username)
);


select distinct writer from tbl_board
order by writer;


delete from tbl_users ;
insert into tbl_users(username, password, email)
values
	('admin', '1234', 'admin@galapgos.org'),
	('user00', '1234', 'user00@galapgos.org'),
	('newbie', '1234', 'newbie@galapgos.org'),
	('newbie0', '1234', 'newbie0@galapgos.org'),
	('newbie1', '1234', 'newbie1@galapgos.org'),
	('newbie2', '1234', 'newbie2@galapgos.org'),
	('newbie3', '1234', 'newbie3@galapgos.org'),
	('newbie4', '1234', 'newbie4@galapgos.org');



select * from tbl_authorities order by authority;

delete from tbl_authorities ;
insert into tbl_authorities (username, authority) 
values 
	('admin','ROLE_ADMIN'),
	('admin','ROLE_MANAGER'),
	('user00','ROLE_MANAGER'),
	('newbie','ROLE_USER'),
	('newbie0','ROLE_USER'),
	('newbie1','ROLE_USER'),
	('newbie2','ROLE_USER'),
	('newbie3','ROLE_USER'),
	('newbie4','ROLE_USER');

select * from tbl_authorities order by authority;


-- 기존 컬럼 no에 pk, auto_increment 배정
alter table travel
modify no int auto_increment primary key; 


select * from travel;


update travel
set 
	description = replace(description, ". " , ".<br> ");
	


drop table if exists tbl_board_attachment;
create table tbl_board_attachment (
    no integer auto_increment primary key,
    bno integer,						-- tbl_board에 대한 FK
    filename varchar(256) not null,		-- 원본 파일 명
    path varchar(256) not null,			-- 서버에서의 파일 경로
    content_type varchar(56),			-- content-type
    size integer,						-- 파일의 크기
    reg_date datetime default now(),
    constraint foreign key(bno) references tbl_board(bno)    
);


drop table if exists tbl_member;
create table tbl_member(
	username varchar(50) primary key,
	password varchar(128) not null,
	email varchar(50) not null,
	reg_date datetime default now(),
	update_date datetime default now()

);


drop table if exists tbl_member_auth;
create table tbl_member_auth(
	username varchar(50) not null,
	auth varchar(50) not null,
 	primary key(username, auth),
	constraint fk_auth_users foreign key (username)
				references tbl_member(username)
);


select distinct writer from tbl_board 
order by writer;


insert into tbl_member(username, password, email)
values
	('admin', '1234', 'admin@galapgos.org'),
	('user00', '1234', 'user00@galapgos.org'),
	('newbie', '1234', 'newbie@galapgos.org'),
	('newbie0', '1234', 'newbie0@galapgos.org'),
	('newbie1', '1234', 'newbie1@galapgos.org'),
	('newbie2', '1234', 'newbie2@galapgos.org'),
	('newbie3', '1234', 'newbie3@galapgos.org'),
	('newbie4', '1234', 'newbie4@galapgos.org');


select * from tbl_member
order by reg_date desc;



update tbl_member 
set password = '$2a$10$cBqx3s5jY/PLSM2flooZbOwK.bpoHUXOByDqmlbNbmBwXhXsSyQNS';

insert into tbl_member_auth(username, auth) 
values 
	('admin','ROLE_ADMIN'),
	('admin','ROLE_MANAGER'),
	('admin','ROLE_USER'),
	('user00','ROLE_MANAGER'),
	('user00','ROLE_USER'),
	('newbie','ROLE_USER'),
	('newbie1','ROLE_USER'),
	('newbie2','ROLE_USER'),
	('newbie3','ROLE_USER'),
	('newbie4','ROLE_USER');

select * from tbl_member_auth order by auth;


drop table if exists tbl_comment;

create table tbl_comment (
	no			integer auto_increment primary key,
	bno 		integer not null,
	content		varchar(2000) not null,
	writer		varchar(50) not null,
	reg_date	datetime default now(),
	update_date	datetime default now(),

	constraint fk_comment_board foreign key(bno) references tbl_board(bno),
	constraint fk_comment_member foreign key(writer) 
			references tbl_member(username)
);

delete from tbl_member 
where username = 'xxxxxxx';

select * from travel
order by rand() limit 5;


select * from tbl_comment;



create table tbl_reply (
	no 		integer auto_increment primary key,
	cno 		integer not null,
	content	varchar(1000) not null,
	writer	varchar(50) not null,
	reg_date	datetime default now(),
	update_date	datetime default now(),

	constraint fk_reply_comment foreign key(cno) references tbl_comment(no)
);


select * from tbl_comment;

insert into tbl_reply(cno, writer, content) 
values	(4, 'admin', '답글1'),
		(4, 'admin', '답글2'),
		(4, 'newbie2', '답글3');

select * from tbl_reply;

select 
	c.no, c.bno, c.content c_content, c.writer c_writer, 
	c.reg_date c_reg_date, c.update_date c_update_date,
	r.no rno, r.content r_content, r.writer r_writer, 
	r.reg_date r_reg_date, r.update_date r_update_date
from tbl_comment c left join tbl_reply r
	on c.no = r.cno 
where bno = 277
order by c.no desc, r.no;


select * from travel;
order by rand()
limit 5;


select 
	c.no, c.bno, c.content c_content, c.writer c_writer, 
	c.reg_date c_reg_date, c.update_date c_update_date,
	r.no rno, r.content r_content, r.writer r_writer, 
	r.reg_date r_reg_date, r.update_date r_update_date
from tbl_comment c left join tbl_reply r
	on c.no = r.cno 
where bno = 277;


단양 다리안관광지 028-
069-

select * from travel ;
where title like '%편백우드%';


delete from travel 
where no = 115;

drop table tbl_travel_heart;

create table tbl_travel_heart (
	tno integer not null,
	username varchar(50) not null,
	constraint primary key(tno, username),
	constraint foreign key (tno) references travel(no),
	constraint foreign key (username) references tbl_member(username) 
)

select * from travel
where mod(no, 2) = 0;


insert into tbl_travel_heart (tno, username)
values	(100, 'admin'),
		(101, 'admin'),
		(105, 'admin'),
		(100, 'user00'),
		(101, 'newbie0'),
		(105, 'newbie1');
	
	
select distinct username from tbl_member;

select count(*) hearts, tno
from tbl_travel_heart 
group by tno;
 



create or replace view view_travel_hearts 
as 
	select count(*) hearts, tno
	from tbl_travel_heart 
	group by tno;
 


select * from view_travel_hearts;


-- travel과 view_travel_hearts를 join
-- join 방법?

select t.*, h.hearts
from travel t left join view_travel_hearts h
on t.no = h.tno;





select t.*, ifnull(hearts, 0) hearts
from travel t left join view_travel_hearts h
	on t.no = h.tno;


create or replace view view_travel
as 
	select t.*, ifnull(hearts, 0) hearts
	from travel t left join view_travel_hearts h
		on t.no = h.tno;

	
select * from view_travel;


-- 특정 travel에 투표했는지 여부 검사
select count(*) from tbl_travel_heart
where tno = 100 and username = 'admin';



select * from tbl_board_attachment; 



--관객,아티스트,관리자 공통
CREATE TABLE os_member(
 id VARCHAR2(100) PRIMARY KEY,
 password VARCHAR2(100) NOT NULL,
 nickname VARCHAR2(100) NOT NULL,
 address VARCHAR2(200) NOT NULL,
 phone VARCHAR2(100) NOT NULL,
 email VARCHAR2(100) NOT NULL,
 name VARCHAR2(100) NOT NULL,
 age VARCHAR2(100) NOT NULL,
 remove_user_date DATE,
 profile VARCHAR2(100) 
);

--권한
CREATE TABLE os_auth(
	auth_name VARCHAR2(100),
	id VARCHAR2(100),
	CONSTRAINT os_auth_pk PRIMARY KEY(auth_name,id),
	CONSTRAINT os_auth_fk FOREIGN KEY(id) REFERENCES os_member(id) ON DELETE CASCADE	 
);

--아티스트
CREATE TABLE os_artist(
	id VARCHAR2(100) PRIMARY KEY,
	sns VARCHAR2(100),
	account VARCHAR2(100),
	artist_info CLOB NOT NULL,
	check_date DATE,
	CONSTRAINT os_artist_fk FOREIGN KEY(id) REFERENCES os_member(id) ON DELETE CASCADE
);

--이벤트
CREATE TABLE os_event(
	event_no NUMBER PRIMARY KEY,
	event_title VARCHAR2(100) NOT NULL,
	event_content CLOB NOT NULL,
	event_image VARCHAR2(100) NOT NULL,
	event_write_date DATE NOT NULL,
	event_date DATE NOT NULL,
	event_check_date DATE,
	id VARCHAR2(100) NOT NULL
	CONSTRAINT os_event_fk REFERENCES os_member(id) ON DELETE CASCADE
);

--공연일정
CREATE TABLE os_show(
	show_no NUMBER PRIMARY KEY,
	show_title VARCHAR2(100) NOT NULL,
	show_img VARCHAR2(100),
	show_write_date DATE NOT NULL,
	show_content CLOB NOT NULL,
	show_date DATE NOT NULL,
	id VARCHAR2(100) NOT NULL
	CONSTRAINT os_show_fk REFERENCES os_member(id) ON DELETE CASCADE
);

--댓글
CREATE TABLE os_comment(
	comment_no NUMBER,
	show_no NUMBER,
	id VARCHAR2(100),
	comment_content CLOB NOT NULL,
	comment_write_date DATE NOT NULL,
		CONSTRAINT os_comment_pk PRIMARY KEY(comment_no,show_no,id),
		CONSTRAINT os_comment_show_fk FOREIGN KEY(show_no) REFERENCES os_show(show_no) ON DELETE CASCADE,
		CONSTRAINT os_comment_id_fk FOREIGN KEY(id) REFERENCES os_member(id) ON DELETE CASCADE
);

--좋아요
CREATE TABLE os_like(
	show_no NUMBER,
	id VARCHAR2(100),
	CONSTRAINT os_like_pk PRIMARY KEY(show_no,id),
	CONSTRAINT os_like_show_fk FOREIGN KEY(show_no) REFERENCES os_show(show_no) ON DELETE CASCADE,
	CONSTRAINT os_like_id_fk FOREIGN KEY(id) REFERENCES os_member(id) ON DELETE CASCADE
);

--팔로우
CREATE TABLE os_follow(
	following_id VARCHAR2(100),
	id VARCHAR2(100),
	CONSTRAINT os_follow_pk PRIMARY KEY(following_id,id),
	CONSTRAINT os_follow_fk FOREIGN KEY(id) REFERENCES os_member(id) ON DELETE CASCADE
);
select * from os_follow;



--공지사항
CREATE TABLE os_notice(
	notice_no NUMBER PRIMARY KEY,
	notice_title VARCHAR2(100) NOT NULL,
	notice_write_date DATE NOT NULL,
	notice_content CLOB NOT NULL,
	id VARCHAR2(100) NOT NULL
	CONSTRAINT os_notice_fk REFERENCES os_member(id) ON DELETE CASCADE
);


--시퀀스
CREATE SEQUENCE os_event_seq NOCACHE;
CREATE SEQUENCE os_show_seq NOCACHE;
CREATE SEQUENCE os_comment_seq NOCACHE;
CREATE SEQUENCE os_notice_seq NOCACHE;

--시퀀스 삭제
DROP SEQUENCE os_event_seq;
DROP SEQUENCE os_show_seq;
DROP SEQUENCE os_comment_seq;
DROP SEQUENCE os_notice_seq;


--테이블 삭제
DROP TABLE os_member;
DROP TABLE os_artist;
DROP TABLE os_show;
DROP TABLE os_auth;
DROP TABLE os_event;
DROP TABLE os_comment;
DROP TABLE os_like;
DROP TABLE os_follow;
DROP TABLE os_notice;

--샘플 아이디(관객)
INSERT INTO os_member(id,password,nickname,address,phone,email,name,age) 
VALUES('bityong','hey1234','펭수','판교','01023451234','bit@gmail.com','펭귄','1997-01-01');

INSERT INTO os_member(id,password,nickname,address,phone,email,name,age) 
VALUES('biton','hey1234','펭수2','판교','01023451234','bit@gmail.com','펭귄2','1997-01-01');

--샘플 아티스트 정보
INSERT INTO os_artist(id,sns,account,artist_info) VALUES('biton','instagram','2222223141','하이루');

--샘플 권환(관객)
INSERT INTO os_auth(auth_name,id) VALUES('ROLE_MEMBER','bityong');
INSERT INTO os_auth(auth_name,id) VALUES('ROLE_MEMBER','biton');
INSERT INTO os_auth(auth_name,id) VALUES('ROLE_ARTIST','biton');



--로그인
SELECT m.id,m.password,m.nickname,m.address,m.phone,m.email,m.name,m.age,m.remove_user_date,m.profile,
a.sns,a.account,a.artist_info,a.check_date
FROM os_member m, os_artist a
WHERE m.id = a.id(+) AND m.id='bityong'

--권한
SELECT auth_name,id FROM os_auth WHERE id='bityong';

--아티스트 승인검사
SELECT check_date FROM os_artist WHERE id='biton'; 

ALTER TABLE os_show MODIFY show_img VARCHAR2(100) NULL;

alter table os_show drop column show_img


INSERT INTO os_member(id,password,nickname,address,phone,email,name,age,profile) 
VALUES('admin','1','관리자','판교','00000000000','bit@gmail.com','관리자','1994-04-07',NULL);
INSERT INTO os_artist(id,sns,account,artist_info,check_date) VALUES('admin','instagram','2222223141','하이루',sysdate); 
INSERT INTO os_auth(auth_name,id) VALUES('ROLE_MEMBER','admin');
INSERT INTO os_auth(auth_name,id) VALUES('ROLE_ARTIST','admin');
INSERT INTO os_auth(auth_name,id) VALUES('ROLE_ADMIN','admin');

select * from os_event 

select * from os_follow

delete from os_follow


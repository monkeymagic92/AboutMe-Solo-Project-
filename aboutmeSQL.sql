CREATE TABLE t_user(
	i_user INT UNSIGNED AUTO_INCREMENT,
	user_id VARCHAR(10),
	user_pw VARCHAR(20),
	nm VARCHAR(15),
	PRIMARY KEY(i_user)
);
SELECT * FROM t_user;





CREATE TABLE t_board(
	i_board INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(10),
	title VARCHAR(50) NOT NULL,
	ctnt LONGTEXT NOT NULL,
	r_dt DATETIME DEFAULT NOW(),
	pw VARCHAR(20),
	scr VARCHAR (2) DEFAULT 1,
	search VARCHAR(10),
	searchResult INT(2),
	PRIMARY KEY(i_board) 
);

SELECT * FROM t_board;
DROP TABLE t_board;



CREATE TABLE t_cmt(
	i_cmt INT UNSIGNED AUTO_INCREMENT,
	i_board INT UNSIGNED,
	cmtPw VARCHAR(30),
	cmtNm VARCHAR(10),
	ctnt VARCHAR(400),
	r_dt DATETIME DEFAULT NOW(),	
	PRIMARY KEY(i_cmt, i_board),
	FOREIGN KEY(i_board) REFERENCES t_board(i_board) ON DELETE CASCADE
);
SELECT * FROM t_cmt;
DROP TABLE t_cmt;






CREATE TABLE t_ipIndex(
	i_ip INT UNSIGNED AUTO_INCREMENT,
	myIp VARCHAR(100),
	ip_addr VARCHAR(100),
	os VARCHAR(20),
	browser VARCHAR(20),
	agent VARCHAR(500),
	r_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY(i_ip)
);
SELECT * FROM t_ipIndex;
DROP TABLE t_ipIndex;




CREATE TABLE t_ipIntro(
	i_ip INT UNSIGNED AUTO_INCREMENT,
	myIp VARCHAR(100),
	ip_addr VARCHAR(100),
	os VARCHAR(20),
	browser VARCHAR(20),
	agent VARCHAR(500),
	r_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY(i_ip)
);
SELECT * FROM t_ipIntro;
DROP TABLE t_ipIntro;




CREATE TABLE t_chat(
	i_chat INT UNSIGNED AUTO_INCREMENT,
	chatCtnt VARCHAR(1000),
	adminCode VARCHAR(2) DEFAULT 1,
	r_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY(i_chat)
);
SELECT * FROM t_chat;
DROP TABLE t_chat;

DELETE FROM t_chat
WHERE i_chat = 13;


CREATE TABLE t_devel(
	i_devel INT UNSIGNED AUTO_INCREMENT,
	ctn1 VARCHAR(150),
	ctn2 VARCHAR(150),
	ctn3 VARCHAR(150),
	ctn4 VARCHAR(150),
	ctn5 VARCHAR(150),
	-- default 값 줘서 1이면 노체크   2면 체크  로  완료 이미지 띄우기 
	-- 안되면 default 지우고 null값으로 체크해서 띄우기
	ctnChk1 VARCHAR(2),
	ctnChk2 VARCHAR(2),
	ctnChk3 VARCHAR(2),
	ctnChk4 VARCHAR(2),
	ctnChk5 VARCHAR(2),
	r_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY(i_devel)
);
SELECT * FROM t_devel;
DROP TABLE t_devel;









-- 멤버 테이블
CREATE TABLE t_member
(
	i_member INT UNSIGNED AUTO_INCREMENT,
	nm VARCHAR(30),
	age INT(3),
	pay INT(10),
	PRIMARY KEY(i_member)
);
SELECT * FROM t_member;


CREATE TABLE t_hobby (
	i_hobby INT UNSIGNED AUTO_INCREMENT,
	i_member INT(3) UNSIGNED,
	hobby1 INT(3),	
	hobby2 INT(3),	
	hobby3 INT(3),	
	FOREIGN KEY(i_member) REFERENCES t_member(i_member),
	PRIMARY KEY(i_hobby)
);
SELECT * FROM t_hobby;


CREATE TABLE t_hobbyNm ( 
	i_hobbyNm INT UNSIGNED AUTO_INCREMENT,
	hobbyNm VARCHAR(30),
	PRIMARY KEY(i_hobbyNm)
);
SELECT * FROM t_hobbynm;





















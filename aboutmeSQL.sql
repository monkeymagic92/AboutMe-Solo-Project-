CREATE TABLE t_user(
	i_user INT UNSIGNED AUTO_INCREMENT,
	user_id VARCHAR(10),
	user_pw VARCHAR(20),
	nm VARCHAR(15),
	PRIMARY KEY(i_user)
);
SELECT * FROM t_user;

INSERT INTO t_user
(user_id, user_pw, nm)
VALUES
('admin', 'admin', '관리자');

USE aboutme;




SELECT * FROM t_board;





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










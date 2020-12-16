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






CREATE TABLE t_board(
	i_board INT UNSIGNED AUTO_INCREMENT,
	i_user INT UNSIGNED,
	nm VARCHAR(10) NOT NULL,
	title VARCHAR(50) NOT NULL,
	ctnt VARCHAR(2000) NOT NULL,
	r_dt DATETIME DEFAULT NOW(),
	scr INT(2),
	pw VARCHAR(40),
	PRIMARY KEY(i_board),
   FOREIGN key(i_user) REFERENCES t_user(i_user) ON DELETE CASCADE
);

SELECT * FROM t_board;

CREATE TABLE tblWomen (
	name VARCHAR2(30) PRIMARY KEY,
	age NUMBER NOT NULL,
	height NUMBER,
	weight NUMBER,
	couple VARCHAR2(30)
);

INSERT INTO tblWomen VALUES ('박나래', 23, 150, 55, NULL);
INSERT INTO tblWomen VALUES ('장도연', 28, 177, 65, '홍길동');
INSERT INTO tblWomen VALUES ('김지민', 30, 160, NULL, '박명수');
INSERT INTO tblWomen VALUES ('김숙', 34, 158, NULL, '유재석');
INSERT INTO tblWomen VALUES ('오나미', 27, NULL, NULL, '조세호');
INSERT INTO tblWomen VALUES ('김민경', 22, 169, 88, '양세형');
INSERT INTO tblWomen VALUES ('홍현희', 20, 158, 75, NULL);
INSERT INTO tblWomen VALUES ('신보라', 26, 170, 60, '정준하');
INSERT INTO tblWomen VALUES ('이세영', 28, 163, NULL, '아무개');
INSERT INTO tblWomen VALUES ('신봉선', 27, 162, NULL, NULL);

COMMIT;

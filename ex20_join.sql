/*
	▶ 조인(Join)
	
		▷ CROSS JOIN
		▷ INNER JOIN
		▷ LEFT OUTER JOIN
		▷ RIGHT OUTER JOIN
		▷ FULL OUTER JOIN
*/

CREATE TABLE tblTest (
	name VARCHAR2(30) NOT NULL,
	age NUMBER(3) NOT NULL,
	nick VARCHAR2(30) NOT NULL
);

INSERT INTO tblTest (name, age, nick) VALUES ('홍길동', 20, '강아지');
INSERT INTO tblTest (name, age, nick) VALUES ('아무개', 22, '고양이');
INSERT INTO tblTest (name, age, nick) VALUES ('홍길동', 20, '강아지');

SELECT * FROM tblTest;

UPDATE tblTest SET nick = '고양이' WHERE name = '홍길동';

SELECT * FROM tblTest;

DELETE FROM tblTest WHERE name = '홍길동';

SELECT * FROM tblTest;

DROP TABLE tblTest;

CREATE TABLE tblTest (
	name VARCHAR2(30) PRIMARY KEY,
	age NUMBER(3) NOT NULL,
	hobby1 VARCHAR2(100),
	hobby2 VARCHAR2(100),
	hobby3 VARCHAR2(100)
);

INSERT INTO tblTest (name, age, hobby1, hobby2, hobby3) VALUES ('홍길동', 20, NULL, NULL, NULL);
INSERT INTO tblTest (name, age, hobby1, hobby2, hobby3) VALUES ('아무개', 22, '골프', NULL, NULL);
INSERT INTO tblTest (name, age, hobby1, hobby2, hobby3) VALUES ('하하하', 24, '수영', '테니스', NULL);
INSERT INTO tblTest (name, age, hobby1, hobby2, hobby3) VALUES ('호호호', 24, '축구', '야구', '농구');

SELECT * FROM tblTest;

CREATE TABLE tblStaff (
	seq NUMBER PRIMARY KEY,
	name VARCHAR2(30) NOT NULL,
	salary NUMBER NOT NULL,
	address VARCHAR2(300) NOT NULL,
	project VARCHAR2(300)
);

INSERT INTO tblStaff (seq, name, salary, address, project) VALUES (1, '홍길동', 300, '서울시', '홍콩 수출');
INSERT INTO tblStaff (seq, name, salary, address, project) VALUES (2, '아무개', 250, '인천시', 'TV 광고');
INSERT INTO tblStaff (seq, name, salary, address, project) VALUES (3, '하하하', 350, '대전시', '매출 분석');
INSERT INTO tblStaff (seq, name, salary, address, project) VALUES (4, '호호호', 300, '서울시', '고객 관리');
INSERT INTO tblStaff (seq, name, salary, address, project) VALUES (5, '후후후', 250, '서울시', '게시판 관리, 회원 응대');
INSERT INTO tblStaff (seq, name, salary, address, project) VALUES (6, '히히히', 250, '부산시', '불량 회원 응대');

SELECT * FROM tblStaff WHERE project LIKE '%회원 응대%';

UPDATE tblStaff SET project = '멤버 조치' WHERE project LIKE '%, 회원 응대';

SELECT * FROM tblStaff;

DROP TABLE tblStaff;

CREATE TABLE tblStaff (
	seq NUMBER PRIMARY KEY,
	name VARCHAR2(30) NOT NULL,
	salary NUMBER NOT NULL,
	address VARCHAR2(300) NOT NULL
);

INSERT INTO tblStaff (seq, name, salary, address) VALUES (1, '홍길동', 300, '서울시');
INSERT INTO tblStaff (seq, name, salary, address) VALUES (2, '아무개', 250, '인천시');
INSERT INTO tblStaff (seq, name, salary, address) VALUES (3, '하하하', 250, '부산시');
INSERT INTO tblStaff (seq, name, salary, address) VALUES (4, '호호호', 250, '광주시');

SELECT * FROM tblStaff;

CREATE TABLE tblProject (
	seq NUMBER PRIMARY KEY,
	project VARCHAR2(100) NOT NULL,
	staffSeq NUMBER NOT NULL
);

INSERT INTO tblProject (seq, project, staffSeq) VALUES (1, '홍콩 수출', 1);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (2, 'TV 광고', 2);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (3, '매출 분석', 3);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (4, '노조 협상', 1);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (5, '대리점 분양', 2);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (6, '자재 매입', 4);

SELECT * FROM tblProject;

INSERT INTO tblProject (seq, project, staffSeq) VALUES (7, '고객 유치', 5);

SELECT * FROM tblProject;

DELETE FROM tblStaff WHERE seq = 1;

SELECT * FROM tblStaff;

DROP TABLE tblStaff;

DROP TABLE tblProject;

CREATE TABLE tblStaff (
	seq NUMBER PRIMARY KEY,
	name VARCHAR2(30) NOT NULL,
	salary NUMBER NOT NULL,
	address VARCHAR2(300) NOT NULL
);

INSERT INTO tblStaff (seq, name, salary, address) VALUES (1, '홍길동', 300, '서울시');
INSERT INTO tblStaff (seq, name, salary, address) VALUES (2, '아무개', 250, '인천시');
INSERT INTO tblStaff (seq, name, salary, address) VALUES (3, '하하하', 250, '부산시');
INSERT INTO tblStaff (seq, name, salary, address) VALUES (4, '호호호', 250, '광주시');

SELECT * FROM tblStaff;

CREATE TABLE tblProject (
	seq NUMBER PRIMARY KEY,
	project VARCHAR2(100) NOT NULL,
	staffSeq NUMBER NOT NULL REFERENCES tblStaff(seq)
);

INSERT INTO tblProject (seq, project, staffSeq) VALUES (1, '홍콩 수출', 1);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (2, 'TV 광고', 2);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (3, '매출 분석', 3);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (4, '노조 협상', 1);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (5, '대리점 분양', 2);
INSERT INTO tblProject (seq, project, staffSeq) VALUES (6, '자재 매입', 4);

SELECT * FROM tblProject;

-- ORA-02291: integrity constraint (HR.SYS_C007144) violated - parent key not found
INSERT INTO tblProject (seq, project, staffSeq) VALUES (7, '고객 유치', 5);

-- ORA-02292: integrity constraint (HR.SYS_C007144) violated - child record found
DELETE FROM tblStaff WHERE seq = 1;

UPDATE tblProject SET staffSeq = 4 WHERE staffSeq = 1;

SELECT * FROM tblProject;

DELETE FROM tblStaff WHERE seq = 1;

SELECT * FROM tblStaff;

SELECT * FROM tblCustomer CROSS JOIN tblSales;
SELECT * FROM tblCustomer, tblSales; 

SELECT (SELECT name FROM tblCustomer WHERE seq = tblSales.cSeq) AS name, item FROM tblSales;

SELECT
    c.name,
    s.item
FROM
    tblCustomer c
        INNER JOIN tblSales s
            ON s.cSeq = c.seq;

SELECT
    (e.first_name || ' ' || e.last_name) AS 이름,
    d.department_id AS 부서,
    r.region_name AS 대륙,
    c.country_name AS 국가,
    l.city AS 도시,
    j.job_title AS 직업
FROM
    employees e
        INNER JOIN departments d
            ON d.department_id = e.department_id
        INNER JOIN locations l
            ON l.location_id = d.location_id
        INNER JOIN countries c
            ON c.country_id = l.country_id
        INNER JOIN regions r
            ON r.region_id = c.region_id
        INNER JOIN jobs j
            ON j.job_id = e.job_id;

SELECT
    *
FROM
    tblCustomer c
        LEFT OUTER JOIN tblSales s
            ON s.cSeq = c.seq;

SELECT
    *
FROM
    tblCustomer c
        RIGHT OUTER JOIN tblSales s
            ON s.cSeq = c.seq;
            
CREATE TABLE tblMember (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    tel VARCHAR2(15) NOT NULL,
    birth NUMBER(4) NOT NULL,
    address VARCHAR2(300)
);

CREATE SEQUENCE memberSeq;

CREATE TABLE tblGenre (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE genreSeq;

CREATE TABLE tblVideo (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    gSeq NUMBER NOT NULL REFERENCES tblGenre(seq),
    director VARCHAR2(50),
    company VARCHAR2(50),
    period NUMBER NOT NULL,
    price NUMBER NOT NULL,
    qty NUMBER NOT NULL
);

CREATE SEQUENCE videoSeq;

CREATE TABLE tblRent (
    seq NUMBER PRIMARY KEY,
    mSeq NUMBER NOT NULL REFERENCES tblMember(seq),
    vSeq NUMBER NOT NULL REFERENCES tblVideo(seq),
    rentDate DATE DEFAULT SYSDATE NOT NULL,
    returnDate DATE
);

CREATE SEQUENCE rentSeq;

CREATE TABLE tblSelf (
	seq NUMBER PRIMARY KEY,
	name VARCHAR2(30) NOT NULL,
	department VARCHAR2(30) NOT NULL,
	super NUMBER REFERENCES tblSelf(seq)
);

INSERT INTO tblSelf VALUES (1, '홍사장', '사장', NULL);
INSERT INTO tblSelf VALUES (2, '김부장', '영업부', 1);
INSERT INTO tblSelf VALUES (3, '박과장', '영업부', 2);
INSERT INTO tblSelf VALUES (4, '최대리', '영업부', 3);
INSERT INTO tblSelf VALUES (5, '정사원', '영업부', 4);
INSERT INTO tblSelf VALUES (6, '이부장', '개발부', 1);
INSERT INTO tblSelf VALUES (7, '하과장', '개발부', 6);
INSERT INTO tblSelf VALUES (8, '신과장', '개발부', 6);
INSERT INTO tblSelf VALUES (9, '황대리', '개발부', 7);
INSERT INTO tblSelf VALUES (10, '허사원', '개발부', 9);

SELECT
    name AS 이름,
    department AS 부서,
    (SELECT name FROM tblSelf WHERE seq = s.super) AS 상사
FROM
    tblSelf s;

SELECT
    s2.name AS 이름,
    s2.department AS 부서,
    s1.name AS 상사
FROM
    tblSelf s1
        INNER JOIN tblSelf s2
            ON s2.super= s1.seq;
	 
SELECT
    s2.name AS 이름,
    s2.department AS 부서,
    s1.name AS 상사
FROM
    tblSelf s1
        RIGHT OUTER JOIN tblSelf s2
            ON s2.super= s1.seq;

SELECT
    m.name,
    w.name
FROM
    tblMen m
        FULL OUTER JOIN tblWomen w
            ON w.couple = m.name;
	 
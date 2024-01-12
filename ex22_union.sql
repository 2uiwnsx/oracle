/*
    ▶ 집합 연산자
    
        ▷ UNION
        ▷ UNION ALL
        ▷ INTERSECT
        ▷ MINUS
*/

SELECT * FROM tblMen
UNION
SELECT * FROM tblWomen;

SELECT name, address, salary FROM tblStaff
UNION
SELECT name, city, basicPay FROM tblInsa;

CREATE TABLE tblA (
	name VARCHAR2(30) NOT NULL
);

INSERT INTO tblA VALUES ('강아지');
INSERT INTO tblA VALUES ('고양이');
INSERT INTO tblA VALUES ('토끼');
INSERT INTO tblA VALUES ('거북이');
INSERT INTO tblA VALUES ('병아리');

CREATE TABLE tblB (
	name VARCHAR2(30) NOT NULL
);

INSERT INTO tblB VALUES ('강아지');
INSERT INTO tblB VALUES ('고양이');
INSERT INTO tblB VALUES ('호랑이');
INSERT INTO tblB VALUES ('사자');
INSERT INTO tblB VALUES ('코끼리');

SELECT * FROM tblA
UNION
SELECT * FROM tblB;

-- 중복된 행이 포함된다.
SELECT * FROM tblA
UNION ALL
SELECT * FROM tblB;

SELECT * FROM tblA
INTERSECT
SELECT * FROM tblB;

SELECT * FROM tblA
MINUS
SELECT * FROM tblB;

SELECT * FROM tblB
MINUS
SELECT * FROM tblA;

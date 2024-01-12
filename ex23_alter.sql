/*
	▶ 테이블 구조 변경 방법
	
		▷ ALTER TABLE 테이블명 ADD (컬럼명 자료형 [제약 조건]);
		▷ ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
		▷ ALTER TABLE 테이블명 MODIFY (컬럼명 자료형 [제약 조건]);
*/

CREATE TABLE tblEdit (
	seq NUMBER PRIMARY KEY,
	data VARCHAR2(20) NOT NULL
);

INSERT INTO tblEdit VALUES (1, '마우스');
INSERT INTO tblEdit VALUES (2, '키보드');
INSERT INTO tblEdit VALUES (3, '모니터');

SELECT * FROM tblEdit;

ALTER TABLE tblEdit ADD (price NUMBER);

SELECT * FROM tblEdit;

DELETE FROM tblEdit;

INSERT INTO tblEdit VALUES (1, '마우스', 1000);
INSERT INTO tblEdit VALUES (2, '키보드', 2000);
INSERT INTO tblEdit VALUES (3, '모니터', 3000);

SELECT * FROM tblEdit;

ALTER TABLE tblEdit ADD (color VARCHAR2(30) DEFAULT 'white' NOT NULL);

SELECT * FROM tblEdit;

ALTER TABLE tblEdit DROP COLUMN price;

SELECT * FROM tblEdit;

ALTER TABLE tblEdit DROP COLUMN color;

SELECT * FROM tblEdit;

ALTER TABLE tblEdit MODIFY (data VARCHAR2(100));

DESC tblEdit;

INSERT INTO tblEdit VALUES (4, '애플 M2 맥북 프로 2023');

SELECT * FROM tblEdit;

ALTER TABLE tblEdit MODIFY (data VARCHAR2(100) NULL);

DESC tblEdit;

INSERT INTO tblEdit VALUES (5, NULL);

SELECT * FROM tblEdit;

-- ORA-01439: column to be modified must be empty to change datatype
ALTER TABLE tblEdit MODIFY (data NUMBER);

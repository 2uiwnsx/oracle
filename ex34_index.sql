/*
    ▶ 인덱스 생성 방법
    
        ▷ CREATE INDEX 인덱스명 ON 테이블명(컬럼명);
        
    ▶ 인덱스 삭제 방법
    
        ▷ DROP INDEX 인덱스명;
*/

CREATE TABLE tblIndex AS (
    SELECT * FROM tblAddressBook
);

SELECT COUNT(*) FROM tblIndex;

INSERT INTO tblIndex (SELECT * FROM tblIndex);
INSERT INTO tblIndex (SELECT * FROM tblIndex);
INSERT INTO tblIndex (SELECT * FROM tblIndex);
INSERT INTO tblIndex (SELECT * FROM tblIndex);
INSERT INTO tblIndex (SELECT * FROM tblIndex);
INSERT INTO tblIndex (SELECT * FROM tblIndex);
INSERT INTO tblIndex (SELECT * FROM tblIndex);
INSERT INTO tblIndex (SELECT * FROM tblIndex);
INSERT INTO tblIndex (SELECT * FROM tblIndex);

SELECT COUNT(*) FROM tblIndex;

SET TIMING ON;

SELECT COUNT(*) FROM tblIndex WHERE name = '최민기';

CREATE INDEX idxName
ON tblIndex(name);

SELECT COUNT(*) FROM tblIndex WHERE name = '최민기';

DROP INDEX idxName;

-- ORA-01452: cannot CREATE UNIQUE INDEX; duplicate keys found
CREATE UNIQUE INDEX idxName
ON tblIndex(name);

CREATE INDEX idxHometown
ON tblIndex(hometown);

SELECT COUNT(*) FROM tblIndex WHERE hometown = '서울';
SELECT COUNT(*) FROM tblIndex WHERE (hometown = '서울') AND (job = '학생');

CREATE INDEX idxHometownAndJob
ON tblIndex(hometown, job);

SELECT COUNT(*) FROM tblIndex WHERE hometown = '서울';
SELECT COUNT(*) FROM tblIndex WHERE (hometown = '서울') AND (job = '학생');

SELECT COUNT(*) FROM tblIndex WHERE SUBSTR(email, INSTR(email, '@')) = '@naver.com';

CREATE INDEX idxEmail
ON tblIndex(email);

SELECT COUNT(*) FROM tblIndex WHERE SUBSTR(email, INSTR(email, '@')) = '@naver.com';

DROP INDEX idxEmail;

CREATE INDEX idxEmail
ON tblIndex(SUBSTR(email, INSTR(email, '@')));

SELECT COUNT(*) FROM tblIndex WHERE SUBSTR(email, INSTR(email, '@')) = '@naver.com';

SET TIMING OFF;

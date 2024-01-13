/*
    ▶ ROLLBACK :  트랜잭션의 변경 사항을 취소하고 이전 상태로 되돌리는 명령어
    ▶ COMMIT : 트랜잭션의 변경 사항을 데이터베이스에 영구적으로 저장하는 명령어
    ▶ SAVEPOINT : 트랜잭션 내에서 특정 지점까지의 작업을 일시적으로 기억하는 명령어
*/

CREATE TABLE tblTrans AS (
    SELECT name, buseo, jikwi FROM tblInsa WHERE city = '서울'
);

SELECT * FROM tblTrans;

DELETE FROM tblTrans WHERE name = '유관순';

SELECT * FROM tblTrans;

ROLLBACK;

SELECT * FROM tblTrans;

DELETE FROM tblTrans WHERE name = '산마루';

SELECT * FROM tblTrans;

INSERT INTO tblTrans VALUES ('홍길동', '기획부', '사원');

SELECT * FROM tblTrans;

UPDATE tblTrans SET jikwi = '상무' WHERE name = '박문수';

SELECT * FROM tblTrans;

COMMIT;

SELECT * FROM tblTrans;

UPDATE tblTrans SET jikwi = '부장' WHERE name = '홍길동';

SELECT * FROM tblTrans;

UPDATE tblTrans SET jikwi = '사장' WHERE name = '홍길동';

SELECT * FROM tblTrans;

ROLLBACK;

SELECT * FROM tblTrans;

INSERT INTO tblTrans VALUES ('하하하', '총무부', '사원');

SAVEPOINT a;

DELETE FROM tblTrans WHERE name = '홍길동';

SAVEPOINT b;

UPDATE tblTrans SET buseo = '개발부' WHERE name = '하하하';

SELECT * FROM tblTrans;

ROLLBACK TO b;

SELECT * FROM tblTrans;

ROLLBACK TO a;

SELECT * FROM tblTrans;

ROLLBACK;

SELECT * FROM tblTrans;

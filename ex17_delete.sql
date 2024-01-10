/*
    ▶ 데이터 삭제 방법
    
        ▷ DELETE [FROM] 테이블명 [WHERE 절];
*/

DELETE FROM tblInsa;

SELECT * FROM tblInsa;

ROLLBACK;

SELECT * FROM tblInsa;

COMMIT;

DELETE FROM tblInsa WHERE num = 1001;

SELECT * FROM tblInsa;

ROLLBACK;

SELECT * FROM tblInsa;

COMMIT;

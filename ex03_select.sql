/*
    ▶ 테이블 구조 확인 방법
    
        ▷ DESC 테이블명;
        
    ----------------------------------
        
    ▶ 데이터 조회 방법
    
        ▷ SELECT 컬럼명 FROM 테이블명;
*/

DESC employees;

SELECT * FROM employees;

SELECT first_name FROM employees;

SELECT * FROM tblComedian;
SELECT first, last, gender, height, weight, nick FROM tblComedian;

SELECT nick FROM tblComedian;
SELECT first, last FROM tblComedian;
SELECT last, first FROM tblComedian;
SELECT last, last FROM tblcomedian;
SELECT last, LENGTH(last) FROM tblComedian;

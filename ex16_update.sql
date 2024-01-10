/*
    ▶ 데이터 갱신 방법
    
        ▷ UPDATE 테이블명 SET 컬럼명 = 값, [컬럼명 = 값] X N;
*/

UPDATE tblCountry SET capital = '세종';

SELECT * FROM tblCountry;

ROLLBACK;

SELECT * FROM tblCountry;

COMMIT;

UPDATE tblCountry SET capital = '세종' WHERE name = '대한민국';

SELECT * FROM tblCountry;

ROLLBACK;

SELECT * FROM tblCountry;

COMMIT;

UPDATE tblCountry SET capital = '세종', population = (population + 100), continent = 'EU' WHERE name = '대한민국';

SELECT * FROM tblCountry;

ROLLBACK;

SELECT * FROM tblCountry;

COMMIT;

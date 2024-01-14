/*
    ▶ LOWER(문자열)
    ▶ UPPER(문자열)
    ▶ INITCAP(문자열)
    ▶ SUBSTR(문자열, 시작 위치, [추출할 길이])
    ▶ LENGTH(문자열)
    ▶ INSTR(문자열, 찾을 문자열, [시작 위치])
    ▶ LPAD(문자열, 총 길이, [패딩 문자열])
    ▶ RPAD(문자열, 총 길이, [패딩 문자열])
    ▶ TRIM(문자열)
    ▶ LTRIM(문자열)
    ▶ RTRIM(문자열)
    ▶ REPLACE(문자열, 찾을 문자열, 대체할 문자열)
    ▶ REGEXP_REPLACE(문자열, 정규 표현식, 대체할 문자열)
    ▶ DECODE(컬럼명, 비교할 값, 결과값, [비교할 값, 결과값] X N)
*/

SELECT first_name FROM employees WHERE (first_name LIKE '%an%') OR (first_name LIKE '%AN%') OR (first_name LIKE '%An%') OR (first_name LIKE '%aN%');
SELECT first_name FROM employees WHERE LOWER(first_name) LIKE '%an%';
SELECT first_name FROM employees WHERE UPPER(first_name) LIKE '%AN%';

SELECT INITCAP('abc'), INITCAP('aBC') FROM DUAL;

SELECT address, SUBSTR(address, 3), SUBSTR(address, 3, 5) FROM tblAddressBook;

SELECT
    COUNT(
        CASE
            WHEN SUBSTR(name, 1, 1) = '김' THEN 1
        END
    ) AS 김,
    COUNT(
        CASE    
            WHEN SUBSTR(name, 1, 1) = '이' THEN 1
        END
    ) AS 이,
    COUNT(
        CASE
            WHEN SUBSTR(name, 1, 1) = '박' THEN 1
        END
    ) AS 박,
    COUNT(
        CASE
            WHEN SUBSTR(name, 1, 1) = '최' THEN 1
        END
    ) AS 최,
    COUNT(
        CASE
            WHEN SUBSTR(name, 1, 1) NOT IN ('김', '이', '박', '최') THEN 1
        END
    ) AS 나머지
FROM
    tblInsa;

SELECT name, LENGTH(name) FROM tblCountry;

SELECT
    INSTR('안녕하세요, 홍길동님.', '홍길동') AS r1,
    INSTR('안녕하세요, 홍길동님.', '아무개') AS r2,
    INSTR('안녕하세요, 홍길동님. 홍길동님.', '홍길동', 13) AS r3,
    INSTR('안녕하세요, 홍길동님. 홍길동님.', '홍길동', -1) AS r4
FROM
    DUAL;

SELECT LPAD('a', 5), LPAD('a', 5, 'b'), LPAD('aa', 5, 'b'), LPAD('aaaaa', 5, 'b'), LPAD('1', 3, '0'), RPAD('1', 3, '0') FROM DUAL;

SELECT
    '     하나      둘     셋     ',
    TRIM('     하나      둘     셋     '),
    LTRIM('     하나      둘     셋     '),
    RTRIM('     하나      둘     셋     ')
FROM
    DUAL;

SELECT REPLACE('홍길동', '홍', '김'), REPLACE('홍길동', '이', '김'), REPLACE('홍길홍', '홍', '김') FROM DUAL;

SELECT
    name,
    REGEXP_REPLACE(name, '김.{2}', '김OO'),
    tel,
    REGEXP_REPLACE(tel, '(\d{3})-(\d{4})-\d{4}', '\1-\2-XXXX')
FROM
    tblInsa;

SELECT
    gender,
    CASE
        WHEN gender = 'm' THEN '남자'
        WHEN gender = 'f' THEN '여자'
    END AS g1,
    REPLACE(REPLACE(gender, 'm', '남자'), 'f', '여자') AS g2,
    DECODE(gender, 'm', '남자', 'f', '여자') AS g3
FROM
    tblComedian;

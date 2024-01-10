/*
    ▶ DISTINCT : 결과 집합에서 중복된 행을 제거하는 키워드
    
    ------------------------------------------------------
    
    ▶ CASE WHEN 구문
    
        ▷ CASE
              WHEN 조건 THEN 값
              [ELSE 값]
          END
*/

SELECT DISTINCT continent FROM tblCountry;

SELECT DISTINCT buseo FROM tblInsa;
SELECT DISTINCT jikwi FROM tblInsa;
SELECT DISTINCT buseo, jikwi FROM tblInsa;

-- 조건 불만족 시, NULL이 반환된다.
SELECT
    (last || first) AS name,
    CASE
        WHEN gender = 'm' THEN '남자'
    END AS gender
FROM
    tblComedian;

SELECT
    (last || first) AS name,
    CASE
        WHEN gender = 'm' THEN '남자'
        WHEN gender = 'f' THEN '여자'
    END AS gender
FROM
    tblComedian;

SELECT
    name,
    CASE
        WHEN continent = 'AS' THEN '아시아'
        WHEN continent = 'EU' THEN '유럽'
        WHEN continent = 'AF' THEN '아프리카'
        ELSE '아메리카'
    END AS continent
FROM
    tblCountry;
    
SELECT
    name,
    CASE
        WHEN jikwi IN ('과장', '부장') THEN '관리직'
        ELSE '생산직'
    END AS job
FROM
    tblInsa;

SELECT
    (last || first) AS name,
    CASE
        WHEN (weight BETWEEN 50 AND 90) THEN '정상'
        ELSE '주의'
    END AS obesity
FROM
    tblComedian;

SELECT
    name,
    basicPay,
    (CASE
        WHEN name LIKE '홍%' THEN 50000
        ELSE 0
    END + basicPay) AS totalPay
FROM
    tblInsa;

SELECT
    title,
    CASE
        WHEN completeDate IS NULL THEN '미완료'
        WHEN completeDate IS NOT NULL THEN '완료'
    END AS status
FROM
    tblTodo;

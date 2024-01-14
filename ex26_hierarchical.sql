/*
    ▶ START WITH : 최상위 노드를 정의하는 키워드
    ▶ CONNECT BY : 계층 구조를 정의하고, 부모 노드와 자식 노드를 연결하는 키워드
    ▶ PRIOR : 현재 노드의 부모 노드를 가리키는 예약어
    ▶ LEVEL : 현재 노드의 계층 레벨을 나타내는 예약어
    ▶ SIBLINGS : 현재 노드와 동일한 부모 노드를 가진 형제 노드를 선택하는 키워드
    ▶ CONNECT_BY_ROOT 컬럼명 : 최상위 노드의 값을 반환하는 함수
    ▶ CONNECT_BY_ISLEAF : 현재 노드가 리프 노드인지 여부를 반환하는 함수
    ▶ SYS_CONNECT_BY_PATH(컬럼명, 구분자) : 현재 노드의 경로를 문자열로 반환하는 함수
*/

CREATE TABLE tblComputer (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    qty NUMBER NOT NULL,
    pSeq NUMBER REFERENCES tblComputer(seq)
);

INSERT INTO tblComputer VALUES (1, '컴퓨터', 1, NULL);
INSERT INTO tblComputer VALUES (2, '본체', 1, 1);
INSERT INTO tblComputer VALUES (3, '메인보드', 1, 2);
INSERT INTO tblComputer VALUES (4, '그래픽카드', 1, 2);
INSERT INTO tblComputer VALUES (5, '랜카드', 1, 2);
INSERT INTO tblComputer VALUES (6, 'CPU', 1, 2);
INSERT INTO tblComputer VALUES (7, '메모리', 2, 2);
INSERT INTO tblComputer VALUES (8, '모니터', 1, 1);
INSERT INTO tblComputer VALUES (9, '보호필름', 1, 8);
INSERT INTO tblComputer VALUES (10, '모니터암', 1, 8);
INSERT INTO tblComputer VALUES (11, '프린터', 1, 1);
INSERT INTO tblComputer VALUES (12, 'A4용지', 100, 11);
INSERT INTO tblComputer VALUES (13, '잉크카트리지', 3, 11);

SELECT * FROM tblComputer;

SELECT
    c1.name AS 부품명,
    c2.name AS "상위 부품명"
FROM
    tblComputer c1
        INNER JOIN tblComputer c2
            ON c2.seq = c1.pseq;

SELECT
    seq AS 번호,
    (LPAD(' ', ((LEVEL - 1) * 10)) || name) AS 부품명,
    PRIOR name AS "상위 부품명",
    LEVEL
FROM
    tblComputer
        START WITH seq = 1
        CONNECT BY pSeq = PRIOR seq
ORDER SIBLINGS BY
	name;

SELECT
    (LPAD(' ', (LEVEL - 1) * 10) || name) AS 이름,
    PRIOR name AS 상사
FROM
    tblSelf
        START WITH seq = 1
        CONNECT BY super = PRIOR seq;

SELECT
    (LPAD(' ', (LEVEL - 1) * 10) || name),
    PRIOR name,
    CONNECT_BY_ROOT name,
    CONNECT_BY_ISLEAF,
    SYS_CONNECT_BY_PATH(name, '-')
FROM
    tblSelf
        START WITH seq = 1
        CONNECT BY super = PRIOR seq;

CREATE TABLE tblBigCategory (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL
);

INSERT INTO tblBigCategory VALUES (1, '카테고리');

SELECT * FROM tblBigCategory;

CREATE TABLE tblMediumCategory (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    pSeq NUMBER NOT NULL REFERENCES tblBigCategory(seq)
);

INSERT INTO tblMediumCategory VALUES (1, '컴퓨터용품', 1);
INSERT INTO tblMediumCategory VALUES (2, '운동용품', 1);
INSERT INTO tblMediumCategory VALUES (3, '먹거리', 1);

SELECT * FROM tblMediumCategory;

CREATE TABLE tblSmallCategory (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    pSeq NUMBER NOT NULL REFERENCES tblMediumCategory(seq)
);

INSERT INTO tblSmallCategory VALUES (1, '하드웨어', 1);
INSERT INTO tblSmallCategory VALUES (2, '소프트웨어', 1);
INSERT INTO tblSmallCategory VALUES (3, '소모품', 1);
INSERT INTO tblSmallCategory VALUES (4, '테니스', 2);
INSERT INTO tblSmallCategory VALUES (5, '골프', 2);
INSERT INTO tblSmallCategory VALUES (6, '달리기', 2);
INSERT INTO tblSmallCategory VALUES (7, '밀키트', 3);
INSERT INTO tblSmallCategory VALUES (8, '베이커리', 3);
INSERT INTO tblSmallCategory VALUES (9, '도시락', 3);

SELECT * FROM tblSmallCategory;

SELECT
    b.name AS 상,
    m.name AS 중,
    s.name AS 하
FROM
    tblBigCategory b
        INNER JOIN tblMediumCategory m
            ON m.pSeq = b.seq
        INNER JOIN tblSmallCategory s
            ON s.pSeq = m.seq;

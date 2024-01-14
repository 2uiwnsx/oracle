CREATE TABLE tblSales (
    seq NUMBER PRIMARY KEY,
    item VARCHAR2(50) NOT NULL,
    qty NUMBER NOT NULL,
    regdate DATE DEFAULT SYSDATE NOT NULL,
    cSeq NUMBER NOT NULL REFERENCES tblCustomer(seq)
);

INSERT INTO tblSales (seq, item, qty, cSeq) VALUES (1, '전화기', 1, 1);
INSERT INTO tblSales (seq, item, qty, cSeq) VALUES (2, '다이어리', 3, 2);
INSERT INTO tblSales (seq, item, qty, cSeq) VALUES (3, '노트', 10, 2);
INSERT INTO tblSales (seq, item, qty, cSeq) VALUES (4, '볼펜', 20, 3);
INSERT INTO tblSales (seq, item, qty, cSeq) VALUES (5, '지우개', 15, 3);
INSERT INTO tblSales (seq, item, qty, cSeq) VALUES (6, '마우스', 5, 1);
INSERT INTO tblSales (seq, item, qty, cSeq) VALUES (7, '키보드', 2, 3);
INSERT INTO tblSales (seq, item, qty, cSeq) VALUES (8, '모니터', 1, 2);
INSERT INTO tblSales (seq, item, qty, cSeq) VALUES (9, '선풍기', 2, 1);

COMMIT;

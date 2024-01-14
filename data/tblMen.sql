CREATE TABLE tblMen (
	name VARCHAR2(30) PRIMARY KEY,
	age NUMBER NOT NULL,
	height NUMBER,
	weight NUMBER,
	couple VARCHAR2(30)
);

INSERT INTO tblMen VALUES ('홍길동', 25, 180, 70, '장도연');
INSERT INTO tblMen VALUES ('아무개', 22, 175, NULL, '이세영');
INSERT INTO tblMen VALUES ('하하하', 27, NULL, 80, NULL);
INSERT INTO tblMen VALUES ('무명씨', 21, 177, 72, NULL);
INSERT INTO tblMen VALUES ('유재석', 29, NULL, NULL, '김숙');
INSERT INTO tblMen VALUES ('박명수', 30, 170, NULL, '김지민');
INSERT INTO tblMen VALUES ('정준하', 31, 183, NULL, '신보라');
INSERT INTO tblMen VALUES ('정형돈', 28, NULL, 92, NULL);
INSERT INTO tblMen VALUES ('양세형', 22, 166, 55, '김민경');
INSERT INTO tblMen VALUES ('조세호', 24, 165, 58, '오나미');

COMMIT;

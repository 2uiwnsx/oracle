CREATE TABLE tblComedian (
	first VARCHAR2(20) NOT NULL,
	last VARCHAR2(20) NOT NULL,
	gender VARCHAR2(1) CHECK (gender IN ('m', 'f')) NOT NULL,
	height NUMBER NOT NULL,
	weight NUMBER NOT NULL,
	nick VARCHAR2(50) NOT NULL
);

INSERT INTO tblComedian VALUES ('재석', '유', 'm', 178, 64, '메뚜기');
INSERT INTO tblComedian VALUES ('명수', '박', 'm', 172, 66, '하찮은');
INSERT INTO tblComedian VALUES ('준하', '정', 'm', 184, 89, '정중앙');
INSERT INTO tblComedian VALUES ('동훈', '하', 'm', 169, 65, '상꼬마');
INSERT INTO tblComedian VALUES ('형돈', '정', 'm', 173, 85, '미존개오');
INSERT INTO tblComedian VALUES ('나래', '박', 'f', 148, 58, '박가래');
INSERT INTO tblComedian VALUES ('국주', '이', 'f', 167, 92, '김태우');
INSERT INTO tblComedian VALUES ('세호', '조', 'm', 167, 82, '프로 억울러');
INSERT INTO tblComedian VALUES ('준현', '김', 'm', 182, 113, '백돼지');
INSERT INTO tblComedian VALUES ('민상', '유', 'm', 183, 129, '이십끼');

COMMIT;

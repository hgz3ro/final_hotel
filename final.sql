--날짜테이블 생성
create table date_t (ds varchar2(10));
--데이터 입력
insert into date_t
SELECT TO_CHAR( TO_DATE('20180101', 'YYYYMMDD') + ROWNUM-1, 'YYYYMMDD') AS DAY
FROM DUAL
CONNECT BY level <= ROUND( TO_DATE('20241231', 'YYYYMMDD') - TO_DATE('20180101', 'YYYYMMDD') );
commit;


/* Drop Tables */

DROP TABLE PERIOD CASCADE CONSTRAINTS;
DROP TABLE ADDITIONAL_FEE CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE RESERVATION CASCADE CONSTRAINTS;
DROP TABLE ROOM_INFO CASCADE CONSTRAINTS;
DROP TABLE ACCOMMODATIONS CASCADE CONSTRAINTS;
DROP TABLE COMMENTS CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE FAVORITE CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE HEAD_ADMIN CASCADE CONSTRAINTS;
DROP TABLE USERQNA CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;

/* drop sequence */
DROP SEQUENCE SEQ_ACCOMMODATIONS;
DROP SEQUENCE SEQ_ADDITIONAL_FEE;
DROP SEQUENCE SEQ_BOARD;
DROP SEQUENCE SEQ_COMMENTS;
DROP SEQUENCE SEQ_FAQ;
DROP SEQUENCE SEQ_FAVORITE;
DROP SEQUENCE SEQ_HEAD_ADMIN;
DROP SEQUENCE SEQ_NOTICE;
DROP SEQUENCE SEQ_PAYMENT;
DROP SEQUENCE SEQ_PERIOD;
DROP SEQUENCE SEQ_RESERVATION;
DROP SEQUENCE SEQ_REVIEW;
DROP SEQUENCE SEQ_ROOM_INFO;
DROP SEQUENCE SEQ_USERQNA;

/* Create sequence */
CREATE SEQUENCE SEQ_ACCOMMODATIONS;
CREATE SEQUENCE SEQ_ADDITIONAL_FEE;
CREATE SEQUENCE SEQ_BOARD;
CREATE SEQUENCE SEQ_COMMENTS;
CREATE SEQUENCE SEQ_FAQ;
CREATE SEQUENCE SEQ_FAVORITE;
CREATE SEQUENCE SEQ_HEAD_ADMIN;
CREATE SEQUENCE SEQ_NOTICE;
CREATE SEQUENCE SEQ_PAYMENT;
CREATE SEQUENCE SEQ_PERIOD;
CREATE SEQUENCE SEQ_RESERVATION;
CREATE SEQUENCE SEQ_REVIEW;
CREATE SEQUENCE SEQ_ROOM_INFO;
CREATE SEQUENCE SEQ_USERQNA;




/* Create Tables */

-- 숙소
CREATE TABLE ACCOMMODATIONS
(
	-- 숙소아이디
	AID NUMBER(4) NOT NULL,
	-- 카테고리
	ACATE VARCHAR2(100),
	-- 숙박업소명
	ANAME VARCHAR2(200),
	-- 주소
	AADDRESS VARCHAR2(200),
	-- 전화번호
	APHONE VARCHAR2(30),
	-- x좌표
	AXCOORDI VARCHAR2(30),
	-- y좌표
	AYCOORDI VARCHAR2(30),
	-- 총객실수
	ATOTALROOM NUMBER(5),
	-- 숙소성급
	AGRADE VARCHAR2(20),
	-- 대표소개
	ADETAIL VARCHAR2(2000),
	-- 대표이미지
	AMAINIMG VARCHAR2(3000),
	-- 등록일
	AREGDATE DATE,
	-- 삭제여부 : 삭제된 경우 = Y 로 표시
	-- 
	AISDEL VARCHAR2(1),
	PRIMARY KEY (AID)
);


-- 추가요금
CREATE TABLE ADDITIONAL_FEE
(
	-- 추가비용아이디
	AFID NUMBER(4) NOT NULL,
	-- 인원추가비용
	AFPERSONNEL NUMBER(10),
	-- 조식추가비용
	AFBREAKFAST NUMBER(10),
	-- 침대추가비용
	AFBED NUMBER(10),
	-- 객실아이디
	RIID NUMBER(4) NOT NULL,
	PRIMARY KEY (AFID)
);


-- 게시판
CREATE TABLE BOARD
(
	-- 게시판아이디
	BID NUMBER(4) NOT NULL,
	-- 카테고리
	BCATE VARCHAR2(50),
	-- 제목
	BTITLE VARCHAR2(100),
	-- 내용
	BCONTENT VARCHAR2(3000),
	-- 작성일
	BRDATE DATE,
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (BID)
);


-- 댓글
CREATE TABLE COMMENTS
(
	-- 댓글아이디
	CID NUMBER(4) NOT NULL,
	-- 내용
	CCONTENT NVARCHAR2(1000),
	-- 작성일
	CRDATE DATE,
	-- 그룹번호
	CREF NUMBER(3),
	-- 출력순서
	CSTEP NUMBER(3),
	-- 댓글번호 : (댓글의댓글)몇번째댓글인지
	-- 
	CLEV NUMBER(1),
	-- 게시판아이디
	BID NUMBER(4) NOT NULL,
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (CID)
);


-- 자주 묻는 질문
CREATE TABLE FAQ
(
	-- 자주묻는질문아이디
	FID NUMBER(4) NOT NULL,
	-- 제목
	FTITLE VARCHAR2(100),
	-- 내용
	FCONTENT VARCHAR2(4000),
	-- 첨부파일
	FFILE VARCHAR2(4000),
	-- 등록일
	FRDATE DATE,
	-- 공개여부 : 공개 ->Y
	-- 비공개->N
	-- 
	FPUBLIC VARCHAR2(1),
	-- 어드민아이디
	AID VARCHAR2(10) NOT NULL,
	PRIMARY KEY (FID)
);


-- 즐겨찾기
CREATE TABLE FAVORITE
(
	-- 즐겨찾기아이디
	FAVID NUMBER(4) NOT NULL,
	-- 선호하는 공항
	FAVAIRPORT VARCHAR2(100),
	-- 선호하는항공사
	FAVAIRLINE VARCHAR2(100),
	-- 선호호텔체인
	FAVHOTEL VARCHAR2(100),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (FAVID)
);


-- 관리자
CREATE TABLE HEAD_ADMIN
(
	-- 어드민아이디
	AID VARCHAR2(10) NOT NULL,
	-- 비밀번호
	APW VARCHAR2(100),
	-- 이름
	ANAME VARCHAR2(100),
	-- 등록일
	ARDATE DATE,
	PRIMARY KEY (AID)
);


-- 회원
CREATE TABLE MEMBERS
(
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	-- 비밀번호
	MPW VARCHAR2(15),
	-- 이름
	MNAME VARCHAR2(100),
	-- 전화번호
	MPHONE VARCHAR2(300),
	-- 이메일
	MEMAIL VARCHAR2(25),
	-- 가입일 : DATE DEFAULT SYSDATE
	MRDATE DATE,
	-- 생년월일
	MBIRTH DATE,
	-- 프로필사진
	MPROFILE VARCHAR2(3000),
	-- 탈퇴여부 : 탈퇴 -> Y
	MDROP VARCHAR2(1),
	PRIMARY KEY (MID)
);


-- 공지글
CREATE TABLE NOTICE
(
	-- 자주묻는질문아이디
	NID NUMBER(4) NOT NULL,
	-- 제목
	NTITLE VARCHAR2(100),
	-- 내용
	NCONTENT VARCHAR2(4000),
	-- 첨부파일
	NFILE VARCHAR2(4000),
	-- 등록일 : DATE DEFAULT SYSDATE
	NRDATE DATE,
	-- 공개여부 : 공개->Y
	-- 비공개->N
	-- 
	NPUBLIC VARCHAR2(1),
	-- 어드민아이디
	AID VARCHAR2(10) NOT NULL,
	PRIMARY KEY (NID)
);


-- 결제
CREATE TABLE PAYMENT
(
	-- 결제아이디
	PID NUMBER(4) NOT NULL,
	-- 결제수단
	PMETHOD VARCHAR2(100),
	-- 결제날짜
	PDATE DATE,
	-- 총 비용
	PTOTAL NUMBER(10),
	-- 환불 : 환불 시 Y
	PREFUND VARCHAR2(1),
	-- 예약아이디
	RID NUMBER(4) NOT NULL,
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (PID)
);


-- 기간
CREATE TABLE PERIOD
(
	-- 기간아이디
	PEID NUMBER(4) NOT NULL,
	-- 시즌 : 비수기/성수기/준성수기
	PESEASON VARCHAR2(20),
	-- 시작날짜
	PESTART DATE,
	-- 끝날짜
	PEEND DATE,
	-- 숙소아이디
	AID NUMBER(4) NOT NULL,
	PRIMARY KEY (PEID)
);


-- 예약
CREATE TABLE RESERVATION
(
	-- 예약아이디
	RID NUMBER(4) NOT NULL,
	-- 인원
	RAMOUNT NUMBER(3),
	-- 예약시작일
	RCHECKIN VARCHAR2(15),
	-- 예약종료일 : 다음날퇴실
	RCHECKOUT VARCHAR2(15),
	-- 예약자이름
	RRESNAME VARCHAR2(100),
	-- 예약자전화번호
	RRESPHONE VARCHAR2(15),
	-- 예약자 이메일
	RRESEMAIL VARCHAR2(100),
	-- 조식추가인원 : 0 -> 조식추가안함
	-- 1~ -> 명 조식 추가
	-- 
	REXBREAKNUM NUMBER(1),
	-- 침대추가 : 1개추가 ->1
	REXBED NUMBER(1),
	-- 인원추가 : 0->추가안함
	-- 1~->명 추가
	REXPERSON NUMBER(1),
	-- 취소여부 : 취소->Y
	-- 
	RCANCEL VARCHAR2(1),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	-- 객실아이디
	RIID NUMBER(4) NOT NULL,
	PRIMARY KEY (RID)
);


-- 리뷰
CREATE TABLE REVIEW
(
	-- 리뷰아이디
	REID NUMBER(4) NOT NULL,
	-- 리뷰제목
	RETITLE VARCHAR2(300),
	-- 리뷰내용
	RECONTENT VARCHAR2(4000),
	-- 리뷰사진
	REPHOTO VARCHAR2(4000),
	-- 리뷰등록일 : DATE DEFAULT SYSDATE
	RERDATE DATE,
	-- 별점
	RESTAR NUMBER(3),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	-- 예약아이디
	RID NUMBER(4) NOT NULL,
	PRIMARY KEY (REID)
);


-- 객실세부정보
CREATE TABLE ROOM_INFO
(
	-- 객실아이디
	RIID NUMBER(4) NOT NULL,
	-- 객실종류 : (호텔-~룸,펜션-00호)
	RIROOMTYPE VARCHAR2(100),
	-- 총 객실수
	RIROOM NUMBER(4),
	-- 부가서비스 : 인터넷,조식,욕조,흡연
	RISERVICE VARCHAR2(3000),
	-- 객실크기 : 7평
	RISIZE VARCHAR2(50),
	-- 숙박가능인원
	RIMINPER NUMBER(3),
	-- 숙박최대인원
	RIMAXPER NUMBER(3),
	-- 성수기 1박 기본요금
	RIPEAK NUMBER(10),
	-- 준성수기 1박 기본요금
	RISEMIPEAK NUMBER(10),
	-- 비수기 1박 기본요금
	RIOFF NUMBER(10),
	-- 대표이미지
	RIMAINIMG VARCHAR2(3000),
	-- 추가이미지1
	RIEXTRAIMG1 VARCHAR2(3000),
	-- 추가이미지2
	RIEXTRAIMG2 VARCHAR2(3000),
	-- 숙소아이디
	AID NUMBER(4) NOT NULL,
	PRIMARY KEY (RIID)
);


-- 문의글
CREATE TABLE USERQNA
(
	-- 문의글아이디
	QID NUMBER(4) NOT NULL,
	-- 문의글카테고리 : 1.상품 2.교환/환불 3.사이트이용 4.기타
	QCATE VARCHAR2(20),
	-- 문의글비번
	QPW VARCHAR2(100),
	-- 문의글제목
	QTITLE VARCHAR2(300),
	-- 문의글내용
	QCONTENT VARCHAR2(4000),
	-- 문의글첨부
	QFILE VARCHAR2(4000),
	-- 문의글등록일 : DATE DEFAULT SYSDATE
	QRDATE DATE,
	-- 문의글처리여부 : 처리->Y
	QLEV VARCHAR2(1),
	-- 그룹번호
	QREF NUMBER(3),
	-- 글번호
	QSTEP NUMBER(3),
	-- 아이디
	MID VARCHAR2(100) NOT NULL,
	PRIMARY KEY (QID)
);



/* Create Foreign Keys */

ALTER TABLE PERIOD
	ADD FOREIGN KEY (AID)
	REFERENCES ACCOMMODATIONS (AID)
;


ALTER TABLE ROOM_INFO
	ADD FOREIGN KEY (AID)
	REFERENCES ACCOMMODATIONS (AID)
;


ALTER TABLE COMMENTS
	ADD FOREIGN KEY (BID)
	REFERENCES BOARD (BID)
;


ALTER TABLE FAQ
	ADD FOREIGN KEY (AID)
	REFERENCES HEAD_ADMIN (AID)
;


ALTER TABLE NOTICE
	ADD FOREIGN KEY (AID)
	REFERENCES HEAD_ADMIN (AID)
;


ALTER TABLE BOARD
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE COMMENTS
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE FAVORITE
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE PAYMENT
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE RESERVATION
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE USERQNA
	ADD FOREIGN KEY (MID)
	REFERENCES MEMBERS (MID)
;


ALTER TABLE PAYMENT
	ADD FOREIGN KEY (RID)
	REFERENCES RESERVATION (RID)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (RID)
	REFERENCES RESERVATION (RID)
;


ALTER TABLE ADDITIONAL_FEE
	ADD FOREIGN KEY (RIID)
	REFERENCES ROOM_INFO (RIID)
;


ALTER TABLE RESERVATION
	ADD FOREIGN KEY (RIID)
	REFERENCES ROOM_INFO (RIID)
;



/* Comments */

COMMENT ON TABLE ACCOMMODATIONS IS '숙소';
COMMENT ON COLUMN ACCOMMODATIONS.AID IS '숙소아이디';
COMMENT ON COLUMN ACCOMMODATIONS.ACATE IS '카테고리';
COMMENT ON COLUMN ACCOMMODATIONS.ANAME IS '숙박업소명';
COMMENT ON COLUMN ACCOMMODATIONS.AADDRESS IS '주소';
COMMENT ON COLUMN ACCOMMODATIONS.APHONE IS '전화번호';
COMMENT ON COLUMN ACCOMMODATIONS.AXCOORDI IS 'x좌표';
COMMENT ON COLUMN ACCOMMODATIONS.AYCOORDI IS 'y좌표';
COMMENT ON COLUMN ACCOMMODATIONS.ATOTALROOM IS '총객실수';
COMMENT ON COLUMN ACCOMMODATIONS.AGRADE IS '숙소성급';
COMMENT ON COLUMN ACCOMMODATIONS.ADETAIL IS '대표소개';
COMMENT ON COLUMN ACCOMMODATIONS.AMAINIMG IS '대표이미지';
COMMENT ON COLUMN ACCOMMODATIONS.AREGDATE IS '등록일';
COMMENT ON COLUMN ACCOMMODATIONS.AISDEL IS '삭제여부 : 삭제된 경우 = Y 로 표시
';
COMMENT ON TABLE ADDITIONAL_FEE IS '추가요금';
COMMENT ON COLUMN ADDITIONAL_FEE.AFID IS '추가비용아이디';
COMMENT ON COLUMN ADDITIONAL_FEE.AFPERSONNEL IS '인원추가비용';
COMMENT ON COLUMN ADDITIONAL_FEE.AFBREAKFAST IS '조식추가비용';
COMMENT ON COLUMN ADDITIONAL_FEE.AFBED IS '침대추가비용';
COMMENT ON COLUMN ADDITIONAL_FEE.RIID IS '객실아이디';
COMMENT ON TABLE BOARD IS '게시판';
COMMENT ON COLUMN BOARD.BID IS '게시판아이디';
COMMENT ON COLUMN BOARD.BCATE IS '카테고리';
COMMENT ON COLUMN BOARD.BTITLE IS '제목';
COMMENT ON COLUMN BOARD.BCONTENT IS '내용';
COMMENT ON COLUMN BOARD.BRDATE IS '작성일';
COMMENT ON COLUMN BOARD.MID IS '아이디';
COMMENT ON TABLE COMMENTS IS '댓글';
COMMENT ON COLUMN COMMENTS.CID IS '댓글아이디';
COMMENT ON COLUMN COMMENTS.CCONTENT IS '내용';
COMMENT ON COLUMN COMMENTS.CRDATE IS '작성일';
COMMENT ON COLUMN COMMENTS.CREF IS '그룹번호';
COMMENT ON COLUMN COMMENTS.CSTEP IS '출력순서';
COMMENT ON COLUMN COMMENTS.CLEV IS '댓글번호 : (댓글의댓글)몇번째댓글인지
';
COMMENT ON COLUMN COMMENTS.BID IS '게시판아이디';
COMMENT ON COLUMN COMMENTS.MID IS '아이디';
COMMENT ON TABLE FAQ IS '자주 묻는 질문';
COMMENT ON COLUMN FAQ.FID IS '자주묻는질문아이디';
COMMENT ON COLUMN FAQ.FTITLE IS '제목';
COMMENT ON COLUMN FAQ.FCONTENT IS '내용';
COMMENT ON COLUMN FAQ.FFILE IS '첨부파일';
COMMENT ON COLUMN FAQ.FRDATE IS '등록일';
COMMENT ON COLUMN FAQ.FPUBLIC IS '공개여부 : 공개 ->Y
비공개->N
';
COMMENT ON COLUMN FAQ.AID IS '어드민아이디';
COMMENT ON TABLE FAVORITE IS '즐겨찾기';
COMMENT ON COLUMN FAVORITE.FAVID IS '즐겨찾기아이디';
COMMENT ON COLUMN FAVORITE.FAVAIRPORT IS '선호하는 공항';
COMMENT ON COLUMN FAVORITE.FAVAIRLINE IS '선호하는항공사';
COMMENT ON COLUMN FAVORITE.FAVHOTEL IS '선호호텔체인';
COMMENT ON COLUMN FAVORITE.MID IS '아이디';
COMMENT ON TABLE HEAD_ADMIN IS '관리자';
COMMENT ON COLUMN HEAD_ADMIN.AID IS '어드민아이디';
COMMENT ON COLUMN HEAD_ADMIN.APW IS '비밀번호';
COMMENT ON COLUMN HEAD_ADMIN.ANAME IS '이름';
COMMENT ON COLUMN HEAD_ADMIN.ARDATE IS '등록일';
COMMENT ON TABLE MEMBERS IS '회원';
COMMENT ON COLUMN MEMBERS.MID IS '아이디';
COMMENT ON COLUMN MEMBERS.MPW IS '비밀번호';
COMMENT ON COLUMN MEMBERS.MNAME IS '이름';
COMMENT ON COLUMN MEMBERS.MPHONE IS '전화번호';
COMMENT ON COLUMN MEMBERS.MEMAIL IS '이메일';
COMMENT ON COLUMN MEMBERS.MRDATE IS '가입일 : DATE DEFAULT SYSDATE';
COMMENT ON COLUMN MEMBERS.MBIRTH IS '생년월일';
COMMENT ON COLUMN MEMBERS.MPROFILE IS '프로필사진';
COMMENT ON COLUMN MEMBERS.MDROP IS '탈퇴여부 : 탈퇴 -> Y';
COMMENT ON TABLE NOTICE IS '공지글';
COMMENT ON COLUMN NOTICE.NID IS '자주묻는질문아이디';
COMMENT ON COLUMN NOTICE.NTITLE IS '제목';
COMMENT ON COLUMN NOTICE.NCONTENT IS '내용';
COMMENT ON COLUMN NOTICE.NFILE IS '첨부파일';
COMMENT ON COLUMN NOTICE.NRDATE IS '등록일 : DATE DEFAULT SYSDATE';
COMMENT ON COLUMN NOTICE.NPUBLIC IS '공개여부 : 공개->Y
비공개->N
';
COMMENT ON COLUMN NOTICE.AID IS '어드민아이디';
COMMENT ON TABLE PAYMENT IS '결제';
COMMENT ON COLUMN PAYMENT.PID IS '결제아이디';
COMMENT ON COLUMN PAYMENT.PMETHOD IS '결제수단';
COMMENT ON COLUMN PAYMENT.PDATE IS '결제날짜';
COMMENT ON COLUMN PAYMENT.PTOTAL IS '총 비용';
COMMENT ON COLUMN PAYMENT.PREFUND IS '환불 : 환불 시 Y';
COMMENT ON COLUMN PAYMENT.RID IS '예약아이디';
COMMENT ON COLUMN PAYMENT.MID IS '아이디';
COMMENT ON TABLE PERIOD IS '기간';
COMMENT ON COLUMN PERIOD.PEID IS '기간아이디';
COMMENT ON COLUMN PERIOD.PESEASON IS '시즌 : 비수기/성수기/준성수기';
COMMENT ON COLUMN PERIOD.PESTART IS '시작날짜';
COMMENT ON COLUMN PERIOD.PEEND IS '끝날짜';
COMMENT ON COLUMN PERIOD.AID IS '숙소아이디';
COMMENT ON TABLE RESERVATION IS '예약';
COMMENT ON COLUMN RESERVATION.RID IS '예약아이디';
COMMENT ON COLUMN RESERVATION.RAMOUNT IS '인원';
COMMENT ON COLUMN RESERVATION.RCHECKIN IS '예약시작일';
COMMENT ON COLUMN RESERVATION.RCHECKOUT IS '예약종료일 : 다음날퇴실';
COMMENT ON COLUMN RESERVATION.RRESNAME IS '예약자이름';
COMMENT ON COLUMN RESERVATION.RRESPHONE IS '예약자전화번호';
COMMENT ON COLUMN RESERVATION.RRESEMAIL IS '예약자 이메일';
COMMENT ON COLUMN RESERVATION.REXBREAKNUM IS '조식추가인원 : 0 -> 조식추가안함
1~ -> 명 조식 추가
';
COMMENT ON COLUMN RESERVATION.REXBED IS '침대추가 : 1개추가 ->1';
COMMENT ON COLUMN RESERVATION.REXPERSON IS '인원추가 : 0->추가안함
1~->명 추가';
COMMENT ON COLUMN RESERVATION.RCANCEL IS '취소여부 : 취소->Y
';
COMMENT ON COLUMN RESERVATION.MID IS '아이디';
COMMENT ON COLUMN RESERVATION.RIID IS '객실아이디';
COMMENT ON TABLE REVIEW IS '리뷰';
COMMENT ON COLUMN REVIEW.REID IS '리뷰아이디';
COMMENT ON COLUMN REVIEW.RETITLE IS '리뷰제목';
COMMENT ON COLUMN REVIEW.RECONTENT IS '리뷰내용';
COMMENT ON COLUMN REVIEW.REPHOTO IS '리뷰사진';
COMMENT ON COLUMN REVIEW.RERDATE IS '리뷰등록일 : DATE DEFAULT SYSDATE';
COMMENT ON COLUMN REVIEW.RESTAR IS '별점';
COMMENT ON COLUMN REVIEW.MID IS '아이디';
COMMENT ON COLUMN REVIEW.RID IS '예약아이디';
COMMENT ON TABLE ROOM_INFO IS '객실세부정보';
COMMENT ON COLUMN ROOM_INFO.RIID IS '객실아이디';
COMMENT ON COLUMN ROOM_INFO.RIROOMTYPE IS '객실종류 : (호텔-~룸,펜션-00호)';
COMMENT ON COLUMN ROOM_INFO.RIROOM IS '총 객실수';
COMMENT ON COLUMN ROOM_INFO.RISERVICE IS '부가서비스 : 인터넷,조식,욕조,흡연';
COMMENT ON COLUMN ROOM_INFO.RISIZE IS '객실크기 : 7평';
COMMENT ON COLUMN ROOM_INFO.RIMINPER IS '숙박가능인원';
COMMENT ON COLUMN ROOM_INFO.RIMAXPER IS '숙박최대인원';
COMMENT ON COLUMN ROOM_INFO.RIPEAK IS '성수기 1박 기본요금';
COMMENT ON COLUMN ROOM_INFO.RISEMIPEAK IS '준성수기 1박 기본요금';
COMMENT ON COLUMN ROOM_INFO.RIOFF IS '비수기 1박 기본요금';
COMMENT ON COLUMN ROOM_INFO.RIMAINIMG IS '대표이미지';
COMMENT ON COLUMN ROOM_INFO.RIEXTRAIMG1 IS '추가이미지1';
COMMENT ON COLUMN ROOM_INFO.RIEXTRAIMG2 IS '추가이미지2';
COMMENT ON COLUMN ROOM_INFO.AID IS '숙소아이디';
COMMENT ON TABLE USERQNA IS '문의글';
COMMENT ON COLUMN USERQNA.QID IS '문의글아이디';
COMMENT ON COLUMN USERQNA.QCATE IS '문의글카테고리 : 1.상품 2.교환/환불 3.사이트이용 4.기타';
COMMENT ON COLUMN USERQNA.QPW IS '문의글비번';
COMMENT ON COLUMN USERQNA.QTITLE IS '문의글제목';
COMMENT ON COLUMN USERQNA.QCONTENT IS '문의글내용';
COMMENT ON COLUMN USERQNA.QFILE IS '문의글첨부';
COMMENT ON COLUMN USERQNA.QRDATE IS '문의글등록일 : DATE DEFAULT SYSDATE';
COMMENT ON COLUMN USERQNA.QLEV IS '문의글처리여부 : 처리->Y';
COMMENT ON COLUMN USERQNA.QREF IS '그룹번호';
COMMENT ON COLUMN USERQNA.QSTEP IS '글번호';
COMMENT ON COLUMN USERQNA.MID IS '아이디';




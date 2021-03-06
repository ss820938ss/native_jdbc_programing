select user(), database();

create database book_Libary;

use book_Libary;

-- 내 스키마
DROP SCHEMA IF EXISTS book_Libary;

-- 내 스키마
CREATE SCHEMA book_Libary;

-- 회원정보
CREATE TABLE Profile (
	P_NO        VARCHAR(5)  NOT NULL COMMENT '회원번호', -- 회원번호
	P_NAME      VARCHAR(4)  NULL     COMMENT '회원이름', -- 회원이름
	P_BIRTH     VARCHAR(8)  NULL     COMMENT '생년월일', -- 생년월일
	P_PHONE     VARCHAR(13) NULL     COMMENT '전화번호', -- 전화번호
	P_CELLPHONE VARCHAR(13) NULL     COMMENT '휴대전화', -- 휴대전화
	P_ADDRESS   VARCHAR(20) NULL     COMMENT '주소', -- 주소
	B_NO        VARCHAR(5)  NULL     COMMENT '도서번호' -- 도서번호
)
COMMENT '회원정보';

-- 회원정보
ALTER TABLE Profile
	ADD CONSTRAINT PK_Profile -- 회원정보 기본키
		PRIMARY KEY (
			P_NO -- 회원번호
		);

-- 도서정보
CREATE TABLE Book_Information (
	B_NO       VARCHAR(5)  NOT NULL COMMENT '도서번호', -- 도서번호
	B_NAME     VARCHAR(40) NULL     COMMENT '도서제목', -- 도서제목
	B_RENTAL   VARCHAR(4)  NULL     COMMENT '대출여부', -- 대출여부
	B_DIVISION VARCHAR(4)  NULL     COMMENT '도서구분' -- 도서구분
)
COMMENT '도서정보';

-- 도서정보
ALTER TABLE Book_Information
	ADD CONSTRAINT PK_Book_Information -- 도서정보 기본키
		PRIMARY KEY (
			B_NO -- 도서번호
		);

-- 대출/반납
CREATE TABLE RENTAL_RETURN (
	P_NO      VARCHAR(5)  NOT NULL COMMENT '회원번호', -- 회원번호
	P_NAME    VARCHAR(4)  NULL     COMMENT '이름', -- 이름
	P_BIRTH   VARCHAR(8)  NULL     COMMENT '생년월일', -- 생년월일
	B_NO      VARCHAR(5)  NULL     COMMENT '도서번호', -- 도서번호
	B_NAME    VARCHAR(40) NULL     COMMENT '도서제목', -- 도서제목
	B_R_DATE  VARCHAR(8)  NULL     COMMENT '도서대여일', -- 도서대여일
	B_OVERDUE VARCHAR(2)  NULL     COMMENT '도서연체일', -- 도서연체일
	P_NO2     VARCHAR(5)  NULL     COMMENT '회원번호2' -- 회원번호2
)
COMMENT '대출/반납';

-- 대출/반납
ALTER TABLE RENTAL_RETURN
	ADD CONSTRAINT PK_RENTAL_RETURN -- 대출/반납 기본키
		PRIMARY KEY (
			P_NO -- 회원번호
		);

-- 회원정보
ALTER TABLE Profile
	ADD CONSTRAINT FK_Book_Information_TO_Profile -- 도서정보 -> 회원정보
		FOREIGN KEY (
			B_NO -- 도서번호
		)
		REFERENCES Book_Information ( -- 도서정보
			B_NO -- 도서번호
		);

-- 대출/반납
ALTER TABLE RENTAL_RETURN
	ADD CONSTRAINT FK_Profile_TO_RENTAL_RETURN -- 회원정보 -> 대출/반납
		FOREIGN KEY (
			P_NO2 -- 회원번호2
		)
		REFERENCES Profile ( -- 회원정보
			P_NO -- 회원번호
		);

-- 대출/반납
ALTER TABLE RENTAL_RETURN
	ADD CONSTRAINT FK_Book_Information_TO_RENTAL_RETURN -- 도서정보 -> 대출/반납
		FOREIGN KEY (
			B_NO -- 도서번호
		)
		REFERENCES Book_Information ( -- 도서정보
			B_NO -- 도서번호
		);
	
-- 회원정보 입력데이터
select * from profile;
	
insert into profile(P_NO, P_NAME, P_BIRTH, P_PHONE, P_CELLPHONE, P_ADDRESS) values
	('12001', '홍길동', '19070405', '042-421-1739', '010-9741-5821', '대전'),
	('12002', '김연수', '19850301', '064-446-8695', '010-4568-5581', '제주'),
	('12003', '김지원', '19860708', '053-548-7898', '010-9111-5556', '대구'),
	('12004', '문희원', '19800108', '052-221-1231', '010-7777-7777', '울산'),
	('12005', '유일한', '19790205', '051-111-2222', '010-4566-8886', '부산'),
	('12006', '김동수', '19811123',  '02-668-8887', '010-1231-1211', '서울'),
	('12007', '배진태', '19820707', '044-500-7333', '010-7877-7777', '세종'),
	('12008', '류은수', '19830301', '062-233-1122', '010-7444-1474', '광주'),
	('12009', '김동철', '19870426', '061-887-4454', '010-8525-1235', '순천'),
	('12010', '최홍석', '19900405', '054-555-7897', '010-3214-6547', '포항'),
	('12011', '김동수', '19830108', '043-529-8457', '010-9566-4228', '제천');
	
	
-- 도서정보 입력데이터
select * from Book_Information;

insert into Book_Information(B_NO, B_NAME, B_DIVISION) values
	('40001', 'The elements of statistical learning', '수학'),
	('40002', 'Computer vision : a modern approach', '컴퓨터'),
	('40003', 'MATLAB for engineers', '전자'),
	('40004', 'CUBA by example', '수학'),
	('40005', 'An introduction to 3D computer vision', '컴퓨터'),
	('40006', 'Numerical methoods', '수학'),
	('40007', 'Image-based modeling', '컴퓨터'),
	('40008', 'Machine learning', '컴퓨터'),
	('40009', 'Probabilistic robotics', '통계'),
	('40010', 'Pattern recognition and machine learning', '컴퓨터');
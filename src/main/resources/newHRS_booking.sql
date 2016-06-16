SET SESSION FOREIGN_KEY_CHECKS=0;


/* Create Tables */

CREATE TABLE suppliermng
(
	-- 공급처 코드
	sup_cd varchar(20) NOT NULL UNIQUE COMMENT '공급처 코드',
	-- 공급처명
	sup_nm varchar(60) NOT NULL COMMENT '공급처명',
	-- 공급처 관리자 명
	sup_manager_nm varchar(32) COMMENT '공급처 관리자 명',
	-- 담당자 연락처
	sup_manager_tel varchar(50) COMMENT '담당자 연락처',
	-- 팩스 번호
	sup_fax_no varchar(50) COMMENT '팩스 번호',
	-- 담당자 이메일
	sup_manager_email varchar(80) COMMENT '담당자 이메일',
	-- 우편번호
	zip_code varchar(20) COMMENT '우편번호',
	-- 공급처 주소
	sup_address varchar(100) COMMENT '공급처 주소',
	-- 등록일
	regi_dt varchar(8) NOT NULL COMMENT '등록일',
	-- 계약 시작일
	str_dt varchar(8) COMMENT '계약 시작일',
	-- 계약 종료일
	end_dt varchar(8) COMMENT '계약 종료일',
	-- 코드 설명
	-- N: Net Price
	-- S:  Sale Price
	-- 
	price_opt char COMMENT '코드 설명 : [ N: Net Price , S: Sale Price ]',
	majin_rate float,
	-- 사용여부
	useyn char DEFAULT 'Y' NOT NULL COMMENT '사용여부',
	PRIMARY KEY (sup_cd)
);


CREATE TABLE roomfaredetail
(
	-- 여행박사 예약번호
	res_code char(16) NOT NULL UNIQUE COMMENT '여행박사 예약번호',
	-- 방, 날짜 별로 요금과 추가요금 정보를 관리한다. 
	room_seq int NOT NULL COMMENT '방, 날짜 별로 요금과 추가요금 정보를 관리한다. ',
	-- 공급처 예약확인 번호
	sup_confirm_no varchar(20) COMMENT '공급처 예약확인 번호',
	-- 객실명
	roomtype varchar(255) NOT NULL COMMENT '객실명',
	-- 체크인 일자
	chkin_dt varchar(8) NOT NULL COMMENT '체크인 일자',
	-- 체크아웃 일자
	chkout_dt varchar(8) NOT NULL COMMENT '체크아웃 일자',
	smokeyn char(1) NOT NULL,
	-- 숙박한 일수
	stay_day int NOT NULL COMMENT '숙박한 일수',
	bfyn char(1) NOT NULL,
	bfprice int DEFAULT 0,
	-- 방별 성인 인원수
	adultcnt int NOT NULL COMMENT '방별 성인 인원수',
	childcnt int NOT NULL,
	-- 영아 인원수
	infantcnt int NOT NULL COMMENT '영아 인원수',
	fin_price float(12) NOT NULL,
	-- 넷가
	net_price float(12) NOT NULL COMMENT '넷가',
	-- 판매가
	sal_price float(12) NOT NULL COMMENT '판매가',
	-- 추가요금
	add_fee bigint COMMENT '추가요금',
	CONSTRAINT Primary_Key UNIQUE (res_code, room_seq)
);


CREATE TABLE guestinfo
(
	-- 여행박사 예약번호
	res_code char(16) NOT NULL UNIQUE COMMENT '여행박사 예약번호',
	-- 방, 날짜 별로 요금과 추가요금 정보를 관리한다. 
	room_seq int NOT NULL COMMENT '방, 날짜 별로 요금과 추가요금 정보를 관리한다. ',
	-- 숙박객 순번
	guest_seq int NOT NULL COMMENT '숙박객 순번',
	-- 코드 설명
	-- A: 성인 ( 18세 이상)
	-- C: 아동 [ EXPEDIA (만 0세~17세) / JTB (만 0세~12세)]
	-- I : 영아 ( 2세 미만 )
	guest_prefix char NOT NULL COMMENT '코드 설명 : [ A: 성인 ( 18세 이상), C: 아동 { EXPEDIA (만 0세~17세) / JTB (만 0세~12세)}, I : 영아 ( 2세 미만 )]',
	-- 성별
	sexx char NOT NULL COMMENT '성별',
	-- 한글명
	ko_nm varchar(32) NOT NULL COMMENT '한글명',
	-- 영문 성
	en_lnm varchar(40) NOT NULL COMMENT '영문 성',
	-- 영문 이름
	en_fnm varchar(40) NOT NULL COMMENT '영문 이름',
	CONSTRAINT pk_guest_001 UNIQUE (res_code, room_seq, guest_seq)
);


CREATE TABLE bookmaster
(
	-- 여행박사 예약번호
	res_code char(16) NOT NULL UNIQUE COMMENT '여행박사 예약번호',
	-- 공급처 코드
	sup_cd varchar(20) COMMENT '공급처 코드',
	ccode varchar(3) NOT NULL,
	-- 공급처 예약번호
	sup_resno varchar(20) NOT NULL COMMENT '공급처 예약번호',
	-- 예약상태
	stat_cd char NOT NULL COMMENT '예약상태',
	-- 호텔코드
	hotel_id varchar(20) NOT NULL COMMENT '호텔코드',
	-- 예약자ID
	orderer_id  varchar(20) COMMENT '예약자ID',
	-- 취소자ID
	canceler_id varchar(20) COMMENT '취소자ID',
	-- 예약자 영문 성
	lname varchar(32) NOT NULL COMMENT '예약자 영문 성',
	-- 예약자 영문 이름
	fname varchar(32) NOT NULL COMMENT '예약자 영문 이름',
	-- 예약자 한글 성명
	res_name varchar(64) NOT NULL COMMENT '예약자 한글 성명',
	-- 예약자 핸드폰 번호
	phone varchar(16) NOT NULL COMMENT '예약자 핸드폰 번호',
	-- 이메일
	email varchar(64) NOT NULL COMMENT '이메일',
	-- 예약일자
	reg_dt varchar(8) NOT NULL COMMENT '예약일자',
	cancle_dt varchar(8) NOT NULL,
	-- 수정 일자
	mod_dt varchar(8) NOT NULL COMMENT '수정 일자',
	-- 예약시간
	reg_tm varchar(6) NOT NULL COMMENT '예약시간',
	-- 취소 시간
	cancle_tm varchar(6) NOT NULL COMMENT '취소 시간',
	-- 수정 시간
	mod_tm varchar(6) NOT NULL COMMENT '수정 시간',
	-- 취소 수수료
	cancle_price float(12) NOT NULL COMMENT '취소 수수료',
	-- 사용여부
	show_yn char NOT NULL COMMENT '사용여부',
	-- 성인 인원 수
	tot_adultcnt int NOT NULL COMMENT '성인 인원 수',
	-- 아동 인원 수 
	tot_childcnt int NOT NULL COMMENT '아동 인원 수 ',
	-- 영아 인원 수
	tot_infantcnt int NOT NULL COMMENT '영아 인원 수',
	roomcnt int NOT NULL,
	currency char(3) NOT NULL,
	exchange_rate float(12) NOT NULL,
	tot_net_price float(12,0) NOT NULL,
	tot_fin_price float(12) NOT NULL,
	tot_sal_price float NOT NULL,
	-- 예상 결과
	-- homepage : PC
	-- mobile : mobile
	res_path varchar(8) COMMENT '코드 설명[ homepage : PC , mobile : mobile ]',
	PRIMARY KEY (res_code),
	CONSTRAINT PK_001 UNIQUE (res_code, hotel_id)
);



/* Create Foreign Keys */

ALTER TABLE guestinfo
	ADD FOREIGN KEY (res_code, room_seq)
	REFERENCES roomfaredetail (res_code, room_seq)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE roomfaredetail
	ADD FOREIGN KEY (res_code)
	REFERENCES bookmaster (res_code)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;




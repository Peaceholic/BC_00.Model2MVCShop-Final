

sqlplus
scott
tiger

DROP TABLE transaction;
DROP TABLE product;
DROP TABLE users;
DROP TABLE book;

DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_tran_no;
DROP SEQUENCE seq_book_bookNo;

CREATE SEQUENCE seq_product_prod_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_tran_no	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_book_bookNo			INCREMENT BY 1 START WITH 10000;


CREATE TABLE users ( 
	user_id 			VARCHAR2(20)		NOT NULL,
	user_name 			VARCHAR2(50)		NOT NULL,
	password 			VARCHAR2(10)		NOT NULL,
	role 				VARCHAR2(5) 		DEFAULT 'user',
	ssn 				VARCHAR2(13),
	cell_phone 			VARCHAR2(14),
	addr 				VARCHAR2(100),
	email 				VARCHAR2(50),
	reg_date 			DATE,
	PRIMARY KEY(user_id)
);


CREATE TABLE product ( 
	prod_no 			NUMBER 				NOT NULL,
	prod_name 			VARCHAR2(100) 		NOT NULL,
	prod_detail 		VARCHAR2(200),
	manufacture_day		VARCHAR2(8),
	price 				NUMBER(10),
	image_file 			VARCHAR2(100),
	reg_date 			DATE,
	PRIMARY KEY(prod_no)
);

CREATE TABLE transaction ( 
	tran_no 				NUMBER 			NOT NULL,
	prod_no 				NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	buyer_id 				VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	payment_option			CHAR(3),
	receiver_name 			VARCHAR2(20),
	receiver_phone			VARCHAR2(14),
	demailaddr 				VARCHAR2(100),
	dlvy_request 			VARCHAR2(100),
	tran_status_code		CHAR(3),
	order_data 				DATE,
	dlvy_date 				DATE,
	PRIMARY KEY(tran_no)
);

CREATE TABLE book ( 			
	bookNo       			NUMBER 			NOT NULL,
	requestNo    			NUMBER 			NOT NULL,
	reqDate					DATE,
	doneDate				DATE,
	title     				VARCHAR2(100),
	contents  				VARCHAR2(500),
	url       				VARCHAR2(400),
	isbn      				VARCHAR2(100),
	datetime	  			DATE,
	authors   				VARCHAR2(50),
	publisher 				VARCHAR2(50),
	translators				VARCHAR2(50),
	price     				VARCHAR2(20),
	sale_price				VARCHAR2(20),
	thumbnail 				VARCHAR2(400),
	status					VARCHAR2(50),
	PRIMARY KEY(bookNo)	
);


INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '서울시 서초구', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate); 

   
           
insert into product values (seq_product_prod_no.nextval, '1주일에 50Kg 빼기', '자기개발','20020101', 6000, 'C.jpg',to_date('2002/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '강아지랑 마라톤 하기', '자기개발','20020101', 6000, 'C.jpg',to_date('2002/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '슬리퍼로 백두산 종주하기', '자기개발','20020101', 6000, 'C.jpg',to_date('2002/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '계산기로 코딩하기', '자기개발','20020101', 6000, 'C.jpg',to_date('2002/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));

insert into product values (seq_product_prod_no.nextval, '세종대왕', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '이순신', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '최무선', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '정약용', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '우장충', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '장영실', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '안중근', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '유관순', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '안창호', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '이봉창', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '최재형', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '윤봉길', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '민영환', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '이상설', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '김약연', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '남자현', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '서재필', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '윤세주', '위인전','20000101', 10000, 'A.jpg',to_date('2000/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));

insert into product values (seq_product_prod_no.nextval, '정주영', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '이병철', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '구인회', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '허만정', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '김종희', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '김수환', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '김대건', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '간디', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '링컨', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '처칠', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '에디슨', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '헬렌켈러', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '테레사수녀', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '찰리체플린', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval, '스티븐호킹', '자서전','20010101', 8000, 'B.jpg',to_date('2001/01/01 01:01:01', 'YYYY/MM/DD HH24:MI:SS'));


commit;

set linesize 1000
set pagesize 1000

column user_id format a30
column user_name format a30
column password format a50
column role format a30
column ssn format a30
column cell_phone format a30
column addr format a30
column email format a30
column reg_date format a30

column prod_no 
column prod_name format a30
column prod_detail format a50
column manufacture_day format a10
column price 
column image_file format a30
column reg_date format a10

column tran_no 
column prod_no 
column buyer_id  format a30
column payment_option format a20
column receiver_name format a30
column receiver_phone format a20
column demailaddr format a20
column dlvy_request format a20
column tran_status_code format a20
column order_data format a10
column dlvy_date format a10

column bookNo    
column requestNo  
column reqDate format a10					
column doneDate	format a10			
column title format a30  	
column contents format a30 	
column url format a30
column isbn format a30      	
column datetime format a30	
column authors format a30   	
column publisher format a30 	
column translators format a30	
column price format a30     	
column sale_price format a30	
column thumbnail format a30	
column status format a30

select * from users;
select * from product order by prod_no;
select * from transaction order by tran_no;
select * from book order by bookNo;





//== Page 처리을 위한 SQL 구성연습

SELECT user_id , user_name , email
FROM users
ORDER BY user_id

currentPage =2
pageSize = 3   
4 ~ 6

SELECT inner_table. * ,  ROWNUM AS row_seq
FROM (	SELECT user_id , user_name , email
				FROM users
				ORDER BY user_id ) inner_table
WHERE ROWNUM <=6;	
//==>           currentPage * paseSize


SELECT * 
FROM (	SELECT inner_table. * ,  ROWNUM AS row_seq
				FROM (	SELECT user_id , user_name , email
								FROM users
								ORDER BY user_id ) inner_table
				WHERE ROWNUM <=6 )
WHERE row_seq BETWEEN 4 AND 6;

//==> (currentPage-1) * paseSize+1           currentPage * paseSize


========================================================================================

sqlplus
scott
tiger
set linesize 1000
set pagesize 1000

column user_id format a30
column user_name format a30
column password format a50
column role format a30
column ssn format a30
column cell_phone format a30
column addr format a30
column email format a30
column reg_date format a30

column prod_no 
column prod_name format a30
column prod_detail format a50
column manufacture_day format a10
column price 
column image_file format a30
column reg_date format a10

column tran_no 
column prod_no 
column buyer_id  format a30
column payment_option format a20
column receiver_name format a30
column receiver_phone format a20
column demailaddr format a20
column dlvy_request format a20
column tran_status_code format a20
column order_data format a10
column dlvy_date format a10

column bookNo    
column requestNo  
column title format a30  	
column contents format a30 	
column url format a30
column isbn format a30      	
column datetime format a30	
column authors format a30   	
column publisher format a30 	
column translators format a30	
column price format a30     	
column sale_price format a30	
column thumbnail format a30	
column status format a30

select * from users;
select * from product order by prod_no;
select * from transaction order by tran_no;
select * from book order by bookNo;


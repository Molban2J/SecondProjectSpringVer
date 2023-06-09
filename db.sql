  
drop sequence free_seq; 
drop sequence freply_seq;
drop sequence cart_seq;
drop sequence product_seq;
drop sequence coupon_seq;
drop sequence orders_seq;
drop sequence order_detail_seq;
drop sequence auction_seq;

drop index idx_free_board_num_desc;

create sequence free_seq start with 1 increment by 1;
create sequence freply_seq start with 1 increment by 1;
create sequence cart_seq start with 1 increment by 1;
create sequence product_seq start with 1 increment by 1;
create sequence coupon_seq start with 1 increment by 1;
create sequence orders_seq start with 1 increment by 1;
create sequence order_detail_seq start with 1 increment by 1;
create sequence auction_seq start with 1 increment by 1;

DROP VIEW order_view;

drop table fboard_reply;
drop table free_board;
drop table cart;
drop table auction;
drop table coupon;
drop table order_detail;
drop table orders;
drop table shopuser;
drop table product;
drop table brand;




/*shopuser*/
CREATE TABLE shopuser (
  userid VARCHAR2(20) PRIMARY KEY,
  pass VARCHAR2(200), /*0419 1000*/
  name VARCHAR2(30),
  email VARCHAR2(200), 
  address1 VARCHAR2(100),
  address2 VARCHAR2(100),
  address3 VARCHAR2(100),
  phone VARCHAR2(20),
  gender NUMBER(1),
  grade NUMBER(10) default 0,
  point NUMBER(10) default 0,
  enter DATE DEFAULT SYSDATE
);

CREATE TABLE free_board (
num NUMBER(5) PRIMARY KEY,
userid VARCHAR2(20),
title VARCHAR2(100),
content VARCHAR2(4000),
category VARCHAR2(100),
writedate DATE DEFAULT SYSDATE,
readcount NUMBER(5) DEFAULT 0
);
CREATE INDEX idx_free_board_num_desc ON free_board (num DESC);



CREATE TABLE fboard_reply (
  rno     NUMBER(10) NOT NULL PRIMARY KEY,
  num     NUMBER(10) NOT NULL,
  writer  VARCHAR2(30) NOT NULL,
  content CLOB NOT NULL,
  regDate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
 CONSTRAINT FK_FBOARD_REPLY_NUM
  FOREIGN KEY (num)
  REFERENCES free_board(num)
  ON DELETE CASCADE
);

/*cart*/
CREATE TABLE cart( /*update 0414 */
cartNum number(5) primary key, /*sequence*/
userid VARCHAR2(20) not null,/*fk - shopuser userid*/	     	    
num NUMBER(5) not null,/*fk - product num*/
pSize VARCHAR2(10),
quantity NUMBER(10),
price NUMBER(10) default 0 not null,
orderDate DATE default sysdate,
result char(1) default 1 /*0418 update*/ /*1 주문 확인 중 2 주문 처리 중*/
);

/*auction*/
CREATE TABLE auction(
num number(5), /* sequence */  /*0419 1000*/
userid VARCHAR2(20) not null,/*fk - shopuser userid*/
bName VARCHAR2(20) not null,
pName VARCHAR2(200) not null,
pSize VARCHAR2(10),
price NUMBER(10) not null,
startPrice NUMBER(10),
imgUrl VARCHAR2(300),
endPrice NUMBER(10),
endTime DATE,
onoff number(1)
);


/*product*/
CREATE TABLE PRODUCT(  /*update 0413 */
num NUMBER(4) primary key, /*sequence*/ 
pGender NUMBER(1), 
bName VARCHAR2(20),
kind NUMBER(1), 
pName VARCHAR2(200) not null,
imgUrl VARCHAR2(300), 
pSize VARCHAR2(10),
discountrate Number(3) default 0,
balance NUMBER(10) DEFAULT 0,
price NUMBER(10) not null,
purchasedNum NUMBER(10) DEFAULT 0,
explain VARCHAR2(4000),
writedate date default sysdate,
readcount NUMBER(4) default 0
);

/*brand*/
CREATE TABLE brand(
bName VARCHAR2(20) primary key,
imgUrl VARCHAR2(300)
);



/* coupon */
CREATE TABLE coupon (
  userid VARCHAR2(20),
  couponname VARCHAR2(20),
  cnum NUMBER(10) NOT NULL PRIMARY KEY,
  discountprice NUMBER(10) NOT NULL,
  couponresult number(10) default(1),
  imgurl varchar2(300),
  CONSTRAINT fk_coupon_userid FOREIGN KEY (userid) REFERENCES shopuser (userid)
);


/* orders */
CREATE TABLE orders (
  orderNumber NUMBER(10) NOT NULL PRIMARY KEY, /*seq*/
  userid VARCHAR2(20), /*fk*/
  indate DATE DEFAULT sysdate
);

/*order_detail*/
CREATE TABLE order_detail (
  orderDetailNumber NUMBER(10) NOT NULL PRIMARY KEY, /*seq*/
  orderNumber NUMBER(10),
  num NUMBER(5), /* FK product */
  quantity NUMBER(5),
  price NUMBER(10) default 0 not null,
  totalPrice NUMBER(10),
  pSize VARCHAR2(10),
  name VARCHAR2(30),
  email VARCHAR2(200), 
  address1 VARCHAR2(100),
  address2 VARCHAR2(100),
  address3 VARCHAR2(100),
  phone VARCHAR2(20),
  result CHAR(1) DEFAULT 1 /*1 주문 확인 중 2 주문 처리 중*/
);

/* join table(order, order_detail) */
CREATE VIEW order_view AS
SELECT
  orders.orderNumber,
  orders.userid,
  orders.indate,
  order_detail.orderDetailNumber,
  order_detail.num,
  order_detail.quantity,
  order_detail.totalprice,
  order_detail.price,
  order_detail.psize,
  order_detail.name,
  order_detail.phone,
  order_detail.address1,
  order_detail.address2,
  order_detail.address3,
  order_detail.result
FROM
  orders
JOIN
  order_detail
ON
  orders.orderNumber = order_detail.orderNumber;


/*FK*/

ALTER TABLE orders
ADD CONSTRAINT orders_fk_user
FOREIGN KEY (userid) REFERENCES shopuser(userid) ON DELETE CASCADE;

ALTER TABLE order_detail
ADD CONSTRAINT order_detail_fk_order
FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber) ON DELETE CASCADE;

ALTER TABLE order_detail
ADD CONSTRAINT order_detail_fk_product
FOREIGN KEY (num) REFERENCES product(num) ON DELETE CASCADE;


ALTER TABLE product
ADD CONSTRAINT product_fk_brand
FOREIGN KEY (bName) REFERENCES brand (bName) ON DELETE CASCADE;


ALTER TABLE cart 
ADD CONSTRAINT cart_fk_user
FOREIGN KEY (userid) REFERENCES shopuser (userid) ON DELETE CASCADE;

ALTER TABLE cart 
ADD CONSTRAINT cart_fk_product
FOREIGN KEY (num) REFERENCES product (num) ON DELETE CASCADE;

ALTER TABLE auction 
ADD CONSTRAINT auction_fk_user
FOREIGN KEY (userid) REFERENCES shopuser (userid) ON DELETE CASCADE;

/* update */

UPDATE shopuser
SET point = point + 50000
WHERE userid = 'user';

/*select*/
select * from shopuser;
select * from free_board;
select * from brand;
select * from cart;
select * from coupon;
select * from product;
select * from auction;
select * from orders;
select * from order_detail;
select * from order_view;
desc order_detail;

update shopuser set grade = 1 where userid='admin';

/*insert*/  /*0419 1000*/
insert into shopuser values('admin','$2a$10$oC0NmZtmTQmBZgKDeXZwFe/VFGb0KgupZl0e.637agg1MNeEdy5e6','관리자', '12345@gamil.com', '12345', '서울특별시 인사동 12길 ', '대일빌딩 , 하이미디어 15층, 16호 ', '01012344321', '1', '1', '0','2023/04/13');
insert into shopuser values('user','$2a$10$oC0NmZtmTQmBZgKDeXZwFe/VFGb0KgupZl0e.637agg1MNeEdy5e6','유저', '12345@gamil.com', '12345', '서울특별시 인사동 12길 ', '대일빌딩 , 하이미디어 15층, 16호 ', '01012344321', '1', '4', '0','2023/04/13');
insert into shopuser values('test','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','유저', '12345@gamil.com', '12345', '서울특별시 인사동 12길 ', '대일빌딩 , 하이미디어 15층, 16호 ', '01012344321', '1', '0', '0','2023/04/13');
insert into shopuser values('test2','$2a$10$oC0NmZtmTQmBZgKDeXZwFe/VFGb0KgupZl0e.637agg1MNeEdy5e6','유저', '12345@gamil.com', '12345', '서울특별시 인사동 12길 ', '대일빌딩 , 하이미디어 15층, 16호 ', '01012344321', '1', '2', '0','2023/04/13');

insert into brand values('louisvuitton','louisvuittonlogo.png');
insert into brand values('Saint Laurent', 'saintlaurentlogo.png');
insert into brand values('prada', 'pradalogo.png');
insert into brand values('balenciaga', 'balenciagalogo.png');
insert into brand values('hermes', 'hermeslogo.png');
insert into brand values('rolex', 'rolexlogo.png');
insert into brand values('dior', 'diorlogo.png');


/* 누적 포인트 등급 상승 admin grade = 1 */
CREATE OR REPLACE TRIGGER update_user_grade
BEFORE UPDATE OF point ON shopuser
FOR EACH ROW
DECLARE
  new_grade NUMBER(10);
BEGIN
  IF :new.point >= 500000 THEN
    new_grade := 4;
  ELSIF :new.point >= 100000 THEN
    new_grade := 3;
  ELSIF :new.point >= 30000 THEN
    new_grade := 2;
  ELSE
    new_grade := 0;
  END IF;
  
  :new.grade := new_grade;
END;
/
delete brand where bname = 'test';



commit;

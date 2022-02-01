# 날 짜 : 2021/08/05
# 이 름 : 권능한
# 내 용 : SQL 실습과제



#실습1
CREATE TABLE `Book`(
	`bookid`		INT PRIMARY KEY,
	`bookname`	VARCHAR(10),
	`publisher`	VARCHAR(10),
	`price`		INT
);

INSERT INTO `Book` VALUES(1,'축구의 역사','굿스포츠',7000);
INSERT INTO `Book` VALUES(2,'축구아는 여자','나무수',13000);
INSERT INTO `Book` VALUES(3,'축구의 이해','대한미디어',22000);
INSERT INTO `Book` VALUES(4,'골프 바이블','대한미디어',35000);
INSERT INTO `Book` VALUES(5,'피겨 교본','굿스포츠',8000);
INSERT INTO `Book` VALUES(6,'역도 단계별기술','굿스포츠', 6000);
INSERT INTO `Book` VALUES(7,'야구의 추억','이상미디어',20000);
INSERT INTO `Book` VALUES(8,'야구를 부탁해','이상미디어',13000);
INSERT INTO `Book` VALUES(9,'올림픽 이야기','삼성당','7500');
INSERT INTO `Book` VALUES(10,'Olympicc Champions','person',13000);
#실습2
CREATE TABLE `Customer` (
	`custid` 	INT PRIMARY KEY,
	`name`		VARCHAR(10),
	`address`	VARCHAR(30),
	`phone`		CHAR(13)
);
INSERT INTO `Customer` VALUES(1,'박지성','영국 맨체스터','000-5000-0001');
INSERT INTO `Customer` VALUES(2,'김연아','대한민국 서울','000-6000-0001');
INSERT INTO `Customer` VALUES(3,'장미란','대한민국 강원도','000-7000-0001');
INSERT INTO `Customer` VALUES(4,'추신수','미국 클리블랜드','000-8000-0001');
INSERT INTO `Customer` (`custid`,`name`,`address`) VALUES(5,'박세리','대한민국 대전');


#실습3OrdersBook
CREATE TABLE `Orders` (
	`orderid`		INT PRIMARY KEY,
	`custid`			INT,
	`bookid`			INT,
	`saleprice`		INT,
	`orderdate`		DATE
);
INSERT INTO `Orders` VALUES(1,1,1,6000,'2014-07-01');
INSERT INTO `Orders` VALUES(2,1,3,21000,'2014-07-03');
INSERT INTO `Orders` VALUES(3,2,5,8000,'2014-07-03');
INSERT INTO `Orders` VALUES(4,3,6,6000,'2014-07-04');
INSERT INTO `Orders` VALUES(5,4,7,20000,'2014-07-05');
INSERT INTO `Orders` VALUES(6,1,2,12000,'2014-07-07');
INSERT INTO `Orders` VALUES(7,4,8,13000,'2014-07-07');
INSERT INTO `Orders` VALUES(8,3,10,12000,'2014-07-08');
INSERT INTO `Orders` VALUES(9,2,10,7000,'2014-07-09');
INSERT INTO `Orders` VALUES(10,3,8,13000,'2014-07-10');


#실습4
SELECT `custid`,`name`,`address`
 FROM `Customer`;
#실습5
SELECT `bookid`,`bookname`,`publisher`,`price`
FROM `Book`;
#실습6
SELECT DISTINCT `publisher`
FROM `Book`;
#실습7
SELECT `bookid`,`bookname`,`publisher`,`price`
FROM `Book`
WHERE `price` < 20000 ;
#실습8
SELECT `bookid`,`bookname`,`publisher`,`price`
FROM `Book`
WHERE `price`>=10000 AND `price`<=20000; 
#실습9
SELECT `bookid`,`bookname`,`publisher`,`price`
FROM `Book`
WHERE `publisher` = '굿스포츠' OR `publisher` ='대한미디어';
#실습10
SELECT `publisher`
FROM `Book`
WHERE `bookname` = '축구의 역사';

#실습11
SELECT `publisher`
FROM `Book`
WHERE `bookname` LIKE '%축구%';


#실습12
SELECT `bookid`,`bookname`,`publisher`,`price`
FROM `Book`
WHERE `bookname` LIKE '_구%';
#실습13
SELECT `bookid`,`bookname`,`publisher`,`price`
FROM `Book`
WHERE `bookname` LIKE '%축구%' AND `price` >= 20000;
#실습14
SELECT `bookid`,`bookname`,`publisher`,`price`
FROM `Book``
ORDER BY `bookname` ASC;
#실습15
SELECT `bookid`,`bookname`,`publisher`,`price`
FROM `Book`
ORDER BY `price` ASC, `bookname`ASC;
#실습16
SELECT `bookid`,`bookname`,`publisher`,`price`
FROM `Book`
ORDER BY `price` DESC, `publisher` ASC;
#실습17
SELECT SUM(`saleprice`) AS `총판매액`
FROM `Orders`;
#실습18
SELECT SUM(`saleprice`) AS `총매출`
FROM `Orders`
WHERE `custid` = 2;
#실습19
SELECT 
	SUM(`saleprice`) AS `총판매액`,
	AVG(`saleprice`) AS `평균값`,
	MIN(`saleprice`) AS `최저가`,
	MAX(`saleprice`) AS `최고가`
FROM `Orders`;
#실습20
SELECT COUNT(*) AS `판매건수`
FROM `Orders`;

#실습21
SELECT `custid`,COUNT(*) AS `수량`
FROM `Orders`
WHERE `saleprice`>=8000
GROUP BY `custid`
HAVING COUNT(*)>=2;

#실습22
SELECT * FROM `Customer` AS a
JOIN `Orders` AS b
ON a.custid = b.custid;

SELECT * FROM `Customer` AS a
JOIN `Orders` AS b
USING(`custid`);

SELECT * FROM `Customer` ,`Orders` WHERE `Customer`.custid= `Orders`.custid;
#실습23
SELECT * FROM `Customer` AS a
	JOIN `Orders` AS b
		ON a.`custid` = b.`custid`
			ORDER BY a.`custid`;

#실습24
SELECT `name`,`saleprice`
FROM `Customer` AS a
JOIN `Orders` AS b
WHERE a.`custid` = b.`custid`;

SELECT `name`,`saleprice` 
	FROM `Customer` AS a
		JOIN `Orders` AS b ON a.custid =b.custid;


#실습25
SELECT a.`name`, SUM(`saleprice`)
FROM `Customer` AS a
JOIN `Orders` AS b
ON a.custid = b.custid
GROUP BY a.`custid`
ORDER BY `name`;
#실습26
SELECT `name`,`bookname` FROM `Customer` AS a
JOIN `Orders` AS b ON a.custid = b.custid
JOIN `Book` AS c ON b.bookid = c.bookid;

#실습27
SELECT `name`,`bookname` FROM `Customer` AS a
JOIN `Orders` AS b ON a.custid = b.custid
JOIN `Book` AS c ON b.bookid = c.bookid
WHERE `price`=20000;


#실습28
SELECT `bookname` FROM `Book` WHERE `price`=(SELECT MAX(`price`) FROM `Book`);
SELECT MAX(`price`) FROM `Book`;

#실습29
INSERT INTO `Book` (`bookname`,`publisher`,`price`)
			VALUES ('스포츠 의학', '한솔의학서적',90000);
#실습30 
INSERT INTO `Book`(`bookname`,`publisher`)
			VALUES('스포츠의학','한솔의학서적');
#실습31
UPDATE `Customer` SET `address`='대한민국 부산' WHERE `custid`=5;
#실습32
DELETE FROM `Customer` WHERE `custid`=5;

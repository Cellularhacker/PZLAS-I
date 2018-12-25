----- Repository Version 1.0.0
----- Written by Cellularhacker
----- License: BSD-3-Clause
----- 
----- A) ==> 동아리방이 터지거나, 유사시의 상황이 발생하였을 경우에 기증자 본인에게 돌려받을지 여부
----- ※기증자는 반드시 주소와 이메일을 입력해야함

--- 동아리원 전체 목록 Table ---
CREATE TABLE `MEMBERS` 
(
	`studentId` int primary key,
	`memName` varchar(255) not null,
	`mobile` varchar(13) not null,
	`email` varchar(255) unique key,
	`addr` varchar(255) null
);

--- 대여 Table ---
CREATE TABLE `BORROW` 
(
	`borrowNo` int primary key,
	`bookNo` int not null,
	`studentId` int not null,
	`startDate` datetime not null,
	`endDate` datetime not null,
	`supplementYN` boolean not null,
	`borrowExtendYN` boolean not null
);

--- 책 전체 목록 Table ---
CREATE TABLE `BOOK` 
(
	`bookNo` int primary key,
	`ISBN` int not null,
	`bookingYN` boolean not null,
	`bookOwner` int not null,
	`disposeYN` boolean not null -- A)
);

--- 대여중 목록 Table ---
CREATE TABLE `BOOKING` 
(
	`studentId` int primary key,
	`bookNo` int primary key,
	`bookedDate` datetime not null
);

--- 부록 Table ---
CREATE TABLE `SUPPLEMENTS` 
(
	`supplementNo` int primary key,
	`bookNo` int not null,
	`supplementName` varchar(255) not null
);

--- ISBN Table ---
CREATE TABLE `BOOK_INFO` 
(
	`ISBN` int primary key,
	`categoryNo` int not null,
	`author` varchar(255) not null,
	`publisher` varchar(255) not null,
	`publicationDate` datetime not null,
	`bookName` varchar(255) not null
);

--- ISBN 세부 카테고리 ---
CREATE TABLE `CATEGORY` 
(
	`categoryNo` int primary key,
	`categoryName` varchar(255) not null
);

ALTER TABLE `BORROW` ADD FOREIGN KEY (`bookNo`) REFERENCES `BOOK` (`bookNo`);

ALTER TABLE `BORROW` ADD FOREIGN KEY (`studentId`) REFERENCES `MEMBERS` (`studentId`);

ALTER TABLE `BOOK` ADD FOREIGN KEY (`ISBN`) REFERENCES `BOOK_INFO` (`ISBN`);

ALTER TABLE `BOOK` ADD FOREIGN KEY (`bookOwner`) REFERENCES `MEMBERS` (`studentId`);

ALTER TABLE `SUPPLEMENTS` ADD FOREIGN KEY (`bookNo`) REFERENCES `BOOK` (`bookNo`);

ALTER TABLE `CATEGORY` ADD FOREIGN KEY (`categoryNo`) REFERENCES `BOOK_INFO` (`categoryNo`);

ALTER TABLE `BOOKING` ADD FOREIGN KEY (`studentId`) REFERENCES `MEMBERS` (`studentId`);

ALTER TABLE `BOOKING` ADD FOREIGN KEY (`bookNo`) REFERENCES `BOOK` (`bookNo`);

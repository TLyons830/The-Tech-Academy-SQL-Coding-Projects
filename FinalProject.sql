CREATE DATABASE Library_Management_System

USE Library_Management_System


/*CREATE TABLES*/

CREATE TABLE LIBRARY_BRANCH (
	Branch_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Branch_Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone INT NOT NULL
);

CREATE TABLE BOOKS (
	Book_ID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE BOOK_AUTHORS (
	Book_ID INT NOT NULL CONSTRAINT fk_Book_ID FOREIGN KEY REFERENCES BOOKS(Book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50)
);

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone INT NOT NULL
);

CREATE TABLE BOOK_COPIES (
	Book_ID INT NOT NULL CONSTRAINT fk_Book_ID2 FOREIGN KEY REFERENCES BOOKS(Book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Branch_ID INT NOT NULL CONSTRAINT fk_Branch_ID FOREIGN KEY REFERENCES LIBRARY_BRANCH(Branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_of_Copies INT NOT NULL
);

CREATE TABLE BOOK_LOANS (
	Book_ID INT NOT NULL CONSTRAINT fk_Book_ID3 FOREIGN KEY REFERENCES BOOKS(Book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Branch_ID INT NOT NULL CONSTRAINT fk_Branch_ID2 FOREIGN KEY REFERENCES LIBRARY_BRANCH(Branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

/*END CREATE TABLES*/

/*INSERT STATEMENTS*/

INSERT INTO LIBRARY_BRANCH
	(Branch_Name, Address)
	VALUES 
	('Sharpstown', '1 Sharp Street'),
	('Central', '2 Main Street'),
	('East', '3 East Road'),
	('West', '4 West Drive')
;

SELECT * FROM LIBRARY_BRANCH

INSERT INTO PUBLISHER
	(PublisherName, Address, Phone)
	VALUES 
	('Picador', '120 Broadway', 111),
	('Doubleday', '1745 Broadway', 000)
;

SELECT * FROM PUBLISHER

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES 
	('The Last Tribe', 'Picador'),
	('The Shinning', 'Doubleday'),
	('Carry', 'Doubleday'),
	('Salems lot', 'Doubleday'),
	('The Stand', 'Doubleday'),
	('The Bells of Old Tokyo', 'Picador'),
	('Piranhas', 'Picador'),
	('Talking to Strangers', 'Picador'),
	('The Time Collector', 'Picador'),
	('All Ships Follow Me', 'Picador'),
	('Good Kids, Bad City', 'Picador'),
	('Receptor', 'Picador'),
	('We the People', 'Picador'),
	('Goldstein', 'Picador'),
	('We Cant Breathe', 'Picador'),
	('How Fiction Works', 'Picador'),
	('The Punitive Society', 'Picador'),
	('City of Devils', 'Picador'),
	('The Crystal World', 'Picador'),
	('The Third Bank of the River', 'Picador'),
	('The Confident Cook', 'Picador'),
	('Cooking in a Small Kitchen', 'Picador'),
	('Chasing New Horizons', 'Picador')
;

SELECT * FROM BOOKS

INSERT INTO BOOK_AUTHORS
	(Book_ID, AuthorName)
	VALUES 
	(100, 'Mark Lee'),
	(101, 'Stephen King'),
	(102, 'Stephen King'),
	(103, 'Stephen King'),
	(104, 'Stephen King'),
	(105, 'Anna Sherman'),
	(106, 'Roberto Saviano'),
	(107, 'Paul Auster'),
	(108, 'Gwendolyn Womack'),
	(109, 'Mieke Eerkens'),
	(110, 'Kyle Swenson'),
	(111, 'Alan Glynn'),
	(112, 'Erwin Chemerinsky'),
	(113, 'Volker Kutscher'),
	(114, 'Jabari Asim'),
	(115, 'James Wood'),
	(116, 'Michel Foucault'),
	(117, 'Paul French'),
	(118, 'J. G. Ballard'),
	(119, 'Chris Feliciano Arnold'),
	(120, 'Irena Chalmers'),
	(121, 'Arthur Schwartz'),
	(122, 'Alan Stern')
;

SELECT * FROM BOOK_AUTHORS

INSERT INTO BOOK_COPIES
	(Book_ID, Branch_ID, Number_of_Copies)
	VALUES 
	(100, 1, 6),
	(103, 1, 6),
	(104, 1, 6),
	(105, 1, 6),
	(106, 1, 6),
	(107, 1, 6),
	(108, 1, 6),
	(109, 1, 6),
	(110, 1, 6),
	(111, 1, 6),
	(101, 2, 6),
	(102, 2, 6),
	(103, 2, 6),
	(104, 2, 6),
	(112, 2, 6),
	(113, 2, 6),
	(114, 2, 6),
	(115, 2, 6),
	(116, 2, 6),
	(117, 2, 6),
	(100, 3, 6),
	(101, 3, 6),
	(102, 3, 6),
	(110, 3, 6),
	(111, 3, 6),
	(112, 3, 6),
	(118, 3, 6),
	(119, 3, 6),
	(120, 3, 6),
	(121, 3, 6),
	(122, 4, 6),
	(105, 4, 6),
	(106, 4, 6),
	(107, 4, 6),
	(108, 4, 6),
	(109, 4, 6),
	(118, 4, 6),
	(119, 4, 6),
	(120, 4, 6),
	(121, 4, 6)
;

SELECT * FROM BOOK_COPIES

INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES 
	('Aaron Rodgers', '11 Minnesota', 11),
	('Davante Adams', '12 Wisonsin', 13),
	('Blake Martinez', '13 Kentucky', 13),
	('Aaron Jones', '14 Missouri', 14),
	('Kenny Clark', '15 Ohio', 15),
	('Jaire Alexander', '16 Rhode Island', 16),
	('Jimmy Graham', '17 Vermont', 17),
	('Geronimo Allison', '18 Alabama', 18)
;

INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES 
	('Kevin King', '22 Oregon', 22),
	('Lane Taylor', '23 California', 23)
;

SELECT * FROM BORROWER

INSERT INTO BOOK_LOANS
	(Book_ID, Branch_ID, CardNo, DateOut, DateDue)
	VALUES 
	(100, 1, 1000, '2017-08-01', '2019-08-30'),
	(103, 1, 1000, '2017-08-01', '2019-08-30'),
	(110, 1, 1000, '2017-08-01', '2019-08-30'),
	(111, 1, 1000, '2017-08-01', '2019-08-30'),
	(104, 1, 1000, '2017-08-01', '2019-08-30'),
	(105, 1, 1000, '2017-08-01', '2019-08-30'),
	(101, 2, 1000, '2017-08-01', '2019-08-30'),
	(102, 2, 1000, '2017-08-01', '2019-08-30'),
	(114, 2, 1000, '2017-08-01', '2019-08-30'),
	(115, 2, 1000, '2017-08-01', '2019-08-30'),
	(116, 2, 1000, '2017-08-01', '2019-08-30'),
	(117, 2, 1000, '2017-08-01', '2019-08-30'),
	(112, 2, 1000, '2017-08-01', '2019-08-30'),
	(113, 2, 1000, '2017-08-01', '2019-08-30'),
	(121, 3, 1000, '2017-08-01', '2019-08-30'),
	(122, 4, 1001, '2017-09-01', '2019-09-30'),
	(105, 4, 1001, '2017-09-01', '2019-09-30'),
	(106, 4, 1001, '2017-09-01', '2019-09-30'),
	(107, 4, 1001, '2017-09-01', '2019-09-30'),
	(108, 4, 1001, '2017-09-01', '2019-09-30'),
	(109, 4, 1001, '2017-09-01', '2019-09-30'),
	(118, 4, 1001, '2017-09-01', '2019-09-30'),
	(119, 4, 1001, '2017-09-01', '2019-09-30'),
	(120, 4, 1001, '2017-09-01', '2019-09-30'),
	(121, 4, 1001, '2017-09-01', '2019-09-30'),
	(100, 3, 1001, '2017-09-01', '2019-09-30'),
	(101, 2, 1001, '2017-09-01', '2019-09-30'),
	(102, 2, 1001, '2017-09-01', '2019-09-30'),
	(103, 2, 1001, '2017-09-01', '2019-09-30'),
	(100, 3, 1002, '2017-10-01', '2019-10-30'),
	(101, 3, 1002, '2017-10-01', '2019-10-30'),
	(102, 3, 1002, '2017-10-01', '2019-10-30'),
	(110, 3, 1002, '2017-10-01', '2019-10-30'),
	(111, 3, 1002, '2017-10-01', '2019-10-30'),
	(112, 3, 1002, '2017-10-01', '2019-10-30'),
	(118, 3, 1002, '2017-10-01', '2019-10-30'),
	(119, 3, 1002, '2017-10-01', '2019-10-30'),
	(120, 3, 1002, '2017-10-01', '2019-10-30'),
	(121, 3, 1002, '2017-10-01', '2019-10-30'),
	(106, 1, 1002, '2017-10-01', '2019-10-30'),
	(107, 1, 1002, '2017-10-01', '2019-10-30'),
	(108, 1, 1002, '2017-10-01', '2019-10-30'),
	(109, 1, 1002, '2017-10-01', '2019-10-30'),
	(101, 2, 1003, '2017-11-01', '2019-11-30'),
	(122, 4, 1004, '2017-12-01', '2019-12-30'),
	(105, 4, 1004, '2017-12-01', '2019-12-30'),
	(103, 1, 1005, '2017-8-01', '2019-8-30'),
	(102, 2, 1006, '2017-9-01', '2019-9-30'),
	(103, 2, 1006, '2017-9-01', '2019-9-30'),
	(100, 3, 1007, '2017-10-01', '2019-10-30')
;

SELECT * FROM BOOK_LOANS


/* END INSERT STATEMENTS*/

/************ Query / Stored Procedures *******************/

USE Library_Management_System

/* 1 */

GO
CREATE PROCEDURE HowManyLostTribeCopiesAtSharpstown
AS
SELECT Number_of_Copies FROM BOOK_COPIES WHERE Branch_ID = 1 and Book_ID = 100
GO;

/* 2 */

GO
CREATE PROCEDURE HowManyLostTribeCopiesAtEachBranch
AS
SELECT Number_of_Copies, Branch_Name
FROM BOOK_COPIES
INNER JOIN LIBRARY_BRANCH on LIBRARY_BRANCH.Branch_ID = BOOK_COPIES.Branch_ID
WHERE Book_ID = 100
;
GO

/* 3 */

GO
CREATE PROCEDURE BorrowersWithoutCheckouts
AS
SELECT Name
FROM BORROWER
LEFT JOIN BOOK_LOANS on BOOK_LOANS.CardNo = BORROWER.CardNo
WHERE BOOK_LOANS.CardNo IS NULL 
;
GO

/* 4 */

GO
CREATE PROCEDURE SharpstownDueToday
AS
SELECT Title, Name, Address 
FROM BORROWER
INNER JOIN BOOK_LOANS on BORROWER.CardNo = BOOK_LOANS.CardNo
INNER JOIN BOOKS on BOOK_LOANS.Book_ID = BOOKS.Book_ID
WHERE Branch_ID = 1 and DateDue = CURRENT_TIMESTAMP
;
GO

/* 5 */

GO
CREATE PROCEDURE TotalBranchLoans
AS
SELECT Branch_Name, COUNT(BOOK_LOANS.Book_ID) as 'Loans'
FROM BOOK_LOANS
INNER JOIN LIBRARY_BRANCH on LIBRARY_BRANCH.Branch_ID = BOOK_LOANS.Branch_ID
GROUP BY Branch_Name
;
GO

/* 6 */

GO
CREATE PROCEDURE BorrowersWithMoreThan5Checkouts
AS
SELECT Name, Address, COUNT(BOOK_LOANS.CardNo) as '# of checkouts'
FROM BORROWER
LEFT JOIN BOOK_LOANS on BORROWER.CardNo = BOOK_LOANS.CardNo
GROUP BY Name, Address
HAVING COUNT(BOOK_LOANS.CardNo) > 5 
;
GO

/* 7 */

GO
CREATE PROCEDURE StephenKingCentralCopies
AS
SELECT Title, Number_of_Copies
FROM BOOKS
INNER JOIN BOOK_AUTHORS on BOOKS.Book_ID = BOOK_AUTHORS.Book_ID
INNER JOIN BOOK_COPIES on BOOK_AUTHORS.Book_ID = BOOK_COPIES.Book_ID
INNER JOIN LIBRARY_BRANCH on LIBRARY_BRANCH.Branch_ID = BOOK_COPIES.Branch_ID
WHERE AuthorName = 'Stephen King' and Branch_Name = 'Central'
;
GO

/********* END Query / Stored Procedures **************/
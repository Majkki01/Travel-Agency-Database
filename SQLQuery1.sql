USE TravelAgency

CREATE TABLE Options (
id int IDENTITY(1,1) PRIMARY KEY,
name varchar(20) UNIQUE NOT NULL,
price DECIMAL(6,2) CHECK (price >= 0),
description varchar(50),
isAvailable BIT NOT NULL
);

CREATE TABLE Locations (
id int IDENTITY(1,1) PRIMARY KEY,
country varchar(20),
city varchar(20),
hotel varchar(20) NOT NULL,
starsCount int CHECK (starsCount >= 1 AND starsCount <= 5) NOT NULL
);

CREATE TABLE People (
PESEL varchar(11) PRIMARY KEY,
firstName varchar(20) NOT NULL,
secondName varchar(20),
surname varchar(20) NOT NULL,
dateOfBirth date NOT NULL,
age int NOT NULL,
address varchar(50),
CHECK(
PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' AND
age >= 0)
);

CREATE TABLE Sellers (
PESEL varchar(11) REFERENCES People ON DELETE CASCADE ON UPDATE CASCADE PRIMARY KEY,
yearsOfExperience int NOT NULL,
salary DECIMAL(9,2),
clientsRate int,
position varchar(20) NOT NULL,
officeNo int,
isEmployed BIT NOT NULL,
supervisorPESEL varchar(11) REFERENCES Sellers(PESEL)
);

CREATE TABLE Participants (
PESEL varchar(11) REFERENCES People ON DELETE CASCADE ON UPDATE CASCADE PRIMARY KEY,
insuranceNumber varchar(18) UNIQUE NOT NULL,
insuranceAmount int NOT NULL,
companyRate int,
satisfactionRate int
);

CREATE TABLE ReservationGroups (
id int IDENTITY(1,1) PRIMARY KEY,
groupLeaderID varchar(11) FOREIGN KEY REFERENCES Participants ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
groupName varchar(20) UNIQUE NOT NULL,
adultsNumber int NOT NULL,
childrenNumber int NOT NULL,
isFamily bit,
CHECK(adultsNumber > 0 AND childrenNumber >= 0)
);

CREATE TABLE Trips (
id int IDENTITY(1,1) PRIMARY KEY,
name varchar(20) UNIQUE NOT NULL,
transport varchar(5) NOT NULL,
type varchar(20),
description varchar(50),
locationID int REFERENCES Locations ON DELETE NO ACTION ON UPDATE CASCADE NOT NULL,
CHECK(transport IN ('plane', 'bus'))
);

CREATE TABLE Sessions (
id int IDENTITY(1,1) PRIMARY KEY,
firstDay smalldatetime NOT NULL,
lastDay smalldatetime NOT NULL,
tripID int FOREIGN KEY REFERENCES Trips ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
CHECK(firstDay < LastDay)
);

CREATE TABLE Offers (
id int IDENTITY(1,1) PRIMARY KEY,
basicPrice DECIMAL(7,2) NOT NULL,
discount DECIMAL(7,2),
participantsNumber int NOT NULL,
isLastMinute bit NOT NULL,
isAvailable bit NOT NULL,
tripID int REFERENCES Trips ON DELETE NO ACTION ON UPDATE CASCADE NOT NULL
);

CREATE TABLE OfferedOptions (
offerID int FOREIGN KEY REFERENCES Offers ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
offeredOptionID int FOREIGN KEY REFERENCES Options ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE IncludedOptions (
offerID int FOREIGN KEY REFERENCES Offers ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
includedOptionID int FOREIGN KEY REFERENCES Options ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE Reservations (
reservationNumber varchar(9) PRIMARY KEY,
dateOfReservation date,
advancePayment DECIMAL(7,2),
paymentMethod varchar(7) NOT NULL,
payment DECIMAL(7,2) NOT NULL,
sessionID int REFERENCES Sessions ON DELETE NO ACTION ON UPDATE NO ACTION NOT NULL,
offerID int REFERENCES Offers ON DELETE NO ACTION ON UPDATE NO ACTION NOT NULL,
groupID int REFERENCES ReservationGroups ON DELETE NO ACTION ON UPDATE NO ACTION NOT NULL,
sellerPESEL varchar(11) REFERENCES Sellers ON DELETE NO ACTION ON UPDATE NO ACTION NOT NULL
);

CREATE TABLE PurchasedOptions (
reservationNumber varchar(9) FOREIGN KEY REFERENCES Reservations ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
optionID int FOREIGN KEY REFERENCES Options ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
CHECK(reservationNumber LIKE '[0-9][0-9][0-9][0-9][/][0-9][0-9][0-9][0-9]')
);

CREATE TABLE SessionsOfOffers (
offerID int FOREIGN KEY REFERENCES Offers ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
sessionID int FOREIGN KEY REFERENCES Sessions ON DELETE NO ACTION ON UPDATE NO ACTION NOT NULL
);

CREATE TABLE ParticipantsInGroups (
groupID int FOREIGN KEY REFERENCES ReservationGroups ON DELETE NO ACTION ON UPDATE NO ACTION NOT NULL,
PESEL varchar(11) FOREIGN KEY REFERENCES Participants ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
CHECK(PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE DummyTable2 (
key21 int,
key22 int,
col21 int,
col22 int,
PRIMARY KEY(key21, key22)
);

CREATE TABLE DummyTable1 (
key11 int PRIMARY KEY,
col11 int,
key21 int,
key22 int,
FOREIGN KEY(key21, key22) REFERENCES DummyTable2(key21, key22)
);


ALTER TABLE Reservations
ADD CONSTRAINT ResCon CHECK (
reservationNumber LIKE '[0-9][0-9][0-9][0-9][/][0-9][0-9][0-9][0-9]' AND
advancePayment >= 0 AND
paymentMethod IN ('card','cash','voucher') AND
payment >=0 AND
sellerPESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
);

ALTER TABLE Offers
ADD CONSTRAINT OffCon CHECK (
basicPrice > 0 AND
discount >= 0 AND
participantsNumber > 0
);

ALTER TABLE Sellers
ADD CONSTRAINT SellCon CHECK (
PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' AND
yearsOfExperience >= 0 AND
salary >= 0 AND
clientsRate >= 1 AND
clientsRate <= 10 AND
supervisorPESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
);

ALTER TABLE Participants
ADD CONSTRAINT ParCon CHECK (
PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' AND
insuranceNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][/][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' AND
insuranceAmount > 0 AND
companyRate >= 1 AND
companyRate <= 10 AND
satisfactionRate >= 1 AND
satisfactionRate <= 10
);
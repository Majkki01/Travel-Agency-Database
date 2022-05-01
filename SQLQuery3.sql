USE TravelAgency

INSERT INTO Options (name, price, description, isAvailable)
VALUES 
('Breakfast', 200, 'buffet in the hotel restaurant, from 7 to 10', 1),
('Dinner', 250, 'buffet in the hotel restaurant, from 13 to 16', 1),
('Drink Bar', 150, 'Free, any 10 drinks per day on the beach bar', 1),
('Beach Place', 95.50, 'Reserved, private space on the beach', 1),
('Car Rental', 250, 'Rental of the chosen car for the 3 days', 1),
('AllInclusive', 500, NULL, 1),
('Swimming pool entry', 100, 'Unlimited entrance to the pool at the hotel', 1),
('SPA', 70, 'one-time treatment of a selected part of the body', 1),
('Game room entrance', 50, 'Pass to the area with gaming machines', 0),
('Bowling', 50.90, 'A single evening of games of bowling', 0),
('Kids Area', 59.90, 'A group day with animators for children', 1),
('Skis Rental', 109.50, 'Rental of the skiing equpiment for 1 week', 0);

INSERT INTO Locations (country, city, hotel, starsCount)
VALUES
('Spain', 'Barcelona', 'Paradise', 4),
('France', 'Saint Tropez', 'Heaven', 4),
('Croatia', 'Split', 'Dreamsun', 5),
('Greece', 'Athens', 'Sunnybeach', 3),
('Turkey', 'Bodrum', 'Kebab&Sun', 2),
('Spain', 'Lloret de mar', 'Paraiso', 4),
('Portugal', 'Porto', 'Elsol', 2),
('Portugal', 'Lisbon', 'Brilla', 5),
('Italy', 'Rome', 'SunnyColoseum', 4),
('Italy', 'Florence', 'MountDream', 3),
('Belgium', 'Antwerp', 'IceSkater', 5),
('Spain', 'Valencia', 'en casa de Marcin', 4),
('Croatia', 'Dubrovnik', 'LovelySun', 4),
('Germany', 'Hamburg', 'SonnigeEntspannung', 3),
('France', 'Paris', 'ParadisEnsoleille', 4);


INSERT INTO People(PESEL, firstName, secondName, surname, dateOfBirth, age, address)
VALUES
('01300411008', 'Marta', 'Paulina', 'Frackowiak', '2001-10-04', 20, 'Gdansk, Jelitkowski Dwor 3c/4'),
('09320181655', 'Marcin', NULL, 'Kuczynski', '2009-12-01', 12, 'Gdansk, Sloeczna 8'),
('54070676405', 'Zuzanna', 'Katarzyna', 'Kowalczyk', '1954-07-06', 67, 'Gdansk, Kochanowskiego 30'),
('96111325671', 'Jakub', NULL, 'Sochacki', '1996-11-13', 25, 'Warszaawa, Marszalkowska 1'),
('67021904513', 'Maciej', 'Michal', 'Swietlik', '1967-02-21', 54, 'Gdansk, Grunwaldzka 4'),
('92032484453', 'Tomasz', 'Andrzej', 'Nowak', '1992-03-24', 29, 'Gdansk, Stokrotkowa 22'),
('65100722771', 'Michal', NULL, 'Rejmak', '1965-10-07', 56, 'Gdynia, Buraczana 5'),
('97051826613', 'Wojciech', 'Kacper', 'Wierzbicki', '1997-05-18', 24, 'Gdansk, Starowiejska 60'),
('09292099651', 'Przemek', 'Robert', 'Gilewski', '2009-09-20', 12, 'Gdansk, Kreta 3'),
('19262641175', 'Grzegorz', NULL, 'Frackowiak', '2019-06-26', 2, 'Gdansk, Reymonta 44'),
('72082520035', 'Tomasz', NULL, 'Nowak', '1972-08-25', 49, 'Gdansk, Rybacka 22'),
('73113087204', 'Natalia', 'Joanna', 'Turska', '1973-11-30', 48, 'Gdansk, Tulipanowa 222'),
('80040615341', 'Joanna', NULL, 'Rejmak', '1980-04-06', 41, 'Sopot, Niepodleglosci 23'),
('02240914738', 'Jacek', 'Mariusz', 'Sokol', '2002-04-09', 19, NULL),
('15250264490', 'Juliusz', 'Patryk', 'Slowacki', '2015-05-02', 6, 'Gdynia, Jerozolimska 11'),
('77073157005', 'Patrycja', 'Lena', 'Skrzypinska', '1977-07-31', 44, 'Gdansk, Szybka 2'),
('00310576712', 'Adam', 'Piotr', 'Rejmak', '2000-11-05', 21, NULL),
('99090954845', 'Julia', 'Marta', 'Znamiec', '1999-09-09', 22, 'Gdansk, Szeroka 22/4'),
('77122025860', 'Aleksandra', 'Natalia', 'Gradowska', '1977-12-20', 44, NULL),
('66052820513', 'Michal', 'Jakub', 'Kaluzny', '1966-05-28', 55, 'Gdansk, Hallera 232/2'),
('80062729000', 'Ewa', 'Ula', 'Syrocka', '1980-06-27', 41, 'Gdansk, Ksiezycowa 1/1'),
('75050188262', 'Sara', 'Weronika', 'Gawrysiak', '1975-05-01', 46, NULL),
('10322813918', 'Szymon', NULL, 'Sadlowski', '2010-12-28', 11, 'Gdansk, Partyzantow 20e/5');

INSERT INTO Sellers (PESEL, yearsOfExperience, salary, clientsRate, position, officeNo, isEmployed, supervisorPESEL)
VALUES
('80062729000', 4, 12000, 8, 'head of department', 100, 1, NULL),
('54070676405', 2, 7100, 9, 'specialized seller', 120, 1, '77073157005'),
('72082520035', 3, 6900, 6, 'mid level seller', 121, 1, '77073157005'),
('77073157005', 5, 9800, 5, 'team manager', 221, 1, '80062729000'),
('99090954845', 7, 7700, 10, 'specialized seller', 241, 1, '92032484453'),
('75050188262', 1, 3500, 7, 'intern', 144, 1, '54070676405'),
('67021904513', 1, 3000, NULL, 'intern', 188, 1, '99090954845'),
('77122025860', 9, 6000, 3, 'senior seller', 188, 1, '80062729000'),
('80040615341', 7, 5000, 4, 'mid level seller', 120, 1, '92032484453'),
('92032484453', 6, 9700, 9, 'team manager', 222, 1, '80062729000');

INSERT INTO Participants (PESEL, insuranceNumber, insuranceAmount, companyRate, satisfactionRate)
VALUES
('01300411008', '58302247/354326783', 15000, 9, 10),
('09320181655', '19038372/300987598', 20000, 7, 9),
('96111325671', '23454594/556893939', 12000, 5, 9),
('65100722771', '63450345/437462930', 15000, 3, 6),
('97051826613', '32039570/230495967', 5000, 8, 6),
('09292099651', '38934356/149679305', 21000, 8, 8),
('19262641175', '95094909/336392067', 17000, 5, 3),
('73113087204', '68749344/003827648', 100000, 10, 10),
('02240914738', '85674335/049306493', 4100, 2, 6),
('15250264490', '56563339/768349323', 19000, 8, 3),
('00310576712', '35342200/133322921', 43000, 8, 8),
('66052820513', '89889542/276767282', 11000, 7, 7),
('10322813918', '34563344/078987677', 10000, 4, 4);

INSERT INTO ReservationGroups (groupLeaderID, groupName, adultsNumber, childrenNumber, isFamily)
VALUES
('65100722771', 'Rejmak family', 2, 1, 1),
('73113087204', 'Friends no. 1', 4, 0, 0),
('66052820513', 'Kaluzny family', 2, 0, 1),
('02240914738', 'Friends of Sokol', 3, 0, 0),
('96111325671', 'Sochacki family', 3, 2, 1),
('65100722771', 'friends of Rejmak', 1, 2, 0),
('96111325671', 'Sochacki crew', 2, 2, 0),
('00310576712', 'Family no. 1', 1, 1, 1),
('65100722771', 'Rejmak', 1, 0, 0),
('96111325671', 'Vacation squad', 3, 1, 0);

INSERT INTO Trips (name, transport, type, description, locationID)
VALUES
('Hot and Sunny Spain', 'plane', 'for rest', 'High quality hotel, sun and sea nextdoor', 1),
('Unforgetable Belgium', 'bus', 'active rest', 'Great architecture and interesting culture', 11),
('Around the mountains', 'plane', 'adventurous', 'Long and breathtaking walks through the Alpes', 10),
('Family rest and fun', 'plane', 'for rest', 'Mix of quiet relax and animations for children', 2),
('Capitals monuments', 'bus', 'sighseeing', 'Know the most interesting monuments of Berlin', 14),
('Restful Croatia', 'plane', 'for rest', 'Great weather, rest and delighting culture', 3),
('Antient Rome', 'bus', 'sighseeing', 'See the most popular monuments of the antient Rome', 9),
('Crazy France', 'plane', 'for rest', 'Many clubs and young people to get to know', 2),
('Peacefull Croatia', 'plane', 'for rest', 'Beautiful beaches and quiet place', 13),
('Estern vibes', 'bus', 'sighseeing', 'Get to know Turkish culture and its views', 5);

INSERT INTO Sessions (firstDay, lastDay, tripID)
VALUES
('2020-07-14 12:53:00','2020-07-21 14:23:00',1),
('2019-03-14 01:11:00','2019-03-24 11:13:00',2),
('2021-02-20 21:23:00','2021-02-25 22:41:00',3),
('2018-07-01 15:53:00','2018-07-14 16:11:00',4),
('2020-04-22 12:13:00','2020-04-28 01:22:00',5),
('2021-07-15 17:15:00','2021-07-22 18:57:00',5),
('2019-07-11 14:01:00','2019-07-15 15:02:00',6),
('2022-08-18 11:53:00','2022-08-21 19:23:00',6),
('2022-08-08 21:11:00','2022-08-22 22:39:00',1),
('2022-10-29 23:53:00','2022-11-07 01:19:00',7),
('2020-09-22 14:56:00','2020-09-29 13:22:00',8),
('2019-08-25 11:59:00','2019-08-31 17:44:00',9);

INSERT INTO Offers (basicPrice, discount, participantsNumber, isLastMinute, isAvailable, tripID)
VALUES
(8000, NULL, 3, 0, 1, 1),
(12000, NULL, 4, 1, 1, 2),
(10000, 1000, 4, 0, 1, 2),
(5000, NULL, 3, 0, 1, 3),
(7000, NULL, 5, 0, 1, 4),
(15000, 500, 3, 1, 1, 5),
(12100, 100, 4, 0, 1, 5),
(4000, NULL, 3, 0, 1, 1),
(9500, 500, 4, 1, 1, 6),
(7450, NULL, 4, 0, 0, 6),
(7500, NULL, 3, 0, 1, 7),
(17000, 2000, 5, 1, 1, 5),
(9000, NULL, 2, 0, 0, 2),
(2500, NULL, 2, 1, 1, 9),
(1500, NULL, 1, 0, 1, 8);

INSERT INTO OfferedOptions (offerID, offeredOptionID)
VALUES
(1,6), (4,6), (6,3), (9,3), (1,1), (4,1), (1,2), (6,2), (2,5), (4,5), (2,8), (6,8), (9,10), (10,10), (8,4),
(9,9), (4,5), (2,11), (10,2), (4,7), (8,8), (8,6), (3,12), (5,11), (7,3), (5,3), (4,9), (7,9), (3,5), (6,9);

INSERT INTO IncludedOptions (offerID, includedOptionID)
VALUES
(1,2), (4,2), (6,1), (9,1), (9,6), (7,7), (4,4), (9,5), (4,8), (2,7), (3,5), (5,8), (9,4), (8,8), (10,5);

INSERT INTO Reservations (reservationNumber, dateOfReservation, advancePayment, paymentMethod, payment, sessionID, offerID, groupID, sellerPESEL)
VALUES
('0001/0420', '2020-04-04', 500, 'card', 8000, 1, 1, 4, '54070676405'),
('0001/0119', '2019-01-14', 2000, 'cash', 12000, 2, 2, 2, '99090954845'),
('0001/0221', '2021-02-10', 700, 'card', 5000, 3, 4, 1, '99090954845'),
('0001/0618', '2018-06-20', NULL, 'voucher', 7000, 4, 5, 5, '54070676405'),
('0002/0420', '2020-04-10', 700, 'card', 14500, 5, 6, 6, '99090954845'),
('0001/1221', '2021-12-21', 1000, 'card', 1000, 8, 9, 7, '72082520035'),
('0002/1221', '2021-12-06', 500, 'cash', 500, 10, 11, 4, '72082520035'),
('0001/0819', '2019-08-10', 250, 'cash', 2500, 12, 14, 3, '54070676405'),
('0001/0920', '2020-09-01', 100, 'card', 1500, 11, 15, 9, '80040615341'),
('0001/0721', '2021-07-01', NULL, 'voucher', 14500, 6, 6, 6, '77122025860');


INSERT INTO PurchasedOptions (reservationNumber, optionID)
VALUES
('0001/0420',6), ('0001/0119',5), ('0001/0119',11), ('0001/0618',11), ('0001/0618',3), ('0001/1221',9), ('0001/0721',3), ('0001/0721',2), ('0001/0721',8), ('0001/1221',10);

INSERT INTO SessionsOfOffers (offerID, sessionID)
VALUES
(1,1), (1,9), (2,2), (3,2), (4,3), (5,4), (6,5), (9,7), (9,8), (11,10), (14,12), (15,11), (6,6), (7,5), (7,6), (8,1), (8,9), (10,7), (10,8), (12,5), (12,6), (13,2);

INSERT INTO ParticipantsInGroups (groupID, PESEL)
VALUES
(1,'65100722771'), (1,'01300411008'), (1,'09320181655'), (2,'66052820513'), (2,'73113087204'), (2,'97051826613'), (2,'96111325671'), (3,'66052820513'),
(3,'02240914738'), (4,'02240914738'), (4,'01300411008'), (4,'00310576712'), (5,'96111325671'), (5,'73113087204'), (5,'01300411008'), (5,'15250264490'),
(5,'09320181655'), (6,'65100722771'), (6,'19262641175'), (6,'15250264490'), (7,'96111325671'), (7,'01300411008'), (7,'09292099651'), (7,'19262641175'), 
(8,'01300411008'), (8,'10322813918'), (9,'65100722771'), (10,'00310576712'), (10,'02240914738'), (10,'97051826613'), (10,'09320181655');

INSERT INTO DummyTable2
VALUES
(1,2,1,2), (3,4,3,4);

INSERT INTO DummyTable1
VALUES
(1,3,1,2),(2,4,3,4);
CREATE TABLE `person` (
  `personID` INT,
  `name` varchar(100),
  `email` varchar(100),
  `phoneNumber` varchar(20),
  `personType` varchar(20),
  PRIMARY KEY (`personID`),
  UNIQUE INDEX `personID_UNIQUE` (`personID` ASC));
  
  CREATE TABLE `staff` (
  `personID` INT,
  `department` varchar(100),
  `IsAdmin` Boolean,
  `position` varchar(100),
  FOREIGN KEY `staff_personID` (`personID`) REFERENCES person(personID));

CREATE TABLE `student` (
  `personID` INT,
  `department` varchar(100),
  `gradYear` int,
  `birthDate` DATE,
  FOREIGN KEY `student_personID` (`personID`) REFERENCES person(personID));

CREATE TABLE `faculty` (
  `personID` INT,
  `department` varchar(100),
  `fulltime` Boolean,
  FOREIGN KEY `faculty_personID` (`personID`) REFERENCES person(personID));
  
  CREATE TABLE `locations` (
  `locationID` INT,
  `locationName` varchar(100),
  `locationAddress` varchar(255),
  PRIMARY KEY (`locationID`),
  UNIQUE INDEX `locationID_UNIQUE` (`locationID` ASC));

CREATE TABLE `carts` (
  `cartID` INT,
  `make` varchar(100),
  `model` varchar(100),
  `numOfSeats` int,
  `available` Boolean,
  PRIMARY KEY (`cartID`),
  UNIQUE INDEX `cartID_UNIQUE` (`cartID` ASC));
  
CREATE TABLE `ratings` (
  `ratingID` INT,
  `rating` INT,
  `comment` VARCHAR(300),
  `ratingDate` DATE,
  PRIMARY KEY (`ratingID`),
  UNIQUE INDEX `ratingID_UNIQUE` (`ratingID` ASC));
  
  CREATE TABLE `drivers` (
  `driverID` INT,
  `personID` INT,
  `status` VARCHAR(20),
  PRIMARY KEY (`driverID`),
  FOREIGN KEY `drivers_personID` (`personID`) REFERENCES person(personID),
  UNIQUE INDEX `driverID_UNIQUE` (`driverID` ASC));
  
  CREATE TABLE `accounts` (
  `accountID` INT,
  `personID` INT,
  `balance` Double,
  PRIMARY KEY (`accountID`),
  FOREIGN KEY `accounts_personID` (`personID`) REFERENCES person(personID),
  UNIQUE INDEX `accountID_UNIQUE` (`accountID` ASC));
  
  CREATE TABLE `payments` (
  `paymentID` INT,
  `accountID` INT,
  `paymentDate` Date,
  `paymentAmount` Double,
  PRIMARY KEY (`paymentID`),
  FOREIGN KEY `payments_accountID` (`accountID`) REFERENCES accounts(accountID),
  UNIQUE INDEX `paymentID_UNIQUE` (`paymentID` ASC));
  
  CREATE TABLE `rides` (
  `rideID` INT,
  `startDateTime` DATETIME,
  `endDateTime` DATETIME,
  `startLocation` INT,
  `endLocation` INT,
  `paymentID` INT,
  `ratingID` INT,
  `passenger1` INT,
  `passenger2` INT,
  `driverID` INT,
  `cartID` INT,
  PRIMARY KEY (`rideID`),
  FOREIGN KEY `rides_startLocation` (`startLocation`) REFERENCES locations(locationID),
  FOREIGN KEY `rides_endLocation` (`endLocation`) REFERENCES locations(locationID),
  FOREIGN KEY `rides_paymentID` (`paymentID`) REFERENCES payments(paymentID),
  FOREIGN KEY `rides_ratingID` (`ratingID`) REFERENCES ratings(ratingID),
  FOREIGN KEY `rides_passenger1` (`passenger1`) REFERENCES person(personID),
  FOREIGN KEY `rides_passenger2` (`passenger2`) REFERENCES person(personID),
  FOREIGN KEY `rides_driverID` (`driverID`) REFERENCES drivers(driverID),
  FOREIGN KEY `rides_cartID` (`cartID`) REFERENCES carts(cartID),
  UNIQUE INDEX `rideID_UNIQUE` (`rideID` ASC));

INSERT INTO `person` 
VALUES (1, 'Quinn Knox', 'arcu@euultrices.org', '(208) 885-2203', 'staff'),
(2, 'Ella Buckner', 'nascetur@ametorciUt.net', '(950) 115-1635', 'staff'),
(3, 'Ali Daniels', 'ante@PraesentluctusCurabitur.com', '(208) 567-7096', 'staff'),
(4, 'Yuli Lowe', 'dui.Suspendisse.ac@nisiMauris.net', '(546) 406-2031', 'staff'),
(5, 'Garrett Glass', 'dui.semper.et@nisi.co.uk', '(311) 828-0153', 'staff'),
(6, 'Stella Gregory', 'a@In.ca', '(945) 579-2852', 'staff'),
(7, 'Jolie Ortega', 'nibh@ullamcorper.co.uk', '(122) 592-9592', 'staff'),
(8, 'Yvette Stout', 'enim.nec@fringilla.edu', '(413) 679-4641', 'staff'),
(9, 'Drew Vang', 'ac.mi@mi.net', '(512) 627-3071', 'staff'),
(10, 'Reuben Mckenzie', 'convallis@accumsaninterdum.net', '(164) 454-2683', 'staff'),
(11, 'Denton Clay', 'quis@massa.co.uk', '(311) 215-5474', 'student'),
(12, 'Laurel Hays', 'nunc.id@ornarefacilisis.net', '(759) 297-6914', 'student'),
(13, 'Kai Walker', 'Cras@fermentummetus.com', '(257) 546-6945', 'student'),
(14, 'Erasmus Frank', 'libero.et@MorbivehiculaPellentesque.co.uk', '(614) 228-5330', 'student'),
(15, 'Kessie Holman', 'laoreet@CrasinterdumNunc.net', '(449) 697-7979', 'student'),
(16, 'Linus May', 'nibh.sit.amet@nasceturridiculusmus.edu', '(598) 442-0395', 'student'),
(17, 'Alexandra Banks', 'at@adipiscingelitEtiam.ca', '(767) 164-1082', 'student'),
(18, 'Buckminster Hines', 'semper.erat.in@pharetrasedhendrerit.co.uk', '(809) 380-3706', 'student'),
(19, 'Vera Lester', 'neque.et@molestiedapibus.org', '(858) 242-4995', 'student'),
(20, 'Tucker Harmon', 'auctor.velit@at.co.uk', '(256) 415-5911', 'student'),
(21, 'Octavia Weber', 'dui.Cum.sociis@Morbimetus.net', '(648) 917-4963', 'faculty'),
(22, 'Samuel Noel', 'est.Nunc.laoreet@ornaretortor.co.uk', '(352) 269-0890', 'faculty'),
(23, 'Raymond Langley', 'natoque.penatibus.et@loremauctorquis.edu', '(301) 756-9041', 'faculty'),
(24, 'Mikayla Farrell', 'tempus.eu.ligula@pede.net', '(257) 150-1324', 'faculty'),
(25, 'Gary Dickson', 'at@pedemalesuada.co.uk', '(780) 931-1489', 'faculty'),
(26, 'Shaeleigh Kirk', 'quis.tristique@accumsanlaoreet.com', '(495) 350-5199', 'faculty'),
(27, 'Barclay Mcmillan', 'id.ante@ipsumCurabitur.edu', '(366) 822-7024', 'faculty'),
(28, 'Hammett Hawkins', 'eget@vitaesodalesnisi.edu', '(142) 499-5752', 'faculty'),
(29, 'Yen Gibbs', 'id.libero@Sedmalesuadaaugue.co.uk', '(754) 889-4121', 'faculty'),
(30, 'Penelope Mejia', 'tempus@arcuVestibulum.net', '(416) 537-8484', 'faculty');

INSERT INTO `staff` 
VALUES (1, 'Accounting', true, 'Supervisor'),
(2, 'Research and Development', false, 'Driver'),
(3, 'Finances', true, 'Supervisor'),
(4, 'Sales and Marketing', false, 'Manager'),
(5, 'Public Relations', true,'Supervisor'),
(6, 'Quality Assurance', false, 'Driver'),
(7, 'Customer Relations', true, 'Front Desk'),
(8, 'Human Resources', false, 'Manager'),
(9, 'Customer Service', false, 'Driver'),
(10, 'Asset Management', false, 'Driver');

INSERT INTO `student`
VALUES (11, 'Accounting', 2020, '2003-12-08'),
(12, 'Media Relations', 2018, '1997-11-15'),
(13, 'Legal Department', 2019, '1999-04-05'),
(14, 'Quality Assurance', 2021, '2001-07-13'),
(15, 'Human Resources', 2022, '1998-09-26'),
(16, 'Sales and Marketing', 2018, '2004-03-15'),
(17, 'Media Relations', 2014, '2002-11-21'),
(18, 'Advertising', 2014, '1997-04-01'),
(19, 'Legal Department', 2020, '1995-03-27'),
(20, 'Advertising', 2014, '1998-10-30');

INSERT INTO `faculty`
VALUES (21, 'Media Relations', false),
(22, 'Human Resources', true),
(23, 'Legal Department', false),
(24, 'Sales and Marketing', false),
(25, 'Customer Service', true),
(26, 'Legal Department', false),
(27, 'Asset Management', false),
(28, 'Legal Department', false),
(29, 'Sales and Marketing', true),
(30, 'Payroll',1);

INSERT INTO `locations` 
VALUES (1, 'Friday', '322 Mary Alexander Dr.'),
(2, 'Duke', '983 Queen Katrina Rd.'),
(3, 'Portal', '763 Alexander Junior Dr.'),
(4, 'Epic', '503 Epic Center Dr.'),
(5, 'CHHS', '805 Mr. Thoms Dr.'),
(6, 'Soccer Stadium', '1981 Soccer St.'),
(7, 'Denny', '983 Denny Rd.'),
(8, 'Smith', '5580 Mr. Smith Dr.'),
(9, 'Cone', '695 Martin Sq.'),
(10, 'Belk', '829 Box St.');

INSERT INTO `carts` 
VALUES (1, 'Porsche', 'one-seater', 1, true),
(2, 'Mercedes-Benz', 'one-seater', 1, true),
(3, 'Ferrari', 'one-seater', 1, true),
(4, 'Chevrolet', 'one-seater', 1, false),
(5, 'Porsche', 'two-seater', 2, true),
(6, 'Mercedes-Benz', 'two-seater', 2, true),
(7, 'Ferrari', 'two-seater', 2, true),
(8, 'Chevrolet', 'two-seater', 2, false);

insert into `ratings`
values (1, 1, 'Driver was rude and drove at an unsafe speed', current_date()),
(2, 5, '', current_date()),
(3, 2, 'Driver was 15 mins late and we could not finish the whole round', current_date()),
(4, 3, 'Driver smelled bad', current_date()),
(5, 5, 'Amazing driver and knowladgeable about the course', current_date()),
(6, 4, 'Good driver butwas 5 mins late', current_date()),
(7, 3, 'Driver was ok', current_date());

insert into `drivers`
values (1, 1, 'active'),
(2, 2, 'active'),
(3, 3, 'active'),
(4, 4, 'active'),
(5, 5, 'active'),
(6, 6, 'active'),
(7, 7, 'active'),
(8, 8, 'inactive');

INSERT INTO `accounts` 
VALUES (1, 11, 98.34),
(2, 12, 80.00),
(3, 13, 154.30),
(4, 14, 256.81),
(5, 15, 11.25),
(6, 16, 249.35),
(7, 17, 141.03),
(8, 18, 60.84),
(9, 19, 5.08),
(10, 20, 98.54);

INSERT INTO `payments` 
VALUES (1, 1, '2019-12-01', 42.02),
(2, 2, '2019-09-20', 30.84),
(3, 3, '2019-07-17', 73.45),
(4, 4, '2018-11-13', 63.95),
(5, 5, '2018-06-11', 39.42),
(6, 6, '2019-11-12', 44.81),
(7, 7, '2019-01-04', 40.34),
(8, 8, '2020-02-28', 50.11),
(9, 9, '2018-04-30', 21.56),
(10, 9, '2018-08-24', 59.25);

INSERT INTO `rides` 
VALUES (1, '2019-02-13 12:23:22', '2019-12-01 02:19:13', 1, 2, 1, 1, 11, null, 1, 1),
(2, '2018-12-11 09:28:45', '2019-09-20 06:54:59', 2, 3, 2, 2, 12, null, 2, 2),
(3, '2018-07-03 21:52:08', '2019-07-17 07:13:19', 3, 4, 3, null, 13, null, 2, 3),
(4, '2018-11-01 06:51:20', '2018-11-13 14:53:35', 4, 5, 4, 3, 14, 11, 3, 4),
(5, '2018-10-23 08:28:08', '2018-06-11 16:00:49', 5, 6, 5, 4, 15, 16, 4, 5),
(6, '2020-01-05 16:55:44', '2019-11-12 08:34:01', 6, 7, 6, 5, 16, 18, 5, 6),
(7, '2020-03-03 18:46:26', '2019-01-04 10:55:13', 7, 8, 7, 6, 17, null, 6, 7),
(8, '2020-03-31 02:50:37', '2020-02-28 20:00:43', 8, 9, 8, null, 18, 11, 7, 8),
(9, '2018-09-22 21:34:55', '2018-04-30 17:59:37', 9, 10, 9, 7, 19, 13, 8, 3),
(10, '2018-07-10 15:21:34', '2018-08-24 18:12:53', 10, 1, 10, null, 20, 19, 8, 4);

commit;
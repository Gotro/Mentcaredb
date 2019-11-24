CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `userFirstName` varchar(255) NOT NULL,
  `userLastName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `loginName` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`)
);

CREATE TABLE `doctor` (
  `userID` int(11) NOT NULL,
  `doctorID` int(11) NOT NULL,
  PRIMARY KEY (`doctorID`),
  KEY `doctor_fk` (`userID`),
  CONSTRAINT `doctor_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

CREATE TABLE `receptionist` (
  `userID` int(11) NOT NULL,
  `receptionistID` int(11) NOT NULL,
  PRIMARY KEY (`receptionistID`),
  KEY `receptionist_fk` (`userID`),
  CONSTRAINT `receptionist_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

CREATE TABLE `patient` (
  `userID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `medications` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  PRIMARY KEY (`patientID`),
  KEY `patient_fk` (`userID`),
  CONSTRAINT `patient_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
);

CREATE TABLE `appointments` (
  `appointmentID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `doctorID` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`appointmentID`),
  KEY `appointments_fk` (`doctorID`),
  KEY `appointments_fk_1` (`patientID`),
  CONSTRAINT `appointments_fk` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`),
  CONSTRAINT `appointments_fk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`)
);

CREATE TABLE `appointmentnotes` (
  `appointmentID` int(11) NOT NULL,
  `attendanceStatus` varchar(255) NOT NULL,
  `situation` varchar(255) NOT NULL,
  `costs` double NOT NULL,
  `appointmentNotes` varchar(255) NOT NULL,
  KEY `appointmentnotes_fk` (`appointmentID`),
  CONSTRAINT `appointmentnotes_fk` FOREIGN KEY (`appointmentID`) REFERENCES `appointments` (`appointmentID`)
);

CREATE TABLE `medication` (
  `medicationID` int(11) NOT NULL,
  `medication` varchar(255) DEFAULT NULL,
  `averageDose` varchar(255) DEFAULT NULL,
  `use` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`medicationID`)
);

CREATE TABLE `perscriptions` (
  `medicationID` int(11) NOT NULL,
  `appointmentID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `doctorID` int(11) NOT NULL,
  `date` date NOT NULL,
  `dose` varchar(255) NOT NULL,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  KEY `perscriptions_fk` (`doctorID`),
  KEY `perscriptions_fk_1` (`patientID`),
  KEY `perscriptions_fk_2` (`medicationID`),
  CONSTRAINT `perscriptions_fk` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`),
  CONSTRAINT `perscriptions_fk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  CONSTRAINT `perscriptions_fk_2` FOREIGN KEY (`medicationID`) REFERENCES `medication` (`medicationID`)
);


CREATE TABLE `inventory` (
  `inventoryID` int(11) NOT NULL,
  `medication` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `medicationID` int(11) DEFAULT NULL,
  `medicationcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`inventoryID`),
  KEY `inventory_fk` (`medicationID`),
  CONSTRAINT `inventory_fk` FOREIGN KEY (`medicationID`) REFERENCES `medication` (`medicationID`)
);




insert into users(userID, `userFirstName`,`userLastName`, password, `role`, `loginName`, address, `phoneNumber`)
values (0001, 'Bob', 'Dale', 'abc123', 'patient', 'bobdale', 'abc123 street', '1231231234');



insert into users(userID, `userFirstName`,`userLastName`, password, `role`, `loginName`, address, `phoneNumber`)
values (0002, 'Rick', 'Grimes', 'password', 'patient', 'rickgrimes', '1234 mlk street', '1111111111');

insert into users(userID, `userFirstName`,`userLastName`, password, `role`, `loginName`, address, `phoneNumber`)
values (0003, 'Xue', 'Zhang', 'iamdoctor', 'doctor', 'xuezhang', '4444 snowhill rd.', '1888777');

insert into users(userID, `userFirstName`,`userLastName`, password, `role`, `loginName`, address, `phoneNumber`)
values (0004, 'Matt', 'Kelly', 'ilikeapples', 'doctor', 'mattkelly', '3333 hunter rd.', '1667777');

insert into users(userID, `userFirstName`,`userLastName`, password, `role`, `loginName`, address, `phoneNumber`)
values (0005, 'Sally', 'Lee', 'iplaysports', 'manager', 'sallylee', '2222 lee rd.', '2879999');

insert into users(userID, `userFirstName`,`userLastName`, password, `role`, `loginName`, address, `phoneNumber`)
values (0006, 'kaitlin', 'roberts', 'iworkhere', 'receptionist', 'kaitlinroberts', '1111 lee rd.', '5556666');

insert into users(userID, `userFirstName`,`userLastName`, password, `role`, `loginName`, address, `phoneNumber`)
values (0007, 'lucy', 'lu', 'iamsick', 'patient', 'lucylu', '8888 lu rd.', '2223333');


insert into doctor(userID, `doctorID`)
values (0003, 0001);


insert into doctor(userID, `doctorID`)
values (0004, 0002);

insert into receptionist(userID, `receptionistID`)
values (0006, 0001);

insert into patient(userID, `patientID`,height, weight, status, medications, gender)
values (0001, 0001, 72, 150, 'stable', 'no medications','male');

insert into patient(userID, `patientID`,height, weight, status, medications, gender)
values (0002, 0002, 64, 160, 'at risk', 'Fluoxetine','male' );

insert into patient(userID, `patientID`,height, weight, status, medications, gender)
values (0007, 0003, 55, 110, 'admitted', 'Citalopram and Sertraline','female' );

insert into appointments(appointmentID, `patientID`,`doctorID`, `date`, `time`)
values (0001, 0001, 0001, '20191115', '08:30:00' );

insert into appointments(appointmentID, `patientID`,`doctorID`, `date`, `time`)
values (0002, 0002, 0001, '20191115', '10:30:00' );

insert into appointments(appointmentID, `patientID`,`doctorID`, `date`, `time`)
values (0003, 0003, 0001, '20191115', '12:30:00' );

insert into appointments(appointmentID, `patientID`,`doctorID`, `date`, `time`)
values (0004, 0003, 0001, '20191116', '10:30:00' );

insert into appointments(appointmentID, `patientID`,`doctorID`, `date`, `time`)
values (0005, 0002, 0002, '20191116', '08:30:00' );

insert into appointments(appointmentID, `patientID`,`doctorID`, `date`, `time`)
values (0006, 0001, 0002, '20191117', '08:30:00' );

insert into appointmentnotes(appointmentID, `attendanceStatus`,situation, costs, `appointmentNotes`)
values (0001, 'on time', 'Check up on how he is doing off meds', '100', 'Seems to be doing better but needs to keep checking in');

insert into appointmentnotes(appointmentID, `attendanceStatus`,situation, costs, `appointmentNotes`)
values (0002, 'on time', 'Check up on how his medication is working', '100', 'Not feeling well, will check in again tomorrow');

insert into appointmentnotes(appointmentID, `attendanceStatus`,situation, costs, `appointmentNotes`)
values (0003, 'late by 15 minutes', 'Having suicidal thoughts', '200', 'needs to be admitted, more medications to be added');

insert into appointmentnotes(appointmentID, `attendanceStatus`,situation, costs, `appointmentNotes`)
values (0004, 'on time', 'Check up on medication effects', '200', 'Medications are doing well, needs to stay admitted');

insert into appointmentnotes(appointmentID, `attendanceStatus`,situation, costs, `appointmentNotes`)
values (0005, 'on time', 'Check up on medication effects', '100', 'Medications are doing well');

insert into appointmentnotes(appointmentID, `attendanceStatus`,situation, costs, `appointmentNotes`)
values (0006, 'on time', 'Check up on getting off medications', '100', 'doing well, can remain off medications');

insert into medication(medicationID, medication, `averageDose`, `use`)
values (0001, 'Fluoxetine 100mg', 'twice per day', 'depression, obsessive-compulsive disorder, some eating disorders, and panic attacks');

insert into medication(medicationID, medication, `averageDose`, `use`)
values (0002, 'Fluoxetine 200mg', 'twice per day', 'depression, obsessive-compulsive disorder, some eating disorders, and panic attacks');

insert into medication(medicationID, medication, `averageDose`, `use`)
values (0003, 'Citalopram 100mg', 'twice per day', 'depression');

insert into medication(medicationID, medication, `averageDose`, `use`)
values (0004, 'Citalopram 200mg', 'twice per day', 'depression');


insert into medication(medicationID, medication, `averageDose`, `use`)
values (0005, 'Sertraline 100mg', 'twice per day', 'depression, obsessive-compulsive disorder , panic attacks, posttraumatic stress disorder, and social anxiety disorder');


insert into medication(medicationID, medication, `averageDose`, `use`)
values (0006, 'Sertraline 200mg', 'twice per day', 'depression, obsessive-compulsive disorder , panic attacks, posttraumatic stress disorder, and social anxiety disorder');


insert into inventory(inventoryID, medication, `date`, `medicationID`, medicationcount)
values (0001, 'Fluoxetine', '20191115', 0001, 200);

insert into inventory(inventoryID, medication, `date`, `medicationID`, medicationcount)
values (0002, 'Fluoxetine', '20191117', 0001, 180);

insert into inventory(inventoryID, medication, `date`, `medicationID`, medicationcount)
values (0003, 'Fluoxetine', '20191115', 0002, 250);



insert into inventory(inventoryID, medication, `date`, `medicationID`, medicationcount)
values (0004, 'Fluoxetine', '20191117', 0002, 280);

insert into inventory(inventoryID, medication, `date`, `medicationID`, medicationcount)
values (0005, 'Citalopram', '20191115', 0003, 100);

insert into inventory(inventoryID, medication, `date`, `medicationID`, medicationcount)
values (0006, 'Citalopram', '20191117', 0003, 95);

insert into inventory(inventoryID, medication, `date`, `medicationID`, medicationcount)
values (0007, 'Citalopram', '20191115', 0004, 100);



insert into inventory(inventoryID, medication, `date`, `medicationID`, medicationcount)
values (0008, 'Sertraline', '20191115', 0005, 100);

insert into inventory(inventoryID, medication, `date`, `medicationID`, medicationcount)
values (0009, 'Sertraline', '20191117', 0005, 90);



insert into perscriptions(medicationID, `appointmentID`, `patientID`, `doctorID`, `date`, dose, datestart, dateend)
values (0001, 0002,0002, 0001 , '20191115','two per day', '20191115', '20191215');

insert into perscriptions(medicationID, `appointmentID`, `patientID`, `doctorID`, `date`, dose, datestart, dateend)
values (0003, 0003,0003, 0001 , '20191115','two per day', '20191115', '20191215');




















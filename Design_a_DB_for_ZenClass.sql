DATABASE FOR GUVI ZEN CLASS

CREATE DATABASE guvi_zen;

use guvi_zen;

----------------------------------------------------------

studentInfo:

CREATE TABLE `studentInfo` (
    `studentId` INT PRIMARY KEY AUTOINCREMENT,
    `studentName` VARCHAR(255) NOT NULL, 
    `mobileNumber` VARCHAR(255) UNIQUE,
    `email` VARCHAR(255) UNIQUE,
    `mentorName` VARCHAR(255),
    `batchId` INT,
    `batchName` VARCHAR(255)    
);

----------------------------------------------------------

taskInfo:

CREATE TABLE `taskInfo` (
    `taskId` INT PRIMARY KEY AUTO_INCREMENT,
    `taskName` VARCHAR(255) NOT NULL,
    `taskDescription` TEXT,
    `studentId` INT,
    `mentorId` INT,
    `batchName` VARCHAR(255)
);

----------------------------------------------------------

mentorInfo:

CREATE TABLE `mentorInfo` (
    `mentorId` INT PRIMARY KEY AUTO_INCREMENT,
    `mentorName` VARCHAR(255) NOT NULL,
    `contactInfo` VARCHAR(255) UNIQUE,
);

----------------------------------------------------------

queryInfo:

CREATE TABLE `queryInfo` (
    `queryId` INT PRIMARY KEY AUTO_INCREMENT,
    `queryText` TEXT,
    `studentId` INT,
    `mentorId` INT,
);

----------------------------------------------------------

dashboardInfo:

CREATE TABLE `dashboardInfo`(
    `batchId` INT PRIMARY KEY,
    `batchName` VARCHAR(255),
    `totalStudents` INT,
    `completedTasks` INT,
    `pendingTasks` INT,
);

----------------------------------------------------------

mockinterviewInfo:

CREATE TABLE `mockinterviewInfo` (
    `mockInterviewId` INT PRIMARY KEY AUTO_INCREMENT,
    `studentId` INT,
    `mentorId` INT,
    `interviewerName` VARCHAR(255),
    `interviewDate` DATE,
);


ALTER TABLE `studentinfo` ADD FOREIGN KEY (`batchid`) REFERENCES `batchinfo` (`batchid`);

ALTER TABLE `taskinfo` ADD FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`);

ALTER TABLE `taskinfo` ADD FOREIGN KEY (`mentorid`) REFERENCES `mentorinfo` (`mentorid`);

ALTER TABLE `batchinfo` ADD FOREIGN KEY (`mentorid`) REFERENCES `mentorinfo` (`mentorid`);

ALTER TABLE `queryinfo` ADD FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`);

ALTER TABLE `queryinfo` ADD FOREIGN KEY (`mentorid`) REFERENCES `mentorinfo` (`mentorid`);

ALTER TABLE `dashboardinfo` ADD FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`);

ALTER TABLE `dashboardinfo` ADD FOREIGN KEY (`mentorid`) REFERENCES `mentorinfo` (`mentorid`);

ALTER TABLE `dashboardinfo` ADD FOREIGN KEY (`batchid`) REFERENCES `batchinfo` (`batchid`);

ALTER TABLE `mockinterviewinfo` ADD FOREIGN KEY (`studentid`) REFERENCES `studentinfo` (`studentid`);

ALTER TABLE `mockinterviewinfo` ADD FOREIGN KEY (`mentorid`) REFERENCES `mentorinfo` (`mentorid`);

ALTER TABLE `mockinterviewinfo` ADD FOREIGN KEY (`batchid`) REFERENCES `batchinfo` (`batchid`);
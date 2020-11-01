CREATE DATABASE Testing_System;
USE Testing_System;
CREATE TABLE Department  (
	DepartmentID			INT,
	DepartmentName			VARCHAR(50)
);
CREATE TABLE Position (
	PositionID				INT,
	PositionName			VARCHAR(50)
);
CREATE TABLE  `account`(
	AccountID				INT,
    Email					VARCHAR(50),
    Username				VARCHAR(50),
    DepartmentID			INT,
    PositionID				INT,
    CreateDate				DATE
    );
CREATE TABLE `Group` (
	GroupID					INT,
    GroupName				VARCHAR(50),
    CreatorID				INT,
    CreateDate				DATE
    );
CREATE TABLE `GroupAccount` (
	GroupID					INT,
    AccountID				INT,
    JoinDate 				DATE
    );
CREATE TABLE TypeQuestion (
	TypeID					INT
    );
    



    
    



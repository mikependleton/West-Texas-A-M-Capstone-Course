#Group 3
#Mike Pendleton
#Do H. Lee
#Ozer Micoogullari

#CIDM 6350-70 Project

drop database if exists UtilityCompany;

CREATE database if not exists UtilityCompany;
USE UtilityCompany;

 CREATE TABLE Contract (
    Number int,
    Customer_ID int,
    Customer_Number int,
    Premise_Number int,
    Rate decimal(19,2),
    Activation_Date Date,
    PRIMARY KEY (Number)
 );

  CREATE TABLE Payment (
	ID int auto_increment,
    Customer_ID int,
    Customer_Number int,
    Bill_ID int,
    Bill_Number int,
    Payment_Date date,
    Payment_Amount decimal(19,2),
    PRIMARY KEY (ID)
 );
 
  CREATE TABLE Premise (
	Number int Auto_increment,
    Meter_ID int,
    Meter_Number int,
    Contract_Number int,
    Address text,
    PRIMARY KEY (Number)
 );
 
  CREATE TABLE Customer (
	ID int auto_increment,
	Number int,
    Premise_Number int,
    Contract_Number int,
    First_Name text,
	Last_Name text,
    PRIMARY KEY (ID, Number)
 );
 
  CREATE TABLE Bill (
    ID int auto_increment,
	Number int,
    Premise_Number int,
    Customer_ID int,
    Customer_Number int,
    Contract_Rate decimal(19,2),
    Meter_ID int,
    Meter_Number int,
    Payment_Number int,
	Bill_Date date,
    Consumption int,
    Bill_Amount decimal(19,2),
    Balance decimal(19,2),
    PRIMARY KEY (ID, Number)
 );
 
  CREATE TABLE Meter (
	ID int auto_increment,
    Premise_Number int,
	Number int,
    Prev_Reader_Number int,
    Prev_Reading_Date date,
    Prev_Reading int,
    Cur_Reader_Number int,
    Cur_Reading int,
    Cur_Reading_Date date,
    Notes text,
    PRIMARY KEY (ID, Number)
 );
 
  CREATE TABLE Reader (
	Number int Auto_increment,
    First_Name text,
    Last_Name text,
    PRIMARY KEY (Number)
 );

ALTER TABLE Contract
ADD FOREIGN KEY (Premise_Number) REFERENCES Premise (Number),
ADD FOREIGN KEY (Customer_ID, Customer_Number) REFERENCES Customer (ID, Number);

ALTER TABLE Payment
ADD FOREIGN KEY (Customer_ID, Customer_Number) REFERENCES Customer (ID, Number),
ADD FOREIGN KEY (Bill_ID, Bill_Number) REFERENCES Bill (ID, Number);

ALTER TABLE Premise
ADD FOREIGN KEY (Contract_Number) REFERENCES Contract (Number),
ADD FOREIGN KEY (Meter_ID, Meter_Number) REFERENCES Meter (ID, Number);

ALTER TABLE Customer
ADD FOREIGN KEY (Contract_Number) REFERENCES Contract (Number),
ADD FOREIGN KEY (Premise_Number) REFERENCES Premise (Number);

ALTER TABLE Bill
ADD FOREIGN KEY (Premise_Number) REFERENCES Premise (Number),
ADD FOREIGN KEY (Customer_ID, Customer_Number) REFERENCES Customer (ID, Number),
ADD FOREIGN KEY (Meter_ID, Meter_Number) REFERENCES Meter (ID, Number),
ADD FOREIGN KEY (Payment_Number) REFERENCES Payment (ID);


ALTER TABLE Meter
ADD FOREIGN KEY (Cur_Reader_Number) REFERENCES Reader (Number),
ADD FOREIGN KEY (Prev_Reader_Number) REFERENCES Reader (Number),
ADD FOREIGN KEY (Premise_Number) REFERENCES Premise (Number);

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- Add the Premise data

INSERT INTO Premise (Meter_Number, Contract_Number, Address)
Values ('24', '3336', '86333 Maywood Road Canyon TX 79016');

INSERT INTO Premise (Meter_Number, Contract_Number, Address)
Values ('5', '5085', '2768 Clarendon Trail Canyon TX 79015');

INSERT INTO Premise (Meter_Number, Contract_Number, Address)
Values ('27', '3592', '36 Laurel Center Canyon TX 79015');

INSERT INTO Premise (Meter_Number, Contract_Number, Address)
Values ('48', '2420', '07245 Dottie Junction Canyon TX 79015');

INSERT INTO Premise (Meter_Number, Contract_Number, Address)
Values ('16', '4283', '656 Weeping Birch Avenue Canyon TX 79016');

INSERT INTO Premise (Meter_Number, Contract_Number, Address)
Values ('40', '2419', '502 Meadow Valley Park Canyon TX 79015');

INSERT INTO Premise (Meter_Number, Contract_Number, Address)
Values ('34', '3891', '1 Stuart Point Canyon TX 79015');

INSERT INTO Premise (Meter_Number, Contract_Number, Address)
Values ('16', '4283', '656 Weeping Birch Avenue Canyon TX 79016');

INSERT INTO Premise (Meter_Number, Contract_Number, Address)
Values ('16', '3955', '656 Weeping Birch Avenue Canyon TX 79016');

INSERT INTO Premise (Meter_Number, Contract_Number, Address)
Values ('56', '2795', '22509 Holmberg Point Canyon TX 79016');

INSERT INTO Premise (Meter_Number, Contract_Number, Address)
Values ('25', '4451', '562 Kim Trail Canyon TX 79015');

-- Add the REader Data

INSERT INTO Reader (First_Name, Last_Name)
Values ('Lancelot', 'Tschiersch');

INSERT INTO Reader (First_Name, Last_Name)
Values ('Bernita', 'Munson');

INSERT INTO Reader (First_Name, Last_Name)
Values ('Genvieve', 'Creighton');

INSERT INTO Reader (First_Name, Last_Name)
Values ('Evaleen', 'Madelin');

INSERT INTO Reader (First_Name, Last_Name)
Values ('Gaspar', 'McCaskill');

INSERT INTO Reader (First_Name, Last_Name)
Values ('Cherye', 'Buey');

INSERT INTO Reader (First_Name, Last_Name)
Values ('Rosalia', 'Skip');

-- Add the Meter Data

INSERT INTO Meter (Number, Premise_Number)
Values ('24', '1');

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('5', '2', '1','2020-05-06','3851','2', '2020-06-06','4060', null);

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('5','2', '2', null, null, null, null, null, 'needs reading ');

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('27','3', '3', '2019-04-15','211', '3', '2019-05-15', '411', null);

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading,Cur_Reader_Number,  Cur_Reading_Date, Cur_Reading, Notes)
Values ('27','3', '3', '2019-05-15','411', '3', '2019-06-15', '670', null);

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('27','3', '3', '2019-06-15','670', '5', '2019-07-15', '830', null);

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('48','4', '4', '2018-09-21','1350', '4', '2018-10-21', '1870', null);

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('48','4', '4', null, null, null, null, null, 'Needs Reading');

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('27','3', '5', null, null, null, null, null, 'Needs Reading');

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('16','5', '6', '2019-10-23','400','3', '2019-11-23', '730', null);

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('40','6', null, null, null, null, null, null, 'Needs Reading Issued, need reading');

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('34','7', null, null, null, null, null, null, 'Needs Reading Issued, need reading');

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('16','5', '3', null, null, null, null, null, 'Needs Reading');

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('16','5', '7', '2018-08-19', '269', '7', '2018-09-19', '400', null);

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('56','10', '6', '2017-12-04','341', '5', '2018-01-05', '612', null);

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('56','10', '5', '2018-01-05','612', '5', '2018-02-05', '890', null);

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('56','10', '5', '2018-01-05', '890', null, null, null, 'need reading');

INSERT INTO Meter (Number, Premise_Number, Prev_Reader_Number, Prev_Reading_Date, Prev_Reading, Cur_Reader_Number, Cur_Reading_Date, Cur_Reading, Notes)
Values ('25','11', null, null, null, null, null, null, 'Needs Reading Issued, need reading');

-- Add the Customer Data

INSERT INTO Customer (Number, Premise_Number, Contract_Number, First_Name, Last_Name)
Values('47', '1', '3336', 'Melania', 'Hailey');

INSERT INTO Customer (Number, Premise_Number, Contract_Number, First_Name, Last_Name)
Values('113', '2', '5085', 'Johnath', 'Dun');

INSERT INTO Customer (Number, Premise_Number, Contract_Number, First_Name, Last_Name)
Values('454', '3', '3592', 'Kalie', 'Gratton');

INSERT INTO Customer (Number, Premise_Number, Contract_Number, First_Name, Last_Name)
Values('454', '4', '2420', 'Kalie', 'Gratton');

INSERT INTO Customer (Number, Premise_Number, Contract_Number, First_Name, Last_Name)
Values('856', '8', '4283', 'Ruperta', 'Horsewood');

INSERT INTO Customer (Number, Premise_Number, Contract_Number, First_Name, Last_Name)
Values('856', '6', '2419', 'Ruperta', 'Horsewood');

INSERT INTO Customer (Number, Premise_Number, Contract_Number, First_Name, Last_Name)
Values('856', '7', '3891', 'Ruperta', 'Horsewood');

INSERT INTO Customer (Number, Premise_Number, Contract_Number, First_Name, Last_Name)
Values('1010', '9', '3955', 'Bat', 'Scamel');

INSERT INTO Customer (Number, Premise_Number, Contract_Number, First_Name, Last_Name)
Values('1125', '10', '2795', 'Roxi', 'Falvey');

INSERT INTO Customer (Number, Premise_Number, Contract_Number, First_Name, Last_Name)
Values('2001', '111', '4451', 'Tulley', 'Reidshaw');

-- Insert Payment data

INSERT INTO Payment (Customer_Number, Bill_Number, Payment_Date, Payment_Amount)
Values ('113', '1002', '2020-07-06','71.06' );

INSERT INTO Payment (Customer_Number, Bill_Number, Payment_Date, Payment_Amount)
Values ('454', '1001', '2019-05-20','98' );

INSERT INTO Payment (Customer_Number, Bill_Number, Payment_Date, Payment_Amount)
Values ('454', '1003', '2019-06-20','126.91' );

INSERT INTO Payment (Customer_Number, Bill_Number, Payment_Date, Payment_Amount)
Values ('454', '1004', '2019-07-16','78.4' );

INSERT INTO Payment (Customer_Number, Bill_Number, Payment_Date, Payment_Amount)
Values ('454', '1007', '2018-10-22','100' );

INSERT INTO Payment (Customer_Number, Bill_Number, Payment_Date, Payment_Amount)
Values ('856', '2007', '2019-11-25','100' );

INSERT INTO Payment (Customer_Number, Bill_Number, Payment_Date, Payment_Amount)
Values ('856', '2007', '2019-12-10', '35.3' );

INSERT INTO Payment (Customer_Number, Bill_Number, Payment_Date, Payment_Amount)
Values ('1010', '2006', null, '0' );

INSERT INTO Payment (Customer_Number, Bill_Number, Payment_Date, Payment_Amount)
Values ('1125', '1005', '2017-12-06', '102.98' );

INSERT INTO Payment (Customer_Number, Bill_Number, Payment_Date, Payment_Amount)
Values ('1125', '1006', '2018-01-08', '105.64' );

-- Insert Bill data

INSERT INTO Bill (Number, Premise_Number, Customer_Number, Contract_Rate, Meter_Number, Payment_Number, Bill_Date, Consumption, Bill_Amount, Balance)
Values('1002', '2', '113', '0.34', '5','1', '2020-06-06', '209', '71.06', '0');

INSERT INTO Bill (Number, Premise_Number, Customer_Number, Contract_Rate, Meter_Number, Payment_Number, Bill_Date, Consumption, Bill_Amount, Balance)
Values('1001', '3', '454', '0.49', '27','2', '2019-05-15', '200', '98', '0');

INSERT INTO Bill (Number, Premise_Number, Customer_Number, Contract_Rate, Meter_Number, Payment_Number, Bill_Date, Consumption, Bill_Amount, Balance)
Values('1003', '3', '454', '0.49', '27','3', '2019-06-15', '259', '126.91', '0');

INSERT INTO Bill (Number, Premise_Number, Customer_Number, Contract_Rate, Meter_Number, Payment_Number, Bill_Date, Consumption, Bill_Amount, Balance)
Values('1004', '3', '454', '0.49', '27','4', '2019-07-15', '160', '78.4', '0');

INSERT INTO Bill (Number, Premise_Number, Customer_Number, Contract_Rate, Meter_Number, Payment_Number, Bill_Date, Consumption, Bill_Amount, Balance)
Values('1007', '4', '454', '0.39', '48','5', '2018-10-21', '520', '202.8', '102.8');

INSERT INTO Bill (Number, Premise_Number, Customer_Number, Contract_Rate, Meter_Number, Payment_Number, Bill_Date, Consumption, Bill_Amount, Balance)
Values('2007', '5', '856', '0.41', '16','6', '2019-11-23', '330', '135.3', '35.3');

INSERT INTO Bill (Number, Premise_Number, Customer_Number, Contract_Rate, Meter_Number, Payment_Number, Bill_Date, Consumption, Bill_Amount, Balance)
Values('2007', '5', '856', '0.41', '16','7', '2019-11-23', '330', '35.3', '0');

INSERT INTO Bill (Number, Premise_Number, Customer_Number, Contract_Rate, Meter_Number, Payment_Number, Bill_Date, Consumption, Bill_Amount, Balance)
Values('2006', '9', '1010', '0.26', '16','8', '2018-09-19', '131', '34.06', '0');

INSERT INTO Bill (Number, Premise_Number, Customer_Number, Contract_Rate, Meter_Number, Payment_Number, Bill_Date, Consumption, Bill_Amount, Balance)
Values('1005', '10', '1125', '0.38', '56','9', '2017-12-04', '271', '102.98', '0');

INSERT INTO Bill (Number, Premise_Number, Customer_Number, Contract_Rate, Meter_Number, Payment_Number, Bill_Date, Consumption, Bill_Amount, Balance)
Values('1006', '10', '1125', '0.38', '56','10', '2018-01-05', '278', '105.64', '0');

-- insert Contract data

INSERT INTO Contract (Number, Customer_Number, Premise_Number, Rate, Activation_Date)
Values ('3336', '47', '1', 0.37, '2018-08-16');

INSERT INTO Contract (Number, Customer_Number, Premise_Number, Rate, Activation_Date)
Values ('5085', '113', '2', 0.34, '2020-05-06');

INSERT INTO Contract (Number, Customer_Number, Premise_Number, Rate, Activation_Date)
Values ('3592', '454', '3', 0.49, '2019-04-15');

INSERT INTO Contract (Number, Customer_Number, Premise_Number, Rate, Activation_Date)
Values ('2420', '454', '4', 0.39, '2018-09-21');

INSERT INTO Contract (Number, Customer_Number, Premise_Number, Rate, Activation_Date)
Values ('4283', '856', '8', 0.41, '2019-10-23');

INSERT INTO Contract (Number, Customer_Number, Premise_Number, Rate, Activation_Date)
Values ('3891', '856', '7', 0.29, '2019-12-13');

INSERT INTO Contract (Number, Customer_Number, Premise_Number, Rate, Activation_Date)
Values ('3955', '1010', '9', 0.26, '2018-08-19');

INSERT INTO Contract (Number, Customer_Number, Premise_Number, Rate, Activation_Date)
Values ('2795', '1125', '10', 0.38, '2017-12-04');

INSERT INTO Contract (Number, Customer_Number, Premise_Number, Rate, Activation_Date)
Values ('4451', '2001', '11', 0.47, '2019-02-11');

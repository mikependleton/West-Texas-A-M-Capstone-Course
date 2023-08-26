#Mike Pendleton
#CIDM 6350-70 assignment #2

drop database if exists dbclass;

CREATE database if not exists dbclass;
USE dbclass;

 CREATE TABLE Players (
	ID int,
    Position text,
    Name text,
    Team_ID INT,
    Skills decimal(19,2),
    PRIMARY KEY (ID)
    );
    
CREATE TABLE History (
	NUMBER int,
    Player_ID int,
    Description text,
    Start_Date date,
    End_Date date,
    PRIMARY KEY (Number, Player_ID)
    );

CREATE TABLE Teams (
	ID int,
    Name text,
    City text,
    Field_ID int,
    Captain_ID int,
    Coach text,
    PRIMARY KEY (ID)
    );
    
CREATE TABLE Fields (
	ID int,
    Name text,
    Location text,
    PRIMARY KEY (ID)
    );
    
CREATE TABLE Matches (
	ID int,
    Host_Team_ID int,
    Guest_Team_ID int,
    Field_ID int,
    Date date,
    Score text,
    Winner text,
    PRIMARY KEY (ID)
    );

CREATE TABLE Goals (
	NUMBER int,
    Match_ID int,
    Player_ID int,
    Time int,
    PRIMARY KEY (Number, Player_ID, Match_ID)
    );
    
ALTER TABLE Players 
ADD FOREIGN KEY (Team_ID) REFERENCES Teams (ID);

ALTER TABLE History 
ADD FOREIGN KEY (Player_ID) REFERENCES Players (ID);

ALTER TABLE Teams 
ADD FOREIGN KEY (Field_ID) REFERENCES Fields (ID),
ADD FOREIGN KEY (Captain_ID) REFERENCES Players (ID);

ALTER TABLE Matches
ADD FOREIGN KEY (Host_Team_ID) REFERENCES Teams (ID),
ADD FOREIGN KEY (Guest_Team_ID) REFERENCES Teams (ID),
ADD FOREIGN KEY (Field_ID) REFERENCES Fields (ID) ;

ALTER TABLE Goals
ADD FOREIGN KEY (Match_ID) REFERENCES Matches (ID),
ADD FOREIGN KEY (Player_ID) REFERENCES Players (ID);


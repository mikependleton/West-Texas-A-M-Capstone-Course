#Mike Pendleton
#CIDM 6350-70 assignment #2

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

Insert into Players (ID, Position, Name, Team_ID, Skills)
Values 	
('1','Midfielder','Paxton Pomykal','1','7.5'),
('7','Forward','Jonathan Lewis','2','8.0'),
('19','Midfielder','Jack Price','2','7.0'),
('3','Defender','Drew Moor','2','8.0'),
('9','Forward','Jesus Ferreira','1','7.0'),
('10','goalkeeper','Kenneth Vermeer','3','7.0'),
('6','Midfielder','Bryce Duke','3','7.5');

Insert into History (Number, Player_ID, Description, Start_Date, End_Date)
values
('1','3','US U-20 squad for the 2003 World Youth Championship','2003-11-27','2003-12-19'),
('2','3','Eastern Conference Championship: 2010, Colorado Rapids','2010-11-13','2010-11-13'),
('3','19','US U20 at the 2019 FIFA U-20 World Cup in Poland.','2019-05-23','2019-06-15');


Insert into teams (ID, Name, City, Field_ID, Captain_ID, Coach)
values
('2','Colorado Rapids','Denver,CO','1','3','Robin Fraser'),
('1','FC Dallas','Dallas,TX','2','1','Luchi Gonzalez'),
('3','Los Angeles FC','Los Angeles,CA','3','10','Bob Bradley');

Insert into fields (ID, Name, Location)
values
('1','Dick\'s Sporting Goods Park','Commerce City,CO'),
('2','Toyota Stadium','Frisco,TX'),
('3','BAnc of California Stadium','Los Angeles,CA');

Insert into matches (ID, Host_Team_ID, Guest_Team_ID, Field_ID, Date, Score, Winner)
values
('1','1','2','1','2019-01-08','0-1','2'),
('2','1','3','1','2019-12-09','2-1','1');

Insert into goals (Number, Match_ID, Player_ID, Time)
values
('1','1','19','32'),
('2','2','6','22'),
('3','2','9','45'),
('4','2','9','87');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;




USE UtilityCompany;


CREATE USER 'Manager'@'localhost' IDENTIFIED BY 'Man@g3r';

GRANT SELECT ON *.* TO 'Manager'@'localhost';
GRANT UPDATE ON utilitycompany.Meter TO 'Manager'@'localhost';
GRANT UPDATE ON utilitycompany.Reader TO 'Manager'@'localhost';

CREATE USER 'Reader'@'localhost' IDENTIFIED BY 'R3ad3r';

GRANT select ON utilitycompany.Premise TO 'Reader'@'localhost';

CREATE USER 'Customer_Service'@'localhost' IDENTIFIED BY 'CustS3rv';

GRANT select ON utilitycompany.Premise TO 'Customer_Service'@'localhost';
GRANT select ON utilitycompany.Customer TO 'Customer_Service'@'localhost';
GRANT select ON utilitycompany.Bill TO 'Customer_Service'@'localhost';
GRANT select ON utilitycompany.Contract TO 'Customer_Service'@'localhost';



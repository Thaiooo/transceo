CREATE DATABASE transeo;
CREATE USER 'transeo'@'localhost' IDENTIFIED BY 'transeo';
GRANT SELECT, INSERT, UPDATE, DELETE ON transeo.* TO 'transeo'@'localhost';
--GRANT CREATE, ALTER, DROP ON transeo.* TO 'transeo'@'localhost';
FLUSH PRIVILEGES;
USE transeo;
 
-- Init séquence
INSERT INTO code_sequence (version ,sequence) VALUES ('0', '1');

-- Location
INSERT INTO adresse (version ,adresse ,postal ,country ,city ,class ,label)
VALUES ('0', 'Aéroport de Paris Roissy Charles de Gaulle', '95711', 'FR', 'Roissy Charles de Gaulle', 'com.transceo.Location', 'Aéroport de Paris Roissy Charles de Gaulle');
INSERT INTO adresse (version ,adresse ,postal ,country ,city ,class ,label)
VALUES ('0', 'Gare de Paris Saint Lazare', '75008', 'FR', 'Paris', 'com.transceo.Location', 'Gare de Paris Saint Lazare');

-- Admin user
INSERT INTO administrator(version,last_name,login,first_name,password) values (0,'admin','admin','admin','aaaaa');

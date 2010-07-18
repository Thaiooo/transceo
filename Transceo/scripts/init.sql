-- Init séquence
INSERT INTO Transeo.code_sequence (version ,sequence)
VALUES ('0', '1');

-- Location
INSERT INTO Transeo.adresse (version ,adresse ,postal ,country ,city ,class ,label)
VALUES ('0', 'Aéroport de Paris Roissy Charles de Gaulle', '95711', 'FR', 'Roissy Charles de Gaulle', 'com.transceo.Location', 'Aéroport de Paris Roissy Charles de Gaulle');
INSERT INTO Transeo.adresse (version ,adresse ,postal ,country ,city ,class ,label)
VALUES ('0', 'Gare de Paris Saint Lazare', '75008', 'FR', 'Paris', 'com.transceo.Location', 'Gare de Paris Saint Lazare');

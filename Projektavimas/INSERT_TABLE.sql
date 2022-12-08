INSERT INTO alko8100.gydytojas VALUES('34893769777', 'Jonas', 'Petraitis','Seimos gydytojas', 2000);
INSERT INTO alko8100.gydytojas VALUES('17233615445', 'Milda', 'Jonaitiene','Onkologas', 3000);
INSERT INTO alko8100.gydytojas VALUES('63282957563', 'Agne', 'Jonaityte','Odontologas', 4000);
INSERT INTO alko8100.gydytojas VALUES('50303010222', 'Arnas', 'Matulaitis', 'Chirurgas', 3500);
INSERT INTO alko8100.gydytojas VALUES('40303030333', 'Dominykas', 'Dominikavicius', 'Odontologas', 6000);

INSERT INTO alko8100.pacientas VALUES('35420123385', 'Linas', 'Zilinskas', '2003-03-20', 'Vyras','37046505391');
INSERT INTO alko8100.pacientas VALUES('81001028285', 'Grazina', 'Zagorskyte', '2001-04-17', 'Moteris','37063700561');
INSERT INTO alko8100.pacientas VALUES('87252117882', 'Sonata', 'Strimaitiene', '2000-05-10', 'Moteris','37046057613');
INSERT INTO alko8100.pacientas VALUES('61235244544', 'Orestas', 'Abrustis', '1999-06-06', 'Vyras','37046565625');
INSERT INTO alko8100.pacientas VALUES('74859122194', 'Antanas', 'Simonaitis', '1979-09-08', 'Vyras','857939591');
INSERT INTO alko8100.pacientas VALUES('81885918369', 'Rugile', 'Osteikiene', '1980-12-13', 'Moteris','859919332');

INSERT INTO alko8100.liga VALUES('56483', 'Agranulocitozė');
INSERT INTO alko8100.liga VALUES('15332', 'Anafilaksija');
INSERT INTO alko8100.liga VALUES('38279', 'Bartolinitas');
INSERT INTO alko8100.liga VALUES('43299', 'Cholera');
INSERT INTO alko8100.liga VALUES('24899', 'Diafragmos išvarža');
INSERT INTO alko8100.liga VALUES('74437', 'Dispepsija');
INSERT INTO alko8100.liga VALUES('44933', 'Encefalitas');
INSERT INTO alko8100.liga VALUES('37563', 'Eritremija');
INSERT INTO alko8100.liga VALUES('45945', 'Gastritas');

INSERT INTO alko8100.apsilankymas VALUES(DEFAULT, '35420123385', '34893769777', '14:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES(DEFAULT, '81001028285', '34893769777', '15:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES(DEFAULT, '87252117882', '34893769777', '16:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES(DEFAULT, '61235244544', '17233615445', '13:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES(DEFAULT, '74859122194', '63282957563', '14:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES(DEFAULT, '81885918369', '50303010222', '15:00:00', '2022-11-30');
INSERT INTO alko8100.apsilankymas VALUES(DEFAULT, '35420123385', '17233615445', '13:00:00', '2022-11-30');
INSERT INTO alko8100.apsilankymas VALUES(DEFAULT, '81001028285', '63282957563', '15:00:00', '2022-11-30');
INSERT INTO alko8100.apsilankymas VALUES(DEFAULT, '87252117882', '50303010222', '16:00:00', '2022-11-30');
INSERT INTO alko8100.apsilankymas VALUES(DEFAULT, '61235244544', '17233615445', '15:00:00', '2022-11-30');

INSERT INTO alko8100.priezastis VALUES(DEFAULT, '56483', 'Planinis');
INSERT INTO alko8100.priezastis VALUES(DEFAULT, '15332', 'Planinis');
INSERT INTO alko8100.priezastis VALUES(DEFAULT, '38279', 'Planinis');
INSERT INTO alko8100.priezastis VALUES(DEFAULT, '38279', 'Konsultacija');
INSERT INTO alko8100.priezastis VALUES(DEFAULT, '37563', 'Planinis');
INSERT INTO alko8100.priezastis VALUES(DEFAULT, '24899', 'Konsultacija');
INSERT INTO alko8100.priezastis VALUES(DEFAULT, '56483', 'Planinis');
INSERT INTO alko8100.priezastis VALUES(DEFAULT, '15332', 'Planinis');
INSERT INTO alko8100.priezastis VALUES(DEFAULT, '38279', 'Planinis');
INSERT INTO alko8100.priezastis VALUES(DEFAULT, '45945', 'Konsultacija');

INSERT INTO alko8100.serga VALUES('35420123385','56483','2017-09-10');
INSERT INTO alko8100.serga VALUES('81001028285','15332','2018-07-28');
INSERT INTO alko8100.serga VALUES('87252117882','38279','2019-10-12');
INSERT INTO alko8100.serga VALUES('74859122194','37563','2016-11-03');
//AK, Vardas, Pavarde, Pareigos, Atlyginimas
INSERT INTO alko8100.gydytojas VALUES('34893769777', 'Jonas', 'Petraitis','Seimos gydytojas');
INSERT INTO alko8100.gydytojas VALUES('99753899663', 'Jonas', 'Jonaitis', 'Seimos gydytojas');
INSERT INTO alko8100.gydytojas VALUES('17233615445', 'Milda', 'Jonaitiene','Onkologas');
INSERT INTO alko8100.gydytojas VALUES('63282957563', 'Agne', 'Jonaityte','Odontologas');
INSERT INTO alko8100.gydytojas VALUES('63372691888', 'Ignas', 'Ignaitis','Onkologas');
INSERT INTO alko8100.gydytojas VALUES('66855264943', 'Andrius','Antanaitis', 'Odontologas');
INSERT INTO alko8100.gydytojas VALUES('50101010222', 'Arvydas', 'Jokubaitis', 'Seimos gydytojas')
INSERT INTO alko8100.gydytojas VALUES('50303010222', 'Arnas', 'Matulaitis', 'Endokrinologas');

//nr, pacientas, gydytojas, laikas, data
INSERT INTO alko8100.apsilankymas VALUES('1', '35420123385', '34893769777', '14:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES('2', '81001028285', '34893769777', '15:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES('3', '87252117882', '34893769777', '16:00:00', '2022-11-29');

INSERT INTO alko8100.apsilankymas VALUES('4', '61235244544', '99753899663', '13:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES('5', '74859122194', '99753899663', '14:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES('6', '81885918369', '99753899663', '15:00:00', '2022-11-30');

INSERT INTO alko8100.apsilankymas VALUES('7', '96133445225', '17233615445', '11:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES('8', '62365404630', '17233615445', '12:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES('9', '77129668195', '17233615445', '13:00:00', '2022-11-27');

INSERT INTO alko8100.apsilankymas VALUES('10', '35440944924', '63282957563', '10:00:00', '2022-12-01');
INSERT INTO alko8100.apsilankymas VALUES('11', '35440944924', '63282957563', '14:00:00', '2022-11-30');
INSERT INTO alko8100.apsilankymas VALUES('12', '35420123385', '63282957563', '17:00:00', '2022-11-29');

INSERT INTO alko8100.apsilankymas VALUES('13', '81001028285', '63372691888', '13:00:00', '2022-11-27');
INSERT INTO alko8100.apsilankymas VALUES('14', '87252117882', '63372691888', '10:00:00', '2022-11-30');

INSERT INTO alko8100.apsilankymas VALUES('15', '61235244544', '66855264943', '18:00:00', '2022-11-29');
INSERT INTO alko8100.apsilankymas VALUES('16', '81885918369', '66855264943', '14:00:00', '2022-11-29');

INSERT INTO alko8100.apsilankymas VALUES('17', '96133445225', '50101010222', '16:00:00', '2022-11-28');
INSERT INTO alko8100.apsilankymas VALUES('18', '62365404630', '50101010222', '16:00:00', '2022-11-29');

INSERT INTO alko8100.apsilankymas VALUES('19', '35440944924', '50303010222', '11:00:00', '2022-11-28');
INSERT INTO alko8100.apsilankymas VALUES('20', '35420123385', '50303010222', '12:00:00', '2022-12-01');

//apsilankymas, liga, pavadinimas
INSERT INTO alko8100.priezastis VALUES('');

//AK, Vardas, Pavarde, Gimimo data, lytis, telefono_nr
INSERT INTO alko8100.pacientas VALUES('35420123385', 'Linas', 'Zilinskas', '2003-03-20', 'Vyras','37046505391');
INSERT INTO alko8100.pacientas VALUES('81001028285', 'Grazina', 'Zagorskyte', '2001-04-17', 'Moteris','37063700561');
INSERT INTO alko8100.pacientas VALUES('87252117882', 'Sonata', 'Strimaitiene', '2000-05-10', 'Moteris','37046057613');
INSERT INTO alko8100.pacientas VALUES('61235244544', 'Orestas', 'Abrustis', '1999-06-06', 'Vyras','37046565625');
INSERT INTO alko8100.pacientas VALUES('74859122194', 'Antanas', 'Simonaitis', '1979-09-08', 'Vyras','857939591');
INSERT INTO alko8100.pacientas VALUES('81885918369', 'Rugile', 'Osteikiene', '1980-12-13', 'Moteris','859919332');
INSERT INTO alko8100.pacientas VALUES('96133445225', 'Linas', 'Zabarauskas', '1960-02-12', 'Vyras','37067985458');
INSERT INTO alko8100.pacientas VALUES('62365404630', 'Albina', 'Stankeviciute', '1970-02-12', 'Moteris','869406876');
INSERT INTO alko8100.pacientas VALUES('77129668195', 'Audrone', 'Vasiliauskaite', '1998-08-27', 'Moteris','37053792730');
INSERT INTO alko8100.pacientas VALUES('35440944924', 'Lukrecija', 'Butkute', '1994-05-21', 'Moteris','846325480');


//Pacientas, liga, diagnozavimo_data
INSERT INTO alko8100.serga VALUES('');

//ligos_nr, pavadinimas
INSERT INTO alko8100.liga VALUES('');


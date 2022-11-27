CREATE TABLE alko8100.gydytojas (

	AK          CHAR(11)        NOT NULL CONSTRAINT AsmensKodas CHECK (AK > 0),
	Vardas      VARCHAR(20)     NOT NULL,
	Pavarde	    VARCHAR(20)	    NOT NULL,
	Pareigos    VARCHAR(20)     NOT NULL,
	Atlyginimas DECIMAL(7,2)    NOT NULL CONSTRAINT Alga CHECK (Atlyginimas >= 1000 AND Atlyginimas <= 10000),

    PRIMARY KEY (AK)

);

CREATE TABLE alko8100.apsilankymas (

    Nr          SERIAL      NOT NULL,
    Pacientas   CHAR(11)    NOT NULL,
    Gydytojas   CHAR(11)    NOT NULL,
    Laikas      TIME        NOT NULL,
    Data        DATE        NOT NULL,

    PRIMARY KEY (Nr),
    FOREIGN KEY (Gydytojas) REFERENCES alko8100.gydytojas(AK) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (Pacientas) REFERENCES alko8100.pacientas(AK) ON DELETE CASCADE  ON UPDATE RESTRICT
);

CREATE TABLE alko8100.priezastis (

    Apsilankymas    SERIAL          NOT NULL,
    Liga            VARCHAR(20)     NOT NULL,
    Pavadinimas     VARCHAR(20)     NOT NULL,

    PRIMARY KEY (Apsilankymas),
    PRIMARY KEY (Liga),
    FOREIGN KEY (Apsilankymas)      REFERENCES alko8100.apsilankymas(Nr) ON DELETE CASCADE  ON UPDATE RESTRICT,
    FOREIGN KEY (Liga)              REFERENCES alko8100.liga(Ligos_nr)   ON DELETE CASCADE  ON UPDATE RESTRICT

);

CREATE TABLE alko8100.pacientas (

    AK              CHAR(11)        NOT NULL CONSTRAINT AsmensKodas CHECK (AK > 0),
    Vardas          VARCHAR(2)      NOT NULL,
	Pavarde	        VARCHAR(20)	    NOT NULL,
    Gimimo_data     DATE            NOT NULL,
    Lytis           CHAR(7)         NOT NULL CONSTRAINT NurodytaLytis CHECK (Lytis IN ('Moteris', 'Vyras')),
    Telefono_nr	    CHAR(15)	    NOT NULL,

    PRIMARY KEY (AK)
);

CREATE TABLE alko8100.serga (

    Pacientas           CHAR(11)        NOT NULL,
    Liga                VARCHAR(20)     NOT NULL,
    Diagnozavimo_data   DATE            NOT NULL,

    PRIMARY KEY (Pacientas),
    PRIMARY KEY (Liga),
    FOREIGN KEY (Pacientas)             REFERENCES alko8100.pacientas(AK)    ON DELETE CASCADE      ON UPDATE RESTRICT,
    FOREIGN KEY (Liga)                  REFERENCES alko8100.liga(Ligos_nr)   ON DELETE RESTRICT     ON UPDATE RESTRICT

);

CREATE TABLE alko8100.liga (

    Ligos_nr        CHAR(15)         NOT NULL,
    Pavadinimas     VARCHAR(15)      NOT NULL,

    PRIMARY KEY (Ligos_nr)
);
    

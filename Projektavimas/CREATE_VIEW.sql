CREATE  VIEW    alko8100.viesi_duomenys (Vardas, Pavarde, Pareigos)
AS      SELECT  Vardas, Pavarde, Pareigos
        FROM    alko8100.gydytojas;

CREATE  VIEW    alko8100.pacientas_amzius
AS      SELECT  Vardas, Pavarde, EXTRACT(YEAR FROM AGE(Gimimo_data)) AS Amzius
        FROM    alko8100.pacientas;

CREATE  MATERIALIZED VIEW   alko8100.pacientu_ligos (Vardas, Pavarde, Ligos_nr, Pavadinimas)
AS      SELECT              Vardas, Pavarde, Ligos_nr, Pavadinimas
        FROM                alko8100.pacientas, alko8100.serga, alko8100.liga
        WHERE               pacientas.AK = serga.Pacientas
        AND                 serga.Liga = liga.Ligos_nr
WITH DATA;
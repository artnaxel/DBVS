CREATE UNIQUE INDEX IndexGydytojui
ON alko8100.gydytojas(Vardas, Pavarde, Pareigos);

CREATE INDEX IndexPacientui
ON alko8100.pacientas(Vardas, Pavarde);
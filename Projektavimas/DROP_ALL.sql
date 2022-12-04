DROP TRIGGER ApsilankymoLaikoTikrinimas ON alko8100.apsilankymas;
DROP TRIGGER ApsilankymuLimitas ON alko8100.apsilankymas;
DROP FUNCTION alko8100.LaikoTikrinimas();
DROP FUNCTION alko8100.MaxApsilankymuSkaicius ();

DROP VIEW alko8100.viesi_duomenys;
DROP VIEW alko8100.pacientas_amzius;
DROP MATERIALIZED VIEW alko8100.pacientu_ligos;

DROP INDEX IndexLigai;
DROP INDEX IndexPacientui;

DROP TABLE alko8100.priezastis;
DROP TABLE alko8100.apsilankymas;
DROP TABLE alko8100.serga;
DROP TABLE alko8100.gydytojas;
DROP TABLE alko8100.pacientas;
DROP TABLE alko8100.liga;
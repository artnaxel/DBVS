CREATE TRIGGER ApsilankymoLaikoTikrinimas
BEFORE  INSERT OR
        UPDATE ON alko8100.apsilankymas
FOR EACH ROW
EXECUTE PROCEDURE LaikoTikrinimas();

CREATE FUNCTION LaikoTikrinimas()
RETURNS TRIGGER
AS
'BEGIN
IF (SELECT COUNT(*) FROM alko8100.apsilankymas
    WHERE ( alko8100.apsilankymas.Pacientas = NEW.Pacientas
    OR      alko8100.apsilankymas.Gydytojas = NEW.Gydytojas)
    AND     alko8100.apsilankymas.Laikas =  NEW.Laikas
    AND     alko8100.apsilankymas.Data   = NEW.Data) > 0
THEN
    RAISE EXCEPTION "Negalima užregistruoti keletą apsilankymų tuo
    pačiu metu pas tą patį gydytoją arba tam pačiam pacientui!"
END IF;
RETURN NEW;
END;'
LANGUAGE plpsql;



CREATE TRIGGER ApsilankymuLimitas
BEFORE  INSERT ON alko8100.apsilankymas
FOR EACH ROW
EXECUTE PROCEDURE MaxApsilankymuSkaicius();

CREATE FUNCTION MaxApsilankymuSkaicius()
RETURNS TRIGGER
AS
'BEGIN
IF (SELECT COUNT(Gydytojas) FROM alko8100.apsilankymas
    WHERE alko8100.apsilankymas.Gydytojas = NEW.Gydytojas
    AND   alko8100.apsilankymas.Data = NEW.Data) >= 10
THEN
    RAISE EXCEPTION "Viršytas apsilankymų skaičius";
END IF;
RETURN NEW;
END;'
LANGUAGE plpgsql;
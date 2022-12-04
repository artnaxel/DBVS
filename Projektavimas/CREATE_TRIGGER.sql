CREATE FUNCTION LaikoTikrinimas()
RETURNS TRIGGER
AS
'BEGIN
IF (SELECT COUNT(*) FROM alko8100.apsilankymas
    WHERE ( alko8100.apsilankymas.Pacientas = NEW.Pacientas
    OR      alko8100.apsilankymas.Gydytojas = NEW.Gydytojas)
    AND     alko8100.apsilankymas.Laikas
    BETWEEN  NEW.Laikas - interval ''45 minutes''
    AND NEW.Laikas + interval ''45 minutes''
    AND     alko8100.apsilankymas.Data   = NEW.Data) > 0
THEN
    RAISE EXCEPTION ''Laikas užimtas!'';
END IF;
RETURN NEW;
END;'
LANGUAGE plpgsql;

CREATE TRIGGER ApsilankymoLaikoTikrinimas
BEFORE  INSERT OR
        UPDATE ON alko8100.apsilankymas
FOR EACH ROW
EXECUTE PROCEDURE LaikoTikrinimas();

CREATE FUNCTION MaxApsilankymuSkaicius()
RETURNS TRIGGER
AS
'BEGIN
IF (SELECT COUNT(Gydytojas) FROM alko8100.apsilankymas
    WHERE alko8100.apsilankymas.Gydytojas = NEW.Gydytojas
    AND   alko8100.apsilankymas.Data = NEW.Data) >= 3
THEN
    RAISE EXCEPTION ''Viršytas apsilankymų skaičius'';
END IF;
RETURN NEW;
END;'
LANGUAGE plpgsql;

CREATE TRIGGER ApsilankymuLimitas
BEFORE  INSERT OR UPDATE OF Gydytojas, Data ON alko8100.apsilankymas
FOR EACH ROW
EXECUTE PROCEDURE MaxApsilankymuSkaicius();
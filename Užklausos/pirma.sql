--Pavadinimas, leidykla ir metai kiekvienos knygos, 
-- išleistos ankščiau negu prieš konkretų skaičių metų.
select EXTRACT(year from CURRENT_DATE) - Knyga.Metai, Knyga.Pavadinimas, Knyga.Leidykla, Knyga.Metai 
from Stud.Knyga 
where Knyga.Metai > EXTRACT(year from CURRENT_DATE) - 16 order by 1;
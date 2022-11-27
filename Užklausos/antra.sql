--Vardai ir pavardės visų skaitytojų,
--kurie skaito konkrečioje leidykloje išleistas knygas.
select distinct Vardas, Pavarde,
EXTRACT(year from AGE(Gimimas))
from Stud.Skaitytojas, Stud.Egzempliorius, Stud.Knyga
where Stud.Egzempliorius.Skaitytojas = Stud.Skaitytojas.Nr
AND Stud.Knyga.ISBN = Stud.Egzempliorius.ISBN
AND Stud.Knyga.Leidykla = 'Baltoji'
order by 3;
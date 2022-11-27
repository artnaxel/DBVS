--Vardai ir pavardes skaitytoju,
--kurie yra paeme maziau knygu uz visu
--skaitytoju paimtu knygu vidurki
--Greta pateikti ir paimtu egzemplioriu skaiciu
with Visu (Vardas, Pavarde, Skaicius) as(
    select Vardas, Pavarde, count(egzempliorius)
    from stud.egzempliorius, stud.skaitytojas
    where egzempliorius.skaitytojas = skaitytojas.nr
    group by Skaitytojas.Vardas, Skaitytojas.Pavarde),
    
    VisuVidurkis (Vidurkis) as(
    select avg(Skaicius) from Visu)
    
select Vardas, Pavarde, Skaicius, round(Vidurkis, 2)
from Visu, VisuVidurkis
where Skaicius < Vidurkis;
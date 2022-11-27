--Vardai ir pavardės skaitytojų,
--kurie yra paėmę mažiau knygų už visų
--skaitytojų paimtų knygų vidurkį.
--Greta pateikti ir paimtų egzempliorių skaičių.


with Count as(
    select count(egzempliorius)
    from stud.egzempliorius, stud.skaitytojas
    where egzempliorius.skaitytojas = skaitytojas.nr
    group by Skaitytojas.Vardas, Skaitytojas.Pavarde)
    
select Vardas, Pavarde, count(distinct egzempliorius)
from stud.egzempliorius, stud.skaitytojas, Count
where egzempliorius.skaitytojas = skaitytojas.nr
group by Skaitytojas.Vardas, Skaitytojas.Pavarde
having count(distinct egzempliorius) < avg(Count);




--Kiekvieneriems metams, kuriais buvo išleista bent viena knyga, visų ir vien tik paimtų egzempliorių skaičiai.

select  knyga.metai, count(*) as Visi, count(egzempliorius.skaitytojas) as Paimti, count(*) - count(egzempliorius.skaitytojas) as "Nepaimti"
from stud.egzempliorius, stud.knyga
where egzempliorius.isbn = knyga.isbn
group by knyga.metai having  count(*) - count(egzempliorius.skaitytojas) > 2
order by "Nepaimti" desc;
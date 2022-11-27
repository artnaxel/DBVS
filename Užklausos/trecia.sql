--Kiekvieneriems metams,
--kuriais buvo išleista bent viena knyga,
--visų ir vien tik paimtų egzempliorių skaičiai.

select  knyga.metai, count(egzempliorius.nr)
from stud.egzempliorius, stud.knyga
where egzempliorius.isbn = knyga.isbn
and egzempliorius.skaitytojas is not null
group by knyga.metai;
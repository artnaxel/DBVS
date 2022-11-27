--Konkrečiam naudotojui - skaičius virtualių lentelių,
-- kurioms jis turi teisę rašyti užklausas.
select  count (A.Table_schema || A.Table_name) as "Lentelių skaičius"
from Information_schema.Table_privileges A, Information_schema.Tables B
where (A.grantee = 'alko8100' OR A.grantee = 'PUBLIC')
and A.Table_schema = B.Table_schema
and A.Table_name = B.Table_name
and B.table_type = 'VIEW'
and A.privilege_type = 'SELECT';
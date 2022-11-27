--Konkrečiam naudotojui - skaičius virtualių lentelių,
-- kurioms jis turi teisę rašyti užklausas.
select  Table_name
from Information_schema.Table_privileges
where grantee = 'alko8100'
and table_schema = 'information_schema'
and privilege_type = 'SELECT';
select
  trim(pgdb.datname) as Database,
  trim(pgn.nspname) as Schema,
  trim(a.name) as Table,
  b.mbytes,
  (CAST(b.mbytes as double precision) / 1024) as gbytes,
  (CAST(b.mbytes as double precision) / 1048576) as tbytes,
  a.rows,
  to_char(a.rows, '999,999,999,999,999') as rows_ww,
  to_char(a.rows, '9999,9999,9999,9999') as rows_jp
from (
       select db_id, id, name, sum(rows) as rows
       from stv_tbl_perm a
       group by db_id, id, name
     ) as a
  join pg_class as pgc on pgc.oid = a.id
  join pg_namespace as pgn on pgn.oid = pgc.relnamespace
  join pg_database as pgdb on pgdb.oid = a.db_id
  join (
         select tbl, count(*) as mbytes
         from stv_blocklist
         group by tbl
       ) b on a.id = b.tbl
order by mbytes desc, a.db_id, a.name

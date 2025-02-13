set heading off
set pagesize 500
set feedback off

select 'drop procedure '||object_name||';'
from user_objects
where object_type = 'PROCEDURE';

select 'drop package body '||object_name||';'
from user_objects
where object_type = 'PACKAGE BODY';

select 'drop package '||object_name||';'
from user_objects
where object_type = 'PACKAGE';

select 'drop view '||view_name||';'
from user_views;

select 'drop table '||table_name||';'
from user_tables;

select 'purge recyclebin;' from dual;
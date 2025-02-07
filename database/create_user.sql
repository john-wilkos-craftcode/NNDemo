drop user nndemo cascade;

create user nndemo identified by <pwd> default tablespace tst_apex temporary tablespace temp;

grant create session, resource, create view, create job, create materialized view to nndemo;

alter user nndemo quota unlimited on tst_apex;
grant create synonym to nndemo;
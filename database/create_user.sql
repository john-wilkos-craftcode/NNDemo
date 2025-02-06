drop user ctb_centerfield cascade;

create user ctb_centerfield identified by M7rK_YJrqTN$Eh24tFpRZs default tablespace tst_apex temporary tablespace temp;

grant create session, resource, create view, create job, create materialized view to ctb_centerfield;

alter user ctb_centerfield quota unlimited on tst_apex;
grant create synonym to ctb_centerfield;
DROP INDEX code_i;

CREATE UNIQUE INDEX code_i
ON cf_lov_values(CODE,FK_LOV_DOMAIN_ID);
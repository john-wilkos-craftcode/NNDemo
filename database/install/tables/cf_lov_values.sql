CREATE TABLE CF_LOV_VALUES 
(
  ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE NOT NULL 
, LOV_VALUE VARCHAR2(255 CHAR) NOT NULL 
, CODE VARCHAR2(30 CHAR) 
, IS_ACTIVE BOOLEAN 
, SEQUENCE_ID NUMBER 
, FK_LOV_DOMAIN_ID NUMBER NOT NULL 
, CREATED_BY VARCHAR2(100 CHAR) NOT NULL 
, CREATED_ON DATE NOT NULL 
, MODIFIED_BY VARCHAR2(100 CHAR) 
, MODIFIED_ON DATE 
, CONSTRAINT CF_LOV_VALUES_PK PRIMARY KEY (ID)
, CONSTRAINT CF_LOV_VALUE_DOMAIN_FK FOREIGN KEY (FK_LOV_DOMAIN_ID) REFERENCES CF_LOV_DOMAINS(ID)
);

CREATE UNIQUE INDEX code_i
ON cf_lov_values(code);
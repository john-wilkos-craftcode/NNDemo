  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CTB_CENTERFIELD"."CF_V_PERSONAL_DETAILS" AS 
  SELECT emp.id
       , cvemp.internalid
       , cvemp.givenname
       , cvemp.familyname
       , cvemp.companies
       , cvemp.cv_function
       , emp.language
       , emp.start_date
       , emp.birthdate
       , cvemp.active
       , emp.employee_email
       , EXTRACT (YEAR FROM SYSDATE) - EXTRACT(YEAR FROM emp.start_date) as years_employed
       , ((EXTRACT (YEAR FROM SYSDATE) - EXTRACT(YEAR FROM emp.start_date)) || ' jaar ' || (EXTRACT (MONTH FROM SYSDATE) - EXTRACT(MONTH FROM emp.start_date)) || ' maand(en)') time_months_year
       , emp.offboarding_date
       , adr.street
       , adr.house_number
       , adr.bus_number
       , adr.zipcode
       , adr.city
       , adr.country
       , adr.telephone
    FROM cf_v_employees cvemp
    JOIN cf_employees emp ON cvemp.internalid = emp.user_mgm_id
    LEFT JOIN cf_employees_addresses adr ON emp.id = adr.employee_id;


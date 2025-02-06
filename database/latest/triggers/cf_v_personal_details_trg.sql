create or replace TRIGGER CF_V_PERSONAL_DETAILS_TRG 
INSTEAD OF INSERT OR UPDATE ON CF_V_PERSONAL_DETAILS 
BEGIN
  IF updating THEN    
    UPDATE cf_employees
       SET language = :new.language
         , start_date = :new.start_date
         , birthdate = :new.birthdate
         , employee_email = :new.employee_email
         , offboarding_date = :new.offboarding_date
     WHERE id = :old.id;
        
    MERGE INTO cf_employees_addresses empadd
    USING (SELECT id employee_id
             FROM cf_employees
             WHERE id = :new.id) emp
    ON (empadd.employee_id = emp.employee_id)
    WHEN MATCHED THEN 
      UPDATE 
         SET street = :new.street
           , house_number = :new.house_number
           , zipcode = :new.zipcode
           , country = :new.country
           , city = :new.city
           , telephone = :new.telephone
       WHERE id = empadd.id
    WHEN NOT MATCHED THEN 
      INSERT(employee_id, street, house_number, zipcode, city, country, telephone)
      VALUES (emp.employee_id, :new.street, :new.house_number, :new.zipcode, :new.city, :new.country, :new.telephone);
  END IF;
END;
create or replace trigger cf_training_employees_biu
    before insert or update 
    on cf_training_employees
    for each row
begin
    if inserting then
        :new.created_on := sysdate;
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.modified_on := sysdate;
    :new.modified_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
end cf_training_employees_biu;
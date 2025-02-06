create or replace trigger cf_lov_values_trg
    before insert or update 
    on cf_lov_values
    for each row
begin
  if inserting then
    :new.created_on := sysdate; 
    :new.created_by := upper(coalesce(sys_context('APEX$SESSION','APP_USER'),user));
  end if;
    :new.modified_on := sysdate;
    :new.modified_by := upper(coalesce(sys_context('APEX$SESSION','APP_USER'),user));
end cf_lov_values_trg;

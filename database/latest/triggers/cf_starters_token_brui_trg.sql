create or replace trigger cf_starters_token_trg
    before insert 
    on cf_starters
    for each row 
begin
    :new.token := (sys_guid());
end cf_starters_token_trg;


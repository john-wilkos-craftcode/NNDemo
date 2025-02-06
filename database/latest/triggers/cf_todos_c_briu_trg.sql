create or replace TRIGGER cf_todos_c_trg
    after insert 
    on cf_todos
    for each row
declare
    v_check number := null;
begin
 for cur_r in (select * from cf_starters)
 loop
    select nvl((select todo_id from cf_todos_starters where starter_id = cur_r.id and todo_id = :new.id), null) into v_check from dual;
    if v_check is null then
        insert into cf_todos_starters(TODO_ID,STARTER_ID,CHECKED) values (:new.id,cur_r.id,0);
    end if;
 end loop;
end cf_todos_c_trg;
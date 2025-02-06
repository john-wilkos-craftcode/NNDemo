create or replace trigger cf_todos_starters_c_trg
  before update on cf_todos_starters
  for each row
declare
  l_user varchar2(200 CHAR) := nvl(v('APP_USER'), user);
begin
    if :new.checked = 1 and nvl(:old.checked,0) = 0 then
    :new.completed_by := l_user;
    :new.completed_on := sysdate;
    end if;
end cf_todos_starters_c_trg;
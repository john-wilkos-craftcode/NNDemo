set serveroutput on

declare
begin
   -- Publish the different languages for each application
   for w in (select workspace_id, workspace
               from apex_workspaces
              where workspace in ('NNDEMO')) 
   loop
      -- Set environment for each workspace
      apex_util.set_security_group_id( w.workspace_id );
      -- Loop the applications for this workspace
      for a in (select app.alias, app.application_id, atm.translated_app_language
                  from apex_applications app
                   inner join apex_application_trans_map atm on atm.primary_application_id=app.application_id
                  where app.workspace = w.workspace)
      loop
         -- Per application language, perform the publish operation
         apex_lang.publish_application(
            p_application_id => a.application_id
            , p_language => a.translated_app_language
         );
         dbms_output.put_line('Publishing '||a.translated_app_language||' for application '||a.alias||' in workspace '||w.workspace||'.');
      end loop;
   end loop;
   commit;
end;
/

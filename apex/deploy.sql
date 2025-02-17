begin
    apex_application_install.set_workspace('NNDEMO');
    -- FrontOffice
    apex_application_install.set_application_id(131);
    apex_application_install.set_auto_install_sup_obj(p_auto_install_sup_obj => false );
    apex_application_install.generate_offset();

end;
/
@f131/f131.sql

begin
    apex_application_install.set_workspace('NNDEMO');
    -- Backoffice
    apex_application_install.set_application_id(103);
    apex_application_install.set_auto_install_sup_obj(p_auto_install_sup_obj => false );
    apex_application_install.generate_offset();
     --   apex_application_install.set_authentication_scheme(p_name => 'AzureAD_QA_SSO');
end;
/
@f103/f103.sql

exit;
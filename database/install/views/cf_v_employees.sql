CREATE OR REPLACE VIEW cf_v_employees AS 
  SELECT internalid
       , givenname
       , familyname
       , email
       , apex_string.join(companies, ', ') as companies
       , apex_string.join(groups, ', ') as groups
       , active
       , payroll_company
       , employee_type
       , availability_emp
       , ctb_cv.cv_centerfield.get_function(p_email => email) cv_function
    FROM TABLE (ctb_user_mgmt.idcs_pkg.users)
/

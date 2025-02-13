CREATE OR REPLACE PACKAGE BODY pck_authentication AS  
  FUNCTION token_authentication (
    p_username IN VARCHAR2,
    p_password IN VARCHAR2)
  RETURN BOOLEAN
  IS 

  BEGIN

    if p_username = 'filip'
    then
        return true;
    else
        return false;
    end if;
  END token_authentication;

END;
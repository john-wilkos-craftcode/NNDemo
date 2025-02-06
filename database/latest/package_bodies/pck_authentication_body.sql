CREATE OR REPLACE PACKAGE BODY pck_authentication AS  
  FUNCTION token_authentication (
    p_username IN VARCHAR2,
    p_password IN VARCHAR2)
  RETURN BOOLEAN
  IS 
    l_token cf_starters.token%type := upper(p_username);
    l_id cf_starters.id%type;

  BEGIN
    BEGIN
      SELECT id, token
      INTO l_id, l_token
      FROM cf_starters
      WHERE token = l_token;
      EXCEPTION WHEN no_data_found THEN
      l_token := '-invalid-';
    END;

    RETURN l_token = p_username;
    END;
END;
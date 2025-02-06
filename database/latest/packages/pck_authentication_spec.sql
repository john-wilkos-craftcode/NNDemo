CREATE OR REPLACE PACKAGE pck_authentication AS 
  FUNCTION token_authentication (
    p_username in varchar2,
    p_password in varchar2)
  RETURN boolean;
END pck_authentication;
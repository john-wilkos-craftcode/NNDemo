CREATE OR REPLACE PACKAGE BODY pck_utils AS  
  FUNCTION betwnstr (
    p_string IN VARCHAR2,
    p_start_pos IN NUMBER, 
    p_end_pos IN NUMBER) 
  RETURN VARCHAR2
  IS 
  
  BEGIN
  RETURN substr( p_string, p_start_pos, p_end_pos - p_start_pos );
  END;
END;
CREATE OR REPLACE PACKAGE pck_utils AS 
  FUNCTION betwnstr (
    p_string VARCHAR2, p_start_pos NUMBER, p_end_pos NUMBER )
  RETURN VARCHAR2;
END pck_utils;

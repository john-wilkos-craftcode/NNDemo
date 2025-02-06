INSERT INTO cf_employees (user_mgm_id, employee_email, language)
SELECT internalid
     , email
     , (SELECT lval.id FROM cf_lov_values lval JOIN cf_lov_domains ldom ON (ldom.id = lval.fk_lov_domain_id) WHERE lval.code = 'NL' AND ldom.code = 'STARTER_LANG')
  FROM cf_v_employees
  WHERE active = 'true';
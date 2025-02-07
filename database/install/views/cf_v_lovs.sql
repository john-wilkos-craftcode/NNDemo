create or replace view cf_v_lovs
as
select l.id 			lov_id
     , l.lov_value 		lov_value
     , l.code 			lov_code
     , d.domain_name 	dom_name
     , d.code 			dom_code
  from cf_lov_values l
    join cf_lov_domains d on d.id = l.fk_lov_domain_id
   where l.is_active
create or replace procedure send_push_notif 
( p_subscription in varchar2,
                            p_title        in varchar2,
                            p_body         in varchar2,
                             p_url         in varchar2
) is

l_rest_return clob;
l_userid number;
begin
l_rest_return := apex_web_service.make_rest_request(
    p_url => 'ctb-dev-app03.cbtdevprivsubn.ctbdevvcn.oraclevcn.com:5050/push' -- My custom REST endpoint (1)
, p_http_method => 'GET'
, p_parm_name => apex_util.string_to_table('title#111#body#111#url#111#subscription','#111#') -- Notification structure (2)
, p_parm_value => apex_util.string_to_table( p_title || '#111#'|| p_body ||'#111#'|| p_url||'#111#'|| p_subscription,'#111#') -- Notification Content (3)
);
end ;

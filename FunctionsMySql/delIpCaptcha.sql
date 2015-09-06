CREATE FUNCTION delIpCaptcha(ip varchar(20))
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

delete from visitorwhitelist
where  visitip=ip;

set dados   = "Tabela catalogo Atualizada!";
	  
RETURN dados;
end;
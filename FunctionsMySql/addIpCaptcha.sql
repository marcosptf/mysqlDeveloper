CREATE FUNCTION addIpCaptcha(ip varchar(20), motivo int(1))
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);
set dados   = "Tabela catalogo Atualizada!";
set motivo1 = "Ambiente de rede local";
set motivo2 = "Liberar acesso de usuário no site";
set motivo3 = "Outros motivos";
set motivo4 := motivo1;

if(motivo=1){
    motivo4 := motivo1;
}else if(motivo=2){
    motivo4 := motivo2;
}else if(motivo=3){
   motivo4  := motivo3;
}

insert into visitorwhitelist(visitip,visitobs)VALUES(ip,motivo4);

	  
RETURN dados;
end;
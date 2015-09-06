delimiter //
CREATE FUNCTION removeusuarionet(email varchar(50),fogbugs varchar(10))
RETURNS varchar(255)

deterministic
begin
declare dados,dados1,dados2,dados3,dados4,dados5 varchar(255);

select idclients into dados from tssfixo_br.clients where mail=email;

update  tssfixo_br.clients 
set     mail  = concat(mail,'-',fogbugs),
        mail2 = concat(mail,'-',fogbugs),
        login = concat(login,'-',fogbugs),
        rut  = concat(rut,'-',fogbugs) 
where   idclients in 
        (
        select      idclients 
        from        tssfixo_br.clients 
        where       mail=email);

select mail  into dados1 from tssfixo_br.clients where idclients=dados;
select mail2 into dados2 from tssfixo_br.clients where idclients=dados;
select login into dados3 from tssfixo_br.clients where idclients=dados;
select rut  into dados4 from tssfixo_br.clients where idclients=dados;

set dados5 = concat('Usuario removido => mail:',dados1,' ','mail2:',dados2,' ','login:',dados3,' ','rut:',rut);

RETURN dados5;
end //
delimiter ;

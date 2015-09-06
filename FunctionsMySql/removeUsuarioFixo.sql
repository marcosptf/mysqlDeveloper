set @email   = 'dentist190184@claro.net.do';
set @fogbugs  = 'FB#16526';
set @idClient = (select idclients  from clients where mail in (select @email));

update      clients 
set         mail=concat(mail,'-' ,(select @fogbugs)),
            mail2=concat(mail,'-' ,(select @fogbugs)),
            login=concat(login,'-',(select @fogbugs)),
            rut=concat(rut,'-'  ,(select @fogbugs)) 
where       mail = (select @email);

select * from clients where idclients = (select @idClient);

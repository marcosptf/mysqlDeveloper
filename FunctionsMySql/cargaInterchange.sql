/********Tratamento de dados*********/
select corrigePartnumber();select * from rpm_homolex.interchange_debug;
update interchange_debug AS rc,marca AS mc SET rc.c =mc.marca_id WHERE lower(trim(rc.c))=lower(trim(mc.nome));
update interchange_debug set c=202 where c='VED';
update interchange_debug set c=224 where c='SAB';
select * from rpm_homolex.interchange_debug group by c;
select * from marca where nome like '%rpm%';
select * from fornecedor where nome like '%Transmissão%';
INSERT INTO marca(nome)VALUE('Hallite');

select a,substring(a,2,(length(a)-1)) from interchange_debug where a regexp '^[^1-9]|[a-z]';
select substring('javascript',2,9);
select * from rpm_homolex.interchange_debug;

#paker=>1662 agel=>1663 seal=>146 sab=>224 usa=>606
/******************DEPLOY************/
delete from interchange_debug where a='M M';
delete from interchange_debug where a='Eixo';
delete from interchange_debug where a='' and b='' and c='' and d='' and e='' and f='' and g='' and h='';
update interchange_debug set p='' where p like '%S/ CONV%';
update interchange_debug set p=replace(p,'(Duplicidade)','') where lower(p) like '%duplicidade%';
update interchange_debug set p='' where lower(p) like '%alemanha%';
select * from rpm_homolex.interchange_debug;

insert into interchange_dev(I_id,puA,marca_idA,puB,marca_idB,origem) select (select seq('interchange_dev')),concat(p,' ',q),111,concat(o,' ',h),224,'2012-09-19 Conversçao SKF para SABO-ORIGINAL.xls' from interchange_debug; 
/*
insert into interchange_dev(I_id,puA,marca_idA,puB,marca_idB,origem) select (select seq('interchange_dev')),concat(a,' ',b),202,d,224,'Planilha 2012-09-10-Planilha Interchanges - 2012-09-10-ORIGINAL.xls' from interchange_debug; 
insert into interchange_dev(I_id,puA,marca_idA,puB,marca_idB,origem) select (select seq('interchange_dev')),concat(a,' ',b),202,e,111,'Planilha 2012-09-10-Planilha Interchanges - 2012-09-10-ORIGINAL.xls' from interchange_debug;
insert into interchange_dev(I_id,puA,marca_idA,puB,marca_idB,origem) select (select seq('interchange_dev')),concat(a,' ',b),202,f,606,'Planilha 2012-09-10-Planilha Interchanges - 2012-09-10-ORIGINAL.xls' from interchange_debug;

insert into interchange_dev(I_id,puA,marca_idA,puB,marca_idB,origem) select (select seq('interchange_dev')),concat(a,' ',b),c,d,224,'Planilha 2012-09-10-Planilha Interchanges - 2012-09-10-ORIGINAL.xls' from interchange_debug;
insert into interchange_dev(I_id,puA,marca_idA,puB,marca_idB,origem) select (select seq('interchange_dev')),concat(a,' ',b),c,e,1663,'Planilha 2012-09-10-Planilha Interchanges - 2012-09-10-ORIGINAL.xls' from interchange_debug;
insert into interchange_dev(I_id,puA,marca_idA,puB,marca_idB,origem) select (select seq('interchange_dev')),concat(a,' ',b),c,f,111,'Planilha 2012-09-10-Planilha Interchanges - 2012-09-10-ORIGINAL.xls' from interchange_debug;
insert into interchange_dev(I_id,puA,marca_idA,puB,marca_idB,origem) select (select seq('interchange_dev')),concat(a,' ',b),c,g,606,'Planilha 2012-09-10-Planilha Interchanges - 2012-09-10-ORIGINAL.xls' from interchange_debug;
*/
truncate table interchange_debug;
select * from rpm_homolex.interchange_debug;
#1.752.100
delete from rpm_homolex.interchange_dev where pua is null or pua='' or pua='N/T' or pub is null or pub='' or pub='N/T';
select count(*) from rpm_homolex.interchange_dev;
#1.727.317
select * from rpm_homolex.interchange_dev group by origem;
select count(*) from rpm_homolex.interchange_dev where pua is null or pua='' or pub is null or pub='' or pub='N/T';
update rpm_homolex.interchange_dev set marca_ida=202 where marca_ida=111 and marca_idb=111;
select * from rpm_homolex.interchange_dev;



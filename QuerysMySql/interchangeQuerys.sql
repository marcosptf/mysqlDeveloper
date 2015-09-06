/********verificação se ja existe estes pus em pecas*********/
SELECT * FROM interchange_debug where f is null or f='';
SELECT * FROM interchange_dev group by origem;
SELECT * FROM interchange_dev_skf group by origem;
SELECT * FROM interchange_debug group by f;
SELECT * FROM rc_marca_depara;
select current_timestamp;
/*
Mapeamento de colunas carga SKF
a=>marca concorrente
b=>pn concorrente
c=>pn skf
d=>obs
e=>marca_id skf
f=>marca_id concorrente
g=>pu concorrente
h=>pu skf
*/


/********Tratamento de dados*********/
#select corrigePartnumber();select * from interchange_debug;
select count(*) from marca;
alter table marca add carga_id int(5);
insert into marca(nome)VALUE('AFB');
insert into marca(nome)VALUE('APS');
insert into marca(nome)VALUE('AUG');
insert into marca(nome)VALUE('BDN');
insert into marca(nome)VALUE('BRT');
insert into marca(nome)VALUE('BST');
insert into marca(nome)VALUE('CAP');
insert into marca(nome)VALUE('CKB');
insert into marca(nome)VALUE('CLH');
insert into marca(nome)VALUE('CUG');
insert into marca(nome)VALUE('CWB');
insert into marca(nome)VALUE('DKP');
insert into marca(nome)VALUE('DOD');
insert into marca(nome)VALUE('EVR');
insert into marca(nome)VALUE('FLU');
insert into marca(nome)VALUE('FMO');
insert into marca(nome)VALUE('GKN');
insert into marca(nome)VALUE('GLH');
insert into marca(nome)VALUE('HBB');
insert into marca(nome)VALUE('HKZ');
insert into marca(nome)VALUE('HLD');
insert into marca(nome)VALUE('HOF');
insert into marca(nome)VALUE('HOV');
insert into marca(nome)VALUE('HRE');
insert into marca(nome)VALUE('HUN');
insert into marca(nome)VALUE('HXB');
insert into marca(nome)VALUE('IHG');
insert into marca(nome)VALUE('JOM');
insert into marca(nome)VALUE('JSB');
insert into marca(nome)VALUE('KAC');
insert into marca(nome)VALUE('KDN');
insert into marca(nome)VALUE('LBT');
insert into marca(nome)VALUE('LFK');
insert into marca(nome)VALUE('LSC');
insert into marca(nome)VALUE('MCG');
insert into marca(nome)VALUE('MOS');
insert into marca(nome)VALUE('MPL');
insert into marca(nome)VALUE('MPS');
insert into marca(nome)VALUE('MQP');
insert into marca(nome)VALUE('NDA');
insert into marca(nome)VALUE('NDC');
insert into marca(nome)VALUE('NHC');
insert into marca(nome)VALUE('NHP');
insert into marca(nome)VALUE('OIL');
insert into marca(nome)VALUE('OKS');
insert into marca(nome)VALUE('OMB');
insert into marca(nome)VALUE('PAV');
insert into marca(nome)VALUE('PBE');
insert into marca(nome)VALUE('PEE');
insert into marca(nome)VALUE('PTW');
insert into marca(nome)VALUE('QHZ');
insert into marca(nome)VALUE('RAM');
insert into marca(nome)VALUE('RWY');
insert into marca(nome)VALUE('SBL');
insert into marca(nome)VALUE('SFR');
insert into marca(nome)VALUE('SNF');
insert into marca(nome)VALUE('SPI');
insert into marca(nome)VALUE('SSB');
insert into marca(nome)VALUE('STE');
insert into marca(nome)VALUE('SUA');
insert into marca(nome)VALUE('TAT');
insert into marca(nome)VALUE('TEM');
insert into marca(nome)VALUE('TOH');
insert into marca(nome)VALUE('TTB');
insert into marca(nome)VALUE('WBZ');
insert into marca(nome)VALUE('WIC');
insert into marca(nome)VALUE('WIT');
insert into marca(nome)VALUE('WPB');
insert into marca(nome)VALUE('YSH');
insert into marca(nome)VALUE('ZXZ');
insert into marca(nome)VALUE('UNP');
insert into marca(nome)VALUE('ROTHE_ERDE');
create index i4 on interchange_debug (a,b,c);
delete from interchange_debug where a='marca_concorrente';
update interchange_debug AS rc,marca AS mc SET rc.f=mc.marca_id WHERE lower(trim(rc.a))=lower(trim(mc.nome));
update interchange_debug AS rc,rc_marca_depara AS mc SET rc.f=mc.marca_id WHERE lower(trim(rc.a))=lower(trim(mc.variacao));
update interchange_debug AS rc SET rc.e=111;
update interchange_debug AS rc SET rc.g=geraPU(geraPUC(b));
update interchange_debug AS rc SET rc.h=geraPU(geraPUC(c));
delete from interchange_debug where a='' and b='' and c='' and d='' and f=null and g='' and h='';
delete from interchange_debug where a='*) Deviations or important information exist! Click on link for details.';
delete from interchange_debug where a='**) The Product is Obsolete. If volume demand is high, please contact the Product Division.';
delete from interchange_debug where a='Did you mean R, S?';
delete from interchange_debug where a='Results 100001-189357 of 189357 results.';

delete from interchange_dev where data_cadastro > '2012-10-15 00:00:00';
truncate table interchange_dev_skf;
insert into interchange_dev_skf(I_id,puA,marca_idA,puB,marca_idB,pnA,pnB,origem) 
select 
(select seq('interchange_dev')),g,f,h,e,b,c,'Interchance SKF 100.000 _ final.CSV e Interchance SKF 1_100.000.csv 11-10-2012' 
from interchange_debug;

select * FROM interchange_dev_skf;




select 
    a as marca,
    GROUP_CONCAT(DISTINCT b ORDER BY b DESC SEPARATOR '    ') as partnumberMarca,
    GROUP_CONCAT(DISTINCT c ORDER BY c DESC SEPARATOR '    ') as partnumberSKF    
from
    interchange_debug
where
    (f is null or f = '') and a <> '' and b <> '' and c <> ''
group by a; 

select * from marca where nome like '%rpm%';
select * from fornecedor where nome like '%Transmissão%';
INSERT INTO marca(nome)VALUE('Hallite');

insert into interchange_dev(I_id,puA,marca_idA,puB,marca_idB,origem) select (select seq('interchange_dev')),concat(p,' ',q),111,concat(o,' ',h),224,'2012-09-19 Conversçao SKF para SABO-ORIGINAL.xls' from interchange_debug; 
select * from rpm_homolex.interchange_dev;



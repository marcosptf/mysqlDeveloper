/* exemplo de como criar create table no mysql/mariadb  */
use test;create table `test.xmlsend` (`id` int(5) not null primary key auto_increment,`xmlsend` text,`xmldate` timestamp not null default current_timestamp,`xmlsent` int(1) not null default 0);show create table `test.xmlsend`;   


SELECT count(cc.cotacao_id) as totalItens FROM cotacao as ct INNER JOIN cotacao_itens AS cc ON ct.cotacao_id=cc.cotacao_id;
select          count(ct.cotacao_id) as totalItens 
FROM            cotacao as ct 
where           (ct.cotacao_id) in
                (select     cc.cotacao_id
                from        cotacao_itens as cc);
//29.822
//13.230

select ((SELECT count(ct.cotacao_id) as totalItens FROM cotacao as ct INNER JOIN cotacao_itens AS cc ON ct.cotacao_id=cc.cotacao_id) /50 );
select (count(SELECT ct.cotacao_id as totalItens FROM cotacao as ct INNER JOIN cotacao_itens AS cc ON ct.cotacao_id=cc.cotacao_id group by ct.cotacao_id) /50 );
select (count(SELECT count(*) as totalItens FROM cotacao) /50 );


SELECT rr.pn, rr.marca, rr.sigla_bearing, rr.qtd_estoqueBR, rr.fornecedoresBR,rr.qtd_estoqueExterior,rr.fornecedoresExterior,rri.pn_inter,rri.marca_inter, rri.qtd_estoqueBR_inter,rri.fornecedoresBR_inter,rri.qtd_estoqueExterior_inter,rri.fornecedoresExterior_inter 
FROM rel_raridade rr 
LEFT JOIN rel_raridade_interchange rri ON (rri.pu=rr.pu AND rri.marca_id=rr.marca_id) 
HAVING rr.qtd_estoqueBR > 0 OR rri.qtd_estoqueBR_inter >0;



/* descobrir marca */
SELECT * FROM marca WHERE lower(nome) LIKE '%uem%';

UPDATE rpm_cargas.cargaestoque SET marca_id='1107' WHERE UPPER(marca_id)='CASE';
UPDATE rpm_cargas.cargaestoque SET marca_id='231' WHERE UPPER(marca_id)='DURKOOPP';
UPDATE rpm_cargas.cargaestoque SET marca_id='1107' WHERE UPPER(marca_id)='ES';
UPDATE rpm_cargas.cargaestoque SET marca_id='1107' WHERE UPPER(marca_id)='INDEL';
UPDATE rpm_cargas.cargaestoque SET marca_id='1107' WHERE UPPER(marca_id)='LRT';
UPDATE rpm_cargas.cargaestoque SET marca_id='1107' WHERE UPPER(marca_id)='MACK';
UPDATE rpm_cargas.cargaestoque SET marca_id='1107' WHERE UPPER(marca_id)='marca_id';
UPDATE rpm_cargas.cargaestoque SET marca_id='1107' WHERE UPPER(marca_id)='NILOS';
UPDATE rpm_cargas.cargaestoque SET marca_id='1107' WHERE UPPER(marca_id)='ORANGE';
UPDATE rpm_cargas.cargaestoque SET marca_id='1107' WHERE UPPER(marca_id)='RIP';
UPDATE rpm_cargas.cargaestoque SET marca_id='1107' WHERE UPPER(marca_id)='STEWAK';
UPDATE rpm_cargas.cargaestoque SET marca_id='128' WHERE UPPER(marca_id)='FAG/SRO';
UPDATE rpm_cargas.cargaestoque SET marca_id='388' WHERE UPPER(marca_id)='GLACIER';
UPDATE rpm_cargas.cargaestoque SET marca_id='407' WHERE UPPER(marca_id)='NBB';
UPDATE rpm_cargas.cargaestoque SET marca_id='528' WHERE UPPER(marca_id)='THOMPSON';
UPDATE rpm_cargas.cargaestoque SET marca_id='649' WHERE UPPER(marca_id)='U&M';




INSERT INTO rpm_cargas.marca(nome)VALUE('ALPHA');
INSERT INTO rpm_cargas.marca(nome)VALUE('DKE');
INSERT INTO rpm_cargas.marca(nome)VALUE('FKS');
INSERT INTO rpm_cargas.marca(nome)VALUE('IBF');
INSERT INTO rpm_cargas.marca(nome)VALUE('NKD');
INSERT INTO rpm_cargas.marca(nome)VALUE('RBS');
INSERT INTO rpm_cargas.marca(nome)VALUE('RCK');
INSERT INTO rpm_cargas.marca(nome)VALUE('RHB');
INSERT INTO rpm_cargas.marca(nome)VALUE('RKC');
INSERT INTO rpm_cargas.marca(nome)VALUE('TOYOTA');


INSERT INTO rpm_cargas.marca(nome)VALUE('ASKUBAL');
INSERT INTO rpm_cargas.marca(nome)VALUE('BORG WARNER');
INSERT INTO rpm_cargas.marca(nome)VALUE('ERIKS');
INSERT INTO rpm_cargas.marca(nome)VALUE('GEA');
INSERT INTO rpm_cargas.marca(nome)VALUE('GWB');
INSERT INTO rpm_cargas.marca(nome)VALUE('HESS-BRIGHT');
INSERT INTO rpm_cargas.marca(nome)VALUE('ITL');
INSERT INTO rpm_cargas.marca(nome)VALUE('LIBE');
INSERT INTO rpm_cargas.marca(nome)VALUE('MAHR');
INSERT INTO rpm_cargas.marca(nome)VALUE('METAFRAM');
INSERT INTO rpm_cargas.marca(nome)VALUE('MINEBEA');
INSERT INTO rpm_cargas.marca(nome)VALUE('NEUWEG');
INSERT INTO rpm_cargas.marca(nome)VALUE('OSBORN');
INSERT INTO rpm_cargas.marca(nome)VALUE('RCS');
INSERT INTO rpm_cargas.marca(nome)VALUE('SARMA');
INSERT INTO rpm_cargas.marca(nome)VALUE('SFRM');
INSERT INTO rpm_cargas.marca(nome)VALUE('SPICER');
INSERT INTO rpm_cargas.marca(nome)VALUE('TBV');
INSERT INTO rpm_cargas.marca(nome)VALUE('TESCUBAL');
INSERT INTO rpm_cargas.marca(nome)VALUE('YFB');



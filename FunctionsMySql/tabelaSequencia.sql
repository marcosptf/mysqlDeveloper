/*******************************************************************************
*       Criação da Tabela de Sequencia
********************************************************************************/

/* criação da tabela de sequencia */
CREATE TABLE `seq` (
  `name` varchar(20) NOT NULL,
  `val` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=innoDB DEFAULT CHARSET=utf8;


/* criação da funcao de sequencia */
drop function if exists seq;
create function seq(seq_name char (20)) 
returns int
deterministic

begin

 declare count1,count2,count3 int; 
 select val into count1 from seq where name=seq_name; 
 set count2=if(count1='' or count1 is null or count1<1,'1',count1+1); 
 update seq set val=count2 where name=seq_name;  
 select val into count3 from seq where name=seq_name; 
 return count3;

end;

/* insere na tabela de sequencia o nome da tabela que precisa de auto increment */
truncate table seq;
select * from seq;
insert into seq values('cotacao',0);


/* chamada da funcao para retornar o ultimo id, se passa por parametro o nome da tabela que deseja o retorno do id */
select seq('tabelaCotacao');




/*******************************************************************************
*       Criação da Tabela de Sequencia item
********************************************************************************/
/* criação da tabela de sequencia */
drop table if exists seq_item;
CREATE TABLE `seq_item` (
  `chave1` varchar (100) NOT NULL,
`name` varchar(20) NOT NULL,
  `val` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`chave1`,`name`)
)ENGINE=innoDB DEFAULT CHARSET=utf8;


/* criação da funcao de sequencia item */
drop function if exists seq_item;
create function seq_item(seq_chave1 char (100), seq_name char (20)) 
returns int
begin

 declare count1,count2,count3 int; 
 select val into count1 from seq_item where chave1=seq_chave1 and name=seq_name;
 set count2=if(count1='' or count1 is null or count1<1,'1',count1+1); 
 update seq_item set val=count2 where chave1=seq_chave1 and name=seq_name;
 select val into count3 from seq_item where chave1=seq_chave1 and name=seq_name;
 return count3;

end;

/* inserindo o primeiro item e chamando a funcao */
insert into seq_item values('tabelaCotacao','1',0);
select seq_item('tabelaCotacao','1');



USE [Production]
GO

/****** Object:  Index [nrc]    Script Date: 14/11/2014 10:44:58 ******/
CREATE NONCLUSTERED INDEX [nrc] ON [dbo].[atualizar_email]
(
	[NRC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


sp_rename PIUsuario, PIUsuarioBK;
go

CREATE TABLE [dbo].[PIUsuario](
	[USERID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Grupo] [nvarchar](50) NULL,
	[CPF] [decimal](18, 0) NULL,
	[TipoUsuario] [nvarchar](50) NULL,
	[Data] [datetime] NULL
) ON [PRIMARY]
GO
insert into PIUsuario
(Nome,Login,Grupo,CPF,TipoUsuario,Data)
select
Nome,Login,Grupo,CPF,TipoUsuario,Data
from PIUsuarioBK;
GO
select count(*) from PIUsuario;
GO
select count(*) from PIUsuarioBK;
GO


sp_rename SpeedyAFO, SpeedyAFOBK;
go
CREATE TABLE [dbo].[SpeedyAFO](
	[AFOID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[AFOSEQ] [decimal](18, 0) NULL,
	[DataEmissao] [datetime] NULL,
	[Arquivo] [varchar](50) NULL,
	[Nome] [char](10) NULL,
	[StatusArquivo] [nvarchar](50) NULL,
	[StatusErro] [nvarchar](500) NULL
) ON [PRIMARY]
GO


insert into SpeedyAFO
(AFOSEQ,DataEmissao,Arquivo,Nome,StatusArquivo,StatusErro)
select 
AFOSEQ,DataEmissao,Arquivo,Nome,StatusArquivo,StatusErro
from SpeedyAFOBK;
go
select count(*) from SpeedyAFO;
GO
select count(*) from SpeedyAFOBK;
go

sp_rename SpeedyAFOExportado, SpeedyAFOExportadoBK;
go
CREATE TABLE [dbo].[SpeedyAFOExportado](
	[AFOEXID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Arquivo] [nvarchar](50) NULL,
	[Vencimento] [nvarchar](50) NULL,
	[DataLimiteInicial] [datetime] NULL,
	[CodEmp] [nvarchar](50) NULL,
	[TpServico] [nvarchar](50) NULL,
	[DataEvento] [nvarchar](50) NULL,
	[Filler1] [nvarchar](50) NULL,
	[DDD] [nvarchar](50) NULL,
	[PrefixoCentral] [nvarchar](50) NULL,
	[Milhar] [nvarchar](50) NULL,
	[Conjugado] [nvarchar](50) NULL,
	[Val] [nvarchar](50) NULL,
	[Ref] [nvarchar](50) NULL,
	[Parcela] [nvarchar](50) NULL,
	[Volume] [nvarchar](50) NULL,
	[Duracao] [nvarchar](50) NULL,
	[Filler2] [nvarchar](50) NULL,
	[Redebito] [nvarchar](50) NULL,
	[CodigoServico] [nvarchar](50) NULL
) ON [PRIMARY]
GO

insert into SpeedyAFOExportado
(Arquivo,Vencimento,DataLimiteInicial,CodEmp,TpServico,DataEvento,Filler1,DDD,PrefixoCentral,Milhar,Conjugado,Val,Ref,Parcela,Volume,Duracao,Filler2,Redebito,CodigoServico)
select
Arquivo,Vencimento,DataLimiteInicial,CodEmp,TpServico,DataEvento,Filler1,DDD,PrefixoCentral,Milhar,Conjugado,Val,Ref,Parcela,Volume,Duracao,Filler2,Redebito,CodigoServico
from
SpeedyAFOExportadoBK;
go
select count(*) from dbo.OASISDevolutivaSenarcAssist;
GO
select count(*) from dbo.OASISDevolutivaSenarcAssistBK;
go


/****** Object:  Index [afoexid]    Script Date: 14/11/2014 11:02:55 ******/
CREATE NONCLUSTERED INDEX [afoexid] ON [dbo].[SpeedyAFOExportado]
(
	[AFOEXID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


sp_rename SpeedyCritica, SpeedyCriticaBK;
GO
CREATE TABLE [dbo].[SpeedyCritica](
	[CRID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Arquivo] [nvarchar](50) NULL,
	[DownloadTime] [datetime] NULL,
	[afo] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[Critica] [char](80) NULL
) ON [PRIMARY]

GO

insert into SpeedyCritica
(Arquivo,DownloadTime,afo,status,Critica)
select
Arquivo,DownloadTime,afo,status,Critica
from SpeedyCriticaBK;
go
select count(*) from SpeedyCritica;
GO
select count(*) from SpeedyCriticaBK;
go
sp_rename SpeedyCustomers, SpeedyCustomersBK;
GO
CREATE TABLE [dbo].[SpeedyCustomers](
	[CID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[arquivo] [nvarchar](50) NULL,
	[origem] [nvarchar](50) NULL,
	[sequencial] [decimal](18, 0) NULL,
	[customerid] [nvarchar](50) NULL,
	[tipoordem] [nvarchar](50) NULL,
	[data] [datetime] NULL,
	[nome] [nvarchar](60) NULL,
	[email] [nvarchar](70) NULL,
	[emailfake] [nvarchar](70) NULL,
	[emailcliente] [nvarchar](100) NULL,
	[emailflag] [char](2) NULL,
	[senha] [nvarchar](20) NULL,
	[senhafake] [nvarchar](50) NULL,
	[CPF] [nvarchar](50) NULL,
	[nrc] [nvarchar](50) NULL,
	[DDD] [nvarchar](50) NULL,
	[terminal] [nvarchar](50) NULL,
	[tipospeedy] [nvarchar](50) NULL,
	[produto] [nvarchar](50) NULL,
	[periodododesconto] [nvarchar](50) NULL,
	[valordesconto] [decimal](19, 4) NULL,
	[valor] [decimal](19, 4) NULL,
	[datadosistema] [datetime] NULL,
	[dataenviada] [datetime] NULL,
	[operador] [nvarchar](50) NULL,
	[canal] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[DiaVencimento] [decimal](18, 0) NULL,
	[UltimaVerificacao] [datetime] NULL,
	[MensagemVNC] [varchar](500) NULL
) ON [PRIMARY]

GO

insert into SpeedyCustomers
(arquivo,origem,sequencial,customerid,tipoordem,data,nome,email,emailfake,emailcliente,emailflag,senha,senhafake,CPF,nrc,DDD,terminal,tipospeedy,produto,periodododesconto,valordesconto,valor,datadosistema,dataenviada,operador,canal,status,DiaVencimento,UltimaVerificacao,MensagemVNC)
select 
arquivo,origem,sequencial,customerid,tipoordem,data,nome,email,emailfake,emailcliente,emailflag,senha,senhafake,CPF,nrc,DDD,terminal,tipospeedy,produto,periodododesconto,valordesconto,valor,datadosistema,dataenviada,operador,canal,status,DiaVencimento,UltimaVerificacao,MensagemVNC
from SpeedyCustomersBK;
go

select count(*) from SpeedyCustomers;
GO
select count(*) from SpeedyCustomersBK;

go

/****** Object:  Index [Canal]    Script Date: 14/11/2014 11:10:29 ******/
CREATE NONCLUSTERED INDEX [Canal] ON [dbo].[SpeedyCustomers]
(
	[canal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [CID]    Script Date: 14/11/2014 11:10:44 ******/
CREATE NONCLUSTERED INDEX [CID] ON [dbo].[SpeedyCustomers]
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [data]    Script Date: 14/11/2014 11:10:56 ******/
CREATE NONCLUSTERED INDEX [data] ON [dbo].[SpeedyCustomers]
(
	[data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [ddd]    Script Date: 14/11/2014 11:11:08 ******/
CREATE NONCLUSTERED INDEX [ddd] ON [dbo].[SpeedyCustomers]
(
	[DDD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [DiaVencimento]    Script Date: 14/11/2014 11:11:19 ******/
CREATE NONCLUSTERED INDEX [DiaVencimento] ON [dbo].[SpeedyCustomers]
(
	[DiaVencimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [NRC]    Script Date: 14/11/2014 11:11:31 ******/
CREATE NONCLUSTERED INDEX [NRC] ON [dbo].[SpeedyCustomers]
(
	[nrc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [produto+diavencimento]    Script Date: 14/11/2014 11:11:43 ******/
CREATE NONCLUSTERED INDEX [produto+diavencimento] ON [dbo].[SpeedyCustomers]
(
	[produto] ASC,
	[DiaVencimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


sp_rename SpeedyEmail, SpeedyEmailBK;
go
CREATE TABLE [dbo].[SpeedyEmail](
	[SEMID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[NomeArquivo] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Enviados] [decimal](18, 0) NULL,
	[Atualizacao] [datetime] NULL,
	[Sucesso] [decimal](18, 0) NULL,
	[Erro] [decimal](18, 0) NULL
) ON [PRIMARY]

GO

insert into SpeedyEmail
(NomeArquivo,Status,Enviados,Atualizacao,Sucesso,Erro)
select 
NomeArquivo,Status,Enviados,Atualizacao,Sucesso,Erro
from SpeedyEmailBK;

go

select count(*) from SpeedyEmail;
GO
select count(*) from SpeedyEmailBK;

go

sp_rename SpeedyFiles, SpeedyFilesBK;
go
CREATE TABLE [dbo].[SpeedyFiles](
	[SFID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[NomeArquivo] [nvarchar](50) NULL,
	[NomeGenerico] [nvarchar](50) NULL,
	[sequencial] [decimal](18, 0) NULL,
	[DownloadTime] [datetime] NULL,
	[DownloadStatus] [nvarchar](300) NULL,
	[FTPStatus] [nvarchar](300) NULL,
	[ProcessingStatus] [nvarchar](50) NULL,
	[Registro] [decimal](18, 0) NULL,
	[Sucesso] [decimal](18, 0) NULL,
	[Falhas] [decimal](18, 0) NULL,
	[TipoI] [decimal](18, 0) NULL,
	[TipoC] [decimal](18, 0) NULL,
	[TipoG] [decimal](18, 0) NULL,
	[TipoPV] [decimal](18, 0) NULL,
	[TipoPI] [decimal](18, 0) NULL,
	[Trocas] [decimal](18, 0) NULL,
	[PMISE1] [decimal](18, 0) NULL,
	[PMISE2] [decimal](18, 0) NULL,
	[PMISE3] [decimal](18, 0) NULL,
	[PMISE4] [decimal](18, 0) NULL,
	[PMISE8] [decimal](18, 0) NULL,
	[PMICOP] [decimal](18, 0) NULL,
	[PMIBAS] [decimal](18, 0) NULL
) ON [PRIMARY]

GO

insert into SpeedyFiles
(NomeArquivo,NomeGenerico,sequencial,DownloadTime,DownloadStatus,FTPStatus,ProcessingStatus,Registro,Sucesso,Falhas,TipoI,TipoC,TipoG,TipoPV,TipoPI,Trocas,PMISE1,PMISE2,PMISE3,PMISE4,PMISE8,PMICOP,PMIBAS)
select 
NomeArquivo,NomeGenerico,sequencial,DownloadTime,DownloadStatus,FTPStatus,ProcessingStatus,Registro,Sucesso,Falhas,TipoI,TipoC,TipoG,TipoPV,TipoPI,Trocas,PMISE1,PMISE2,PMISE3,PMISE4,PMISE8,PMICOP,PMIBAS
from SpeedyFilesBK;

go

select count(*) from SpeedyFiles;
GO
select count(*) from SpeedyFilesBK;

go

/****** Object:  Index [NomeArquivo]    Script Date: 14/11/2014 11:18:06 ******/
CREATE NONCLUSTERED INDEX [NomeArquivo] ON [dbo].[SpeedyFiles]
(
	[NomeArquivo] ASC,
	[FTPStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO


sp_rename SpeedyFiltro, SpeedyFiltroBK;

GO

CREATE TABLE [dbo].[SpeedyFiltro](
	[SFID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[DownloadTime] [datetime] NULL,
	[NomeArquivo] [nvarchar](50) NULL,
	[LidosSER] [nvarchar](50) NULL,
	[LidosSVA] [nvarchar](50) NULL,
	[Inclusoes] [nvarchar](50) NULL,
	[Encontrados] [nvarchar](50) NULL,
	[Corrigidos] [nvarchar](50) NULL
) ON [PRIMARY]

GO

insert into SpeedyFiltro
(DownloadTime,NomeArquivo,LidosSER,LidosSVA,Inclusoes,Encontrados,Corrigidos)
select 
DownloadTime,NomeArquivo,LidosSER,LidosSVA,Inclusoes,Encontrados,Corrigidos
from SpeedyFiltroBK;
go
select count(*) from SpeedyFiltro;
GO
select count(*) from SpeedyFiltroBK;
go

sp_rename SpeedyJob, SpeedyJobBK;
GO

CREATE TABLE [dbo].[SpeedyJob](
	[TId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[DataInclusao] [datetime] NULL,
	[Codigo] [decimal](18, 0) NULL,
	[Tipo] [nvarchar](50) NULL,
	[Descricao] [nvarchar](255) NULL,
	[nrc] [nvarchar](50) NULL,
	[OrderID] [nvarchar](50) NULL,
	[CustomerID] [nvarchar](50) NULL,
	[campo] [nvarchar](50) NULL,
	[valor] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[ip] [nvarchar](50) NULL
) ON [PRIMARY]

GO

insert into SpeedyJob
(DataInclusao,Codigo,Tipo,Descricao,nrc,OrderID,CustomerID,campo,valor,status,ip)
select 
DataInclusao,Codigo,Tipo,Descricao,nrc,OrderID,CustomerID,campo,valor,status,ip
from
SpeedyJobBK;
go
select count(*) from SpeedyJob;
GO
select count(*) from SpeedyJobBK;
go
sp_rename SpeedyLog, SpeedyLogBK;
go
CREATE TABLE [dbo].[SpeedyLog](
	[LogID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Secao] [decimal](18, 0) NULL,
	[DataIni] [datetime] NULL,
	[DataFim] [datetime] NULL,
	[Tipo] [nvarchar](500) NULL,
	[nrc] [nvarchar](50) NULL,
	[ip] [nvarchar](50) NULL,
	[origem] [nvarchar](500) NULL
) ON [PRIMARY]

GO

insert into SpeedyLog
(Secao,DataIni,DataFim,Tipo,nrc,ip,origem)
select 
Secao,DataIni,DataFim,Tipo,nrc,ip,origem
from SpeedyLogBK;

go
select count(*) from SpeedyLog;
GO
select count(*) from SpeedyLogBK;
GO

/****** Object:  Index [logid]    Script Date: 14/11/2014 11:28:04 ******/
CREATE NONCLUSTERED INDEX [logid] ON [dbo].[SpeedyLog]
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


sp_rename SpeedyLogEnvio, SpeedyLogEnvioBK;
GO
CREATE TABLE [dbo].[SpeedyLogEnvio](
	[SLEID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DataEnvio] [datetime] NULL,
	[NRC] [nvarchar](50) NULL,
	[MSG] [nvarchar](500) NULL
) ON [PRIMARY]

GO

insert into SpeedyLogEnvio
(DataEnvio,NRC,MSG)
select 
DataEnvio,NRC,MSG
from SpeedyLogEnvioBK;
go

select count(*) from SpeedyLogEnvio;
GO
select count(*) from SpeedyLogEnvioBK;
go
sp_rename SpeedyOrders, SpeedyOrdersBK;
GO
CREATE TABLE [dbo].[SpeedyOrders](
	[ORDERID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[arquivo] [nvarchar](50) NULL,
	[data] [datetime] NULL,
	[Origem] [nvarchar](50) NULL,
	[Sequencial] [decimal](18, 0) NULL,
	[customerid] [nvarchar](50) NULL,
	[TipoOrdem] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[nome] [nvarchar](60) NULL,
	[email] [nvarchar](70) NULL,
	[senha] [nvarchar](20) NULL,
	[CPF] [nvarchar](50) NULL,
	[nrc] [nvarchar](50) NULL,
	[DDD] [nvarchar](50) NULL,
	[terminal] [nvarchar](50) NULL,
	[tipospeedy] [nvarchar](50) NULL,
	[produto] [nvarchar](50) NULL,
	[periodododesconto] [nvarchar](50) NULL,
	[valordesconto] [decimal](19, 4) NULL,
	[valor] [decimal](19, 4) NULL,
	[datadosistema] [datetime] NULL,
	[dataenviada] [datetime] NULL,
	[operador] [nvarchar](50) NULL,
	[canal] [nvarchar](50) NULL,
	[NetSafePOrderID] [nvarchar](50) NULL,
	[NetSafeCustomerID] [nvarchar](50) NULL,
	[NetSafeID] [nvarchar](50) NULL,
	[NetSafeStatus] [nvarchar](50) NULL,
	[NetSafeMensagem] [nvarchar](300) NULL,
	[NetSafeConfirmationNumber] [nvarchar](300) NULL,
	[NetSafeSKU] [nvarchar](50) NULL,
	[NetSafeDataProcessamento] [datetime] NULL,
	[AtivacaoIP] [nvarchar](50) NULL,
	[AtivacaoData] [datetime] NULL,
	[TipoOS] [nvarchar](50) NULL
) ON [PRIMARY]

GO

insert into SpeedyOrders
(arquivo,data,Origem,Sequencial,customerid,TipoOrdem,status,nome,email,senha,CPF,nrc,DDD,terminal,tipospeedy,produto,periodododesconto,valordesconto,valor,datadosistema,dataenviada,operador,canal,NetSafePOrderID,NetSafeCustomerID,NetSafeID,NetSafeStatus,NetSafeMensagem,NetSafeConfirmationNumber,NetSafeSKU,NetSafeDataProcessamento,AtivacaoIP,AtivacaoData,TipoOS)
select 
arquivo,data,Origem,Sequencial,customerid,TipoOrdem,status,nome,email,senha,CPF,nrc,DDD,terminal,tipospeedy,produto,periodododesconto,valordesconto,valor,datadosistema,dataenviada,operador,canal,NetSafePOrderID,NetSafeCustomerID,NetSafeID,NetSafeStatus,NetSafeMensagem,NetSafeConfirmationNumber,NetSafeSKU,NetSafeDataProcessamento,AtivacaoIP,AtivacaoData,TipoOS
from SpeedyOrdersBK;
GO
select count(*) from SpeedyOrders;
GO
select count(*) from SpeedyOrdersBK;
go

/****** Object:  Index [Data]    Script Date: 14/11/2014 11:35:38 ******/
CREATE NONCLUSTERED INDEX [Data] ON [dbo].[SpeedyOrders]
(
	[data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO


/****** Object:  Index [NRC+Arquivo]    Script Date: 14/11/2014 11:35:49 ******/
CREATE NONCLUSTERED INDEX [NRC+Arquivo] ON [dbo].[SpeedyOrders]
(
	[nrc] ASC,
	[arquivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [NRC+Produto]    Script Date: 14/11/2014 11:36:00 ******/
CREATE NONCLUSTERED INDEX [NRC+Produto] ON [dbo].[SpeedyOrders]
(
	[nrc] ASC,
	[produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [OrderID]    Script Date: 14/11/2014 11:36:11 ******/
CREATE NONCLUSTERED INDEX [OrderID] ON [dbo].[SpeedyOrders]
(
	[ORDERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [Status]    Script Date: 14/11/2014 11:36:22 ******/
CREATE NONCLUSTERED INDEX [Status] ON [dbo].[SpeedyOrders]
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO


sp_rename SpeedySER, SpeedySERBK;
GO
CREATE TABLE [dbo].[SpeedySER](
	[SERID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[arquivo] [nvarchar](50) NULL,
	[data] [datetime] NULL,
	[customerid] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[operacao] [char](10) NULL,
	[nome] [nvarchar](60) NULL,
	[nrc] [nvarchar](50) NULL,
	[ddd] [nvarchar](50) NULL,
	[terminal] [nvarchar](50) NULL,
	[CLAPLA] [char](3) NULL,
	[TIPPC1] [char](3) NULL,
	[produto] [char](10) NULL
) ON [PRIMARY]

GO

insert into SpeedySER
(arquivo,data,customerid,Status,operacao,nome,nrc,ddd,terminal,CLAPLA,TIPPC1,produto)
select
arquivo,data,customerid,Status,operacao,nome,nrc,ddd,terminal,CLAPLA,TIPPC1,produto
from SpeedySERBK;
GO
select count(*) from SpeedySER;
GO
select count(*) from SpeedySERBK;
GO

/****** Object:  Index [Arquivo]    Script Date: 14/11/2014 11:41:37 ******/
CREATE NONCLUSTERED INDEX [Arquivo] ON [dbo].[SpeedySER]
(
	[arquivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [data]    Script Date: 14/11/2014 11:41:53 ******/
CREATE NONCLUSTERED INDEX [data] ON [dbo].[SpeedySER]
(
	[data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [nrc+arquivo]    Script Date: 14/11/2014 11:42:11 ******/
CREATE NONCLUSTERED INDEX [nrc+arquivo] ON [dbo].[SpeedySER]
(
	[nrc] ASC,
	[arquivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [nrc-data]    Script Date: 14/11/2014 11:42:29 ******/
CREATE NONCLUSTERED INDEX [nrc-data] ON [dbo].[SpeedySER]
(
	[nrc] ASC,
	[data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [serid]    Script Date: 14/11/2014 11:42:46 ******/
CREATE NONCLUSTERED INDEX [serid] ON [dbo].[SpeedySER]
(
	[SERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [terminal]    Script Date: 14/11/2014 11:42:59 ******/
CREATE NONCLUSTERED INDEX [terminal] ON [dbo].[SpeedySER]
(
	[produto] ASC,
	[ddd] ASC,
	[terminal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


sp_rename SpeedySVA, SpeedySVABK;
GO
CREATE TABLE [dbo].[SpeedySVA](
	[SVAID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[arquivo] [nvarchar](50) NULL,
	[sequencial] [decimal](18, 0) NULL,
	[NomeGenerico] [nvarchar](50) NULL,
	[data] [datetime] NULL,
	[customerid] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[nome] [nvarchar](60) NULL,
	[email] [nvarchar](70) NULL,
	[CPF] [nvarchar](50) NULL,
	[nrc] [nvarchar](50) NULL,
	[DDD] [nvarchar](50) NULL,
	[terminal] [nvarchar](50) NULL,
	[tipospeedy] [nvarchar](50) NULL,
	[produto] [nvarchar](50) NULL,
	[periodododesconto] [nvarchar](50) NULL,
	[valordesconto] [decimal](19, 4) NULL,
	[valor] [decimal](19, 4) NULL,
	[datadosistema] [datetime] NULL,
	[dataenviada] [datetime] NULL,
	[operador] [nvarchar](50) NULL,
	[canal] [nvarchar](50) NULL
) ON [PRIMARY]

GO

insert into SpeedySVA
(arquivo,sequencial,NomeGenerico,data,customerid,status,nome,email,CPF,nrc,DDD,terminal,tipospeedy,produto,periodododesconto,valordesconto,valor,datadosistema,dataenviada,operador,canal)
select 
arquivo,sequencial,NomeGenerico,data,customerid,status,nome,email,CPF,nrc,DDD,terminal,tipospeedy,produto,periodododesconto,valordesconto,valor,datadosistema,dataenviada,operador,canal
from SpeedySVABK;
GO
select count(*) from SpeedySVA;
GO
select count(*) from SpeedySVABK;
GO

/****** Object:  Index [Arquivo]    Script Date: 14/11/2014 11:46:23 ******/
CREATE NONCLUSTERED INDEX [Arquivo] ON [dbo].[SpeedySVA]
(
	[arquivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [data]    Script Date: 14/11/2014 11:46:39 ******/
CREATE NONCLUSTERED INDEX [data] ON [dbo].[SpeedySVA]
(
	[data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [nrc+arquivo]    Script Date: 14/11/2014 11:46:50 ******/
CREATE NONCLUSTERED INDEX [nrc+arquivo] ON [dbo].[SpeedySVA]
(
	[arquivo] ASC,
	[nrc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [nrc+arquivo+produto]    Script Date: 14/11/2014 11:47:00 ******/
CREATE NONCLUSTERED INDEX [nrc+arquivo+produto] ON [dbo].[SpeedySVA]
(
	[nrc] ASC,
	[arquivo] ASC,
	[produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

/****** Object:  Index [svaid]    Script Date: 14/11/2014 11:47:12 ******/
CREATE NONCLUSTERED INDEX [svaid] ON [dbo].[SpeedySVA]
(
	[SVAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [terminal]    Script Date: 14/11/2014 11:47:22 ******/
CREATE NONCLUSTERED INDEX [terminal] ON [dbo].[SpeedySVA]
(
	[terminal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


sp_rename SpeedyTrial, SpeedyTrialBK;
GO

CREATE TABLE [dbo].[SpeedyTrial](
	[STID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[TrialCustomerID] [nvarchar](50) NULL,
	[TrialOrderID] [nvarchar](50) NULL,
	[TrialDate] [datetime] NULL,
	[TrialName] [nvarchar](100) NULL,
	[TrialEmail] [nvarchar](100) NULL,
	[TrialSenha] [nvarchar](50) NULL,
	[TrialNRC] [nvarchar](50) NULL,
	[TrialStatus] [nvarchar](50) NULL,
	[TrialMensagem] [nvarchar](500) NULL,
	[TrialID] [nvarchar](50) NULL,
	[TrialXML] [nvarchar](1000) NULL
) ON [PRIMARY]

GO

insert into SpeedyTrial
(TrialCustomerID,TrialOrderID,TrialDate,TrialName,TrialEmail,TrialSenha,TrialNRC,TrialStatus,TrialMensagem,TrialID,TrialXML)
select
TrialCustomerID,TrialOrderID,TrialDate,TrialName,TrialEmail,TrialSenha,TrialNRC,TrialStatus,TrialMensagem,TrialID,TrialXML
from
SpeedyTrialBK;
GO
select count(*) from SpeedyTrial;
GO
select count(*) from SpeedyTrialBK;

go

sp_rename SpeedyVencimentos, SpeedyVencimentosBK;

GO

CREATE TABLE [dbo].[SpeedyVencimentos](
	[TVID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Periodo] [decimal](18, 0) NULL,
	[Vencimento] [datetime] NULL,
	[DataLimiteIni] [datetime] NULL,
	[DataLimiteFim] [datetime] NULL
) ON [PRIMARY]

GO

insert into SpeedyVencimentos
(Periodo,Vencimento,DataLimiteIni,DataLimiteFim)
select 
Periodo,Vencimento,DataLimiteIni,DataLimiteFim
from
SpeedyVencimentosBK;
GO
select count(*) from SpeedyVencimentos;
GO
select count(*) from SpeedyVencimentosBK;


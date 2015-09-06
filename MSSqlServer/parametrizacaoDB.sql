use parametrizacao_com;
GO
sp_rename Ativacoes, AtivacoesBK;
GO
CREATE TABLE [dbo].[Ativacoes](
	[SID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DataReport] [datetime] NULL,
	[Partner] [nvarchar](50) NULL,
	[PartnerName] [nvarchar](100) NULL,
	[Negocio] [nvarchar](50) NULL,
	[BaseAtivos] [nvarchar](50) NULL,
	[Ativos] [nvarchar](50) NULL,
	[Cancelados] [nvarchar](50) NULL
) ON [PRIMARY]

GO

insert into Ativacoes
(DataReport,Partner,PartnerName,Negocio,BaseAtivos,Ativos,Cancelados)
select 
DataReport,Partner,PartnerName,Negocio,BaseAtivos,Ativos,Cancelados
from 
AtivacoesBK;
GO
select count(*) from Ativacoes;
GO
select count(*) from AtivacoesBK;
select top 50 * from ativacoes_com.dbo.weblog order by 1 desc;
select top 1000 * from ativacoes_com.dbo.weblog where request='update' order by 1 desc;
select 
logid,
replace(replace(replace(replace(replace(replace(replace(replace(replace(XMLin,'\n',''),'\r',''),'\t',''),'\b',''),'	',''),'CR+LF',''),'\r\n',''),char(13),''),char(10),'')
from ativacoes_com.dbo.weblog where status='SUCCESS'  order by 1 desc;


/* quero todos os registros */
select      wl.email			as email,
			wl.CustomerID		as customerid,
			ct.subpartnerid		as partnerid,
			od.netsafeorderid	as netsaferef,
			od.partnerorderid	as partnerref,
			wl.Request			as request,
			wl.Status			as status,
			wl.Mensagem			as mensagem

from		ativacoes_com.dbo.WebLog    as wl with (nolock) 
inner join  ativacoes_com.dbo.customers as ct with (nolock) on wl.customerid=ct.customerid
inner join  ativacoes_com.dbo.orders    as od with (nolock) on wl.CustomerID=od.customerid
where       wl.CustomerID in (

				/* de todos os cliente com requisicao NEW da OI que deram erro 509 */				
				select		CustomerID
				from		ativacoes_com.dbo.WebLog with (nolock) 
				where		ConfirmationNumber like 'NETBR55%' 
				and			Request='NEW' 
				and         Status='FAIL'
				and			Mensagem like '%509%'
				and         CustomerID not in (
						
					/* com excessao dos mesmos clientes que estao/estiveram no caso acima, 
					mas ja deram sucesso em algum momento  */
					select		CustomerID
					from		ativacoes_com.dbo.WebLog with (nolock) 
					where		Request='NEW' 
					and         Status='SUCCESS'
				)
				group by    CustomerID
			);

			
/* traz somente clientes que estao como novos ou renovacao */
select		top 25 * 
from		Partner_Security.dbo.PartnerSecurity 
where       EmailAddress not in (
				select email from Partner_Security.dbo.weblog where email !=''
)
and         TipoOrdem in ('NEW','WAITING')
order by	DataVenda desc;



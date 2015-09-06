SELECT SQL_CALC_FOUND_ROWS o.*,
            pu as partnumber_unico,
            puc as partnumber_unico_compacto,
            m.empresa as marca,
            disponibilidade_id as situacao_id,
            oferta as status_id,
            qtd as oferta_id,
            partnumber as referencia
FROM fornecedor_estoque o
LEFT JOIN fornecedor_marca m ON o.marca_id = m.marca_id
WHERE o.marca_id!=1
and (
                (pu LIKE '6200')
            or
                (puc LIKE '6200')
            )
GROUP BY o.marca_id DESC, pu
ORDER BY o.marca_id DESC, pu,preco DESC;




SELECT SQL_CALC_FOUND_ROWS o.*, m.empresa as marca
FROM fornecedor_estoque o
LEFT JOIN fornecedor_marca m ON o.marca_id = m.marca_id
WHERE o.marca_id= and (
(pu LIKE '6200%') or (puc LIKE '6200%')
)
GROUP BY o.marca_id DESC, pu
ORDER BY o.marca_id DESC, pu,preco DESC ;


SELECT SQL_CALC_FOUND_ROWS o.*,m.nome as marca FROM oferta o LEFT JOIN marca m ON o.marca_id = m.marca_id
WHERE (
(partnumber_unico LIKE '62022z%')
or
(partnumber_unico_compacto LIKE '62022z%')
)
GROUP BY status_id DESC, situacao_id,partnumber_unico,o.marca_id ORDER BY status_id DESC, situacao_id,preco DESC,partnumber_unico,o.marca_id


SELECT SQL_CALC_FOUND_ROWS o.*,m.nome as marca FROM oferta o LEFT JOIN marca m ON o.marca_id = m.marca_id
WHERE (
(partnumber_unico LIKE '62022-z%')
or
(partnumber_unico_compacto LIKE '62022-z%')
)
GROUP BY status_id DESC, situacao_id,partnumber_unico,o.marca_id ORDER BY status_id DESC, situacao_id,preco DESC,partnumber_unico,o.marca_id LIMIT 90


##############################################################################################################

/* gera selects de tabelas existentes na base */
select 'select ''' + name + ''', count(*) from ' + name from sysobjects where type = 'u' 

exemplos de saida=>
select 'InteractiveLog', count(*) from InteractiveLog
select 'Language', count(*) from Language
select 'OrderItem', count(*) from OrderItem
select 'Orders', count(*) from Orders
select 'Products', count(*) from Products
select 'SMSAtivacao', count(*) from SMSAtivacao
select 'SMSCustomers', count(*) from SMSCustomers
select 'SMSRouting', count(*) from SMSRouting
select 'SubPartners', count(*) from SubPartners
select 'WebLog', count(*) from WebLog
select 'NETBR35', count(*) from NETBR35
select 'NEtBR60', count(*) from NEtBR60
select 'BusinessMarket', count(*) from BusinessMarket
select 'Customers', count(*) from Customers


/* stored procedure para renomear estrutura de tabelas */
sp_rename nome_atual_tabela, nome_novo_tabela


/* query com limit 1000 */
SELECT TOP 1000 [OrderID]
      ,[CustomerID]
      ,[PartnerOrderID]
      ,[SubPartnerID]
      ,[ProductID]
      ,[OrderDate]
      ,[DeskTopMailBoxes]
      ,[SubscriptionLength]
      ,[ServiceLevel]
      ,[PaymentType]
      ,[LanguageCode]
      ,[ProductName]
      ,[ProductQTY]
      ,[McAfeeExpDate]
  FROM [mobile_com].[dbo].[OrderItem]
  
  
  /* criacao de indices */
  /* InteractiveLog */
CREATE INDEX INX_BusinessMarketID ON mobile_com.dbo.BusinessMarket (BusinessMarketID);

/* Language */
create index inx_LanguageID on mobile_com.dbo.Language (LanguageID);

/* OrderItem */
create index inx_OrderID on mobile.dbo.OrderItem (OrderID);
create index inx_ProductID on mobile.dbo.OrderItem (ProductID);
create index inx_CustomerID on mobile.dbo.OrderItem (CustomerID);

/* Orders */
/* Products */
/* SMSAtivacao */
/* SMSCustomers */
/* SMSRouting */
/* SubPartners */
/* WebLog */
/* NETBR35 */
/* NEtBR60 */
/* BusinessMarket */
/* Customers */


#####################################################################################################################

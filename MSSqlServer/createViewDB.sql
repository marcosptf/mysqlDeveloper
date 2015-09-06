USE [mobile_com]
GO
/****** Object:  View [dbo].[NETBR35]    Script Date: 10/31/2014 12:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NETBR35]
AS
SELECT     TOP (100) PERCENT dbo.Customers.SubPartnerID, dbo.Orders.OrderID, dbo.Customers.Email, dbo.Customers.CustomerID, 
                      dbo.Orders.PartnerOrderID, dbo.Orders.RequestType, dbo.Products.ProductName, dbo.Orders.OrderDate, dbo.Orders.OrderEnd, 
                      dbo.OrderItem.ProductID, dbo.Products.Offer, dbo.Orders.Status, dbo.Orders.NetSafeOrderID, dbo.Orders.Status, dbo.Customers.FirstName, 
                      dbo.Customers.LastName
FROM         dbo.Customers INNER JOIN
                      dbo.Orders INNER JOIN
                      dbo.OrderItem ON dbo.Orders.NetSafeOrderID = dbo.OrderItem.OrderID AND dbo.Orders.SubPartnerID = dbo.OrderItem.SubPartnerID INNER JOIN
                      dbo.Products ON dbo.OrderItem.ProductID = dbo.Products.SKU ON dbo.Customers.SubPartnerID = dbo.Orders.SubPartnerID AND 
                      dbo.Customers.CustomerID = dbo.Orders.CustomerID
GROUP BY dbo.Customers.SubPartnerID, dbo.Customers.Email, dbo.Customers.CustomerID, dbo.Orders.RequestType, dbo.Products.ProductName, 
                      dbo.Orders.OrderDate, dbo.Orders.OrderEnd, dbo.OrderItem.ProductID, dbo.Products.Offer, dbo.Orders.Status, dbo.Orders.NetSafeOrderID, 
                      dbo.Orders.Status, dbo.Orders.OrderID, dbo.Orders.PartnerOrderID, dbo.Customers.FirstName, dbo.Customers.LastName
HAVING      (dbo.Orders.Status = N'released' OR
                      dbo.Orders.Status = N'warning') AND (dbo.Orders.Status LIKE N'%0000%' OR
                      dbo.Orders.Status LIKE N'%1000%' OR
                      dbo.Orders.Status LIKE N'%500%' AND NOT (dbo.Orders.Status LIKE N'%malformed%')) AND (dbo.Orders.RequestType = N'new') AND 
                      (dbo.Orders.OrderDate < { fn NOW() }) AND (dbo.Customers.SubPartnerID = N'NETBR35') AND (dbo.Orders.OrderEnd = dbo.Orders.OrderDate)
ORDER BY dbo.Orders.OrderID, dbo.Orders.RequestType DESC, dbo.Customers.CustomerID, dbo.Orders.PartnerOrderID, dbo.OrderItem.ProductID, 
                      dbo.Orders.OrderDate

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 284
               Bottom = 114
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderItem"
            Begin Extent = 
               Top = 6
               Left = 516
               Bottom = 114
               Right = 703
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NETBR35'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NETBR35'


USE [mobile_com]
GO
/****** Object:  View [dbo].[NEtBR60]    Script Date: 10/31/2014 12:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NEtBR60]
AS
SELECT     TOP (100) PERCENT dbo.Customers.SubPartnerID, dbo.Orders.OrderID, dbo.Customers.Email, dbo.Customers.CustomerID, 
                      dbo.Orders.PartnerOrderID, dbo.Orders.RequestType, dbo.Products.ProductName, dbo.Orders.OrderDate, dbo.Orders.OrderEnd, 
                      dbo.OrderItem.ProductID, dbo.Products.Offer, dbo.Orders.Status, dbo.Orders.NetSafeOrderID, dbo.Orders.Status, dbo.Customers.FirstName, 
                      dbo.Customers.LastName
FROM         dbo.Customers INNER JOIN
                      dbo.Orders INNER JOIN
                      dbo.OrderItem ON dbo.Orders.NetSafeOrderID = dbo.OrderItem.OrderID AND dbo.Orders.SubPartnerID = dbo.OrderItem.SubPartnerID INNER JOIN
                      dbo.Products ON dbo.OrderItem.ProductID = dbo.Products.SKU ON dbo.Customers.SubPartnerID = dbo.Orders.SubPartnerID AND 
                      dbo.Customers.CustomerID = dbo.Orders.CustomerID
GROUP BY dbo.Customers.SubPartnerID, dbo.Customers.Email, dbo.Customers.CustomerID, dbo.Orders.RequestType, dbo.Products.ProductName, 
                      dbo.Orders.OrderDate, dbo.Orders.OrderEnd, dbo.OrderItem.ProductID, dbo.Products.Offer, dbo.Orders.Status, dbo.Orders.NetSafeOrderID, 
                      dbo.Orders.Status, dbo.Orders.OrderID, dbo.Orders.PartnerOrderID, dbo.Customers.FirstName, dbo.Customers.LastName
HAVING      (dbo.Orders.Status = N'released' OR
                      dbo.Orders.Status = N'warning') AND (dbo.Orders.Status LIKE N'%0000%' OR
                      dbo.Orders.Status LIKE N'%1000%' OR
                      dbo.Orders.Status LIKE N'%500%' AND NOT (dbo.Orders.Status LIKE N'%malformed%')) AND (dbo.Orders.RequestType = N'new') AND 
                      (dbo.Orders.OrderDate < { fn NOW() }) AND (dbo.Customers.SubPartnerID = N'netbr60') AND (dbo.Orders.OrderEnd = dbo.Orders.OrderDate)
ORDER BY dbo.Orders.OrderID, dbo.Orders.RequestType DESC, dbo.Customers.CustomerID, dbo.Orders.PartnerOrderID, dbo.OrderItem.ProductID, 
                      dbo.Orders.OrderDate

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 284
               Bottom = 114
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderItem"
            Begin Extent = 
               Top = 6
               Left = 516
               Bottom = 114
               Right = 703
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NEtBR60'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NEtBR60'

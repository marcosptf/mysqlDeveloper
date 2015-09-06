

/* function split to sql server 2008 */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Split]  
(  
 @RowData nvarchar(MAX),
 @SplitOn nvarchar(5)
)    
RETURNS @ReturnValue TABLE   
(Data NVARCHAR(MAX))   
AS
BEGIN
 Declare @Counter int
 Set @Counter = 1 
 While (Charindex(@SplitOn,@RowData)>0) 
 Begin  
  Insert Into @ReturnValue (data)  
  Select Data = 
      ltrim(rtrim(Substring(@RowData,1,Charindex(@SplitOn,@RowData)-1)))
  Set @RowData = 
      Substring(@RowData,Charindex(@SplitOn,@RowData)+1,len(@RowData)) 
  Set @Counter = @Counter + 1  
 End 
 Insert Into @ReturnValue (data)  
 Select Data = ltrim(rtrim(@RowData))  
 Return  
END


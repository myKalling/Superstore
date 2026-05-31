USE [Superstore]
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Update an existing order using COALESCE
-- EXEC UpdateOrder @OrderID = 1, @SalesPrice = 100.00, @Quantity = 2, @Discount = 5.00, @Profit = 20.00, @ShipModeID = 1, @ShipDate = '2026-06-01'
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOrder]
    @OrderID INT,
    @SalesPrice DECIMAL(18, 2) = NULL,
    @Quantity INT = NULL,
    @Discount DECIMAL(18, 2) = NULL,
    @Profit DECIMAL(18, 2) = NULL,
    @ShipModeID INT = NULL,
    @ShipDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE dbo.[Order]
        SET 
            SalesPrice = COALESCE(@SalesPrice, SalesPrice),
            Quantity = COALESCE(@Quantity, Quantity),
            Discount = COALESCE(@Discount, Discount),
            Profit = COALESCE(@Profit, Profit),
            ShipModeID = COALESCE(@ShipModeID, ShipModeID),
            ShipDate = COALESCE(@ShipDate, ShipDate),
            DateUpdated = GETDATE()
        WHERE OrderID = @OrderID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
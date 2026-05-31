USE [Superstore]
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Create a new order
-- EXEC CreateNewOrder
-- =============================================
CREATE PROCEDURE [dbo].[CreateOrder]
    @OrderDate DATETIME,
    @CustomerID INT,
    @SalesPrice DECIMAL(18, 2),
    @Quantity INT,
    @Discount DECIMAL(18, 2),
    @Profit DECIMAL(18, 2),
    @ShipModeID INT,
    @ShipDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO dbo.[Order] (OrderDate, CustomerID, SalesPrice, Quantity, Discount, Profit, ShipModeID, ShipDate, IsActive, DateCreated)
        VALUES (@OrderDate, @CustomerID, @SalesPrice, @Quantity, @Discount, @Profit, @ShipModeID, @ShipDate, 1, GETDATE());

        SELECT SCOPE_IDENTITY() AS NewOrderID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
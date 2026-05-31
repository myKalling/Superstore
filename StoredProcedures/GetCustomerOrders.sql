USE [Superstore]
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Get all orders for a specific customer
-- EXEC GetCustomerOrders @CustomerID = 1
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomerOrders]
    @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT o.OrderID, o.OrderDate, o.SalesPrice, o.Quantity, s.ShipMode, o.ShipDate
        FROM dbo.[Order] AS o
        JOIN dbo.ShipMode AS s ON o.ShipModeID = s.ShipModeID
        WHERE o.CustomerID = @CustomerID AND o.IsActive = 1
        ORDER BY o.OrderDate DESC;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
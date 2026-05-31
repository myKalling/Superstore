USE [Superstore]
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Get detailed product list for a specific order
-- EXEC GetOrderProduct @OrderID = 10
-- =============================================
CREATE PROCEDURE [dbo].[GetOrderProduct]
    @OrderID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT od.OrderID, p.ProductID, p.ProductName, p.UnitPrice, od.OrderKey
        FROM dbo.OrderDetail AS od
        JOIN dbo.Product AS p ON od.ProductID = p.ProductID
        WHERE od.OrderID = @OrderID;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
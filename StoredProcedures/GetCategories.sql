USE [Superstore]
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Get all product categories
-- EXEC GetCategories
-- =============================================
CREATE PROCEDURE [dbo].[GetCategories]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT CategoryID, Category
        FROM dbo.Category
        ORDER BY Category;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
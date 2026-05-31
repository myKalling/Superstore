USE [Superstore]
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Get all regions for lookup
-- EXEC GetRegions
-- =============================================
CREATE PROCEDURE [dbo].[GetRegions]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT RegionID, Region
        FROM dbo.Region
        ORDER BY Region;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
USE [Superstore]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Get all countries for lookup
-- EXEC GetCountries
-- =============================================
CREATE PROCEDURE [dbo].[GetCountries]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT CountryID, Country, Name
        FROM dbo.Country
        ORDER BY Country;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
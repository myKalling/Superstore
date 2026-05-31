USE [Superstore]
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Get all ship modes for lookup
-- EXEC GetShipModes
-- =============================================
CREATE PROCEDURE [dbo].[GetShipModes]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT ShipModeID, ShipMode
        FROM dbo.ShipMode
        ORDER BY ShipMode;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
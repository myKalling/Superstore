USE [Superstore]
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Get all states for lookup
-- EXEC GetStates
-- =============================================
CREATE PROCEDURE [dbo].[GetStates]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT StateID, State, Name
        FROM dbo.State
        ORDER BY State;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
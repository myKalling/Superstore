USE [Superstore]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Get all segments for lookup
-- EXEC GetSegments
-- =============================================
CREATE PROCEDURE [dbo].[GetSegments]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT SegmentID, Segment
        FROM dbo.Segment
        ORDER BY Segment;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
USE [Superstore]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Kenny Gallardo
-- Create date: May 31, 2026
-- Description: Get all address types for lookup
-- EXEC GetAddressTypes
-- =============================================
CREATE PROCEDURE [dbo].[GetAddressTypes]
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT AddressTypeID, AddressType
        FROM dbo.AddressType
        ORDER BY AddressType;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
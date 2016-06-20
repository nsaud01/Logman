create procedure GetEventById
@Id bigint
as
begin
  SELECT TOP 1 [Id]
      ,[ProviderName]
      ,[EventLevel]
      ,[Keywords]
      ,[TimeCreated]
      ,[ParentId]
      ,[ComputerName]
      ,[IpAddress]
      ,[UserAgent]
      ,[Message]
      ,[Description]
      ,[ExtendedInformation]
      ,[ApplicationId]
  FROM [events].[dbo].[Events]
  WHERE [Id] = @Id
end
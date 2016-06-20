alter procedure GetAppStatus
@AppId int
as

	DECLARE @retainDays int
	SELECT @retainDays = [DefaultRetainPeriodDays] 
	From Applications
	WHERE Id=@AppId

	
	DECLARE @FatalCount int
	DECLARE @ErrorCount int
	DECLARE @WarningCount int

	select @FatalCount = count(1)  from Events as E where ApplicationId = @AppId and EventLevel = 1  and DateAdd(day, -1*@retainDays,getutcdate()) <=  E.TimeCreated

	select @ErrorCount = count(1)  from Events as E where ApplicationId = @AppId and EventLevel = 2 and DateAdd(day, -1*@retainDays,getutcdate()) <=  E.TimeCreated

	select @WarningCount=count(1)  from Events as E where ApplicationId = @AppId and EventLevel = 4 and DateAdd(day, -1*@retainDays,getutcdate()) <=  E.TimeCreated

	Select @FatalCount as FatalCount, @ErrorCount as ErrorCount, @WarningCount as WarningCount, MaxFatalErrors, [MaxErrors], MaxWarnings, DefaultRetainPeriodDays
	From Applications
	WHERE Id=@AppId
go
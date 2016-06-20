alter procedure GetEventTrendOfApp
@AppId int
as

	DECLARE @retainDays int
	SELECT @retainDays = [DefaultRetainPeriodDays] 
	From Applications
	WHERE Id=@AppId

	SELECT  [TimeCreated] , Count(1) as FatalCount
	from Events as E 
	where ApplicationId = @AppId and EventLevel =1
	and DateAdd(day, -1*@retainDays,getutcdate()) <=  E.TimeCreated
		group by [TimeCreated]
	order by [TimeCreated]


	SELECT  [TimeCreated] , Count(1) as ErrorCount
	from Events as E 
	where ApplicationId = @AppId and EventLevel = 2
	and DateAdd(day, -1*@retainDays,getutcdate()) <=  E.TimeCreated
	group by [TimeCreated]
	order by [TimeCreated]


	SELECT  [TimeCreated] , Count(1) as WarningCount
	from Events as E 
	where ApplicationId = @AppId and EventLevel = 4
	and DateAdd(day, -1*@retainDays,getutcdate()) <=  E.TimeCreated
	group by [TimeCreated]
	order by [TimeCreated]

go
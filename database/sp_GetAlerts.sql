alter proc GetAlerts
@appId bigint
as

	select Id , EventLevelValue, PeriodValue, PeriodType, Value, [Target], NotificationType, AppId , LastExecutionTime
	
	from Alerts
	with (nolock)
	where AppId=@appId
	order by id
go
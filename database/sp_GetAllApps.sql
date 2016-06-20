create proc GetAllApps
as

	select   Id, AppName,AppKey, Enabled, DefaultRetainPeriodDays, MaxFatalErrors, MaxErrors, MaxWarnings
	from Applications
	with (nolock)
go
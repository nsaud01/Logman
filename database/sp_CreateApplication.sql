alter proc CreateApplication
@name varchar(100),
@appKey varchar(16),
@retentionDays int,
@fatals int,
@errors int,
@warnings int,
@active int = 1
as

insert into Applications (AppName, AppKey, [Enabled], DefaultRetainPeriodDays, MaxFatalErrors, [MaxErrors], MaxWarnings)
values (@name, @appKey, @active, @retentionDays, @fatals, @errors, @warnings)

select SCOPE_IDENTITY() as Id, @name as AppName, @appKey as AppKey, @active as Enabled, @retentionDays as DefaultRetainPeriodDays, @fatals as MaxFatalErrors, @errors as MaxErrors, @warnings as MaxWarnings
go
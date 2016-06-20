create proc UpdateApplication
@name varchar(100),
@appKey varchar(16),
@retentionDays int,
@fatals int,
@errors int,
@warnings int,
@active int = 1
as

declare @id bigint 
select @id = id from Applications where AppKey=@appKey

if @id is not null
begin
	update Applications
	set AppName = @name, [Enabled]=@active, DefaultRetainPeriodDays= @retentionDays, MaxFatalErrors=@fatals, MaxErrors= @errors, MaxWarnings=@warnings 
	where id =@id
end

	select top 1 * from Applications where id=@id
go
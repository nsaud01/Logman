create proc GetAppUser 
@appId bigint,
@userId bigint
as
	select top 1 * from AppUser
	with (NoLock)
	where @appId = AppId and @userId = UserId
go
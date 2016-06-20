create proc [GetApplication]
@AppKey varchar(36)
as
	select top 1 * from Applications
	where [AppKey]=@AppKey
go
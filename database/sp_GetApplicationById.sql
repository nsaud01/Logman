create proc [GetApplicationById]
@Id varchar(36)
as
	select top 1 * from Applications
	where [Id]=@id
go
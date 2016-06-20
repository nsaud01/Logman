create procedure ConfirmUser
@activationKey varchar(100)
as

	update [user] 
	set active =1
	where activationkey = @activationKey

	select * from [user] 
	where activationkey = @activationKey
go
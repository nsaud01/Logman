ALTER proc CreateUser

@UserName varchar(100),
@Password varchar(100),
@ActivationKey varchar(100),
@PasswordSalt varchar(100)
as

  insert into [user]
  (username, [password], [PasswordSalt], [active], activationKey)
  values
  (@UserName, @Password, @PasswordSalt, 0, @ActivationKey)

  select SCOPE_IDENTITY()
go

-- test
-- createuser "a@b.com", "1", "2"



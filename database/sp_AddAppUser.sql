alter procedure AddAppUser
@appId bigint,
@userId bigint,
@roleId int
as

insert into [AppUser]  (AppId, UserId, RoleId) 
values (@appId, @userId,@roleId)

go
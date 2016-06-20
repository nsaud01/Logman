create table [User]
(
	id bigint not null identity(1,1) primary key,
	username varchar(100) not null,
	[password] varchar(100) not null,
	active bit not null default(1),
	activationKey varchar(100) not null,
	passwordSalt varchar(100) not null
)

go

create unique index IDX_USER_USERNAME on [User](username)


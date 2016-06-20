create table Events
(
Id bigint not null identity(1,1) primary key,
ProviderName varchar(100) not null,
EventLevel smallint not null,
Keywords varchar(100) null,
TimeCreated SmallDateTime not null,
ParentId bigint null,
ComputerName varchar(100),
IpAddress varchar(40),
UserAgent varchar(200),
[Message] varchar(100),
[Description] varchar(max),
ExtendedInformation varchar(max)
)

alter table Events add  ApplicationId bigint not null
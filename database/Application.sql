create table Applications(

Id bigint not null primary key identity (1,1),
AppName varchar(100) not null,
AppKey varchar(36) 
)



alter table Applications add Enabled bit default(1)
go
alter table Applications add DefaultRetainPeriodDays int default(30)
go

alter table Applications add [MaxFatalErrors] int default(20)
go
alter table Applications add [MaxErrors] int default(100)
go
alter table Applications add [MaxWarnings] int default(100)
go
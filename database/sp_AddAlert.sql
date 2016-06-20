create proc AddAlert
(@EventLevelValue int,
@PeriodValue int,
@PeriodType smallint,
@Value int,
@NotificationType smallint,
@Target varchar(255)
)
as

insert into Alerts (EventLevelValue, PeriodValue, PeriodType, Value, NotificationType, [Target])
values (@EventLevelValue, @PeriodValue, @PeriodType, @Value, @NotificationType, @Target)

select CAST(SCOPE_IDENTITY() AS INT) AS Id
go
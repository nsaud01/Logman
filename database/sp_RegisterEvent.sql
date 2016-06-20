alter procedure RegisterEvent
(
@Providername varchar(100),
@EventLevel smallint,
@Keywords varchar(100),
@ParentId bigint = null,
@ComputerName varchar(100),
@IpAddress varchar(100),
@UserAgent varchar(200),
@Message varchar(100),
@Description varchar(max),
@ExtendedInformation varchar(max),
@ApplicationId bigint
)

as

	INSERT INTO EVENTS
	(Providername, EventLevel, Keywords, ParentId, ComputerName, IpAddress, UserAgent, [Message], [Description],
	ExtendedInformation, ApplicationId, TimeCreated)
	values (@Providername, @EventLevel, @Keywords, @ParentId, @ComputerName, @IpAddress, @UserAgent, @Message, 
	@Description, @ExtendedInformation, @ApplicationId, getutcdate())

	SELECT SCOPE_IDENTITY()

go
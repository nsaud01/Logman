ALTER PROC GETAPPEVENTS
(
@APPID BIGINT,
@PAGENUMBER int, 
@PAGESIZE int,
@KEYWORD VARCHAR(100) = NULL,
@Fdate DateTime,
@ToDate DateTime,
@EVENTLEVEL  INT 
)
AS

	DECLARE @EventLeveTypes TABLE
	(
		Id int
	)

	insert into @EventLeveTypes
	select [Id] from EventLevel as E where @EVENTLEVEL & [Id] = [Id]
	

	set @KEYWORD = dbo.Base64Decode(isnull(@KEYWORD,''))
	DECLARE @DailyRetainPeriodDays int

	SELECT @DailyRetainPeriodDays = A.DefaultRetainPeriodDays
	FROM APPLICATIONS AS A WITH (NOLOCK) WHERE ID = @APPID AND A.Enabled=1
	

	DECLARE @CURRENTDATE DATETIME = GetUtcDate()
	DECLARE @FROMDATE DATETIME = DATEADD(DAY, -1*@DailyRetainPeriodDays, @CURRENTDATE);

	-- The FROM DATE cannot be before the date retention date. Like if we keep the data for 30 days only, we cannot get events since 60 days ago.
	IF @FDATE < @FROMDATE
	BEGIN
		SET @Fdate = @FROMDATE
	END

	SELECT   TOP 5 [MESSAGE], COUNT(1) AS CNT FROM EVENTS
	WITH (NOLOCK)
	WHERE  ApplicationId=@APPID AND TimeCreated >= @FROMDATE  and EventLevel=1
	GROUP BY [MESSAGE];


WITH CTE AS
	(
		SELECT ROW_NUMBER() OVER (ORDER BY ID) AS ROWNUMBER,* FROM EVENTS AS E
		WITH (NOLOCK)
		WHERE  E.ApplicationId=@APPID AND TimeCreated >= @FROMDATE AND E.PARENTID IS NULL 
		AND (ISNULL(@KEYWORD,'')=''  OR (E.Message LIKE '%' +@KEYWORD+'%'  OR E.Description LIKE '%' +@KEYWORD+'%'))
		AND eventlevel in (select distinct Id from  @EventLeveTypes)
		AND e.TimeCreated >=@Fdate AND e.TimeCreated <=@ToDate
	)
	SELECT * FROM CTE
	WHERE ROWNUMBER BETWEEN @PAGENUMBER*@PAGESIZE  AND (@PAGENUMBER+1)*@PAGESIZE
	ORDER BY [Id] DESC
	

GO
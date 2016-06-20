CREATE FUNCTION Base64Decode ( @Input NVARCHAR(MAX) )

RETURNS VARCHAR(MAX)
BEGIN

DECLARE @DecodedOutput VARCHAR(MAX)

set @DecodedOutput = CAST(CAST(N'' AS XML).value('xs:base64Binary(sql:variable("@Input"))', 'varbinary(max)') AS NVARCHAR(MAX))

RETURN @DecodedOutput

END


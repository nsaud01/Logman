

CREATE TABLE [dbo].[Alerts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EventLevelValue] [int] NOT NULL,
	[PeriodValue] [int] NOT NULL,
	[PeriodType] [smallint] NOT NULL,
	[Value] [int] NOT NULL,
	[Target] [varchar](255) NOT NULL,
	[NotificationType] [smallint] NOT NULL,
 CONSTRAINT [PK_Alerts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0= Hour, 1= Day, 2=Week' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alerts', @level2type=N'COLUMN',@level2name=N'id'
GO


alter table Alerts add LastExecutionTime DateTime Null


USE [Events]
GO

/****** Object:  Table [dbo].[AppUser]    Script Date: 4/04/2014 5:31:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AppUser](
	[AppId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_AppUser] PRIMARY KEY CLUSTERED 
(
	[AppId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AppUser]  WITH CHECK ADD  CONSTRAINT [FK_AppUser_Applications] FOREIGN KEY([AppId])
REFERENCES [dbo].[Applications] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AppUser] CHECK CONSTRAINT [FK_AppUser_Applications]
GO

ALTER TABLE [dbo].[AppUser]  WITH CHECK ADD  CONSTRAINT [FK_AppUser_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([id])
GO

ALTER TABLE [dbo].[AppUser] CHECK CONSTRAINT [FK_AppUser_Roles]
GO

ALTER TABLE [dbo].[AppUser]  WITH CHECK ADD  CONSTRAINT [FK_AppUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AppUser] CHECK CONSTRAINT [FK_AppUser_User]
GO



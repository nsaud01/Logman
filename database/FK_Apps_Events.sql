USE [events]
GO

ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Applications] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Applications]
GO



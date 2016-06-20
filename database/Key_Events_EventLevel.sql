USE [events]
GO

ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventLevel] FOREIGN KEY([EventLevel])
REFERENCES [dbo].[EventLevel] ([Id])
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventLevel]
GO



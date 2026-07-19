USE [RenegadePlatinum]
GO
/****** Object:  Table [dbo].[Encounters]    Script Date: 19/07/2026 16:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encounters](
	[EncounterID] [int] IDENTITY(1,1) NOT NULL,
	[Area] [varchar](100) NOT NULL,
	[Pokemon] [varchar](100) NOT NULL,
	[EncounterResult] [varchar](20) NOT NULL,
	[Nickname] [varchar](100) NULL,
	[LevelMet] [int] NULL,
	[Method] [varchar](50) NULL,
	[Notes] [varchar](500) NULL,
	[CurrentEvolution] [varchar](100) NULL,
	[IsAlive] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[EncounterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerPokemon]    Script Date: 19/07/2026 16:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerPokemon](
	[Area] [nvarchar](100) NOT NULL,
	[TrainerName] [nvarchar](100) NOT NULL,
	[Team] [nvarchar](500) NOT NULL,
	[Level] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WildEncounters]    Script Date: 19/07/2026 16:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WildEncounters](
	[Area] [nvarchar](100) NOT NULL,
	[Time] [nvarchar](20) NOT NULL,
	[Pokemon] [nvarchar](100) NOT NULL,
	[Method] [nvarchar](50) NOT NULL,
	[EncounterChance] [nvarchar](10) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Encounters]  WITH CHECK ADD  CONSTRAINT [CHK_Encounters_IsAlive] CHECK  (([IsAlive]='No' OR [IsAlive]='Yes' OR [IsAlive] IS NULL))
GO
ALTER TABLE [dbo].[Encounters] CHECK CONSTRAINT [CHK_Encounters_IsAlive]
GO
ALTER TABLE [dbo].[Encounters]  WITH CHECK ADD  CONSTRAINT [CHK_Encounters_Result] CHECK  (([EncounterResult]='escaped' OR [EncounterResult]='fainted' OR [EncounterResult]='not caught' OR [EncounterResult]='caught'))
GO
ALTER TABLE [dbo].[Encounters] CHECK CONSTRAINT [CHK_Encounters_Result]
GO

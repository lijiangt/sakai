-- # thanks to George Papastamatopoulos for submitting this ... and Marko Lahma for
-- # updating it.
-- #
-- # In your Quartz properties file, you'll need to set 
-- # org.quartz.jobStore.driverDelegateClass = org.quartz.impl.jdbcjobstore.MSSQLDelegate
-- #
-- # you shouse enter your DB instance's name on the next line in place of "enter_db_name_here"
-- #
-- #
-- # From a helpful (but anonymous) Quartz user:
-- #
-- # Regarding this error message:  
-- #
-- #     [Microsoft][SQLServer 2000 Driver for JDBC]Can't start a cloned connection while in manual transaction mode.
-- #
-- #
-- #     I added "SelectMethod=cursor;" to my Connection URL in the config file. 
-- #     It Seems to work, hopefully no side effects.
-- #
-- #		example:
-- #		"jdbc:microsoft:sqlserver://dbmachine:1433;SelectMethod=cursor"; 
-- #
-- # Another user has pointed out that you will probably need to use the 
-- # JTDS driver
-- #

USE [enter_db_name_here]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_QRTZ_JOB_LISTENERS_QRTZ_JOB_DETAILS]') AND OBJECTPROPERTY(id, N'ISFOREIGNKEY') = 1)
ALTER TABLE [dbo].[QRTZ_JOB_LISTENERS] DROP CONSTRAINT FK_QRTZ_JOB_LISTENERS_QRTZ_JOB_DETAILS
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS]') AND OBJECTPROPERTY(id, N'ISFOREIGNKEY') = 1)
ALTER TABLE [dbo].[QRTZ_TRIGGERS] DROP CONSTRAINT FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_QRTZ_CRON_TRIGGERS_QRTZ_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISFOREIGNKEY') = 1)
ALTER TABLE [dbo].[QRTZ_CRON_TRIGGERS] DROP CONSTRAINT FK_QRTZ_CRON_TRIGGERS_QRTZ_TRIGGERS
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_QRTZ_SIMPLE_TRIGGERS_QRTZ_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISFOREIGNKEY') = 1)
ALTER TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] DROP CONSTRAINT FK_QRTZ_SIMPLE_TRIGGERS_QRTZ_TRIGGERS
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_QRTZ_TRIGGER_LISTENERS_QRTZ_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISFOREIGNKEY') = 1)
ALTER TABLE [dbo].[QRTZ_TRIGGER_LISTENERS] DROP CONSTRAINT FK_QRTZ_TRIGGER_LISTENERS_QRTZ_TRIGGERS
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_CALENDARS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_CALENDARS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_CRON_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_CRON_TRIGGERS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_BLOB_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_BLOB_TRIGGERS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_FIRED_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_FIRED_TRIGGERS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_PAUSED_TRIGGER_GRPS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_PAUSED_TRIGGER_GRPS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_SCHEDULER_STATE]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_SCHEDULER_STATE]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_LOCKS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_LOCKS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_JOB_DETAILS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_JOB_DETAILS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_JOB_LISTENERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_JOB_LISTENERS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_SIMPLE_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_TRIGGER_LISTENERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_TRIGGER_LISTENERS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[QRTZ_TRIGGERS]
GO

CREATE TABLE [dbo].[QRTZ_CALENDARS] (
  [CALENDAR_NAME] [VARCHAR] (80)  NOT NULL ,
  [CALENDAR] [IMAGE] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_CRON_TRIGGERS] (
  [TRIGGER_NAME] [VARCHAR] (80)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (80)  NOT NULL ,
  [CRON_EXPRESSION] [VARCHAR] (80)  NOT NULL ,
  [TIME_ZONE_ID] [VARCHAR] (80) 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_FIRED_TRIGGERS] (
  [ENTRY_ID] [VARCHAR] (95)  NOT NULL ,
  [TRIGGER_NAME] [VARCHAR] (80)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (80)  NOT NULL ,
  [IS_VOLATILE] [VARCHAR] (1)  NOT NULL ,
  [INSTANCE_NAME] [VARCHAR] (80)  NOT NULL ,
  [FIRED_TIME] [BIGINT] NOT NULL ,
  [STATE] [VARCHAR] (16)  NOT NULL,
  [JOB_NAME] [VARCHAR] (80)  NULL ,
  [JOB_GROUP] [VARCHAR] (80)  NULL ,
  [IS_STATEFUL] [VARCHAR] (1)  NULL ,
  [REQUESTS_RECOVERY] [VARCHAR] (1) NULL,
  [PRIORITY] [INT] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_PAUSED_TRIGGER_GRPS] (
  [TRIGGER_GROUP] [VARCHAR] (80)  NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_SCHEDULER_STATE] (
  [INSTANCE_NAME] [VARCHAR] (80)  NOT NULL ,
  [LAST_CHECKIN_TIME] [BIGINT] NOT NULL ,
  [CHECKIN_INTERVAL] [BIGINT] NOT NULL ,
  [RECOVERER] [VARCHAR] (80)  NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_LOCKS] (
  [LOCK_NAME] [VARCHAR] (40)  NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_JOB_DETAILS] (
  [JOB_NAME] [VARCHAR] (80)  NOT NULL ,
  [JOB_GROUP] [VARCHAR] (80)  NOT NULL ,
  [DESCRIPTION] [VARCHAR] (120) NULL ,
  [JOB_CLASS_NAME] [VARCHAR] (128)  NOT NULL ,
  [IS_DURABLE] [VARCHAR] (1)  NOT NULL ,
  [IS_VOLATILE] [VARCHAR] (1)  NOT NULL ,
  [IS_STATEFUL] [VARCHAR] (1)  NOT NULL ,
  [REQUESTS_RECOVERY] [VARCHAR] (1)  NOT NULL ,
  [JOB_DATA] [IMAGE] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_JOB_LISTENERS] (
  [JOB_NAME] [VARCHAR] (80)  NOT NULL ,
  [JOB_GROUP] [VARCHAR] (80)  NOT NULL ,
  [JOB_LISTENER] [VARCHAR] (80)  NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] (
  [TRIGGER_NAME] [VARCHAR] (80)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (80)  NOT NULL ,
  [REPEAT_COUNT] [BIGINT] NOT NULL ,
  [REPEAT_INTERVAL] [BIGINT] NOT NULL ,
  [TIMES_TRIGGERED] [BIGINT] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_BLOB_TRIGGERS] (
  [TRIGGER_NAME] [VARCHAR] (80)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (80)  NOT NULL ,
  [BLOB_DATA] [IMAGE] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_TRIGGER_LISTENERS] (
  [TRIGGER_NAME] [VARCHAR] (80)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (80)  NOT NULL ,
  [TRIGGER_LISTENER] [VARCHAR] (80)  NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_TRIGGERS] (
  [TRIGGER_NAME] [VARCHAR] (80)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (80)  NOT NULL ,
  [JOB_NAME] [VARCHAR] (80)  NOT NULL ,
  [JOB_GROUP] [VARCHAR] (80)  NOT NULL ,
  [IS_VOLATILE] [VARCHAR] (1)  NOT NULL ,
  [DESCRIPTION] [VARCHAR] (120) NULL ,
  [NEXT_FIRE_TIME] [BIGINT] NULL ,
  [PREV_FIRE_TIME] [BIGINT] NULL ,
  [TRIGGER_STATE] [VARCHAR] (16)  NOT NULL ,
  [TRIGGER_TYPE] [VARCHAR] (8)  NOT NULL ,
  [START_TIME] [BIGINT] NOT NULL ,
  [END_TIME] [BIGINT] NULL ,
  [CALENDAR_NAME] [VARCHAR] (80)  NULL ,
  [MISFIRE_INSTR] [SMALLINT] NULL ,
  [PRIORITY] [INT] NULL ,
  [JOB_DATA] [IMAGE] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_CALENDARS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_CALENDARS] PRIMARY KEY  CLUSTERED
  (
    [CALENDAR_NAME]
  )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_CRON_TRIGGERS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_CRON_TRIGGERS] PRIMARY KEY  CLUSTERED
  (
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_FIRED_TRIGGERS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_FIRED_TRIGGERS] PRIMARY KEY  CLUSTERED
  (
    [ENTRY_ID]
  )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_PAUSED_TRIGGER_GRPS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_PAUSED_TRIGGER_GRPS] PRIMARY KEY  CLUSTERED
  (
    [TRIGGER_GROUP]
  )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_SCHEDULER_STATE] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_SCHEDULER_STATE] PRIMARY KEY  CLUSTERED
  (
    [INSTANCE_NAME]
  )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_LOCKS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_LOCKS] PRIMARY KEY  CLUSTERED
  (
    [LOCK_NAME]
  )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_JOB_DETAILS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_JOB_DETAILS] PRIMARY KEY  CLUSTERED
  (
    [JOB_NAME],
    [JOB_GROUP]
  )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_JOB_LISTENERS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_JOB_LISTENERS] PRIMARY KEY  CLUSTERED
  (
    [JOB_NAME],
    [JOB_GROUP],
    [JOB_LISTENER]
  )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_SIMPLE_TRIGGERS] PRIMARY KEY  CLUSTERED
  (
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_TRIGGER_LISTENERS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_TRIGGER_LISTENERS] PRIMARY KEY  CLUSTERED
  (
    [TRIGGER_NAME],
    [TRIGGER_GROUP],
    [TRIGGER_LISTENER]
  )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_TRIGGERS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_TRIGGERS] PRIMARY KEY  CLUSTERED
  (
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_CRON_TRIGGERS] ADD
  CONSTRAINT [FK_QRTZ_CRON_TRIGGERS_QRTZ_TRIGGERS] FOREIGN KEY
  (
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  ) REFERENCES [dbo].[QRTZ_TRIGGERS] (
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  ) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[QRTZ_JOB_LISTENERS] ADD
  CONSTRAINT [FK_QRTZ_JOB_LISTENERS_QRTZ_JOB_DETAILS] FOREIGN KEY
  (
    [JOB_NAME],
    [JOB_GROUP]
  ) REFERENCES [dbo].[QRTZ_JOB_DETAILS] (
    [JOB_NAME],
    [JOB_GROUP]
  ) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] ADD
  CONSTRAINT [FK_QRTZ_SIMPLE_TRIGGERS_QRTZ_TRIGGERS] FOREIGN KEY
  (
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  ) REFERENCES [dbo].[QRTZ_TRIGGERS] (
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  ) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[QRTZ_TRIGGER_LISTENERS] ADD
  CONSTRAINT [FK_QRTZ_TRIGGER_LISTENERS_QRTZ_TRIGGERS] FOREIGN KEY
  (
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  ) REFERENCES [dbo].[QRTZ_TRIGGERS] (
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  ) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[QRTZ_TRIGGERS] ADD
  CONSTRAINT [FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS] FOREIGN KEY
  (
    [JOB_NAME],
    [JOB_GROUP]
  ) REFERENCES [dbo].[QRTZ_JOB_DETAILS] (
    [JOB_NAME],
    [JOB_GROUP]
  )
GO

INSERT INTO [dbo].[QRTZ_LOCKS] VALUES('TRIGGER_ACCESS');
INSERT INTO [dbo].[QRTZ_LOCKS] VALUES('JOB_ACCESS');
INSERT INTO [dbo].[QRTZ_LOCKS] VALUES('CALENDAR_ACCESS');
INSERT INTO [dbo].[QRTZ_LOCKS] VALUES('STATE_ACCESS');
INSERT INTO [dbo].[QRTZ_LOCKS] VALUES('MISFIRE_ACCESS');

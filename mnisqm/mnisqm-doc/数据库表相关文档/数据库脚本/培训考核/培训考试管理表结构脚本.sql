USE [MNIS_QM]
GO
/****** Object:  Table [dbo].[COM_TRANSFERS_MANAGE]    Script Date: 2016/5/31 14:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COM_TRANSFERS_MANAGE](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[USER_CODE] [varchar](10) NOT NULL,
	[USER_NAME] [varchar](50) NOT NULL,
	[OUT_DEPT] [varchar](20) NOT NULL,
	[OUT_TIME] [datetime] NOT NULL,
	[IN_DEPT] [varchar](20) NOT NULL,
	[IN_TIME] [datetime] NOT NULL,
	[STATUS] [int] NOT NULL,
	[IS_VALID] [char](1) NOT NULL,
	[REMARK] [varchar](200) NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](50) NOT NULL,
	[UPDATE_TIME] [datetime] NULL,
	[UPDATE_PERSON] [varchar](50) NULL,
 CONSTRAINT [PK_COM_TRANSFERS_MANAGE] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEM_ATTENDANCE_MANAGE]    Script Date: 2016/5/31 14:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEM_ATTENDANCE_MANAGE](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TRAIN_CODE] [varchar](20) NOT NULL,
	[DEPT_CODE] [varchar](20) NOT NULL,
	[USER_CODE] [varchar](10) NOT NULL,
	[USER_NAME] [varchar](50) NOT NULL,
	[ATTENDANCE_SITUATION] [int] NOT NULL,
	[REMARK] [varchar](200) NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](50) NOT NULL,
	[UPDATE_TIME] [datetime] NULL,
	[UPDATE_PERSON] [varchar](50) NULL,
 CONSTRAINT [PK_TEM_ATTENDANCE_MANAGE] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEM_EXAM_MANAGE]    Script Date: 2016/5/31 14:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEM_EXAM_MANAGE](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EXAM_CODE] [varchar](20) NOT NULL,
	[EXAM_NAME] [varchar](100) NOT NULL,
	[EXAM_TIME] [datetime] NOT NULL,
	[TIME_SPAN] [varchar](20) NOT NULL,
	[PLACE] [varchar](50) NULL,
	[GROSS_SCORE] [decimal](5, 1) NOT NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](50) NOT NULL,
	[UPDATE_TIME] [datetime] NULL,
	[UPDATE_PERSON] [varchar](50) NULL,
 CONSTRAINT [PK_TEM_EXAM_MANAGE] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TEM_EXAM_MANAGE_1] UNIQUE NONCLUSTERED 
(
	[EXAM_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEM_PERFORMANCE_MANAGE]    Script Date: 2016/5/31 14:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEM_PERFORMANCE_MANAGE](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EXAM_CODE] [varchar](20) NOT NULL,
	[DEPT_CODE] [varchar](20) NOT NULL,
	[USER_CODE] [varchar](10) NOT NULL,
	[USER_NAME] [varchar](50) NOT NULL,
	[SCORE] [decimal](5, 1) NULL,
	[ASSESS_SITUATION] [int] NULL,
	[REMARK] [varchar](200) NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](50) NOT NULL,
	[UPDATE_TIME] [datetime] NULL,
	[UPDATE_PERSON] [varchar](50) NULL,
 CONSTRAINT [PK_TEM_PERFORMANCE_MANAGE] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEM_TRAIN_MANAGE]    Script Date: 2016/5/31 14:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEM_TRAIN_MANAGE](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TRAIN_CODE] [varchar](20) NOT NULL,
	[COURSE_NAME] [varchar](100) NOT NULL,
	[LECTURER] [varchar](50) NULL,
	[BEGIN_TIME] [datetime] NOT NULL,
	[END_TIME] [datetime] NOT NULL,
	[PLACE] [varchar](50) NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](50) NOT NULL,
	[UPDATE_TIME] [datetime] NULL,
	[UPDATE_PERSON] [varchar](50) NULL,
 CONSTRAINT [PK_TEM_TRAIN_MANAGE] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TEM_TRAIN_MANAGE_1] UNIQUE NONCLUSTERED 
(
	[TRAIN_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[COM_TRANSFERS_MANAGE] ADD  DEFAULT (getdate()) FOR [CREATE_TIME]
GO
ALTER TABLE [dbo].[TEM_ATTENDANCE_MANAGE] ADD  CONSTRAINT [DF_TEM_ATTENDANCE_MANAGE_CREATE_TIME]  DEFAULT (getdate()) FOR [CREATE_TIME]
GO
ALTER TABLE [dbo].[TEM_EXAM_MANAGE] ADD  DEFAULT (getdate()) FOR [CREATE_TIME]
GO
ALTER TABLE [dbo].[TEM_PERFORMANCE_MANAGE] ADD  DEFAULT (getdate()) FOR [CREATE_TIME]
GO
ALTER TABLE [dbo].[TEM_TRAIN_MANAGE] ADD  DEFAULT (getdate()) FOR [CREATE_TIME]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增长主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'SEQ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'USER_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'USER_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调出科室' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'OUT_DEPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调出日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'OUT_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调入科室' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'IN_DEPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调入日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'IN_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态：1 申请、2 审核' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有效 Y 是 N 否' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'IS_VALID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'REMARK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'CREATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'UPDATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE', @level2type=N'COLUMN',@level2name=N'UPDATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基础信息-人员调动管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'COM_TRANSFERS_MANAGE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增长主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'SEQ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训表编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'TRAIN_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'科室编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'DEPT_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'USER_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'USER_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出勤情况 1 出勤、2 请假、3 缺勤、4 早退' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'ATTENDANCE_SITUATION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'REMARK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'CREATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'UPDATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'UPDATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训考试管理-出勤管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_ATTENDANCE_MANAGE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增长主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE', @level2type=N'COLUMN',@level2name=N'SEQ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试管理编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE', @level2type=N'COLUMN',@level2name=N'EXAM_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE', @level2type=N'COLUMN',@level2name=N'EXAM_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE', @level2type=N'COLUMN',@level2name=N'EXAM_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE', @level2type=N'COLUMN',@level2name=N'TIME_SPAN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE', @level2type=N'COLUMN',@level2name=N'PLACE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE', @level2type=N'COLUMN',@level2name=N'GROSS_SCORE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE', @level2type=N'COLUMN',@level2name=N'CREATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE', @level2type=N'COLUMN',@level2name=N'UPDATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE', @level2type=N'COLUMN',@level2name=N'UPDATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训考试管理-考试管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_EXAM_MANAGE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增长主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'SEQ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试管理编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'EXAM_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'科室编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'DEPT_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'USER_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'USER_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成绩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'SCORE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考核情况  1通过、2 未通过' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'ASSESS_SITUATION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'REMARK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'CREATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'UPDATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE', @level2type=N'COLUMN',@level2name=N'UPDATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训考试管理-成绩管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_PERFORMANCE_MANAGE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增长主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE', @level2type=N'COLUMN',@level2name=N'SEQ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训管理编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE', @level2type=N'COLUMN',@level2name=N'TRAIN_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE', @level2type=N'COLUMN',@level2name=N'COURSE_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'讲师姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE', @level2type=N'COLUMN',@level2name=N'LECTURER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE', @level2type=N'COLUMN',@level2name=N'BEGIN_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE', @level2type=N'COLUMN',@level2name=N'END_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE', @level2type=N'COLUMN',@level2name=N'PLACE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE', @level2type=N'COLUMN',@level2name=N'CREATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE', @level2type=N'COLUMN',@level2name=N'UPDATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE', @level2type=N'COLUMN',@level2name=N'UPDATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训考试管理-培训管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TEM_TRAIN_MANAGE'
GO

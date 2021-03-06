USE [MNIS_V3]
GO
/****** Object:  Table [dbo].[SAT_RESULT]    Script Date: 2016/6/12 16:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAT_RESULT](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DEPT_CODE] [varchar](20) NOT NULL,
	[RESULT_CODE] [varchar](20) NOT NULL,
	[USER_TYPE] [int] NOT NULL,
	[BED_CODE] [varchar](10) NULL,
	[FORM_TYPE] [varchar](20) NOT NULL,
	[USER_CODE] [varchar](10) NULL,
	[NAME] [varchar](50) NULL,
	[IN_HOSP_NO] [varchar](20) NULL,
	[SURVER_DATE] [date] NOT NULL,
	[ADVICE] [varchar](500) NULL,
	[STATUS] [varchar](2) NOT NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](50) NOT NULL,
	[UPDATE_TIME] [datetime] NULL,
	[UPDATE_PERSON] [varchar](50) NULL,
 CONSTRAINT [PK_SAT_RESULT] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAT_RESULT_DETAIL]    Script Date: 2016/6/12 16:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAT_RESULT_DETAIL](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DETAIL_CODE] [varchar](20) NOT NULL,
	[RESULT_CODE] [varchar](20) NOT NULL,
	[CONTENT] [varchar](500) NOT NULL,
	[OPTION_CODE] [varchar](100) NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](50) NOT NULL,
	[UPDATE_TIME] [datetime] NULL,
	[UPDATE_PERSON] [varchar](50) NULL,
 CONSTRAINT [PK_SAT_RESULT_DETAIL] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SAT_RESULT] ADD  CONSTRAINT [DF__SAT_RESUL__CREAT__426DB909]  DEFAULT (getdate()) FOR [CREATE_TIME]
GO
ALTER TABLE [dbo].[SAT_RESULT_DETAIL] ADD  DEFAULT (getdate()) FOR [CREATE_TIME]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增长主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'SEQ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'DEPT_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'RESULT_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'USER_TYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'床号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'BED_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'FORM_TYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'护士编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'USER_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'住院号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'IN_HOSP_NO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调查日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'SURVER_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建议' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'ADVICE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'CREATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'UPDATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT', @level2type=N'COLUMN',@level2name=N'UPDATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'满意度调查-满意度结果主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增长主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT_DETAIL', @level2type=N'COLUMN',@level2name=N'SEQ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细编号  满意度模板明细的detailCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT_DETAIL', @level2type=N'COLUMN',@level2name=N'DETAIL_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT_DETAIL', @level2type=N'COLUMN',@level2name=N'RESULT_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT_DETAIL', @level2type=N'COLUMN',@level2name=N'CONTENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选择结果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT_DETAIL', @level2type=N'COLUMN',@level2name=N'OPTION_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT_DETAIL', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT_DETAIL', @level2type=N'COLUMN',@level2name=N'CREATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT_DETAIL', @level2type=N'COLUMN',@level2name=N'UPDATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT_DETAIL', @level2type=N'COLUMN',@level2name=N'UPDATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'满意度调查-满意度结果明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_RESULT_DETAIL'
GO

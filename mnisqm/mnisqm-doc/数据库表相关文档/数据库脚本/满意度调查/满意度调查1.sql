USE [MNIS_V3]
GO
/****** Object:  Table [dbo].[SAT_OPTION]    Script Date: 2016/6/12 16:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAT_OPTION](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DETAIL_CODE] [varchar](20) NOT NULL,
	[OPTION_CODE] [varchar](20) NULL,
	[OPTION_CONTENT] [varchar](50) NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](50) NOT NULL,
	[UPDATE_TIME] [datetime] NULL,
	[UPDATE_PERSON] [varchar](50) NULL,
 CONSTRAINT [PK_SAT_OPTION] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAT_TEMPLATE]    Script Date: 2016/6/12 16:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAT_TEMPLATE](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FORM_CODE] [varchar](20) NOT NULL,
	[FORM_NAME] [varchar](50) NULL,
	[FORM_TYPE] [varchar](20) NOT NULL,
	[USER_TYPE] [int] NOT NULL,
	[STATUS] [varchar](2) NOT NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](50) NOT NULL,
	[UPDATE_TIME] [datetime] NULL,
	[UPDATE_PERSON] [varchar](50) NULL,
 CONSTRAINT [PK_SAT_TEMPLATE] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_SAT_TEMPLATE_1] UNIQUE NONCLUSTERED 
(
	[FORM_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAT_TEMPLATE_DETAIL]    Script Date: 2016/6/12 16:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAT_TEMPLATE_DETAIL](
	[SEQ_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DETAIL_CODE] [varchar](20) NOT NULL,
	[FORM_CODE] [varchar](20) NOT NULL,
	[CONTENT] [varchar](500) NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[CREATE_PERSON] [varchar](50) NOT NULL,
	[UPDATE_TIME] [datetime] NULL,
	[UPDATE_PERSON] [varchar](50) NULL,
 CONSTRAINT [PK_SAT_TEMPLATE_DETAIL] PRIMARY KEY CLUSTERED 
(
	[SEQ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SAT_OPTION] ADD  DEFAULT (getdate()) FOR [CREATE_TIME]
GO
ALTER TABLE [dbo].[SAT_TEMPLATE] ADD  CONSTRAINT [DF__SAT_TEMPL__CREAT__36FC065D]  DEFAULT (getdate()) FOR [CREATE_TIME]
GO
ALTER TABLE [dbo].[SAT_TEMPLATE_DETAIL] ADD  DEFAULT (getdate()) FOR [CREATE_TIME]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增长主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_OPTION', @level2type=N'COLUMN',@level2name=N'SEQ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_OPTION', @level2type=N'COLUMN',@level2name=N'DETAIL_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选项编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_OPTION', @level2type=N'COLUMN',@level2name=N'OPTION_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_OPTION', @level2type=N'COLUMN',@level2name=N'OPTION_CONTENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_OPTION', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_OPTION', @level2type=N'COLUMN',@level2name=N'CREATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_OPTION', @level2type=N'COLUMN',@level2name=N'UPDATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_OPTION', @level2type=N'COLUMN',@level2name=N'UPDATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'满意度调查-选项表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_OPTION'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增长主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE', @level2type=N'COLUMN',@level2name=N'SEQ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE', @level2type=N'COLUMN',@level2name=N'FORM_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE', @level2type=N'COLUMN',@level2name=N'FORM_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE', @level2type=N'COLUMN',@level2name=N'FORM_TYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用类型  1：患者；2：护士' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE', @level2type=N'COLUMN',@level2name=N'USER_TYPE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 01：有效；09：无效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE', @level2type=N'COLUMN',@level2name=N'STATUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE', @level2type=N'COLUMN',@level2name=N'CREATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE', @level2type=N'COLUMN',@level2name=N'UPDATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE', @level2type=N'COLUMN',@level2name=N'UPDATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'满意度调查-满意度模板主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增长主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE_DETAIL', @level2type=N'COLUMN',@level2name=N'SEQ_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE_DETAIL', @level2type=N'COLUMN',@level2name=N'DETAIL_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE_DETAIL', @level2type=N'COLUMN',@level2name=N'FORM_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE_DETAIL', @level2type=N'COLUMN',@level2name=N'CONTENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE_DETAIL', @level2type=N'COLUMN',@level2name=N'CREATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE_DETAIL', @level2type=N'COLUMN',@level2name=N'CREATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE_DETAIL', @level2type=N'COLUMN',@level2name=N'UPDATE_TIME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE_DETAIL', @level2type=N'COLUMN',@level2name=N'UPDATE_PERSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'满意度调查-满意度模板明细' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SAT_TEMPLATE_DETAIL'
GO

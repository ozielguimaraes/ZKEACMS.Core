CREATE TABLE [dbo].[ProductCategoryTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryId] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[ParentId] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ProductCategoryTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProductTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[TagId] [int] NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProductImage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ImageUrl] [nvarchar](500) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 4) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PromoCode] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [nvarchar](50) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Total] [decimal](18, 4) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[PayTime] [datetime] NULL,
	[CompletePayTime] [datetime] NULL,
	[TrackingNumber] [nvarchar](50) NULL,
	[LogisticsCompany] [nvarchar](50) NULL,
	[ShippingAddress] [nvarchar](500) NULL,
	[PaymentGateway] [nvarchar](50) NULL,
	[PaymentID] [nvarchar](500) NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [nvarchar](50) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 4) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PromoCode] [nvarchar](50) NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreatebyName] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateBy] [nvarchar](50) NULL,
	[LastUpdateByName] [nvarchar](100) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT INTO dbo.DataDictionary( DicName ,Title ,DicValue ,[Order] ,Pid ,IsSystem ,Status)
SELECT N'Order@OrderStatus',N'未支付',1,1,0,1,0 UNION ALL
SELECT N'Order@OrderStatus',N'取消',2,2,0,1,0 UNION ALL
SELECT N'Order@OrderStatus',N'已支付',3,3,0,1,0 UNION ALL
SELECT N'Order@OrderStatus',N'已发货',4,4,0,1,0 UNION ALL
SELECT N'Order@OrderStatus',N'交易完成',5,5,0,1,0 UNION ALL
SELECT N'Order@OrderStatus',N'已退款',6,6,0,1,0 UNION ALL
SELECT N'Order@OrderStatus',N'退款中',7,7,0,1,0
GO

INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductImages', N'zh-CN', N'展示图', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductEntity@ProductTags', N'zh-CN', N'标签', N'ProductEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@CreatebyName', N'zh-CN', N'创建人', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@CreateDate', N'zh-CN', N'创建日期', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@Description', N'zh-CN', N'描述', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@ImageUrl', N'zh-CN', N'图片', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@LastUpdateByName', N'zh-CN', N'更新人', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@LastUpdateDate', N'zh-CN', N'更新日期', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@Status', N'zh-CN', N'状态', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'ProductImage@Title', N'zh-CN', N'标题', N'ProductImage', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@CultureName', N'zh-CN', N'语言缩写', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanKey', N'zh-CN', N'翻译键', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanType', N'zh-CN', N'对象', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@LanValue', N'zh-CN', N'翻译值', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'LanguageEntity@Module', N'zh-CN', N'模块', N'LanguageEntity', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@ActionType', N'zh-CN', N'ActionType', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CompletePayTime', N'zh-CN', N'完成支付时间', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Contact', N'zh-CN', N'联系人', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CreateBy', N'zh-CN', N'CreateBy', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CreatebyName', N'zh-CN', N'创建人', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@CreateDate', N'zh-CN', N'创建日期', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Description', N'zh-CN', N'描述', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@ID', N'zh-CN', N'订单号', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateBy', N'zh-CN', N'LastUpdateBy', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateByName', N'zh-CN', N'更新人', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LastUpdateDate', N'zh-CN', N'更新日期', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@LogisticsCompany', N'zh-CN', N'快递公司', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@OrderStatus', N'zh-CN', N'订单状态', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PaymentGateway', N'zh-CN', N'支付方式', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PaymentID', N'zh-CN', N'支付ID', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PayTime', N'zh-CN', N'发起支付时间', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@PhoneNumber', N'zh-CN', N'电话', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@ShippingAddress', N'zh-CN', N'收货地址', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Status', N'zh-CN', N'状态', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Title', N'zh-CN', N'标题', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@Total', N'zh-CN', N'总价', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@TrackingNumber', N'zh-CN', N'快递单号', N'Order', N'EntityProperty')
INSERT [dbo].[Language] ([LanKey], [CultureName], [LanValue], [Module], [LanType]) VALUES (N'Order@UserId', N'zh-CN', N'登录名', N'Order', N'EntityProperty')

GO
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategoryTag_Manage', 1, N'管理产品标签', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-11T15:43:52.953' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-11T15:43:52.953' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'ProductCategoryTag_View', 1, N'查看产品标签', NULL, N'产品', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-11T15:43:52.947' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-11T15:43:52.947' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_Manage', 1, N'管理订单', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17 10:49:53.937' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-17 11:47:13.047' AS DateTime))
INSERT [dbo].[Permission] ([PermissionKey], [RoleId], [Title], [Description], [Module], [Status], [CreateBy], [CreatebyName], [CreateDate], [LastUpdateBy], [LastUpdateByName], [LastUpdateDate]) VALUES (N'Order_View', 1, N'查看订单', NULL, N'商城', NULL, N'admin', N'ZKEASOFT', CAST(N'2017-11-17 10:49:53.923' AS DateTime), N'admin', N'ZKEASOFT', CAST(N'2017-11-17 11:47:13.060' AS DateTime))
GO
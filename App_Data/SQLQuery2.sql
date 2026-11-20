CREATE TABLE [dbo].[Users] (
    [UserId]          INT            IDENTITY (1, 1) NOT NULL,
    [FullName]        NVARCHAR (100) NOT NULL,
    [Email]           NVARCHAR (120) NOT NULL,
    [PhoneNumber]     NVARCHAR (20)  NULL,
    [PasswordHash]    NVARCHAR (255) NOT NULL,
    [ProfileImageUrl] NVARCHAR (255) DEFAULT ('Images/default_avatar.jpg') NULL,
    [MembershipTier]  NVARCHAR (50)  DEFAULT ('Standard Member') NULL,
    [Status]          NVARCHAR (20)  DEFAULT ('ACTIVE') NULL,
    [MemberSince]     DATETIME       DEFAULT (getdate()) NULL,
    [CreatedAt]       DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);
GO

CREATE TABLE [dbo].[AboutCoreValues] (
    [ValueId]     INT            IDENTITY (1, 1) NOT NULL,
    [IconClass]   NVARCHAR (50)  NULL,
    [Title]       NVARCHAR (100) NULL,
    [Description] NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([ValueId] ASC)
);
GO

CREATE TABLE [dbo].[AboutLeadership] (
    [LeaderId]  INT            IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (100) NULL,
    [Role]      NVARCHAR (100) NULL,
    [AvatarUrl] NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([LeaderId] ASC)
);
GO

CREATE TABLE [dbo].[AboutUsContent] (
    [Id]           INT            DEFAULT ((1)) NOT NULL,
    [OurStory]     NVARCHAR (MAX) NULL,
    [OurMission]   NVARCHAR (MAX) NULL,
    [OurVision]    NVARCHAR (MAX) NULL,
    [HeroImageUrl] NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

CREATE TABLE [dbo].[AdminUsers] (
    [AdminId]               INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]             NVARCHAR (50)  NOT NULL,
    [LastName]              NVARCHAR (50)  NOT NULL,
    [Email]                 NVARCHAR (120) NOT NULL,
    [PhoneNumber]           NVARCHAR (20)  NULL,
    [PasswordHash]          NVARCHAR (255) NOT NULL,
    [AvatarUrl]             NVARCHAR (255) DEFAULT ('Images/profile.jpg') NULL,
    [SystemLanguage]        NVARCHAR (20)  DEFAULT ('en-US') NULL,
    [NotifyNewOrders]       BIT            DEFAULT ((1)) NULL,
    [NotifyInventoryAlerts] BIT            DEFAULT ((1)) NULL,
    [NotifyDailySummary]    BIT            DEFAULT ((0)) NULL,
    [CreatedAt]             DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([AdminId] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);
GO

CREATE TABLE [dbo].[Categories] (
    [CategoryId]     INT            IDENTITY (1, 1) NOT NULL,
    [CategoryName]   NVARCHAR (100) NOT NULL,
    [Description]    NVARCHAR (500) NULL,
    [Status]         NVARCHAR (20)  DEFAULT ('ACTIVE') NULL,
    [InventoryCount] INT            DEFAULT ((0)) NULL,
    [CreatedAt]      DATETIME       DEFAULT (getdate()) NULL,
    [CategorySlug]   NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([CategoryId] ASC)
);
GO

CREATE TABLE [dbo].[CategoryImages] (
    [ImageId]    INT            IDENTITY (1, 1) NOT NULL,
    [CategoryId] INT            NOT NULL,
    [ImageUrl]   NVARCHAR (255) NOT NULL,
    [IsCover]    BIT            DEFAULT ((0)) NULL,
    [SortOrder]  INT            DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([ImageId] ASC),
    FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([CategoryId]) ON DELETE CASCADE
);
GO

CREATE TABLE [dbo].[CholiItems] (
    [ItemId]           INT             IDENTITY (1, 1) NOT NULL,
    [CategoryId]       INT             NOT NULL,
    [SKU]              NVARCHAR (50)   NOT NULL,
    [Title]            NVARCHAR (150)  NOT NULL,
    [Fabric]           NVARCHAR (100)  NULL,
    [Color]            NVARCHAR (50)   NULL,
    [SizeOption]       NVARCHAR (50)   DEFAULT ('M/38') NULL,
    [RentalPeriodDays] INT             DEFAULT ((3)) NULL,
    [RentalPrice]      DECIMAL (10, 2) NOT NULL,
    [SecurityDeposit]  DECIMAL (10, 2) DEFAULT ((0.00)) NULL,
    [Description]      NVARCHAR (MAX)  NULL,
    [Status]           NVARCHAR (30)   DEFAULT ('Available') NULL,
    [IsTrending]       BIT             DEFAULT ((0)) NULL,
    [IsNewArrival]     BIT             DEFAULT ((0)) NULL,
    [PrimaryImageUrl]  NVARCHAR (255)  NOT NULL,
    [CreatedAt]        DATETIME        DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ItemId] ASC),
    UNIQUE NONCLUSTERED ([SKU] ASC),
    FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([CategoryId])
);
GO

CREATE TABLE [dbo].[ContactUsContent] (
    [Id]                 INT            DEFAULT ((1)) NOT NULL,
    [BusinessPhone]      NVARCHAR (30)  NULL,
    [SecondaryPhone]     NVARCHAR (30)  NULL,
    [WhatsappNumber]     NVARCHAR (30)  NULL,
    [BusinessEmail]      NVARCHAR (100) NULL,
    [InstagramUrl]       NVARCHAR (255) NULL,
    [FacebookUrl]        NVARCHAR (255) NULL,
    [StoreAddress]       NVARCHAR (500) NULL,
    [EmailNotifications] BIT            DEFAULT ((1)) NULL,
    [AutoReply]          BIT            DEFAULT ((0)) NULL,
    [UpdatedAt]          DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

CREATE TABLE [dbo].[CustomerAddresses] (
    [AddressId]     INT            IDENTITY (1, 1) NOT NULL,
    [UserId]        INT            NOT NULL,
    [RecipientName] NVARCHAR (100) NOT NULL,
    [PhoneNumber]   NVARCHAR (20)  NOT NULL,
    [StreetAddress] NVARCHAR (255) NOT NULL,
    [City]          NVARCHAR (100) NOT NULL,
    [StateProvince] NVARCHAR (100) NOT NULL,
    [PostalPincode] NVARCHAR (20)  NOT NULL,
    [AddressType]   NVARCHAR (20)  DEFAULT ('Home') NULL,
    [IsDefault]     BIT            DEFAULT ((1)) NULL,
    [CreatedAt]     DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([AddressId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]) ON DELETE CASCADE
);
GO

CREATE TABLE [dbo].[HomeCollections] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Title]      NVARCHAR (100) NOT NULL,
    [ItemsCount] INT            DEFAULT ((0)) NULL,
    [ImageUrl]   NVARCHAR (255) DEFAULT ('Images/default_collection.jpg') NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

CREATE TABLE [dbo].[HomePageSettings] (
    [Id]               INT            DEFAULT ((1)) NOT NULL,
    [HeroMainHeading]  NVARCHAR (150) NULL,
    [HeroSubtext]      NVARCHAR (300) NULL,
    [HeroBtnText]      NVARCHAR (50)  NULL,
    [NarrativeHeading] NVARCHAR (200) NULL,
    [NarrativeBody]    NVARCHAR (MAX) NULL,
    [UpdatedAt]        DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

CREATE TABLE [dbo].[HomeTrendingCholis] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (150) NOT NULL,
    [RentalPrice] NVARCHAR (50)  NOT NULL,
    [Status]      NVARCHAR (30)  DEFAULT ('In Stock') NULL,
    [ImageUrl]    NVARCHAR (255) DEFAULT ('Images/default_choli.jpg') NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

CREATE TABLE [dbo].[Notifications] (
    [NotificationId] INT            IDENTITY (1, 1) NOT NULL,
    [Title]          NVARCHAR (150) NOT NULL,
    [MessageContent] NVARCHAR (MAX) NOT NULL,
    [Category]       NVARCHAR (50)  DEFAULT ('Rentals') NULL,
    [RecipientGroup] NVARCHAR (50)  DEFAULT ('All Subscribers') NULL,
    [DeliveryMethod] NVARCHAR (50)  DEFAULT ('Email') NULL,
    [ScheduledTime]  DATETIME       NULL,
    [Status]         NVARCHAR (20)  DEFAULT ('Sent') NULL,
    [CreatedAt]      DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([NotificationId] ASC)
);
GO

CREATE TABLE [dbo].[Offers] (
    [OfferId]           INT             IDENTITY (1, 1) NOT NULL,
    [OfferName]         NVARCHAR (100)  NOT NULL,
    [CouponCode]        NVARCHAR (30)   NOT NULL,
    [DiscountType]      NVARCHAR (20)   NOT NULL,
    [DiscountValue]     DECIMAL (10, 2) NOT NULL,
    [FormattedDiscount] NVARCHAR (50)   NULL,
    [MinOrderValue]     DECIMAL (10, 2) NULL,
    [UsageLimit]        INT             DEFAULT ((1)) NULL,
    [StartDate]         DATE            NOT NULL,
    [EndDate]           DATE            NULL,
    [Status]            NVARCHAR (20)   DEFAULT ('Active') NULL,
    [CreatedAt]         DATETIME        DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([OfferId] ASC),
    UNIQUE NONCLUSTERED ([CouponCode] ASC)
);
GO

CREATE TABLE [dbo].[Orders] (
    [OrderId]               INT             IDENTITY (1, 1) NOT NULL,
    [OrderCode]             NVARCHAR (40)   NOT NULL,
    [UserId]                INT             NOT NULL,
    [AddressId]             INT             NOT NULL,
    [Subtotal]              DECIMAL (10, 2) NOT NULL,
    [CleaningFee]           DECIMAL (10, 2) DEFAULT ((0.00)) NULL,
    [InsuranceFee]          DECIMAL (10, 2) DEFAULT ((0.00)) NULL,
    [TaxAmount]             DECIMAL (10, 2) DEFAULT ((0.00)) NULL,
    [TotalAmount]            DECIMAL (10, 2) NOT NULL,
    [EstimatedDeliveryDate] DATE            NULL,
    [OrderStatus]            NVARCHAR (30)   DEFAULT ('Confirmed') NULL,
    [PaymentMethod]          NVARCHAR (50)   DEFAULT ('Cash on Delivery') NULL,
    [PaymentStatus]          NVARCHAR (30)   DEFAULT ('Pending') NULL,
    [CreatedAt]             DATETIME        DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([OrderId] ASC),
    UNIQUE NONCLUSTERED ([OrderCode] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]),
    FOREIGN KEY ([AddressId]) REFERENCES [dbo].[CustomerAddresses] ([AddressId])
);
GO

CREATE TABLE [dbo].[OrderItems] (
    [OrderItemId] INT             IDENTITY (1, 1) NOT NULL,
    [OrderId]     INT             NOT NULL,
    [ItemId]      INT             NULL,
    [Quantity]    INT             DEFAULT ((1)) NULL,
    [RentalPrice] DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderItemId] ASC),
    CONSTRAINT [FK_OrderItems_Orders]
        FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([OrderId])
);
GO

CREATE TABLE [dbo].[PasswordResetOtps] (
    [OtpId]      INT          IDENTITY (1, 1) NOT NULL,
    [Email]      NVARCHAR (120) NOT NULL,
    [OtpCode]    VARCHAR (6)  NOT NULL,
    [ExpiryTime] DATETIME     NOT NULL,
    [IsUsed]     BIT          DEFAULT ((0)) NULL,
    [CreatedAt]  DATETIME     DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([OtpId] ASC)
);
GO

CREATE TABLE [dbo].[Payments] (
    [PaymentId]     INT             IDENTITY (1, 1) NOT NULL,
    [OrderId]       INT             NOT NULL,
    [TransactionId] NVARCHAR (100)  NOT NULL,
    [Amount]        DECIMAL (10, 2) NOT NULL,
    [PaymentMethod] NVARCHAR (50)   NULL,
    [PaymentStatus] NVARCHAR (30)   NOT NULL,
    [PaymentDate]   DATETIME        DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([PaymentId] ASC),
    UNIQUE NONCLUSTERED ([TransactionId] ASC),
    FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([OrderId])
);
GO

CREATE TABLE [dbo].[RefundRequests] (
    [RefundId]        INT            IDENTITY (1, 1) NOT NULL,
    [RefundRequestId] NVARCHAR (50)  NOT NULL,
    [OrderId]         INT            NOT NULL,
    [RefundAmount]    DECIMAL (10, 2) NOT NULL,
    [Reason]          NVARCHAR (255) NOT NULL,
    [Status]          NVARCHAR (30)  DEFAULT ('Pending') NULL,
    [RequestedDate]   DATETIME       DEFAULT (getdate()) NULL,
    [ProcessedDate]   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([RefundId] ASC),
    UNIQUE NONCLUSTERED ([RefundRequestId] ASC),
    FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([OrderId])
);
GO

CREATE TABLE [dbo].[RentalCart] (
    [CartId]          INT             IDENTITY (1, 1) NOT NULL,
    [UserId]          INT             NOT NULL,
    [ItemId]          INT             NOT NULL,
    [RentalStartDate] DATE            NOT NULL,
    [RentalEndDate]   DATE            NOT NULL,
    [RentalDays]      INT             DEFAULT ((3)) NULL,
    [RentalPrice]     DECIMAL (10, 2) NOT NULL,
    [CleaningFee]     DECIMAL (10, 2) DEFAULT ((35.00)) NULL,
    [InsuranceFee]    DECIMAL (10, 2) DEFAULT ((20.00)) NULL,
    [CreatedAt]       DATETIME        DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([CartId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]) ON DELETE CASCADE,
    FOREIGN KEY ([ItemId]) REFERENCES [dbo].[CholiItems] ([ItemId]) ON DELETE CASCADE
);
GO

CREATE TABLE [dbo].[Reviews] (
    [ReviewId]            INT            IDENTITY (1, 1) NOT NULL,
    [UserId]              INT            NOT NULL,
    [ItemId]              INT            NOT NULL,
    [Rating]              INT            NOT NULL,
    [SentimentText]       NVARCHAR (50)  NULL,
    [FitFeedback]         NVARCHAR (30)  NULL,
    [ReviewTitle]         NVARCHAR (150) NOT NULL,
    [ReviewBody]          NVARCHAR (MAX) NOT NULL,
    [CustomerSnapshotUrl] NVARCHAR (255) NULL,
    [HelpfulVotes]        INT            DEFAULT ((0)) NULL,
    [Status]              NVARCHAR (20)  DEFAULT ('Pending') NULL,
    [CreatedAt]            DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ReviewId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]),
    FOREIGN KEY ([ItemId]) REFERENCES [dbo].[CholiItems] ([ItemId]),
    CHECK ([Rating] >= (1) AND [Rating] <= (5))
);
GO

CREATE TABLE [dbo].[WebsiteSettings] (
    [SettingId]     INT            IDENTITY (1, 1) NOT NULL,
    [SiteName]      NVARCHAR (100) DEFAULT ('Style On Rent') NULL,
    [Tagline]       NVARCHAR (200) DEFAULT ('Premium Ethnic Wear on Rent') NULL,
    [BusinessEmail] NVARCHAR (120) DEFAULT ('contact@styleonrent.com') NULL,
    [SupportPhone]  NVARCHAR (30)  DEFAULT ('+91 98765 43210') NULL,
    [MainLogoUrl]   NVARCHAR (255) DEFAULT ('Images/logo.png') NULL,
    [FaviconUrl]    NVARCHAR (255) DEFAULT ('Images/favicon.ico') NULL,
    [UpdatedAt]     DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([SettingId] ASC)
);
GO

CREATE TABLE [dbo].[Wishlist] (
    [WishlistId] INT      IDENTITY (1, 1) NOT NULL,
    [UserId]     INT      NOT NULL,
    [ItemId]     INT      NOT NULL,
    [AddedAt]    DATETIME DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([WishlistId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]) ON DELETE CASCADE,
    FOREIGN KEY ([ItemId]) REFERENCES [dbo].[CholiItems] ([ItemId]) ON DELETE CASCADE
);
GO
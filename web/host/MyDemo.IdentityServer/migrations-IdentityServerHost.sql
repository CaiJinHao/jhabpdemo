IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpAuditLogs] (
        [Id] uniqueidentifier NOT NULL,
        [ApplicationName] nvarchar(96) NULL,
        [UserId] uniqueidentifier NULL,
        [UserName] nvarchar(256) NULL,
        [TenantId] uniqueidentifier NULL,
        [TenantName] nvarchar(64) NULL,
        [ImpersonatorUserId] uniqueidentifier NULL,
        [ImpersonatorUserName] nvarchar(256) NULL,
        [ImpersonatorTenantId] uniqueidentifier NULL,
        [ImpersonatorTenantName] nvarchar(64) NULL,
        [ExecutionTime] datetime2 NOT NULL,
        [ExecutionDuration] int NOT NULL,
        [ClientIpAddress] nvarchar(64) NULL,
        [ClientName] nvarchar(128) NULL,
        [ClientId] nvarchar(64) NULL,
        [CorrelationId] nvarchar(64) NULL,
        [BrowserInfo] nvarchar(512) NULL,
        [HttpMethod] nvarchar(16) NULL,
        [Url] nvarchar(256) NULL,
        [Exceptions] nvarchar(max) NULL,
        [Comments] nvarchar(256) NULL,
        [HttpStatusCode] int NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        CONSTRAINT [PK_AbpAuditLogs] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpClaimTypes] (
        [Id] uniqueidentifier NOT NULL,
        [Name] nvarchar(256) NOT NULL,
        [Required] bit NOT NULL,
        [IsStatic] bit NOT NULL,
        [Regex] nvarchar(512) NULL,
        [RegexDescription] nvarchar(128) NULL,
        [Description] nvarchar(256) NULL,
        [ValueType] int NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        CONSTRAINT [PK_AbpClaimTypes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpFeatureValues] (
        [Id] uniqueidentifier NOT NULL,
        [Name] nvarchar(128) NOT NULL,
        [Value] nvarchar(128) NOT NULL,
        [ProviderName] nvarchar(64) NULL,
        [ProviderKey] nvarchar(64) NULL,
        CONSTRAINT [PK_AbpFeatureValues] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpLinkUsers] (
        [Id] uniqueidentifier NOT NULL,
        [SourceUserId] uniqueidentifier NOT NULL,
        [SourceTenantId] uniqueidentifier NULL,
        [TargetUserId] uniqueidentifier NOT NULL,
        [TargetTenantId] uniqueidentifier NULL,
        CONSTRAINT [PK_AbpLinkUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpOrganizationUnitExtensions] (
        [Id] uniqueidentifier NOT NULL,
        [LeaderId] uniqueidentifier NULL,
        [LeaderType] int NULL,
        CONSTRAINT [PK_AbpOrganizationUnitExtensions] PRIMARY KEY ([Id])
    );
    DECLARE @defaultSchema AS sysname;
    SET @defaultSchema = SCHEMA_NAME();
    DECLARE @description AS sql_variant;
    SET @description = N'组织扩展表';
    EXEC sp_addextendedproperty 'MS_Description', @description, 'SCHEMA', @defaultSchema, 'TABLE', N'AbpOrganizationUnitExtensions';
    SET @description = N'用户ID';
    EXEC sp_addextendedproperty 'MS_Description', @description, 'SCHEMA', @defaultSchema, 'TABLE', N'AbpOrganizationUnitExtensions', 'COLUMN', N'LeaderId';
    SET @description = N'领导类型';
    EXEC sp_addextendedproperty 'MS_Description', @description, 'SCHEMA', @defaultSchema, 'TABLE', N'AbpOrganizationUnitExtensions', 'COLUMN', N'LeaderType';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpOrganizationUnits] (
        [Id] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [ParentId] uniqueidentifier NULL,
        [Code] nvarchar(95) NOT NULL,
        [DisplayName] nvarchar(128) NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        [CreationTime] datetime2 NOT NULL,
        [CreatorId] uniqueidentifier NULL,
        [LastModificationTime] datetime2 NULL,
        [LastModifierId] uniqueidentifier NULL,
        [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [DeleterId] uniqueidentifier NULL,
        [DeletionTime] datetime2 NULL,
        CONSTRAINT [PK_AbpOrganizationUnits] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId] FOREIGN KEY ([ParentId]) REFERENCES [AbpOrganizationUnits] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpPermissionGrants] (
        [Id] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [Name] nvarchar(128) NOT NULL,
        [ProviderName] nvarchar(64) NOT NULL,
        [ProviderKey] nvarchar(64) NOT NULL,
        CONSTRAINT [PK_AbpPermissionGrants] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpRoles] (
        [Id] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [Name] nvarchar(256) NOT NULL,
        [NormalizedName] nvarchar(256) NOT NULL,
        [IsDefault] bit NOT NULL,
        [IsStatic] bit NOT NULL,
        [IsPublic] bit NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        CONSTRAINT [PK_AbpRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpSecurityLogs] (
        [Id] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [ApplicationName] nvarchar(96) NULL,
        [Identity] nvarchar(96) NULL,
        [Action] nvarchar(96) NULL,
        [UserId] uniqueidentifier NULL,
        [UserName] nvarchar(256) NULL,
        [TenantName] nvarchar(64) NULL,
        [ClientId] nvarchar(64) NULL,
        [CorrelationId] nvarchar(64) NULL,
        [ClientIpAddress] nvarchar(64) NULL,
        [BrowserInfo] nvarchar(512) NULL,
        [CreationTime] datetime2 NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        CONSTRAINT [PK_AbpSecurityLogs] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpSettings] (
        [Id] uniqueidentifier NOT NULL,
        [Name] nvarchar(128) NOT NULL,
        [Value] nvarchar(2048) NOT NULL,
        [ProviderName] nvarchar(64) NULL,
        [ProviderKey] nvarchar(64) NULL,
        CONSTRAINT [PK_AbpSettings] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpTenants] (
        [Id] uniqueidentifier NOT NULL,
        [Name] nvarchar(64) NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        [CreationTime] datetime2 NOT NULL,
        [CreatorId] uniqueidentifier NULL,
        [LastModificationTime] datetime2 NULL,
        [LastModifierId] uniqueidentifier NULL,
        [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [DeleterId] uniqueidentifier NULL,
        [DeletionTime] datetime2 NULL,
        CONSTRAINT [PK_AbpTenants] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpUsers] (
        [Id] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [UserName] nvarchar(256) NOT NULL,
        [NormalizedUserName] nvarchar(256) NOT NULL,
        [Name] nvarchar(64) NULL,
        [Surname] nvarchar(64) NULL,
        [Email] nvarchar(256) NOT NULL,
        [NormalizedEmail] nvarchar(256) NOT NULL,
        [EmailConfirmed] bit NOT NULL DEFAULT CAST(0 AS bit),
        [PasswordHash] nvarchar(256) NULL,
        [SecurityStamp] nvarchar(256) NOT NULL,
        [IsExternal] bit NOT NULL DEFAULT CAST(0 AS bit),
        [PhoneNumber] nvarchar(16) NULL,
        [PhoneNumberConfirmed] bit NOT NULL DEFAULT CAST(0 AS bit),
        [IsActive] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL DEFAULT CAST(0 AS bit),
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL DEFAULT CAST(0 AS bit),
        [AccessFailedCount] int NOT NULL DEFAULT 0,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        [CreationTime] datetime2 NOT NULL,
        [CreatorId] uniqueidentifier NULL,
        [LastModificationTime] datetime2 NULL,
        [LastModifierId] uniqueidentifier NULL,
        [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [DeleterId] uniqueidentifier NULL,
        [DeletionTime] datetime2 NULL,
        CONSTRAINT [PK_AbpUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerApiResources] (
        [Id] uniqueidentifier NOT NULL,
        [Name] nvarchar(200) NOT NULL,
        [DisplayName] nvarchar(200) NULL,
        [Description] nvarchar(1000) NULL,
        [Enabled] bit NOT NULL,
        [AllowedAccessTokenSigningAlgorithms] nvarchar(100) NULL,
        [ShowInDiscoveryDocument] bit NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        [CreationTime] datetime2 NOT NULL,
        [CreatorId] uniqueidentifier NULL,
        [LastModificationTime] datetime2 NULL,
        [LastModifierId] uniqueidentifier NULL,
        [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [DeleterId] uniqueidentifier NULL,
        [DeletionTime] datetime2 NULL,
        CONSTRAINT [PK_IdentityServerApiResources] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerApiScopes] (
        [Id] uniqueidentifier NOT NULL,
        [Enabled] bit NOT NULL,
        [Name] nvarchar(200) NOT NULL,
        [DisplayName] nvarchar(200) NULL,
        [Description] nvarchar(1000) NULL,
        [Required] bit NOT NULL,
        [Emphasize] bit NOT NULL,
        [ShowInDiscoveryDocument] bit NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        [CreationTime] datetime2 NOT NULL,
        [CreatorId] uniqueidentifier NULL,
        [LastModificationTime] datetime2 NULL,
        [LastModifierId] uniqueidentifier NULL,
        [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [DeleterId] uniqueidentifier NULL,
        [DeletionTime] datetime2 NULL,
        CONSTRAINT [PK_IdentityServerApiScopes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerClients] (
        [Id] uniqueidentifier NOT NULL,
        [ClientId] nvarchar(200) NOT NULL,
        [ClientName] nvarchar(200) NULL,
        [Description] nvarchar(1000) NULL,
        [ClientUri] nvarchar(2000) NULL,
        [LogoUri] nvarchar(2000) NULL,
        [Enabled] bit NOT NULL,
        [ProtocolType] nvarchar(200) NOT NULL,
        [RequireClientSecret] bit NOT NULL,
        [RequireConsent] bit NOT NULL,
        [AllowRememberConsent] bit NOT NULL,
        [AlwaysIncludeUserClaimsInIdToken] bit NOT NULL,
        [RequirePkce] bit NOT NULL,
        [AllowPlainTextPkce] bit NOT NULL,
        [RequireRequestObject] bit NOT NULL,
        [AllowAccessTokensViaBrowser] bit NOT NULL,
        [FrontChannelLogoutUri] nvarchar(2000) NULL,
        [FrontChannelLogoutSessionRequired] bit NOT NULL,
        [BackChannelLogoutUri] nvarchar(2000) NULL,
        [BackChannelLogoutSessionRequired] bit NOT NULL,
        [AllowOfflineAccess] bit NOT NULL,
        [IdentityTokenLifetime] int NOT NULL,
        [AllowedIdentityTokenSigningAlgorithms] nvarchar(100) NULL,
        [AccessTokenLifetime] int NOT NULL,
        [AuthorizationCodeLifetime] int NOT NULL,
        [ConsentLifetime] int NULL,
        [AbsoluteRefreshTokenLifetime] int NOT NULL,
        [SlidingRefreshTokenLifetime] int NOT NULL,
        [RefreshTokenUsage] int NOT NULL,
        [UpdateAccessTokenClaimsOnRefresh] bit NOT NULL,
        [RefreshTokenExpiration] int NOT NULL,
        [AccessTokenType] int NOT NULL,
        [EnableLocalLogin] bit NOT NULL,
        [IncludeJwtId] bit NOT NULL,
        [AlwaysSendClientClaims] bit NOT NULL,
        [ClientClaimsPrefix] nvarchar(200) NULL,
        [PairWiseSubjectSalt] nvarchar(200) NULL,
        [UserSsoLifetime] int NULL,
        [UserCodeType] nvarchar(100) NULL,
        [DeviceCodeLifetime] int NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        [CreationTime] datetime2 NOT NULL,
        [CreatorId] uniqueidentifier NULL,
        [LastModificationTime] datetime2 NULL,
        [LastModifierId] uniqueidentifier NULL,
        [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [DeleterId] uniqueidentifier NULL,
        [DeletionTime] datetime2 NULL,
        CONSTRAINT [PK_IdentityServerClients] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerDeviceFlowCodes] (
        [Id] uniqueidentifier NOT NULL,
        [DeviceCode] nvarchar(200) NOT NULL,
        [UserCode] nvarchar(200) NOT NULL,
        [SubjectId] nvarchar(200) NULL,
        [SessionId] nvarchar(100) NULL,
        [ClientId] nvarchar(200) NOT NULL,
        [Description] nvarchar(200) NULL,
        [Expiration] datetime2 NOT NULL,
        [Data] nvarchar(max) NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        [CreationTime] datetime2 NOT NULL,
        [CreatorId] uniqueidentifier NULL,
        CONSTRAINT [PK_IdentityServerDeviceFlowCodes] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerIdentityResources] (
        [Id] uniqueidentifier NOT NULL,
        [Name] nvarchar(200) NOT NULL,
        [DisplayName] nvarchar(200) NULL,
        [Description] nvarchar(1000) NULL,
        [Enabled] bit NOT NULL,
        [Required] bit NOT NULL,
        [Emphasize] bit NOT NULL,
        [ShowInDiscoveryDocument] bit NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        [CreationTime] datetime2 NOT NULL,
        [CreatorId] uniqueidentifier NULL,
        [LastModificationTime] datetime2 NULL,
        [LastModifierId] uniqueidentifier NULL,
        [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
        [DeleterId] uniqueidentifier NULL,
        [DeletionTime] datetime2 NULL,
        CONSTRAINT [PK_IdentityServerIdentityResources] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerPersistedGrants] (
        [Key] nvarchar(200) NOT NULL,
        [Type] nvarchar(50) NOT NULL,
        [SubjectId] nvarchar(200) NULL,
        [SessionId] nvarchar(100) NULL,
        [ClientId] nvarchar(200) NOT NULL,
        [Description] nvarchar(200) NULL,
        [CreationTime] datetime2 NOT NULL,
        [Expiration] datetime2 NULL,
        [ConsumedTime] datetime2 NULL,
        [Data] nvarchar(max) NOT NULL,
        [Id] uniqueidentifier NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(40) NULL,
        CONSTRAINT [PK_IdentityServerPersistedGrants] PRIMARY KEY ([Key])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpAuditLogActions] (
        [Id] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [AuditLogId] uniqueidentifier NOT NULL,
        [ServiceName] nvarchar(256) NULL,
        [MethodName] nvarchar(128) NULL,
        [Parameters] nvarchar(2000) NULL,
        [ExecutionTime] datetime2 NOT NULL,
        [ExecutionDuration] int NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        CONSTRAINT [PK_AbpAuditLogActions] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AbpAuditLogActions_AbpAuditLogs_AuditLogId] FOREIGN KEY ([AuditLogId]) REFERENCES [AbpAuditLogs] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpEntityChanges] (
        [Id] uniqueidentifier NOT NULL,
        [AuditLogId] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [ChangeTime] datetime2 NOT NULL,
        [ChangeType] tinyint NOT NULL,
        [EntityTenantId] uniqueidentifier NULL,
        [EntityId] nvarchar(128) NOT NULL,
        [EntityTypeFullName] nvarchar(128) NOT NULL,
        [ExtraProperties] nvarchar(max) NULL,
        CONSTRAINT [PK_AbpEntityChanges] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AbpEntityChanges_AbpAuditLogs_AuditLogId] FOREIGN KEY ([AuditLogId]) REFERENCES [AbpAuditLogs] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpOrganizationUnitRoles] (
        [RoleId] uniqueidentifier NOT NULL,
        [OrganizationUnitId] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [CreationTime] datetime2 NOT NULL,
        [CreatorId] uniqueidentifier NULL,
        CONSTRAINT [PK_AbpOrganizationUnitRoles] PRIMARY KEY ([OrganizationUnitId], [RoleId]),
        CONSTRAINT [FK_AbpOrganizationUnitRoles_AbpOrganizationUnits_OrganizationUnitId] FOREIGN KEY ([OrganizationUnitId]) REFERENCES [AbpOrganizationUnits] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AbpOrganizationUnitRoles_AbpRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AbpRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpRoleClaims] (
        [Id] uniqueidentifier NOT NULL,
        [RoleId] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [ClaimType] nvarchar(256) NOT NULL,
        [ClaimValue] nvarchar(1024) NULL,
        CONSTRAINT [PK_AbpRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AbpRoleClaims_AbpRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AbpRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpTenantConnectionStrings] (
        [TenantId] uniqueidentifier NOT NULL,
        [Name] nvarchar(64) NOT NULL,
        [Value] nvarchar(1024) NOT NULL,
        CONSTRAINT [PK_AbpTenantConnectionStrings] PRIMARY KEY ([TenantId], [Name]),
        CONSTRAINT [FK_AbpTenantConnectionStrings_AbpTenants_TenantId] FOREIGN KEY ([TenantId]) REFERENCES [AbpTenants] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpUserClaims] (
        [Id] uniqueidentifier NOT NULL,
        [UserId] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [ClaimType] nvarchar(256) NOT NULL,
        [ClaimValue] nvarchar(1024) NULL,
        CONSTRAINT [PK_AbpUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AbpUserClaims_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpUserLogins] (
        [UserId] uniqueidentifier NOT NULL,
        [LoginProvider] nvarchar(64) NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [ProviderKey] nvarchar(196) NOT NULL,
        [ProviderDisplayName] nvarchar(128) NULL,
        CONSTRAINT [PK_AbpUserLogins] PRIMARY KEY ([UserId], [LoginProvider]),
        CONSTRAINT [FK_AbpUserLogins_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpUserOrganizationUnits] (
        [UserId] uniqueidentifier NOT NULL,
        [OrganizationUnitId] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [CreationTime] datetime2 NOT NULL,
        [CreatorId] uniqueidentifier NULL,
        CONSTRAINT [PK_AbpUserOrganizationUnits] PRIMARY KEY ([OrganizationUnitId], [UserId]),
        CONSTRAINT [FK_AbpUserOrganizationUnits_AbpOrganizationUnits_OrganizationUnitId] FOREIGN KEY ([OrganizationUnitId]) REFERENCES [AbpOrganizationUnits] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AbpUserOrganizationUnits_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpUserRoles] (
        [UserId] uniqueidentifier NOT NULL,
        [RoleId] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        CONSTRAINT [PK_AbpUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AbpUserRoles_AbpRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AbpRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AbpUserRoles_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpUserTokens] (
        [UserId] uniqueidentifier NOT NULL,
        [LoginProvider] nvarchar(64) NOT NULL,
        [Name] nvarchar(128) NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AbpUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AbpUserTokens_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerApiResourceClaims] (
        [Type] nvarchar(200) NOT NULL,
        [ApiResourceId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_IdentityServerApiResourceClaims] PRIMARY KEY ([ApiResourceId], [Type]),
        CONSTRAINT [FK_IdentityServerApiResourceClaims_IdentityServerApiResources_ApiResourceId] FOREIGN KEY ([ApiResourceId]) REFERENCES [IdentityServerApiResources] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerApiResourceProperties] (
        [ApiResourceId] uniqueidentifier NOT NULL,
        [Key] nvarchar(250) NOT NULL,
        [Value] nvarchar(2000) NOT NULL,
        CONSTRAINT [PK_IdentityServerApiResourceProperties] PRIMARY KEY ([ApiResourceId], [Key], [Value]),
        CONSTRAINT [FK_IdentityServerApiResourceProperties_IdentityServerApiResources_ApiResourceId] FOREIGN KEY ([ApiResourceId]) REFERENCES [IdentityServerApiResources] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerApiResourceScopes] (
        [ApiResourceId] uniqueidentifier NOT NULL,
        [Scope] nvarchar(200) NOT NULL,
        CONSTRAINT [PK_IdentityServerApiResourceScopes] PRIMARY KEY ([ApiResourceId], [Scope]),
        CONSTRAINT [FK_IdentityServerApiResourceScopes_IdentityServerApiResources_ApiResourceId] FOREIGN KEY ([ApiResourceId]) REFERENCES [IdentityServerApiResources] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerApiResourceSecrets] (
        [Type] nvarchar(250) NOT NULL,
        [Value] nvarchar(4000) NOT NULL,
        [ApiResourceId] uniqueidentifier NOT NULL,
        [Description] nvarchar(1000) NULL,
        [Expiration] datetime2 NULL,
        CONSTRAINT [PK_IdentityServerApiResourceSecrets] PRIMARY KEY ([ApiResourceId], [Type], [Value]),
        CONSTRAINT [FK_IdentityServerApiResourceSecrets_IdentityServerApiResources_ApiResourceId] FOREIGN KEY ([ApiResourceId]) REFERENCES [IdentityServerApiResources] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerApiScopeClaims] (
        [Type] nvarchar(200) NOT NULL,
        [ApiScopeId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_IdentityServerApiScopeClaims] PRIMARY KEY ([ApiScopeId], [Type]),
        CONSTRAINT [FK_IdentityServerApiScopeClaims_IdentityServerApiScopes_ApiScopeId] FOREIGN KEY ([ApiScopeId]) REFERENCES [IdentityServerApiScopes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerApiScopeProperties] (
        [ApiScopeId] uniqueidentifier NOT NULL,
        [Key] nvarchar(250) NOT NULL,
        [Value] nvarchar(2000) NOT NULL,
        CONSTRAINT [PK_IdentityServerApiScopeProperties] PRIMARY KEY ([ApiScopeId], [Key], [Value]),
        CONSTRAINT [FK_IdentityServerApiScopeProperties_IdentityServerApiScopes_ApiScopeId] FOREIGN KEY ([ApiScopeId]) REFERENCES [IdentityServerApiScopes] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerClientClaims] (
        [ClientId] uniqueidentifier NOT NULL,
        [Type] nvarchar(250) NOT NULL,
        [Value] nvarchar(250) NOT NULL,
        CONSTRAINT [PK_IdentityServerClientClaims] PRIMARY KEY ([ClientId], [Type], [Value]),
        CONSTRAINT [FK_IdentityServerClientClaims_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerClientCorsOrigins] (
        [ClientId] uniqueidentifier NOT NULL,
        [Origin] nvarchar(150) NOT NULL,
        CONSTRAINT [PK_IdentityServerClientCorsOrigins] PRIMARY KEY ([ClientId], [Origin]),
        CONSTRAINT [FK_IdentityServerClientCorsOrigins_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerClientGrantTypes] (
        [ClientId] uniqueidentifier NOT NULL,
        [GrantType] nvarchar(250) NOT NULL,
        CONSTRAINT [PK_IdentityServerClientGrantTypes] PRIMARY KEY ([ClientId], [GrantType]),
        CONSTRAINT [FK_IdentityServerClientGrantTypes_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerClientIdPRestrictions] (
        [ClientId] uniqueidentifier NOT NULL,
        [Provider] nvarchar(200) NOT NULL,
        CONSTRAINT [PK_IdentityServerClientIdPRestrictions] PRIMARY KEY ([ClientId], [Provider]),
        CONSTRAINT [FK_IdentityServerClientIdPRestrictions_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerClientPostLogoutRedirectUris] (
        [ClientId] uniqueidentifier NOT NULL,
        [PostLogoutRedirectUri] nvarchar(2000) NOT NULL,
        CONSTRAINT [PK_IdentityServerClientPostLogoutRedirectUris] PRIMARY KEY ([ClientId], [PostLogoutRedirectUri]),
        CONSTRAINT [FK_IdentityServerClientPostLogoutRedirectUris_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerClientProperties] (
        [ClientId] uniqueidentifier NOT NULL,
        [Key] nvarchar(250) NOT NULL,
        [Value] nvarchar(2000) NOT NULL,
        CONSTRAINT [PK_IdentityServerClientProperties] PRIMARY KEY ([ClientId], [Key], [Value]),
        CONSTRAINT [FK_IdentityServerClientProperties_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerClientRedirectUris] (
        [ClientId] uniqueidentifier NOT NULL,
        [RedirectUri] nvarchar(2000) NOT NULL,
        CONSTRAINT [PK_IdentityServerClientRedirectUris] PRIMARY KEY ([ClientId], [RedirectUri]),
        CONSTRAINT [FK_IdentityServerClientRedirectUris_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerClientScopes] (
        [ClientId] uniqueidentifier NOT NULL,
        [Scope] nvarchar(200) NOT NULL,
        CONSTRAINT [PK_IdentityServerClientScopes] PRIMARY KEY ([ClientId], [Scope]),
        CONSTRAINT [FK_IdentityServerClientScopes_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerClientSecrets] (
        [Type] nvarchar(250) NOT NULL,
        [Value] nvarchar(4000) NOT NULL,
        [ClientId] uniqueidentifier NOT NULL,
        [Description] nvarchar(2000) NULL,
        [Expiration] datetime2 NULL,
        CONSTRAINT [PK_IdentityServerClientSecrets] PRIMARY KEY ([ClientId], [Type], [Value]),
        CONSTRAINT [FK_IdentityServerClientSecrets_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerIdentityResourceClaims] (
        [Type] nvarchar(200) NOT NULL,
        [IdentityResourceId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_IdentityServerIdentityResourceClaims] PRIMARY KEY ([IdentityResourceId], [Type]),
        CONSTRAINT [FK_IdentityServerIdentityResourceClaims_IdentityServerIdentityResources_IdentityResourceId] FOREIGN KEY ([IdentityResourceId]) REFERENCES [IdentityServerIdentityResources] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [IdentityServerIdentityResourceProperties] (
        [IdentityResourceId] uniqueidentifier NOT NULL,
        [Key] nvarchar(250) NOT NULL,
        [Value] nvarchar(2000) NOT NULL,
        CONSTRAINT [PK_IdentityServerIdentityResourceProperties] PRIMARY KEY ([IdentityResourceId], [Key], [Value]),
        CONSTRAINT [FK_IdentityServerIdentityResourceProperties_IdentityServerIdentityResources_IdentityResourceId] FOREIGN KEY ([IdentityResourceId]) REFERENCES [IdentityServerIdentityResources] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE TABLE [AbpEntityPropertyChanges] (
        [Id] uniqueidentifier NOT NULL,
        [TenantId] uniqueidentifier NULL,
        [EntityChangeId] uniqueidentifier NOT NULL,
        [NewValue] nvarchar(512) NULL,
        [OriginalValue] nvarchar(512) NULL,
        [PropertyName] nvarchar(128) NOT NULL,
        [PropertyTypeFullName] nvarchar(64) NOT NULL,
        CONSTRAINT [PK_AbpEntityPropertyChanges] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId] FOREIGN KEY ([EntityChangeId]) REFERENCES [AbpEntityChanges] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpAuditLogActions_AuditLogId] ON [AbpAuditLogActions] ([AuditLogId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpAuditLogActions_TenantId_ServiceName_MethodName_ExecutionTime] ON [AbpAuditLogActions] ([TenantId], [ServiceName], [MethodName], [ExecutionTime]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpAuditLogs_TenantId_ExecutionTime] ON [AbpAuditLogs] ([TenantId], [ExecutionTime]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpAuditLogs_TenantId_UserId_ExecutionTime] ON [AbpAuditLogs] ([TenantId], [UserId], [ExecutionTime]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpEntityChanges_AuditLogId] ON [AbpEntityChanges] ([AuditLogId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpEntityChanges_TenantId_EntityTypeFullName_EntityId] ON [AbpEntityChanges] ([TenantId], [EntityTypeFullName], [EntityId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpEntityPropertyChanges_EntityChangeId] ON [AbpEntityPropertyChanges] ([EntityChangeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [IX_AbpFeatureValues_Name_ProviderName_ProviderKey] ON [AbpFeatureValues] ([Name], [ProviderName], [ProviderKey]) WHERE [ProviderName] IS NOT NULL AND [ProviderKey] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [IX_AbpLinkUsers_SourceUserId_SourceTenantId_TargetUserId_TargetTenantId] ON [AbpLinkUsers] ([SourceUserId], [SourceTenantId], [TargetUserId], [TargetTenantId]) WHERE [SourceTenantId] IS NOT NULL AND [TargetTenantId] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpOrganizationUnitExtensions_LeaderId] ON [AbpOrganizationUnitExtensions] ([LeaderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpOrganizationUnitRoles_RoleId_OrganizationUnitId] ON [AbpOrganizationUnitRoles] ([RoleId], [OrganizationUnitId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpOrganizationUnits_Code] ON [AbpOrganizationUnits] ([Code]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpOrganizationUnits_ParentId] ON [AbpOrganizationUnits] ([ParentId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [IX_AbpPermissionGrants_TenantId_Name_ProviderName_ProviderKey] ON [AbpPermissionGrants] ([TenantId], [Name], [ProviderName], [ProviderKey]) WHERE [TenantId] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpRoleClaims_RoleId] ON [AbpRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpRoles_NormalizedName] ON [AbpRoles] ([NormalizedName]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpSecurityLogs_TenantId_Action] ON [AbpSecurityLogs] ([TenantId], [Action]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpSecurityLogs_TenantId_ApplicationName] ON [AbpSecurityLogs] ([TenantId], [ApplicationName]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpSecurityLogs_TenantId_Identity] ON [AbpSecurityLogs] ([TenantId], [Identity]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpSecurityLogs_TenantId_UserId] ON [AbpSecurityLogs] ([TenantId], [UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [IX_AbpSettings_Name_ProviderName_ProviderKey] ON [AbpSettings] ([Name], [ProviderName], [ProviderKey]) WHERE [ProviderName] IS NOT NULL AND [ProviderKey] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpTenants_Name] ON [AbpTenants] ([Name]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpUserClaims_UserId] ON [AbpUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpUserLogins_LoginProvider_ProviderKey] ON [AbpUserLogins] ([LoginProvider], [ProviderKey]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpUserOrganizationUnits_UserId_OrganizationUnitId] ON [AbpUserOrganizationUnits] ([UserId], [OrganizationUnitId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpUserRoles_RoleId_UserId] ON [AbpUserRoles] ([RoleId], [UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpUsers_Email] ON [AbpUsers] ([Email]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpUsers_NormalizedEmail] ON [AbpUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpUsers_NormalizedUserName] ON [AbpUsers] ([NormalizedUserName]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_AbpUsers_UserName] ON [AbpUsers] ([UserName]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_IdentityServerClients_ClientId] ON [IdentityServerClients] ([ClientId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE UNIQUE INDEX [IX_IdentityServerDeviceFlowCodes_DeviceCode] ON [IdentityServerDeviceFlowCodes] ([DeviceCode]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_IdentityServerDeviceFlowCodes_Expiration] ON [IdentityServerDeviceFlowCodes] ([Expiration]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_IdentityServerDeviceFlowCodes_UserCode] ON [IdentityServerDeviceFlowCodes] ([UserCode]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_IdentityServerPersistedGrants_Expiration] ON [IdentityServerPersistedGrants] ([Expiration]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_IdentityServerPersistedGrants_SubjectId_ClientId_Type] ON [IdentityServerPersistedGrants] ([SubjectId], [ClientId], [Type]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    CREATE INDEX [IX_IdentityServerPersistedGrants_SubjectId_SessionId_Type] ON [IdentityServerPersistedGrants] ([SubjectId], [SessionId], [Type]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220907045718_initial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220907045718_initial', N'6.0.5');
END;
GO

COMMIT;
GO


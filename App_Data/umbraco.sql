-- Script Date: 03.07.2020 14:11  - ErikEJ.SqlCeScripting version 3.5.2.86
-- Database information:
-- Locale Identifier: 1045
-- Encryption Mode: 
-- Case Sensitive: False
-- Database: C:\Users\pisaq\source\repos\Emi-Center\App_Data\Umbraco.sdf
-- ServerVersion: 4.0.8876.1
-- DatabaseSize: 2,563 MB
-- SpaceAvailable: 3,997 GB
-- Created: 29.06.2020 09:59

-- User Table information:
-- Number of tables: 51
-- cmsContentNu: 46 row(s)
-- cmsContentType: 9 row(s)
-- cmsContentType2ContentType: 3 row(s)
-- cmsContentTypeAllowedContentType: 3 row(s)
-- cmsDictionary: 1 row(s)
-- cmsDocumentType: 7 row(s)
-- cmsLanguageText: 0 row(s)
-- cmsMacro: 0 row(s)
-- cmsMacroProperty: 0 row(s)
-- cmsMember: 0 row(s)
-- cmsMember2MemberGroup: 0 row(s)
-- cmsMemberType: 0 row(s)
-- cmsPropertyType: 31 row(s)
-- cmsPropertyTypeGroup: 9 row(s)
-- cmsTagRelationship: 0 row(s)
-- cmsTags: 0 row(s)
-- cmsTemplate: 4 row(s)
-- umbracoAccess: 0 row(s)
-- umbracoAccessRule: 0 row(s)
-- umbracoAudit: 44 row(s)
-- umbracoCacheInstruction: 233 row(s)
-- umbracoConsent: 0 row(s)
-- umbracoContent: 38 row(s)
-- umbracoContentSchedule: 0 row(s)
-- umbracoContentVersion: 81 row(s)
-- umbracoContentVersionCultureVariation: 0 row(s)
-- umbracoDataType: 49 row(s)
-- umbracoDocument: 9 row(s)
-- umbracoDocumentCultureVariation: 0 row(s)
-- umbracoDocumentVersion: 52 row(s)
-- umbracoDomain: 0 row(s)
-- umbracoExternalLogin: 0 row(s)
-- umbracoKeyValue: 1 row(s)
-- umbracoLanguage: 1 row(s)
-- umbracoLock: 11 row(s)
-- umbracoLog: 534 row(s)
-- umbracoMediaVersion: 29 row(s)
-- umbracoNode: 103 row(s)
-- umbracoPropertyData: 459 row(s)
-- umbracoRedirectUrl: 1 row(s)
-- umbracoRelation: 53 row(s)
-- umbracoRelationType: 5 row(s)
-- umbracoServer: 1 row(s)
-- umbracoUser: 2 row(s)
-- umbracoUser2NodeNotify: 0 row(s)
-- umbracoUser2UserGroup: 3 row(s)
-- umbracoUserGroup: 5 row(s)
-- umbracoUserGroup2App: 13 row(s)
-- umbracoUserGroup2NodePermission: 0 row(s)
-- umbracoUserLogin: 14 row(s)
-- umbracoUserStartNode: 0 row(s)

CREATE TABLE [umbracoUser] (
  [id] int IDENTITY (2,1) NOT NULL
, [userDisabled] bit DEFAULT (('0')) NOT NULL
, [userNoConsole] bit DEFAULT (('0')) NOT NULL
, [userName] nvarchar(255) NOT NULL
, [userLogin] nvarchar(125) NOT NULL
, [userPassword] nvarchar(500) NOT NULL
, [passwordConfig] nvarchar(500) NULL
, [userEmail] nvarchar(255) NOT NULL
, [userLanguage] nvarchar(10) NULL
, [securityStampToken] nvarchar(255) NULL
, [failedLoginAttempts] int NULL
, [lastLockoutDate] datetime NULL
, [lastPasswordChangeDate] datetime NULL
, [lastLoginDate] datetime NULL
, [emailConfirmedDate] datetime NULL
, [invitedDate] datetime NULL
, [createDate] datetime DEFAULT ((GETDATE())) NOT NULL
, [updateDate] datetime DEFAULT ((GETDATE())) NOT NULL
, [avatar] nvarchar(500) NULL
, [tourData] ntext NULL
);
GO
CREATE TABLE [umbracoUserLogin] (
  [sessionId] uniqueidentifier NOT NULL
, [userId] int NOT NULL
, [loggedInUtc] datetime NOT NULL
, [lastValidatedUtc] datetime NOT NULL
, [loggedOutUtc] datetime NULL
, [ipAddress] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoServer] (
  [id] int IDENTITY (2,1) NOT NULL
, [address] nvarchar(500) NOT NULL
, [computerName] nvarchar(255) NOT NULL
, [registeredDate] datetime DEFAULT ((GETDATE())) NOT NULL
, [lastNotifiedDate] datetime NOT NULL
, [isActive] bit NOT NULL
, [isMaster] bit NOT NULL
);
GO
CREATE TABLE [umbracoRelationType] (
  [id] int IDENTITY (10,1) NOT NULL
, [typeUniqueId] uniqueidentifier NOT NULL
, [dual] bit NOT NULL
, [parentObjectType] uniqueidentifier NULL
, [childObjectType] uniqueidentifier NULL
, [name] nvarchar(255) NOT NULL
, [alias] nvarchar(100) NOT NULL
);
GO
CREATE TABLE [umbracoRedirectUrl] (
  [id] uniqueidentifier NOT NULL
, [contentKey] uniqueidentifier NOT NULL
, [createDateUtc] datetime NOT NULL
, [url] nvarchar(255) NOT NULL
, [culture] nvarchar(255) NULL
, [urlHash] nvarchar(40) NOT NULL
);
GO
CREATE TABLE [umbracoNode] (
  [id] int IDENTITY (1153,1) NOT NULL
, [uniqueId] uniqueidentifier DEFAULT ((NEWID())) NOT NULL
, [parentId] int NOT NULL
, [level] int NOT NULL
, [path] nvarchar(150) NOT NULL
, [sortOrder] int NOT NULL
, [trashed] bit DEFAULT (('0')) NOT NULL
, [nodeUser] int NULL
, [text] nvarchar(255) NULL
, [nodeObjectType] uniqueidentifier NULL
, [createDate] datetime DEFAULT ((GETDATE())) NOT NULL
);
GO
CREATE TABLE [umbracoUserStartNode] (
  [id] int IDENTITY (1,1) NOT NULL
, [userId] int NOT NULL
, [startNode] int NOT NULL
, [startNodeType] int NOT NULL
);
GO
CREATE TABLE [umbracoUserGroup] (
  [id] int IDENTITY (6,1) NOT NULL
, [userGroupAlias] nvarchar(200) NOT NULL
, [userGroupName] nvarchar(200) NOT NULL
, [userGroupDefaultPermissions] nvarchar(50) NULL
, [createDate] datetime DEFAULT ((GETDATE())) NOT NULL
, [updateDate] datetime DEFAULT ((GETDATE())) NOT NULL
, [icon] nvarchar(255) NULL
, [startContentId] int NULL
, [startMediaId] int NULL
);
GO
CREATE TABLE [umbracoUserGroup2NodePermission] (
  [userGroupId] int NOT NULL
, [nodeId] int NOT NULL
, [permission] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoUserGroup2App] (
  [userGroupId] int NOT NULL
, [app] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoUser2UserGroup] (
  [userId] int NOT NULL
, [userGroupId] int NOT NULL
);
GO
CREATE TABLE [umbracoUser2NodeNotify] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [action] nchar(1) NOT NULL
);
GO
CREATE TABLE [umbracoRelation] (
  [id] int IDENTITY (266,1) NOT NULL
, [parentId] int NOT NULL
, [childId] int NOT NULL
, [relType] int NOT NULL
, [datetime] datetime DEFAULT ((GETDATE())) NOT NULL
, [comment] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [umbracoLog] (
  [id] int IDENTITY (535,1) NOT NULL
, [userId] int NULL
, [NodeId] int NOT NULL
, [entityType] nvarchar(50) NULL
, [Datestamp] datetime DEFAULT ((GETDATE())) NOT NULL
, [logHeader] nvarchar(50) NOT NULL
, [logComment] nvarchar(4000) NULL
, [parameters] nvarchar(500) NULL
);
GO
CREATE TABLE [umbracoLock] (
  [id] int NOT NULL
, [value] int NOT NULL
, [name] nvarchar(64) NOT NULL
);
GO
CREATE TABLE [umbracoLanguage] (
  [id] int IDENTITY (2,1) NOT NULL
, [languageISOCode] nvarchar(14) NULL
, [languageCultureName] nvarchar(100) NULL
, [isDefaultVariantLang] bit DEFAULT (('0')) NOT NULL
, [mandatory] bit DEFAULT (('0')) NOT NULL
, [fallbackLanguageId] int NULL
);
GO
CREATE TABLE [umbracoKeyValue] (
  [key] nvarchar(256) NOT NULL
, [value] nvarchar(255) NULL
, [updated] datetime DEFAULT ((GETDATE())) NOT NULL
);
GO
CREATE TABLE [umbracoExternalLogin] (
  [id] int IDENTITY (1,1) NOT NULL
, [userId] int NOT NULL
, [loginProvider] nvarchar(4000) NOT NULL
, [providerKey] nvarchar(4000) NOT NULL
, [createDate] datetime DEFAULT ((GETDATE())) NOT NULL
);
GO
CREATE TABLE [umbracoDomain] (
  [id] int IDENTITY (1,1) NOT NULL
, [domainDefaultLanguage] int NULL
, [domainRootStructureID] int NULL
, [domainName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoDocumentCultureVariation] (
  [id] int IDENTITY (4,1) NOT NULL
, [nodeId] int NOT NULL
, [languageId] int NOT NULL
, [edited] bit NOT NULL
, [available] bit NOT NULL
, [published] bit NOT NULL
, [name] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoDataType] (
  [nodeId] int NOT NULL
, [propertyEditorAlias] nvarchar(255) NOT NULL
, [dbType] nvarchar(50) NOT NULL
, [config] ntext NULL
);
GO
CREATE TABLE [umbracoContent] (
  [nodeId] int NOT NULL
, [contentTypeId] int NOT NULL
);
GO
CREATE TABLE [umbracoDocument] (
  [nodeId] int NOT NULL
, [published] bit NOT NULL
, [edited] bit NOT NULL
);
GO
CREATE TABLE [umbracoContentVersion] (
  [id] int IDENTITY (107,1) NOT NULL
, [nodeId] int NOT NULL
, [versionDate] datetime DEFAULT ((GETDATE())) NOT NULL
, [userId] int NULL
, [current] bit NOT NULL
, [text] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoMediaVersion] (
  [id] int NOT NULL
, [path] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoDocumentVersion] (
  [id] int NOT NULL
, [templateId] int NULL
, [published] bit NOT NULL
);
GO
CREATE TABLE [umbracoContentVersionCultureVariation] (
  [id] int IDENTITY (18,1) NOT NULL
, [versionId] int NOT NULL
, [languageId] int NOT NULL
, [name] nvarchar(255) NOT NULL
, [date] datetime NOT NULL
, [availableUserId] int NULL
);
GO
CREATE TABLE [umbracoContentSchedule] (
  [id] uniqueidentifier NOT NULL
, [nodeId] int NOT NULL
, [languageId] int NULL
, [date] datetime NOT NULL
, [action] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoConsent] (
  [id] int IDENTITY (1,1) NOT NULL
, [current] bit NOT NULL
, [source] nvarchar(512) NOT NULL
, [context] nvarchar(128) NOT NULL
, [action] nvarchar(512) NOT NULL
, [createDate] datetime DEFAULT ((GETDATE())) NOT NULL
, [state] int NOT NULL
, [comment] nvarchar(255) NULL
);
GO
CREATE TABLE [umbracoCacheInstruction] (
  [id] int IDENTITY (499,1) NOT NULL
, [utcStamp] datetime NOT NULL
, [jsonInstruction] ntext NOT NULL
, [originated] nvarchar(500) NOT NULL
, [instructionCount] int DEFAULT (('1')) NOT NULL
);
GO
CREATE TABLE [umbracoAudit] (
  [id] int IDENTITY (45,1) NOT NULL
, [performingUserId] int NOT NULL
, [performingDetails] nvarchar(1024) NULL
, [performingIp] nvarchar(64) NULL
, [eventDateUtc] datetime DEFAULT ((GETDATE())) NOT NULL
, [affectedUserId] int NOT NULL
, [affectedDetails] nvarchar(1024) NULL
, [eventType] nvarchar(256) NOT NULL
, [eventDetails] nvarchar(1024) NULL
);
GO
CREATE TABLE [umbracoAccess] (
  [id] uniqueidentifier NOT NULL
, [nodeId] int NOT NULL
, [loginNodeId] int NOT NULL
, [noAccessNodeId] int NOT NULL
, [createDate] datetime DEFAULT ((GETDATE())) NOT NULL
, [updateDate] datetime DEFAULT ((GETDATE())) NOT NULL
);
GO
CREATE TABLE [umbracoAccessRule] (
  [id] uniqueidentifier NOT NULL
, [accessId] uniqueidentifier NOT NULL
, [ruleValue] nvarchar(255) NOT NULL
, [ruleType] nvarchar(255) NOT NULL
, [createDate] datetime DEFAULT ((GETDATE())) NOT NULL
, [updateDate] datetime DEFAULT ((GETDATE())) NOT NULL
);
GO
CREATE TABLE [cmsTemplate] (
  [pk] int IDENTITY (18,1) NOT NULL
, [nodeId] int NOT NULL
, [alias] nvarchar(100) NULL
);
GO
CREATE TABLE [cmsTags] (
  [id] int IDENTITY (1,1) NOT NULL
, [group] nvarchar(100) NOT NULL
, [languageId] int NULL
, [tag] nvarchar(200) NOT NULL
);
GO
CREATE TABLE [cmsPropertyTypeGroup] (
  [id] int IDENTITY (23,1) NOT NULL
, [contenttypeNodeId] int NOT NULL
, [text] nvarchar(255) NOT NULL
, [sortorder] int NOT NULL
, [uniqueID] uniqueidentifier DEFAULT ((NEWID())) NOT NULL
);
GO
CREATE TABLE [cmsPropertyType] (
  [id] int IDENTITY (86,1) NOT NULL
, [dataTypeId] int NOT NULL
, [contentTypeId] int NOT NULL
, [propertyTypeGroupId] int NULL
, [Alias] nvarchar(255) NOT NULL
, [Name] nvarchar(255) NULL
, [sortOrder] int DEFAULT (('0')) NOT NULL
, [mandatory] bit DEFAULT (('0')) NOT NULL
, [mandatoryMessage] nvarchar(500) NULL
, [validationRegExp] nvarchar(255) NULL
, [validationRegExpMessage] nvarchar(500) NULL
, [Description] nvarchar(2000) NULL
, [variations] int DEFAULT (('1')) NOT NULL
, [UniqueID] uniqueidentifier DEFAULT ((NEWID())) NOT NULL
);
GO
CREATE TABLE [umbracoPropertyData] (
  [id] int IDENTITY (1146,1) NOT NULL
, [versionId] int NOT NULL
, [propertyTypeId] int NOT NULL
, [languageId] int NULL
, [segment] nvarchar(256) NULL
, [intValue] int NULL
, [decimalValue] numeric(38,6) NULL
, [dateValue] datetime NULL
, [varcharValue] nvarchar(512) NULL
, [textValue] ntext NULL
);
GO
CREATE TABLE [cmsTagRelationship] (
  [nodeId] int NOT NULL
, [tagId] int NOT NULL
, [propertyTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsMemberType] (
  [pk] int IDENTITY (1,1) NOT NULL
, [NodeId] int NOT NULL
, [propertytypeId] int NOT NULL
, [memberCanEdit] bit DEFAULT (('0')) NOT NULL
, [viewOnProfile] bit DEFAULT (('0')) NOT NULL
, [isSensitive] bit DEFAULT (('0')) NOT NULL
);
GO
CREATE TABLE [cmsMember] (
  [nodeId] int NOT NULL
, [Email] nvarchar(1000) DEFAULT (('''')) NOT NULL
, [LoginName] nvarchar(1000) DEFAULT (('''')) NOT NULL
, [Password] nvarchar(1000) DEFAULT (('''')) NOT NULL
);
GO
CREATE TABLE [cmsMember2MemberGroup] (
  [Member] int NOT NULL
, [MemberGroup] int NOT NULL
);
GO
CREATE TABLE [cmsMacro] (
  [id] int IDENTITY (2,1) NOT NULL
, [uniqueId] uniqueidentifier NOT NULL
, [macroUseInEditor] bit DEFAULT (('0')) NOT NULL
, [macroRefreshRate] int DEFAULT (('0')) NOT NULL
, [macroAlias] nvarchar(255) NOT NULL
, [macroName] nvarchar(255) NULL
, [macroCacheByPage] bit DEFAULT (('1')) NOT NULL
, [macroCachePersonalized] bit DEFAULT (('0')) NOT NULL
, [macroDontRender] bit DEFAULT (('0')) NOT NULL
, [macroSource] nvarchar(255) NOT NULL
, [macroType] int NOT NULL
);
GO
CREATE TABLE [cmsMacroProperty] (
  [id] int IDENTITY (7,1) NOT NULL
, [uniquePropertyId] uniqueidentifier NOT NULL
, [editorAlias] nvarchar(255) NOT NULL
, [macro] int NOT NULL
, [macroPropertySortOrder] int DEFAULT (('0')) NOT NULL
, [macroPropertyAlias] nvarchar(50) NOT NULL
, [macroPropertyName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsLanguageText] (
  [pk] int IDENTITY (1,1) NOT NULL
, [languageId] int NOT NULL
, [UniqueId] uniqueidentifier NOT NULL
, [value] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsDocumentType] (
  [contentTypeNodeId] int NOT NULL
, [templateNodeId] int NOT NULL
, [IsDefault] bit DEFAULT (('0')) NOT NULL
);
GO
CREATE TABLE [cmsDictionary] (
  [pk] int IDENTITY (2,1) NOT NULL
, [id] uniqueidentifier NOT NULL
, [parent] uniqueidentifier NULL
, [key] nvarchar(450) NOT NULL
);
GO
CREATE TABLE [cmsContentTypeAllowedContentType] (
  [Id] int NOT NULL
, [AllowedId] int NOT NULL
, [SortOrder] int DEFAULT (('0')) NOT NULL
);
GO
CREATE TABLE [cmsContentType2ContentType] (
  [parentContentTypeId] int NOT NULL
, [childContentTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsContentType] (
  [pk] int IDENTITY (546,1) NOT NULL
, [nodeId] int NOT NULL
, [alias] nvarchar(255) NULL
, [icon] nvarchar(255) NULL
, [thumbnail] nvarchar(255) DEFAULT (('folder.png')) NOT NULL
, [description] nvarchar(1500) NULL
, [isContainer] bit DEFAULT (('0')) NOT NULL
, [isElement] bit DEFAULT (('0')) NOT NULL
, [allowAtRoot] bit DEFAULT (('0')) NOT NULL
, [variations] int DEFAULT (('1')) NOT NULL
);
GO
CREATE TABLE [cmsContentNu] (
  [nodeId] int NOT NULL
, [published] bit NOT NULL
, [data] ntext NOT NULL
, [rv] bigint NOT NULL
);
GO
SET IDENTITY_INSERT [umbracoUser] ON;
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userName],[userLogin],[userPassword],[passwordConfig],[userEmail],[userLanguage],[securityStampToken],[failedLoginAttempts],[lastLockoutDate],[lastPasswordChangeDate],[lastLoginDate],[emailConfirmedDate],[invitedDate],[createDate],[updateDate],[avatar],[tourData]) VALUES (
-1,0,0,N'Pisaqtom',N'kontakt@fide-soft.com',N'bVOD7o/6sv9wbRY7wB7mnA==Y9g8T73l7SRknLN07Bt5B+mI2LF5G8dB6s55sc69Grw=',N'{"hashAlgorithm":"HMACSHA256"}',N'kontakt@fide-soft.com',N'en-US',N'ef0fdd99-9db5-49e1-a19f-be8301cc8496',0,NULL,{ts '2020-06-29 09:59:52.297'},{ts '2020-07-02 15:15:05.847'},NULL,NULL,{ts '2020-06-29 09:59:50.870'},{ts '2020-07-02 15:15:05.977'},NULL,NULL);
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userName],[userLogin],[userPassword],[passwordConfig],[userEmail],[userLanguage],[securityStampToken],[failedLoginAttempts],[lastLockoutDate],[lastPasswordChangeDate],[lastLoginDate],[emailConfirmedDate],[invitedDate],[createDate],[updateDate],[avatar],[tourData]) VALUES (
1,0,0,N'Damian',N'contact@fide-soft.com',N'7qKTyF7cbshq6Yi6bJDFXQ==Zok9wErO/csd87bP3Rsj75DENgbScsm3KfdHnhPxKGE=',N'{"hashAlgorithm":"HMACSHA256"}',N'contact@fide-soft.com',N'pl-PL',N'415f9474-8702-493b-af5a-d3b62c888cc3',0,NULL,{ts '2020-06-29 16:40:57.863'},NULL,NULL,NULL,{ts '2020-06-29 16:40:00.767'},{ts '2020-06-29 16:40:58.220'},NULL,NULL);
GO
SET IDENTITY_INSERT [umbracoUser] OFF;
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'37a5d317-dfc7-472f-8a9a-26c7aa52dbd7',-1,{ts '2020-07-02 09:13:36.010'},{ts '2020-07-02 09:37:19.003'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'e07c8c58-4b6c-4b68-b7fe-294647f6a8dc',-1,{ts '2020-06-29 12:28:23.263'},{ts '2020-06-29 13:14:39.857'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'b158065a-b899-49f9-8a51-509f8031f2b0',-1,{ts '2020-06-29 11:20:38.947'},{ts '2020-06-29 11:27:52.553'},{ts '2020-06-29 11:27:53.643'},N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'8e8b8447-7fef-4c20-8380-5123642c1044',-1,{ts '2020-07-01 11:27:55.883'},{ts '2020-07-01 13:07:26.480'},{ts '2020-07-01 13:07:34.263'},N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'a048d170-2d91-4553-8de7-8f0e39a3e8da',-1,{ts '2020-07-02 14:15:07.320'},{ts '2020-07-02 15:21:06.630'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'2cf7a1ab-7065-4b21-8658-94d6c1a27bec',-1,{ts '2020-06-30 08:38:21.850'},{ts '2020-06-30 09:29:39.400'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'fe2fd5ff-d641-4dac-8c1b-a83890a95cd8',-1,{ts '2020-06-29 09:02:06.140'},{ts '2020-06-29 11:18:52.420'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'ef014870-5754-4f22-bc88-bc544e358709',-1,{ts '2020-07-01 13:46:12.627'},{ts '2020-07-01 13:46:12.627'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'44d7de2c-f022-47bb-84cc-cad98dc237f7',-1,{ts '2020-07-01 13:19:57.100'},{ts '2020-07-01 13:28:51.953'},{ts '2020-07-01 13:29:48.347'},N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'3b7423b4-db3b-405a-9743-ce57913ca164',-1,{ts '2020-06-29 11:35:00.297'},{ts '2020-06-29 11:51:24.377'},{ts '2020-06-29 11:52:14.090'},N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'f7713233-f8fd-4e60-92da-e02cc1098107',-1,{ts '2020-06-29 14:42:45.357'},{ts '2020-06-29 15:40:56.873'},{ts '2020-06-29 15:41:03.730'},N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'ff169c97-f133-4564-9095-ef74e5c47fd0',-1,{ts '2020-07-02 09:37:38.960'},{ts '2020-07-02 10:14:06.247'},{ts '2020-07-02 10:14:07.187'},N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'41753aa9-ebad-4e64-884b-f6e3eaaccc8f',-1,{ts '2020-06-29 15:52:58.333'},{ts '2020-06-29 16:07:54.497'},NULL,N'::1');
GO
INSERT INTO [umbracoUserLogin] ([sessionId],[userId],[loggedInUtc],[lastValidatedUtc],[loggedOutUtc],[ipAddress]) VALUES (
'53e9bce5-aefa-4a1c-88fc-ff518409cff8',-1,{ts '2020-06-30 07:24:39.813'},{ts '2020-06-30 08:18:47.100'},NULL,N'::1');
GO
SET IDENTITY_INSERT [umbracoServer] ON;
GO
INSERT INTO [umbracoServer] ([id],[address],[computerName],[registeredDate],[lastNotifiedDate],[isActive],[isMaster]) VALUES (
1,N'http://localhost/umbraco',N'MSI//LM/W3SVC/2/ROOT',{ts '2020-06-29 10:00:56.670'},{ts '2020-07-03 09:23:23.247'},1,1);
GO
SET IDENTITY_INSERT [umbracoServer] OFF;
GO
SET IDENTITY_INSERT [umbracoRelationType] ON;
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
1,'4cbeb612-e689-3563-b755-bf3ede295433',1,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Document On Copy',N'relateDocumentOnCopy');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
2,'0cc3507c-66ab-3091-8913-3d998148e423',0,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Parent Document On Delete',N'relateParentDocumentOnDelete');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
3,'8307994f-faf2-3844-bab9-72d34514edf2',0,'b796f64c-1f99-4ffb-b886-4bf4bc011a9c','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',N'Relate Parent Media Folder On Delete',N'relateParentMediaFolderOnDelete');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
4,'4954ce93-3bf9-3d1e-9cd2-21bf9f9c2abf',0,NULL,NULL,N'Related Media',N'umbMedia');
GO
INSERT INTO [umbracoRelationType] ([id],[typeUniqueId],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
5,'0b93e414-5abe-36ec-a6bb-516e56f12238',0,NULL,NULL,N'Related Document',N'umbDocument');
GO
SET IDENTITY_INSERT [umbracoRelationType] OFF;
GO
INSERT INTO [umbracoRedirectUrl] ([id],[contentKey],[createDateUtc],[url],[culture],[urlHash]) VALUES (
'34b5f0dc-c2d4-40c3-ba04-7b124f31ccec','6488d9eb-d5b9-45ff-be96-93ebb4d6876f',{ts '2020-07-02 14:59:36.977'},N'/masaz-i-pielegnacja-ciala',N'',N'7672f50c1e10a8331fbc28a9e45a30e8c5c25709');
GO
SET IDENTITY_INSERT [umbracoNode] ON;
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-99,'8f1ef1e1-9de4-40d3-a072-6673f631ca64',-1,1,N'-1,-99',39,0,-1,N'Label (decimal)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.950'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-98,'a97cec69-9b71-4c30-8b12-ec398860d7e8',-1,1,N'-1,-98',38,0,-1,N'Label (time)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.947'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-97,'aa2c52a0-ce87-4e65-a47c-7df09358585d',-1,1,N'-1,-97',2,0,-1,N'List View - Members','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.973'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-96,'3a0156c4-3b8c-4803-bdc1-6871faa83fff',-1,1,N'-1,-96',2,0,-1,N'List View - Media','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.970'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-95,'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4',-1,1,N'-1,-95',2,0,-1,N'List View - Content','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.970'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-94,'0e9794eb-f9b5-4f20-a788-93acd233a7e4',-1,1,N'-1,-94',37,0,-1,N'Label (datetime)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.947'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-93,'930861bf-e262-4ead-a704-f99453565708',-1,1,N'-1,-93',36,0,-1,N'Label (bigint)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.947'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-92,'f0bc4bfb-b499-40d6-ba86-058885a5178c',-1,1,N'-1,-92',35,0,-1,N'Label (string)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.943'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-91,'8e7f995c-bd81-4627-9932-c40e568ec788',-1,1,N'-1,-91',36,0,-1,N'Label (integer)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.943'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-90,'84c6b441-31df-4ffe-b67e-67d5bc3ae65a',-1,1,N'-1,-90',34,0,-1,N'Upload','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.950'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-89,'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3',-1,1,N'-1,-89',33,0,-1,N'Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.953'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-88,'0cc0eba1-9960-42c9-bf9b-60e150b429ae',-1,1,N'-1,-88',32,0,-1,N'Textstring','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.953'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-87,'ca90c950-0aff-4e72-b976-a30b1ac57dad',-1,1,N'-1,-87',4,0,-1,N'Richtext editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.957'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-51,'2e6d3631-066e-44b8-aec4-96f09099b2b5',-1,1,N'-1,-51',2,0,-1,N'Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.957'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-49,'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49',-1,1,N'-1,-49',2,0,-1,N'True/false','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.957'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-43,'fbaf13a8-4036-41f2-93a3-974f678c312a',-1,1,N'-1,-43',2,0,-1,N'Checkbox list','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.960'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-42,'f38f0ac7-1d27-439c-9f3f-089cd8825a53',-1,1,N'-1,-42',2,0,-1,N'Dropdown multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.967'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-41,'5046194e-4237-453c-a547-15db3a07c4e1',-1,1,N'-1,-41',2,0,-1,N'Date Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.963'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-40,'bb5f57c9-ce2b-4bb9-b697-4caca783a805',-1,1,N'-1,-40',2,0,-1,N'Radiobox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.963'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-39,'0b6a45e7-44ba-430d-9da5-4e46060b9e03',-1,1,N'-1,-39',2,0,-1,N'Dropdown','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.963'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-37,'0225af17-b302-49cb-9176-b9f35cab9c17',-1,1,N'-1,-37',2,0,-1,N'Approved Color','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.967'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-36,'e4d66c0f-b935-4200-81f0-025f7256b89a',-1,1,N'-1,-36',2,0,-1,N'Date Picker with time','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.967'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-21,'bf7c7cbc-952f-4518-97a2-69e9c7b33842',-1,0,N'-1,-21',0,0,-1,N'Recycle Bin','cf3d8e34-1c1c-41e9-ae56-878b57b32113',{ts '2020-06-29 09:59:50.940'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-20,'0f582a79-1e41-4cf0-bfa0-76340651891a',-1,0,N'-1,-20',0,0,-1,N'Recycle Bin','01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8',{ts '2020-06-29 09:59:50.937'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
-1,'916724a5-173d-4619-b97e-b9de133dd6f5',-1,0,N'-1',0,0,-1,N'SYSTEM DATA: umbraco master root','ea7d8624-4cfe-4578-a871-24aa946bf34d',{ts '2020-06-29 09:59:50.933'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1031,'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d',-1,1,N'-1,1031',2,0,-1,N'Folder','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2020-06-29 09:59:50.973'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1032,'cc07b313-0843-4aa8-bbda-871c8da728c8',-1,1,N'-1,1032',2,0,-1,N'Image','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2020-06-29 09:59:50.973'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1033,'4c52d8ab-54e6-40cd-999c-7a5f24903e4d',-1,1,N'-1,1033',2,0,-1,N'File','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2020-06-29 09:59:50.977'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1041,'b6b73142-b9c1-4bf8-a16d-e1c23320b549',-1,1,N'-1,1041',2,0,-1,N'Tags','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.977'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1043,'1df9f033-e6d4-451f-b8d2-e0cbc50a836f',-1,1,N'-1,1043',2,0,-1,N'Image Cropper','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.977'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1044,'d59be02f-1df9-4228-aa1e-01917d806cda',-1,1,N'-1,1044',0,0,-1,N'Member','9b5416fb-e72f-45a9-a07b-5a9a2709ce43',{ts '2020-06-29 09:59:50.980'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1046,'fd1e0da5-5606-4862-b679-5d0cf3a52a59',-1,1,N'-1,1046',2,0,-1,N'Content Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.980'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1047,'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548',-1,1,N'-1,1047',2,0,-1,N'Member Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.983'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1048,'135d60e0-64d9-49ed-ab08-893c9ba44ae5',-1,1,N'-1,1048',2,0,-1,N'Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.983'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1049,'9dbbcbbb-2327-434a-b355-af1b84e5010a',-1,1,N'-1,1049',2,0,-1,N'Multiple Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.987'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1050,'b4e3535a-1753-47e2-8568-602cf8cfee6f',-1,1,N'-1,1050',2,0,-1,N'Multi URL Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 09:59:50.987'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1064,'a829b425-611b-4972-87ce-b948d7be0362',-1,1,N'-1,1064',29,0,-1,N'Strona Główna - Telefon Firmowy - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 11:00:22.973'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1065,'c89f0f49-2a34-4971-9106-1e2328288684',-1,1,N'-1,1065',30,0,-1,N'Strona Główna - Telefon Recepcja - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 11:03:10.693'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1068,'8d7bd135-6434-4aa2-a454-420c9690ad91',1110,1,N'-1,1110,1068',0,0,NULL,N'Strona Główna','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-06-29 11:14:37.953'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1070,'5e5f84d0-6c85-4e22-8058-7766602d5e34',-1,1,N'-1,1070',31,0,-1,N'Strona Główna - Zdjęcie Tła - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 11:59:30.653'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1071,'2ae1da38-4f37-47ca-ab1f-0e1ee609a1f0',-21,1,N'-1,-21,1071',0,1,-1,N'Bg 1','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-29 12:00:58.877'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1072,'b3fcb8b2-381c-4e98-ad89-45dc80b4b012',-21,1,N'-1,-21,1072',0,1,-1,N'Emi-Center-Background','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-29 12:02:00.597'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1073,'ec6dfdf7-2a49-484e-8a56-7f9a52387bad',-21,1,N'-1,-21,1073',0,1,-1,N'Bg 1 (1)','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-29 12:11:48.207'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1074,'280dd6f5-f1a5-4b27-abec-96a74e40d39a',-1,1,N'-1,1074',1,0,-1,N'Images','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-29 12:13:15.247'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1075,'0347e667-7265-41af-9558-5b875808cf38',1074,2,N'-1,1074,1075',0,0,-1,N'Bg 1','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-29 12:13:27.850'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1076,'e113ad3b-e528-47bc-a809-9274b04373cd',-1,1,N'-1,1076',32,0,-1,N'Strona Główna - Logo - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 12:37:09.953'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1077,'456e973b-f595-4df9-87b5-9573fcea1685',-1,1,N'-1,1077',33,0,-1,N'Strona Główna - Zdjęcie tła - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 12:41:34.847'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1078,'0d7dadfe-166a-4c9a-beda-c4bc05dfa351',-1,1,N'-1,1078',34,0,-1,N'Strona Główna - Zdjęcie tła - Multi Url Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 12:49:38.910'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1079,'dffa30f3-a512-477f-bcba-618392e97d0d',-1,1,N'-1,1079',35,0,-1,N'Strona Główna - Zdjęcie tła - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 12:50:21.467'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1080,'566e1de2-2424-483c-99c3-b6360ad9541a',-1,1,N'-1,1080',36,0,-1,N'URLPicker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 14:14:21.450'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1081,'eea7015d-47ff-447e-9f44-b0d189ee6885',-1,1,N'-1,1081',37,0,-1,N'Strona Główna - URLBackground - Custom URL Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 15:47:55.607'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1082,'8808d09e-4aa1-431f-bd1d-66087ff22d7e',-1,1,N'-1,1082',38,0,-1,N'Strona Główna - URLBackground - File upload','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 16:06:03.577'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1083,'6723b513-aaf1-4a5b-8a20-f9e29c83e22b',-1,1,N'-1,1083',39,0,-1,N'Strona Główna - URLBackground - Content Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 16:06:39.700'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1084,'85704b5a-d252-417a-b2a6-1347d109f4c4',-1,1,N'-1,1084',40,0,-1,N'Strona Główna - URLBackground - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 16:07:38.120'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1085,'a7668992-7bc6-4cb6-8ecb-df74761987b2',-1,1,N'-1,1085',41,0,-1,N'Strona Główna - URLBackground - Media Picker (1)','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-29 16:09:27.433'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1086,'615e84dd-7c73-44f0-9f27-06b0aea2efff',1074,2,N'-1,1074,1086',1,0,-1,N'Logo','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-29 16:33:49.170'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1090,'f3d0c23d-b6cb-4709-a14a-9dfe8c8f1c4e',-1,1,N'-1,1090',2,0,-1,N'Galeria','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:17.447'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1091,'9121b980-96c0-4224-bd2f-6d1d64ad3b51',-21,1,N'-1,-21,1091',0,1,-1,N'Img 1','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:34.283'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1092,'c66c3469-c4a4-43e1-bd1e-f8b4916aa5b3',-21,1,N'-1,-21,1092',0,1,-1,N'Img 2','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:35.090'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1093,'db6a0cbe-5b8c-4f5a-8147-7b62098a924b',-21,1,N'-1,-21,1093',0,1,-1,N'Img 3','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:35.863'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1094,'47d3b964-6625-473c-ac27-c7ca20517ab1',-21,1,N'-1,-21,1094',0,1,-1,N'Img 4','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:36.683'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1095,'e985a122-92ab-4bce-943b-a63ce770f21c',-21,1,N'-1,-21,1095',0,1,-1,N'Img 5','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:37.500'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1096,'e3b9a845-0752-4c21-8056-50db413eb67b',-21,1,N'-1,-21,1096',0,1,-1,N'Img 6','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:38.300'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1097,'56f5b4b3-3db6-4a6d-a841-70b6ed593595',-21,1,N'-1,-21,1097',0,1,-1,N'Img 7','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:39.110'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1098,'3dc1d975-11c1-48e6-af40-3e7250fcb7c2',-21,1,N'-1,-21,1098',0,1,-1,N'Img 8','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:39.940'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1099,'b1635612-277a-46c2-9644-fb20e7a67916',-21,1,N'-1,-21,1099',0,1,-1,N'Img 9','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:40.750'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1100,'ce6bad19-f229-42a0-91f3-eb23abebddd6',-21,1,N'-1,-21,1100',0,1,-1,N'Img 10','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:41.573'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1101,'d26b25fd-79a0-4e0a-b08d-63543b5fb23f',-21,1,N'-1,-21,1101',0,1,-1,N'Img 11','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-06-30 08:34:42.377'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1106,'5b6b643c-14e7-413f-b856-84da255f6e42',-1,1,N'-1,1106',42,0,-1,N'_Layout - logo - Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-06-30 09:05:33.260'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1110,'959142af-36c5-4f80-b7d1-5fae5df212ea',-1,1,N'-1,1110',0,0,NULL,N'Master','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-06-30 09:44:32.553'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1111,'097e42b6-f3e7-46db-86b7-1102b247ff54',-1,1,N'-1,1111',0,0,-1,N'Master','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-06-30 09:47:11.230'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1112,'ca1480b6-9394-47e8-b733-e269229eaaff',1111,2,N'-1,1111,1112',0,0,-1,N'Strona Główna','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-06-30 09:50:28.180'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1113,'331fa914-4132-4c4c-940c-bf575ad800f9',-1,1,N'-1,1113',0,0,-1,N'Strona Główna','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-06-30 09:58:49.787'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1116,'eb0482fa-cf36-4fd6-b1bc-7a5a8fa76877',1111,2,N'-1,1111,1116',1,0,-1,N'Galeria','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-06-30 10:13:02.147'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1118,'c701ac8f-be0e-44d4-86e1-e4901ab41cbe',1110,1,N'-1,1110,1118',0,0,NULL,N'Galeria','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-06-30 10:14:40.327'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1119,'80adb2e2-b5cf-4abf-ab2b-12fd71267f93',-1,1,N'-1,1119',1,0,-1,N'Galeria','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-07-01 12:36:08.280'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1120,'2f2f4358-e428-4364-a5f3-fe49cff99ff6',-1,1,N'-1,1120',2,0,-1,N'Galeria','6ebef410-03aa-48cf-a792-e1c1cb087aca',{ts '2020-07-01 12:37:44.633'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1121,'de3a267f-f060-4da0-95ed-93229f76953c',1090,2,N'-1,1090,1121',0,0,-1,N'Img 1','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-07-01 12:46:49.037'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1122,'af1ba5e3-73a8-4d3c-a836-41c99a791859',1090,2,N'-1,1090,1122',0,0,-1,N'Img 2','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-07-01 12:46:49.807'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1123,'8be2281b-fde2-4132-a231-6db09ad01b03',1090,2,N'-1,1090,1123',0,0,-1,N'Img 3','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-07-01 12:46:50.557'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1124,'599cf43e-6898-42d5-a464-c4b8e3901127',1090,2,N'-1,1090,1124',0,0,-1,N'Img 4','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-07-01 12:46:51.030'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1125,'43ba5c22-46c1-4ffd-8787-3404cee217c4',1090,2,N'-1,1090,1125',0,0,-1,N'Img 5','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-07-01 12:46:51.883'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1126,'ced17de9-3ee2-45ca-a8af-f962df2ceb3d',1090,2,N'-1,1090,1126',0,0,-1,N'Img 6','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-07-01 12:46:52.503'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1127,'79277694-711b-4019-9773-2242c7e35a98',1090,2,N'-1,1090,1127',0,0,-1,N'Img 7','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-07-01 12:46:53.290'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1128,'41a09512-2edd-4a6a-a0c1-a7e4219a8484',1090,2,N'-1,1090,1128',0,0,-1,N'Img 8','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-07-01 12:46:54.153'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1129,'55f48754-556f-4b03-91dd-89955fa58506',1090,2,N'-1,1090,1129',0,0,-1,N'Img 9','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-07-01 12:46:54.900'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1130,'42db1120-d1a2-406f-8820-67c05978127e',1090,2,N'-1,1090,1130',0,0,-1,N'Img 10','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-07-01 12:46:55.720'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1131,'ca3a1974-3bb7-49b8-a15c-426fcaeb3520',1090,2,N'-1,1090,1131',0,0,-1,N'Img 11','b796f64c-1f99-4ffb-b886-4bf4bc011a9c',{ts '2020-07-01 12:46:56.507'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1136,'e8758cf6-0acc-4f5a-8d63-b435b5a4aa8f',-1,1,N'-1,1136',43,0,-1,N'Cennik - Cena Usługi - Decimal','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-07-01 13:41:17.493'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1138,'b94e8957-2088-4450-964d-c9c87f0ce4d5',-1,1,N'-1,1138',1,0,-1,N'CennikDocument','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-07-01 13:42:41.383'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1140,'16618563-a2d7-4daf-a47f-d520fad068e8',1111,2,N'-1,1111,1140',2,0,-1,N'Cennik','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2020-07-01 13:44:56.320'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1141,'eece0890-6ebc-4d5f-8f3d-197fa3a731c7',-1,1,N'-1,1141',44,0,-1,N'Lista Usług','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-07-01 13:52:40.453'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1142,'cee075fd-9c6f-4a06-b061-081e169bb1b1',-1,1,N'-1,1142',45,0,-1,N'CennikDocument - Czas Wykonania usługi - Slider','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-07-01 13:54:13.917'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1143,'d0123dfe-e5b5-4bfa-82d8-9a3085e45d37',1110,1,N'-1,1110,1143',0,0,NULL,N'Cennik','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2020-07-01 13:56:26.437'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1144,'6011f1c8-19f8-472c-86ea-62cf6baa80a5',-20,1,N'-1,-20,1144',0,1,-1,N'Cennik-1','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-07-01 14:00:26.467'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1145,'787b7f93-874c-46c6-8780-10883101f6d7',-1,1,N'-1,1145',46,0,-1,N'CennikDocument - Opis Usługi - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-07-02 10:50:43.433'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1146,'5cbb7903-805b-4e2c-88f8-4b9ab9017493',-1,1,N'-1,1146',2,0,-1,N'Cennik - Chirurgia','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-07-02 15:22:11.647'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1147,'82aa0a7e-3f7a-4dc1-8f99-217005396b8d',-1,1,N'-1,1147',47,0,-1,N'CennikDocument - Czas Wykonania usługi - Textbox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-07-02 15:40:39.087'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1148,'ec76d7fd-25df-4b63-ae96-32d1aca8e4a0',-1,1,N'-1,1148',48,0,-1,N'CennikDocument - Opis Usługi - Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2020-07-02 15:40:59.763'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1149,'46d3adfa-cdde-42b6-875f-080a972de1f6',-1,1,N'-1,1149',3,0,-1,N'Cennik - Kosmetyka','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-07-02 15:43:02.197'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1150,'6488d9eb-d5b9-45ff-be96-93ebb4d6876f',-1,1,N'-1,1150',4,0,-1,N'Cennik - Masaż i pielęgnacja ciała','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-07-02 15:59:24.530'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1151,'e6ae01ea-0ec8-40fb-89e6-8d0a321f8d82',-1,1,N'-1,1151',5,0,-1,N'Cennik - Podologia','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-07-02 16:05:42.407'});
GO
INSERT INTO [umbracoNode] ([id],[uniqueId],[parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[nodeObjectType],[createDate]) VALUES (
1152,'d2f083ac-8f15-4362-b8ab-63bd57514df3',-1,1,N'-1,1152',6,0,-1,N'Cennik - Pielęgnacja dłoni i paznokci','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2020-07-02 16:07:49.570'});
GO
SET IDENTITY_INSERT [umbracoNode] OFF;
GO
SET IDENTITY_INSERT [umbracoUserStartNode] OFF;
GO
SET IDENTITY_INSERT [umbracoUserGroup] ON;
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (
1,N'admin',N'Administrators',N'CADMOSKTPIURZ:5F7ï',{ts '2020-06-29 09:59:51.453'},{ts '2020-06-29 09:59:51.453'},N'icon-medal',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (
2,N'writer',N'Writers',N'CAH:F',{ts '2020-06-29 09:59:51.457'},{ts '2020-06-29 09:59:51.457'},N'icon-edit',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (
3,N'editor',N'Editors',N'CADMOSKTPUZ:5Fï',{ts '2020-06-29 09:59:51.460'},{ts '2020-06-29 09:59:51.460'},N'icon-tools',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (
4,N'translator',N'Translators',N'AF',{ts '2020-06-29 09:59:51.460'},{ts '2020-06-29 09:59:51.460'},N'icon-globe',-1,-1);
GO
INSERT INTO [umbracoUserGroup] ([id],[userGroupAlias],[userGroupName],[userGroupDefaultPermissions],[createDate],[updateDate],[icon],[startContentId],[startMediaId]) VALUES (
5,N'sensitiveData',N'Sensitive data',N'',{ts '2020-06-29 09:59:51.463'},{ts '2020-06-29 09:59:51.463'},N'icon-lock',-1,-1);
GO
SET IDENTITY_INSERT [umbracoUserGroup] OFF;
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'forms');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'media');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'member');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'packages');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'settings');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'translation');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
1,N'users');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
2,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
3,N'content');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
3,N'forms');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
3,N'media');
GO
INSERT INTO [umbracoUserGroup2App] ([userGroupId],[app]) VALUES (
4,N'translation');
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (
-1,1);
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (
-1,5);
GO
INSERT INTO [umbracoUser2UserGroup] ([userId],[userGroupId]) VALUES (
1,1);
GO
SET IDENTITY_INSERT [umbracoRelation] ON;
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
2,-1,1073,3,{ts '2020-06-29 12:12:32.357'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
3,-1,1072,3,{ts '2020-06-29 12:12:35.330'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
4,-1,1071,3,{ts '2020-06-29 12:12:37.340'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
120,1120,1086,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
121,1120,1101,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
122,1120,1100,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
123,1120,1099,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
124,1120,1098,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
125,1120,1097,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
126,1120,1096,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
127,1120,1095,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
128,1120,1094,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
129,1120,1093,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
130,1120,1092,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
131,1120,1091,4,{ts '2020-07-01 12:37:44.663'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
157,1090,1101,3,{ts '2020-07-01 12:45:52.553'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
158,1090,1100,3,{ts '2020-07-01 12:45:53.567'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
159,1090,1099,3,{ts '2020-07-01 12:45:54.543'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
160,1090,1098,3,{ts '2020-07-01 12:45:55.507'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
161,1090,1097,3,{ts '2020-07-01 12:45:56.453'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
162,1090,1096,3,{ts '2020-07-01 12:45:57.440'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
163,1090,1095,3,{ts '2020-07-01 12:45:58.407'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
164,1090,1094,3,{ts '2020-07-01 12:45:59.370'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
165,1090,1093,3,{ts '2020-07-01 12:46:00.337'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
166,1090,1092,3,{ts '2020-07-01 12:46:01.297'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
167,1090,1091,3,{ts '2020-07-01 12:46:02.060'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
188,1144,1086,4,{ts '2020-07-02 15:16:37.957'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
189,-1,1144,2,{ts '2020-07-02 15:16:40.357'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
239,1119,1086,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
240,1119,1075,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
241,1119,1121,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
242,1119,1122,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
243,1119,1123,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
244,1119,1124,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
245,1119,1125,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
246,1119,1126,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
247,1119,1127,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
248,1119,1128,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
249,1119,1129,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
250,1119,1130,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
251,1119,1131,4,{ts '2020-07-02 16:20:28.617'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
252,1146,1086,4,{ts '2020-07-02 16:20:38.067'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
253,1146,1075,4,{ts '2020-07-02 16:20:38.067'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
256,1149,1086,4,{ts '2020-07-02 16:21:07.207'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
257,1149,1075,4,{ts '2020-07-02 16:21:07.207'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
258,1150,1086,4,{ts '2020-07-02 16:21:15.143'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
259,1150,1075,4,{ts '2020-07-02 16:21:15.143'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
260,1151,1086,4,{ts '2020-07-02 16:21:23.207'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
261,1151,1075,4,{ts '2020-07-02 16:21:23.207'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
262,1152,1086,4,{ts '2020-07-02 16:21:32.577'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
263,1152,1075,4,{ts '2020-07-02 16:21:32.577'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
264,1113,1086,4,{ts '2020-07-02 16:22:02.637'},N'');
GO
INSERT INTO [umbracoRelation] ([id],[parentId],[childId],[relType],[datetime],[comment]) VALUES (
265,1113,1075,4,{ts '2020-07-02 16:22:02.637'},N'');
GO
SET IDENTITY_INSERT [umbracoRelation] OFF;
GO
SET IDENTITY_INSERT [umbracoLog] ON;
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
1,-1,1,N'Language',{ts '2020-06-29 10:11:04.037'},N'Save',N'Save Language',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
2,-1,1060,N'Template',{ts '2020-06-29 10:29:25.390'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
3,-1,1061,N'DocumentType',{ts '2020-06-29 10:29:25.637'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
4,-1,1060,N'Template',{ts '2020-06-29 10:38:52.693'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
5,-1,1060,N'Template',{ts '2020-06-29 10:38:58.537'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
6,-1,1060,N'Template',{ts '2020-06-29 10:40:14.577'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
7,-1,-1,N'Document',{ts '2020-06-29 10:41:14.537'},N'Delete',N'Delete content of type 1061',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
8,-1,1061,N'DocumentType',{ts '2020-06-29 10:41:14.610'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
9,-1,1060,N'Template',{ts '2020-06-29 10:41:18.967'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
10,-1,1062,N'Template',{ts '2020-06-29 10:41:31.240'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
11,-1,1062,N'Template',{ts '2020-06-29 10:42:01.133'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
12,-1,1063,N'DocumentType',{ts '2020-06-29 10:47:09.837'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
13,-1,1064,N'DataType',{ts '2020-06-29 11:00:23.060'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
14,-1,1065,N'DataType',{ts '2020-06-29 11:03:10.750'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
15,-1,1063,N'DocumentType',{ts '2020-06-29 11:06:03.867'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
16,-1,1062,N'Template',{ts '2020-06-29 11:06:30.907'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
17,-1,1066,N'Template',{ts '2020-06-29 11:06:43.947'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
18,-1,1066,N'Template',{ts '2020-06-29 11:07:16.597'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
19,-1,1067,N'Template',{ts '2020-06-29 11:10:16.337'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
20,-1,1067,N'Template',{ts '2020-06-29 11:13:46.283'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
21,-1,1063,N'DocumentType',{ts '2020-06-29 11:13:58.087'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
22,-1,1068,N'Template',{ts '2020-06-29 11:14:37.967'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
23,-1,1063,N'DocumentType',{ts '2020-06-29 11:14:42.877'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
24,-1,1068,N'Template',{ts '2020-06-29 11:16:52.853'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
25,-1,1069,N'Document',{ts '2020-06-29 11:19:33.023'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
26,-1,-1,N'Stylesheet',{ts '2020-06-29 11:24:55.653'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
27,-1,1068,N'Template',{ts '2020-06-29 11:25:54.913'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
28,-1,-1,N'Stylesheet',{ts '2020-06-29 11:27:39.823'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
29,-1,-1,N'Stylesheet',{ts '2020-06-29 11:29:26.757'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
30,-1,-1,N'Script',{ts '2020-06-29 11:31:09.360'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
31,-1,-1,N'Script',{ts '2020-06-29 11:32:12.457'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
32,-1,1068,N'Template',{ts '2020-06-29 11:32:41.523'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
33,-1,1068,N'Template',{ts '2020-06-29 11:33:15.307'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
34,-1,1068,N'Template',{ts '2020-06-29 11:37:28.200'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
35,-1,1068,N'Template',{ts '2020-06-29 11:42:05.290'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
36,-1,1068,N'Template',{ts '2020-06-29 11:43:04.687'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
37,-1,1068,N'Template',{ts '2020-06-29 11:45:33.863'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
38,-1,1069,N'Document',{ts '2020-06-29 11:46:54.223'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
39,-1,1069,N'Document',{ts '2020-06-29 11:46:57.977'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
40,-1,1069,N'Document',{ts '2020-06-29 11:47:16.413'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
41,-1,1068,N'Template',{ts '2020-06-29 11:48:37.883'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
42,-1,1068,N'Template',{ts '2020-06-29 11:49:07.950'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
43,-1,1068,N'Template',{ts '2020-06-29 11:49:20.380'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
44,-1,1069,N'Document',{ts '2020-06-29 11:49:59.857'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
45,-1,1068,N'Template',{ts '2020-06-29 11:51:20.333'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
46,-1,1068,N'Template',{ts '2020-06-29 11:55:23.953'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
47,-1,1068,N'Template',{ts '2020-06-29 11:56:38.367'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
48,-1,1070,N'DataType',{ts '2020-06-29 11:59:30.713'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
49,-1,1063,N'DocumentType',{ts '2020-06-29 11:59:44.193'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
50,-1,1071,N'Media',{ts '2020-06-29 12:00:58.907'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
51,-1,1072,N'Media',{ts '2020-06-29 12:02:00.627'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
52,-1,1063,N'DocumentType',{ts '2020-06-29 12:03:13.087'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
53,-1,1069,N'Document',{ts '2020-06-29 12:03:33.090'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
54,-1,1068,N'Template',{ts '2020-06-29 12:04:50.647'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
55,-1,1073,N'Media',{ts '2020-06-29 12:11:48.243'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
56,-1,1073,N'Media',{ts '2020-06-29 12:12:31.997'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
57,-1,1073,N'Media',{ts '2020-06-29 12:12:32.470'},N'Delete',N'Trashed media with Id: 1073 related to original parent media item with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
58,-1,1072,N'Media',{ts '2020-06-29 12:12:35.073'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
59,-1,1072,N'Media',{ts '2020-06-29 12:12:35.337'},N'Delete',N'Trashed media with Id: 1072 related to original parent media item with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
60,-1,1071,N'Media',{ts '2020-06-29 12:12:37.003'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
61,-1,1071,N'Media',{ts '2020-06-29 12:12:37.453'},N'Delete',N'Trashed media with Id: 1071 related to original parent media item with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
62,-1,1074,N'Media',{ts '2020-06-29 12:13:15.273'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
63,-1,1075,N'Media',{ts '2020-06-29 12:13:27.877'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
64,-1,1075,N'Media',{ts '2020-06-29 12:15:06.497'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
65,-1,1075,N'Media',{ts '2020-06-29 12:15:12.413'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
66,-1,1069,N'Document',{ts '2020-06-29 12:15:55.957'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
67,-1,-1,N'Stylesheet',{ts '2020-06-29 12:17:06.097'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
68,-1,-1,N'Stylesheet',{ts '2020-06-29 12:17:23.957'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
69,-1,-1,N'Stylesheet',{ts '2020-06-29 12:18:10.497'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
70,-1,-1,N'Stylesheet',{ts '2020-06-29 12:20:55.597'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
71,-1,1076,N'DataType',{ts '2020-06-29 12:37:10.040'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
72,-1,1063,N'DocumentType',{ts '2020-06-29 12:37:15.063'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
73,-1,-1,N'Stylesheet',{ts '2020-06-29 12:39:40.677'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
74,-1,1068,N'Template',{ts '2020-06-29 12:40:16.910'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
75,-1,1068,N'Template',{ts '2020-06-29 12:41:09.717'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
76,-1,1077,N'DataType',{ts '2020-06-29 12:41:34.910'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
77,-1,1063,N'DocumentType',{ts '2020-06-29 12:41:47.587'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
78,-1,1069,N'Document',{ts '2020-06-29 12:42:05.737'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
79,-1,1068,N'Template',{ts '2020-06-29 12:42:34.133'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
80,-1,1063,N'DocumentType',{ts '2020-06-29 12:44:35.357'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
81,-1,1069,N'Document',{ts '2020-06-29 12:45:30.233'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
82,-1,1068,N'Template',{ts '2020-06-29 12:46:05.817'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
83,-1,1068,N'Template',{ts '2020-06-29 12:46:43.590'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
84,-1,1068,N'Template',{ts '2020-06-29 12:47:11.423'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
85,-1,1050,N'DataType',{ts '2020-06-29 12:49:10.103'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
86,-1,1078,N'DataType',{ts '2020-06-29 12:49:38.977'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
87,-1,1079,N'DataType',{ts '2020-06-29 12:50:21.527'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
88,-1,1079,N'DataType',{ts '2020-06-29 12:51:26.167'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
89,-1,1063,N'DocumentType',{ts '2020-06-29 12:51:53.570'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
90,-1,-1,N'Package',{ts '2020-06-29 13:57:39.767'},N'PackagerInstall',N'Package files installed for package ''Umbraco.TimePicker''.',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
91,-1,-1,N'DocumentType',{ts '2020-06-29 13:57:50.103'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
92,-1,-1,N'Package',{ts '2020-06-29 13:57:50.203'},N'PackagerInstall',N'Package data installed for package ''Umbraco.TimePicker''.',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
93,-1,1080,N'DataType',{ts '2020-06-29 14:14:21.553'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
94,-1,1080,N'DataType',{ts '2020-06-29 14:14:49.763'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
95,-1,1080,N'DataType',{ts '2020-06-29 15:47:22.293'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
96,-1,1081,N'DataType',{ts '2020-06-29 15:47:55.673'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
97,-1,1063,N'DocumentType',{ts '2020-06-29 15:48:02.457'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
98,-1,1069,N'Document',{ts '2020-06-29 15:52:48.260'},N'Unpublish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
99,-1,1069,N'Document',{ts '2020-06-29 15:59:53.793'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
100,-1,1082,N'DataType',{ts '2020-06-29 16:06:03.633'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
101,-1,1083,N'DataType',{ts '2020-06-29 16:06:39.763'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
102,-1,1063,N'DocumentType',{ts '2020-06-29 16:06:48.287'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
103,-1,1084,N'DataType',{ts '2020-06-29 16:07:38.177'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
104,-1,1063,N'DocumentType',{ts '2020-06-29 16:08:25.607'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
105,-1,1085,N'DataType',{ts '2020-06-29 16:09:27.497'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
106,-1,1063,N'DocumentType',{ts '2020-06-29 16:09:35.217'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
107,-1,1069,N'Document',{ts '2020-06-29 16:09:54.887'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
108,-1,1068,N'Template',{ts '2020-06-29 16:10:28.147'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
109,-1,1068,N'Template',{ts '2020-06-29 16:11:19.390'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
110,-1,1068,N'Template',{ts '2020-06-29 16:14:29.663'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
111,-1,1068,N'Template',{ts '2020-06-29 16:14:34.523'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
112,-1,1068,N'Template',{ts '2020-06-29 16:15:09.213'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
113,-1,1068,N'Template',{ts '2020-06-29 16:15:31.040'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
114,-1,1068,N'Template',{ts '2020-06-29 16:16:32.790'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
115,-1,1068,N'Template',{ts '2020-06-29 16:17:55.403'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
116,-1,1068,N'Template',{ts '2020-06-29 16:19:02.513'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
117,-1,1068,N'Template',{ts '2020-06-29 16:20:00.947'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
118,-1,1068,N'Template',{ts '2020-06-29 16:28:22.420'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
119,-1,1068,N'Template',{ts '2020-06-29 16:29:18.703'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
120,-1,1068,N'Template',{ts '2020-06-29 16:30:13.077'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
121,-1,1068,N'Template',{ts '2020-06-29 16:33:35.547'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
122,-1,1086,N'Media',{ts '2020-06-29 16:33:49.213'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
123,-1,1069,N'Document',{ts '2020-06-29 16:35:30.007'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
124,-1,1063,N'DocumentType',{ts '2020-06-29 16:39:28.523'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
125,-1,1068,N'Template',{ts '2020-06-29 16:39:34.647'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
126,-1,1087,N'Template',{ts '2020-06-29 16:55:59.257'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
127,-1,1088,N'DocumentType',{ts '2020-06-29 16:55:59.560'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
128,-1,1087,N'Template',{ts '2020-06-29 17:00:29.373'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
129,-1,1087,N'Template',{ts '2020-06-29 17:01:16.897'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
130,-1,1088,N'DocumentType',{ts '2020-06-29 17:03:10.517'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
131,-1,1089,N'Document',{ts '2020-06-29 17:03:23.227'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
132,-1,1089,N'Document',{ts '2020-06-29 17:03:58.743'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
133,-1,1063,N'DocumentType',{ts '2020-06-30 08:25:45.423'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
134,-1,1087,N'Template',{ts '2020-06-30 08:26:20.790'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
135,-1,1087,N'Template',{ts '2020-06-30 08:27:03.550'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
136,-1,1087,N'Template',{ts '2020-06-30 08:28:00.367'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
137,-1,1087,N'Template',{ts '2020-06-30 08:29:09.737'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
138,-1,1087,N'Template',{ts '2020-06-30 08:34:00.890'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
139,-1,1090,N'Media',{ts '2020-06-30 08:34:17.530'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
140,-1,1091,N'Media',{ts '2020-06-30 08:34:34.317'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
141,-1,1092,N'Media',{ts '2020-06-30 08:34:35.133'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
142,-1,1093,N'Media',{ts '2020-06-30 08:34:35.900'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
143,-1,1094,N'Media',{ts '2020-06-30 08:34:36.710'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
144,-1,1095,N'Media',{ts '2020-06-30 08:34:37.530'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
145,-1,1096,N'Media',{ts '2020-06-30 08:34:38.330'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
146,-1,1097,N'Media',{ts '2020-06-30 08:34:39.140'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
147,-1,1098,N'Media',{ts '2020-06-30 08:34:39.967'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
148,-1,1099,N'Media',{ts '2020-06-30 08:34:40.777'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
149,-1,1100,N'Media',{ts '2020-06-30 08:34:41.600'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
150,-1,1101,N'Media',{ts '2020-06-30 08:34:42.407'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
151,-1,1089,N'Document',{ts '2020-06-30 08:34:46.830'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
152,-1,1089,N'Document',{ts '2020-06-30 08:35:38.727'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
153,-1,1063,N'DocumentType',{ts '2020-06-30 08:36:16.353'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
154,-1,1063,N'DocumentType',{ts '2020-06-30 08:36:20.987'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
155,-1,1087,N'Template',{ts '2020-06-30 08:36:27.990'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
156,-1,1087,N'Template',{ts '2020-06-30 08:38:45.133'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
157,-1,1063,N'DocumentType',{ts '2020-06-30 08:38:55.620'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
158,-1,1087,N'Template',{ts '2020-06-30 08:40:43.687'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
159,-1,1087,N'Template',{ts '2020-06-30 08:43:03.107'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
160,-1,1087,N'Template',{ts '2020-06-30 08:43:30.990'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
161,-1,1087,N'Template',{ts '2020-06-30 08:43:42.337'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
162,-1,1087,N'Template',{ts '2020-06-30 08:44:08.983'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
163,-1,1063,N'DocumentType',{ts '2020-06-30 08:44:42.037'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
164,-1,1087,N'Template',{ts '2020-06-30 08:45:27.617'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
165,-1,1087,N'Template',{ts '2020-06-30 08:46:52.290'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
166,-1,1087,N'Template',{ts '2020-06-30 08:48:48.090'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
167,-1,1069,N'Document',{ts '2020-06-30 08:48:57.453'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
168,-1,1063,N'DocumentType',{ts '2020-06-30 08:49:47.287'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
169,-1,1063,N'DocumentType',{ts '2020-06-30 08:50:14.050'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
170,-1,1088,N'DocumentType',{ts '2020-06-30 08:50:32.420'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
171,-1,1068,N'Template',{ts '2020-06-30 08:50:42.893'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
172,-1,1069,N'Document',{ts '2020-06-30 08:50:54.967'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
173,-1,1069,N'Document',{ts '2020-06-30 08:51:01.013'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
174,-1,1069,N'Document',{ts '2020-06-30 08:51:04.417'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
175,-1,1087,N'Template',{ts '2020-06-30 08:51:29.643'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
176,-1,1069,N'Document',{ts '2020-06-30 08:51:34.553'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
177,-1,1069,N'Document',{ts '2020-06-30 08:51:39.973'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
178,-1,1069,N'Document',{ts '2020-06-30 08:51:42.247'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
179,-1,1063,N'DocumentType',{ts '2020-06-30 08:53:49.107'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
180,-1,1088,N'DocumentType',{ts '2020-06-30 08:53:58.197'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
181,-1,1087,N'Template',{ts '2020-06-30 08:54:08.963'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
182,-1,1063,N'DocumentType',{ts '2020-06-30 08:55:46.737'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
183,-1,1087,N'Template',{ts '2020-06-30 08:56:10.820'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
184,-1,1087,N'Template',{ts '2020-06-30 08:56:14.380'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
185,-1,1102,N'Template',{ts '2020-06-30 08:57:21.413'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
186,-1,1089,N'Document',{ts '2020-06-30 08:57:31.947'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
187,-1,1089,N'Document',{ts '2020-06-30 08:57:39.343'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
188,-1,1068,N'Template',{ts '2020-06-30 08:57:45.590'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
189,-1,1089,N'Document',{ts '2020-06-30 08:57:57.497'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
190,-1,1103,N'Document',{ts '2020-06-30 08:58:23.000'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
191,-1,1089,N'Document',{ts '2020-06-30 08:58:34.017'},N'Move',N'Moved to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
192,-1,1089,N'Document',{ts '2020-06-30 08:58:34.617'},N'Delete',N'Trashed content with Id: 1089 related to original parent content with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
193,-1,1103,N'Document',{ts '2020-06-30 08:58:43.073'},N'Move',N'Moved to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
194,-1,1103,N'Document',{ts '2020-06-30 08:58:43.573'},N'Delete',N'Trashed content with Id: 1103 related to original parent content with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
195,-1,1104,N'Document',{ts '2020-06-30 08:58:59.427'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
196,-1,1104,N'Document',{ts '2020-06-30 08:59:01.813'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
197,-1,1102,N'Template',{ts '2020-06-30 08:59:32.690'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
198,-1,1104,N'Document',{ts '2020-06-30 08:59:48.017'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
199,-1,1063,N'DocumentType',{ts '2020-06-30 09:04:15.067'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
200,-1,1106,N'DataType',{ts '2020-06-30 09:05:33.350'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
201,-1,1107,N'Template',{ts '2020-06-30 09:06:56.403'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
202,-1,1108,N'DocumentType',{ts '2020-06-30 09:06:56.647'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
203,-1,1108,N'DocumentType',{ts '2020-06-30 09:09:13.793'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
204,-1,1107,N'Template',{ts '2020-06-30 09:11:41.413'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
205,-1,1068,N'Template',{ts '2020-06-30 09:12:22.737'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
206,-1,1107,N'Template',{ts '2020-06-30 09:12:28.860'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
207,-1,1107,N'Template',{ts '2020-06-30 09:13:33.567'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
208,-1,1102,N'Template',{ts '2020-06-30 09:13:56.260'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
209,-1,1102,N'Template',{ts '2020-06-30 09:14:19.940'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
210,-1,1104,N'Document',{ts '2020-06-30 09:14:29.390'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
211,-1,1068,N'Template',{ts '2020-06-30 09:15:31.687'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
212,-1,1069,N'Document',{ts '2020-06-30 09:15:37.200'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
213,-1,1063,N'DocumentType',{ts '2020-06-30 09:15:59.803'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
214,-1,1069,N'Document',{ts '2020-06-30 09:16:17.927'},N'SaveVariant',N'Saved languages: English (United States)',N'English (United States)');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
215,-1,1069,N'Document',{ts '2020-06-30 09:16:39.577'},N'Move',N'Moved to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
216,-1,1069,N'Document',{ts '2020-06-30 09:16:40.163'},N'Delete',N'Trashed content with Id: 1069 related to original parent content with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
217,-1,1104,N'Document',{ts '2020-06-30 09:16:45.547'},N'Move',N'Moved to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
218,-1,1104,N'Document',{ts '2020-06-30 09:16:46.127'},N'Delete',N'Trashed content with Id: 1104 related to original parent content with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
219,-1,1108,N'DocumentType',{ts '2020-06-30 09:17:10.830'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
220,-1,1074,N'Media',{ts '2020-06-30 09:17:44.950'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
221,-1,1109,N'Document',{ts '2020-06-30 09:18:16.550'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
222,-1,1109,N'Document',{ts '2020-06-30 09:18:19.207'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
223,-1,1107,N'Template',{ts '2020-06-30 09:18:47.290'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
224,-1,1109,N'Document',{ts '2020-06-30 09:18:49.140'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
225,-1,1109,N'Document',{ts '2020-06-30 09:38:34.960'},N'Move',N'Moved to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
226,-1,1109,N'Document',{ts '2020-06-30 09:38:35.780'},N'Delete',N'Trashed content with Id: 1109 related to original parent content with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
227,-1,-20,N'Document',{ts '2020-06-30 09:38:40.360'},N'Delete',N'Recycle bin emptied',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
228,-1,-1,N'Document',{ts '2020-06-30 09:38:51.290'},N'Delete',N'Delete content of type 1108',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
229,-1,1108,N'DocumentType',{ts '2020-06-30 09:38:51.370'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
230,-1,-1,N'Document',{ts '2020-06-30 09:38:56.897'},N'Delete',N'Delete content of type 1088',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
231,-1,1088,N'DocumentType',{ts '2020-06-30 09:38:56.977'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
232,-1,-1,N'Document',{ts '2020-06-30 09:39:01.973'},N'Delete',N'Delete content of type 1063',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
233,-1,1063,N'DocumentType',{ts '2020-06-30 09:39:02.030'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
234,-1,1110,N'Template',{ts '2020-06-30 09:44:32.570'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
235,-1,1107,N'Template',{ts '2020-06-30 09:44:51.907'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
236,-1,1068,N'Template',{ts '2020-06-30 09:45:22.300'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
237,-1,1110,N'Template',{ts '2020-06-30 09:45:33.800'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
238,-1,1068,N'Template',{ts '2020-06-30 09:46:13.087'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
239,-1,1110,N'Template',{ts '2020-06-30 09:46:31.467'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
240,-1,1068,N'Template',{ts '2020-06-30 09:46:34.770'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
241,-1,1102,N'Template',{ts '2020-06-30 09:46:42.597'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
242,-1,1111,N'DocumentType',{ts '2020-06-30 09:47:11.263'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
243,-1,1111,N'DocumentType',{ts '2020-06-30 09:48:08.057'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
244,-1,1111,N'DocumentType',{ts '2020-06-30 09:48:34.797'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
245,-1,1111,N'DocumentType',{ts '2020-06-30 09:48:44.773'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
246,-1,1112,N'DocumentType',{ts '2020-06-30 09:50:28.200'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
247,-1,1111,N'DocumentType',{ts '2020-06-30 09:50:42.097'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
248,-1,1112,N'DocumentType',{ts '2020-06-30 09:50:47.540'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
249,-1,1112,N'DocumentType',{ts '2020-06-30 09:51:36.077'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
250,-1,1111,N'DocumentType',{ts '2020-06-30 09:54:45.043'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
251,-1,1111,N'DocumentType',{ts '2020-06-30 09:55:04.780'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
252,-1,1111,N'DocumentType',{ts '2020-06-30 09:55:58.790'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
253,-1,1068,N'Template',{ts '2020-06-30 09:57:28.337'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
254,-1,1068,N'Template',{ts '2020-06-30 09:58:12.383'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
255,-1,1113,N'Document',{ts '2020-06-30 09:58:49.887'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
256,-1,1113,N'Document',{ts '2020-06-30 09:59:01.303'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
257,-1,1068,N'Template',{ts '2020-06-30 09:59:31.547'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
258,-1,1111,N'DocumentType',{ts '2020-06-30 10:01:22.440'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
259,-1,1068,N'Template',{ts '2020-06-30 10:01:37.403'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
260,-1,1110,N'Template',{ts '2020-06-30 10:01:56.827'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
261,-1,1068,N'Template',{ts '2020-06-30 10:03:22.147'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
262,-1,1112,N'DocumentType',{ts '2020-06-30 10:04:42.080'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
263,-1,1113,N'Document',{ts '2020-06-30 10:05:15.127'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
264,-1,1113,N'Document',{ts '2020-06-30 10:05:16.963'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
265,-1,1113,N'Document',{ts '2020-06-30 10:05:31.883'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
266,-1,1068,N'Template',{ts '2020-06-30 10:06:19.070'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
267,-1,1068,N'Template',{ts '2020-06-30 10:07:06.660'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
268,-1,1113,N'Document',{ts '2020-06-30 10:07:13.797'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
269,-1,1113,N'Document',{ts '2020-06-30 10:07:15.230'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
270,-1,1074,N'Media',{ts '2020-06-30 10:08:04.570'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
271,-1,1114,N'Media',{ts '2020-06-30 10:08:14.697'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
272,-1,1113,N'Document',{ts '2020-06-30 10:08:37.630'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
273,-1,1113,N'Document',{ts '2020-06-30 10:08:41.867'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
274,-1,1113,N'Document',{ts '2020-06-30 10:09:36.607'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
275,-1,1113,N'Document',{ts '2020-06-30 10:09:38.023'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
276,-1,1115,N'Template',{ts '2020-06-30 10:13:01.900'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
277,-1,1116,N'DocumentType',{ts '2020-06-30 10:13:02.167'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
278,-1,1116,N'DocumentType',{ts '2020-06-30 10:13:12.613'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
279,-1,1117,N'Template',{ts '2020-06-30 10:13:34.190'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
280,-1,1115,N'Template',{ts '2020-06-30 10:13:42.883'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
281,-1,1117,N'Template',{ts '2020-06-30 10:13:53.317'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
282,-1,1118,N'Template',{ts '2020-06-30 10:14:40.340'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
283,-1,1118,N'Template',{ts '2020-06-30 10:18:04.370'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
284,-1,1113,N'Document',{ts '2020-07-01 12:28:24.133'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
285,-1,1118,N'Template',{ts '2020-07-01 12:33:32.937'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
286,-1,1118,N'Template',{ts '2020-07-01 12:34:13.943'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
287,-1,1116,N'DocumentType',{ts '2020-07-01 12:35:11.940'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
288,-1,1119,N'Document',{ts '2020-07-01 12:36:08.437'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
289,-1,1119,N'Document',{ts '2020-07-01 12:36:10.577'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
290,-1,1119,N'Document',{ts '2020-07-01 12:36:15.053'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
291,-1,1119,N'Document',{ts '2020-07-01 12:36:21.657'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
292,-1,1119,N'Document',{ts '2020-07-01 12:36:22.647'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
293,-1,1119,N'Document',{ts '2020-07-01 12:36:25.593'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
294,-1,1116,N'DocumentType',{ts '2020-07-01 12:36:53.907'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
295,-1,1119,N'Document',{ts '2020-07-01 12:37:02.637'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
296,-1,1118,N'Template',{ts '2020-07-01 12:37:20.377'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
297,-1,1119,N'Document',{ts '2020-07-01 12:37:35.507'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
298,-1,1118,N'Template',{ts '2020-07-01 12:38:05.007'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
299,-1,1110,N'Template',{ts '2020-07-01 12:38:09.577'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
300,-1,1111,N'DocumentType',{ts '2020-07-01 12:38:24.323'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
301,-1,1119,N'Document',{ts '2020-07-01 12:38:29.730'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
302,-1,1119,N'Document',{ts '2020-07-01 12:38:35.323'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
303,-1,1119,N'Document',{ts '2020-07-01 12:38:38.647'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
304,-1,1119,N'Document',{ts '2020-07-01 12:38:43.840'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
305,-1,1118,N'Template',{ts '2020-07-01 12:39:02.723'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
306,-1,1119,N'Document',{ts '2020-07-01 12:39:07.403'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
307,-1,1118,N'Template',{ts '2020-07-01 12:39:48.487'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
308,-1,1118,N'Template',{ts '2020-07-01 12:40:04.417'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
309,-1,1119,N'Document',{ts '2020-07-01 12:40:14.797'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
310,-1,1119,N'Document',{ts '2020-07-01 12:40:20.340'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
311,-1,1119,N'Document',{ts '2020-07-01 12:40:22.167'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
312,-1,1118,N'Template',{ts '2020-07-01 12:41:02.890'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
313,-1,1119,N'Document',{ts '2020-07-01 12:41:07.527'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
314,-1,1118,N'Template',{ts '2020-07-01 12:42:04.720'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
315,-1,1119,N'Document',{ts '2020-07-01 12:42:09.917'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
316,-1,1118,N'Template',{ts '2020-07-01 12:42:49.117'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
317,-1,1118,N'Template',{ts '2020-07-01 12:43:16.967'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
318,-1,1118,N'Template',{ts '2020-07-01 12:43:44.487'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
319,-1,1114,N'Media',{ts '2020-07-01 12:45:28.927'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
320,-1,1114,N'Media',{ts '2020-07-01 12:45:29.387'},N'Delete',N'Trashed media with Id: 1114 related to original parent media item with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
321,-1,1101,N'Media',{ts '2020-07-01 12:45:52.230'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
322,-1,1101,N'Media',{ts '2020-07-01 12:45:52.663'},N'Delete',N'Trashed media with Id: 1101 related to original parent media item with Id: 1090',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
323,-1,1100,N'Media',{ts '2020-07-01 12:45:53.217'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
324,-1,1100,N'Media',{ts '2020-07-01 12:45:53.677'},N'Delete',N'Trashed media with Id: 1100 related to original parent media item with Id: 1090',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
325,-1,1099,N'Media',{ts '2020-07-01 12:45:54.220'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
326,-1,1099,N'Media',{ts '2020-07-01 12:45:54.657'},N'Delete',N'Trashed media with Id: 1099 related to original parent media item with Id: 1090',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
327,-1,1098,N'Media',{ts '2020-07-01 12:45:55.170'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
328,-1,1098,N'Media',{ts '2020-07-01 12:45:55.613'},N'Delete',N'Trashed media with Id: 1098 related to original parent media item with Id: 1090',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
329,-1,1097,N'Media',{ts '2020-07-01 12:45:56.130'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
330,-1,1097,N'Media',{ts '2020-07-01 12:45:56.547'},N'Delete',N'Trashed media with Id: 1097 related to original parent media item with Id: 1090',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
331,-1,1096,N'Media',{ts '2020-07-01 12:45:57.117'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
332,-1,1096,N'Media',{ts '2020-07-01 12:45:57.547'},N'Delete',N'Trashed media with Id: 1096 related to original parent media item with Id: 1090',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
333,-1,1095,N'Media',{ts '2020-07-01 12:45:58.080'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
334,-1,1095,N'Media',{ts '2020-07-01 12:45:58.513'},N'Delete',N'Trashed media with Id: 1095 related to original parent media item with Id: 1090',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
335,-1,1094,N'Media',{ts '2020-07-01 12:45:59.037'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
336,-1,1094,N'Media',{ts '2020-07-01 12:45:59.477'},N'Delete',N'Trashed media with Id: 1094 related to original parent media item with Id: 1090',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
337,-1,1093,N'Media',{ts '2020-07-01 12:46:00.000'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
338,-1,1093,N'Media',{ts '2020-07-01 12:46:00.443'},N'Delete',N'Trashed media with Id: 1093 related to original parent media item with Id: 1090',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
339,-1,1092,N'Media',{ts '2020-07-01 12:46:00.970'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
340,-1,1092,N'Media',{ts '2020-07-01 12:46:01.400'},N'Delete',N'Trashed media with Id: 1092 related to original parent media item with Id: 1090',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
341,-1,1091,N'Media',{ts '2020-07-01 12:46:01.710'},N'Move',N'Move Media to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
342,-1,1091,N'Media',{ts '2020-07-01 12:46:02.173'},N'Delete',N'Trashed media with Id: 1091 related to original parent media item with Id: 1090',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
343,-1,1114,N'Media',{ts '2020-07-01 12:46:29.720'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
344,-1,1121,N'Media',{ts '2020-07-01 12:46:49.067'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
345,-1,1122,N'Media',{ts '2020-07-01 12:46:49.837'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
346,-1,1123,N'Media',{ts '2020-07-01 12:46:50.583'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
347,-1,1124,N'Media',{ts '2020-07-01 12:46:51.060'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
348,-1,1125,N'Media',{ts '2020-07-01 12:46:51.913'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
349,-1,1126,N'Media',{ts '2020-07-01 12:46:52.537'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
350,-1,1127,N'Media',{ts '2020-07-01 12:46:53.330'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
351,-1,1128,N'Media',{ts '2020-07-01 12:46:54.180'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
352,-1,1129,N'Media',{ts '2020-07-01 12:46:54.927'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
353,-1,1130,N'Media',{ts '2020-07-01 12:46:55.747'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
354,-1,1131,N'Media',{ts '2020-07-01 12:46:56.533'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
355,-1,1090,N'Media',{ts '2020-07-01 12:47:00.237'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
356,-1,1119,N'Document',{ts '2020-07-01 12:47:45.243'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
357,-1,1119,N'Document',{ts '2020-07-01 12:47:47.393'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
358,-1,1118,N'Template',{ts '2020-07-01 12:52:16.917'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
359,-1,1118,N'Template',{ts '2020-07-01 12:52:31.427'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
360,-1,1118,N'Template',{ts '2020-07-01 12:56:32.267'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
361,-1,1118,N'Template',{ts '2020-07-01 12:57:39.023'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
362,-1,1118,N'Template',{ts '2020-07-01 12:58:01.977'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
363,-1,1119,N'Document',{ts '2020-07-01 12:58:06.397'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
364,-1,1118,N'Template',{ts '2020-07-01 12:58:38.887'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
365,-1,1119,N'Document',{ts '2020-07-01 12:58:45.437'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
366,-1,1112,N'DocumentType',{ts '2020-07-01 13:02:08.053'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
367,-1,1112,N'DocumentType',{ts '2020-07-01 13:02:20.643'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
368,-1,1132,N'Template',{ts '2020-07-01 13:08:55.157'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
369,-1,1133,N'DocumentType',{ts '2020-07-01 13:08:55.370'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
370,-1,-1,N'PartialView',{ts '2020-07-01 13:09:33.530'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
371,-1,-1,N'PartialView',{ts '2020-07-01 13:11:32.003'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
372,-1,1132,N'Template',{ts '2020-07-01 13:11:35.927'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
373,-1,-1,N'Document',{ts '2020-07-01 13:11:42.403'},N'Delete',N'Delete content of type 1133',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
374,-1,1133,N'DocumentType',{ts '2020-07-01 13:11:42.467'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
375,-1,-1,N'PartialView',{ts '2020-07-01 13:15:30.547'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
376,-1,-1,N'PartialViewMacro',{ts '2020-07-01 13:18:08.920'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
377,-1,-1,N'Macro',{ts '2020-07-01 13:18:09.290'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
378,-1,-1,N'Macro',{ts '2020-07-01 13:19:42.473'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
379,-1,-1,N'Macro',{ts '2020-07-01 13:20:12.963'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
380,-1,-1,N'PartialView',{ts '2020-07-01 13:22:01.937'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
381,-1,-1,N'Macro',{ts '2020-07-01 13:23:21.780'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
382,-1,-1,N'PartialViewMacro',{ts '2020-07-01 13:23:26.410'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
383,-1,1134,N'Template',{ts '2020-07-01 13:33:47.347'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
384,-1,1135,N'DocumentType',{ts '2020-07-01 13:33:47.610'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
385,-1,1136,N'DataType',{ts '2020-07-01 13:41:17.597'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
386,-1,-1,N'Document',{ts '2020-07-01 13:41:53.540'},N'Delete',N'Delete content of type 1135',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
387,-1,1135,N'DocumentType',{ts '2020-07-01 13:41:53.613'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
388,-1,1134,N'Template',{ts '2020-07-01 13:42:26.117'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
389,-1,1137,N'Template',{ts '2020-07-01 13:42:41.123'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
390,-1,1138,N'DocumentType',{ts '2020-07-01 13:42:41.430'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
391,-1,1139,N'Template',{ts '2020-07-01 13:44:56.070'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
392,-1,1140,N'DocumentType',{ts '2020-07-01 13:44:56.343'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
393,-1,1140,N'DocumentType',{ts '2020-07-01 13:45:13.653'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
394,-1,-95,N'DataType',{ts '2020-07-01 13:47:11.487'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
395,-1,1140,N'DocumentType',{ts '2020-07-01 13:47:24.217'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
396,-1,-95,N'DataType',{ts '2020-07-01 13:48:22.470'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
397,-1,-95,N'DataType',{ts '2020-07-01 13:48:47.123'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
398,-1,1138,N'DocumentType',{ts '2020-07-01 13:51:58.930'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
399,-1,1141,N'DataType',{ts '2020-07-01 13:52:40.523'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
400,-1,1140,N'DocumentType',{ts '2020-07-01 13:52:50.670'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
401,-1,1142,N'DataType',{ts '2020-07-01 13:54:13.987'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
402,-1,1138,N'DocumentType',{ts '2020-07-01 13:54:21.057'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
403,-1,1141,N'DataType',{ts '2020-07-01 13:55:31.950'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
404,-1,1140,N'DocumentType',{ts '2020-07-01 13:55:41.837'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
405,-1,1139,N'Template',{ts '2020-07-01 13:56:15.467'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
406,-1,1143,N'Template',{ts '2020-07-01 13:56:26.447'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
407,-1,1140,N'DocumentType',{ts '2020-07-01 13:56:42.330'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
408,-1,1137,N'Template',{ts '2020-07-01 13:56:48.200'},N'Delete',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
409,-1,1111,N'DocumentType',{ts '2020-07-01 13:57:08.120'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
410,-1,1140,N'DocumentType',{ts '2020-07-01 13:57:23.993'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
411,-1,1141,N'DataType',{ts '2020-07-01 13:58:37.980'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
412,-1,1140,N'DocumentType',{ts '2020-07-01 13:58:44.900'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
413,-1,1144,N'Document',{ts '2020-07-01 14:00:26.617'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
414,-1,1144,N'Document',{ts '2020-07-01 14:02:16.803'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
415,-1,1144,N'Document',{ts '2020-07-01 14:02:27.680'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
416,-1,1143,N'Template',{ts '2020-07-01 14:05:37.267'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
417,-1,1143,N'Template',{ts '2020-07-01 14:21:31.380'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
418,-1,1143,N'Template',{ts '2020-07-01 14:22:00.520'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
419,-1,1143,N'Template',{ts '2020-07-01 14:22:14.773'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
420,-1,1143,N'Template',{ts '2020-07-01 14:22:14.977'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
421,-1,1143,N'Template',{ts '2020-07-01 14:29:34.723'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
422,-1,1143,N'Template',{ts '2020-07-02 10:36:08.870'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
423,-1,1143,N'Template',{ts '2020-07-02 10:38:52.720'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
424,-1,1143,N'Template',{ts '2020-07-02 10:49:47.717'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
425,-1,1145,N'DataType',{ts '2020-07-02 10:50:43.510'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
426,-1,1138,N'DocumentType',{ts '2020-07-02 10:50:51.000'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
427,-1,1144,N'Document',{ts '2020-07-02 10:52:09.087'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
428,-1,1144,N'Document',{ts '2020-07-02 10:52:11.397'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
429,-1,1143,N'Template',{ts '2020-07-02 10:53:13.480'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
430,-1,1143,N'Template',{ts '2020-07-02 10:53:40.887'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
431,-1,1143,N'Template',{ts '2020-07-02 10:53:54.257'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
432,-1,1143,N'Template',{ts '2020-07-02 10:54:29.313'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
433,-1,1143,N'Template',{ts '2020-07-02 10:55:09.737'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
434,-1,1143,N'Template',{ts '2020-07-02 10:55:35.903'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
435,-1,1143,N'Template',{ts '2020-07-02 10:55:52.070'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
436,-1,1143,N'Template',{ts '2020-07-02 10:56:32.750'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
437,-1,1144,N'Document',{ts '2020-07-02 10:56:39.647'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
438,-1,1143,N'Template',{ts '2020-07-02 10:57:49.710'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
439,-1,1143,N'Template',{ts '2020-07-02 10:57:55.760'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
440,-1,1143,N'Template',{ts '2020-07-02 10:58:46.787'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
441,-1,1143,N'Template',{ts '2020-07-02 11:00:11.070'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
442,-1,1143,N'Template',{ts '2020-07-02 11:00:31.487'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
443,-1,1144,N'Document',{ts '2020-07-02 11:00:48.273'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
444,-1,1143,N'Template',{ts '2020-07-02 11:01:15.103'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
445,-1,1143,N'Template',{ts '2020-07-02 11:09:19.940'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
446,-1,1144,N'Document',{ts '2020-07-02 11:10:19.433'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
447,-1,1144,N'Document',{ts '2020-07-02 15:16:38.017'},N'Move',N'Moved to recycle bin',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
448,-1,1144,N'Document',{ts '2020-07-02 15:16:40.467'},N'Delete',N'Trashed content with Id: 1144 related to original parent content with Id: -1',NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
449,-1,1140,N'DocumentType',{ts '2020-07-02 15:18:00.477'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
450,-1,1146,N'Document',{ts '2020-07-02 15:22:11.733'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
451,-1,1146,N'Document',{ts '2020-07-02 15:22:19.163'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
452,-1,1143,N'Template',{ts '2020-07-02 15:24:40.487'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
453,-1,1143,N'Template',{ts '2020-07-02 15:26:47.620'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
454,-1,1118,N'Template',{ts '2020-07-02 15:27:39.147'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
455,-1,1143,N'Template',{ts '2020-07-02 15:27:44.570'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
456,-1,1118,N'Template',{ts '2020-07-02 15:28:36.210'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
457,-1,1118,N'Template',{ts '2020-07-02 15:28:45.487'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
458,-1,1143,N'Template',{ts '2020-07-02 15:28:52.787'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
459,-1,1146,N'Document',{ts '2020-07-02 15:28:58.117'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
460,-1,1143,N'Template',{ts '2020-07-02 15:31:31.083'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
461,-1,1146,N'Document',{ts '2020-07-02 15:31:43.737'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
462,-1,1113,N'Document',{ts '2020-07-02 15:31:59.137'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
463,-1,1143,N'Template',{ts '2020-07-02 15:32:35.623'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
464,-1,1143,N'Template',{ts '2020-07-02 15:33:33.050'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
465,-1,1143,N'Template',{ts '2020-07-02 15:34:00.880'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
466,-1,1143,N'Template',{ts '2020-07-02 15:34:13.573'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
467,-1,1143,N'Template',{ts '2020-07-02 15:36:03.930'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
468,-1,1143,N'Template',{ts '2020-07-02 15:37:09.610'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
469,-1,1147,N'DataType',{ts '2020-07-02 15:40:39.160'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
470,-1,1148,N'DataType',{ts '2020-07-02 15:40:59.827'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
471,-1,1138,N'DocumentType',{ts '2020-07-02 15:41:06.757'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
472,-1,1149,N'Document',{ts '2020-07-02 15:43:02.237'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
473,-1,1149,N'Document',{ts '2020-07-02 15:43:04.440'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
474,-1,1149,N'Document',{ts '2020-07-02 15:43:36.337'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
475,-1,1138,N'DocumentType',{ts '2020-07-02 15:43:55.937'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
476,-1,1149,N'Document',{ts '2020-07-02 15:44:29.717'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
477,-1,1149,N'Document',{ts '2020-07-02 15:44:32.107'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
478,-1,1149,N'Document',{ts '2020-07-02 15:44:33.873'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
479,-1,1149,N'Document',{ts '2020-07-02 15:45:23.163'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
480,-1,1143,N'Template',{ts '2020-07-02 15:47:36.937'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
481,-1,1143,N'Template',{ts '2020-07-02 15:48:07.987'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
482,-1,1149,N'Document',{ts '2020-07-02 15:48:32.793'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
483,-1,1149,N'Document',{ts '2020-07-02 15:48:35.147'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
484,-1,1149,N'Document',{ts '2020-07-02 15:48:50.993'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
485,-1,1146,N'Document',{ts '2020-07-02 15:49:27.077'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
486,-1,1149,N'Document',{ts '2020-07-02 15:50:38.430'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
487,-1,1149,N'Document',{ts '2020-07-02 15:51:32.277'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
488,-1,1149,N'Document',{ts '2020-07-02 15:52:18.787'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
489,-1,1149,N'Document',{ts '2020-07-02 15:52:46.120'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
490,-1,1149,N'Document',{ts '2020-07-02 15:53:00.133'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
491,-1,1149,N'Document',{ts '2020-07-02 15:53:23.207'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
492,-1,1146,N'Document',{ts '2020-07-02 15:53:34.360'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
493,-1,1146,N'Document',{ts '2020-07-02 15:53:39.917'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
494,-1,1149,N'Document',{ts '2020-07-02 15:55:59.230'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
495,-1,1149,N'Document',{ts '2020-07-02 15:56:54.123'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
496,-1,1149,N'Document',{ts '2020-07-02 15:56:55.937'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
497,-1,1149,N'Document',{ts '2020-07-02 15:56:58.883'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
498,-1,1149,N'Document',{ts '2020-07-02 15:57:21.513'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
499,-1,1150,N'Document',{ts '2020-07-02 15:59:24.583'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
500,-1,1150,N'Document',{ts '2020-07-02 15:59:36.547'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
501,-1,1143,N'Template',{ts '2020-07-02 16:00:24.937'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
502,-1,1151,N'Document',{ts '2020-07-02 16:05:42.443'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
503,-1,1151,N'Document',{ts '2020-07-02 16:05:44.460'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
504,-1,1143,N'Template',{ts '2020-07-02 16:06:12.883'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
505,-1,1143,N'Template',{ts '2020-07-02 16:06:29.927'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
506,-1,1152,N'Document',{ts '2020-07-02 16:07:49.620'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
507,-1,1143,N'Template',{ts '2020-07-02 16:08:35.680'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
508,-1,1143,N'Template',{ts '2020-07-02 16:09:25.680'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
509,-1,1143,N'Template',{ts '2020-07-02 16:10:03.663'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
510,-1,1143,N'Template',{ts '2020-07-02 16:10:18.830'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
511,-1,1119,N'Document',{ts '2020-07-02 16:11:42.887'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
512,-1,1113,N'Document',{ts '2020-07-02 16:12:18.533'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
513,-1,1118,N'Template',{ts '2020-07-02 16:14:12.707'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
514,-1,1118,N'Template',{ts '2020-07-02 16:14:39.507'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
515,-1,1118,N'Template',{ts '2020-07-02 16:14:54.010'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
516,-1,1068,N'Template',{ts '2020-07-02 16:15:28.210'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
517,-1,1068,N'Template',{ts '2020-07-02 16:16:49.763'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
518,-1,1068,N'Template',{ts '2020-07-02 16:17:31.117'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
519,-1,1118,N'Template',{ts '2020-07-02 16:17:51.890'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
520,-1,1143,N'Template',{ts '2020-07-02 16:17:56.083'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
521,-1,1118,N'Template',{ts '2020-07-02 16:18:16.940'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
522,-1,1143,N'Template',{ts '2020-07-02 16:18:22.723'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
523,-1,1112,N'DocumentType',{ts '2020-07-02 16:19:43.030'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
524,-1,1111,N'DocumentType',{ts '2020-07-02 16:20:04.767'},N'Save',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
525,-1,1113,N'Document',{ts '2020-07-02 16:20:20.987'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
526,-1,1119,N'Document',{ts '2020-07-02 16:20:28.630'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
527,-1,1146,N'Document',{ts '2020-07-02 16:20:38.070'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
528,-1,1149,N'Document',{ts '2020-07-02 16:20:46.790'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
529,-1,1149,N'Document',{ts '2020-07-02 16:21:07.213'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
530,-1,1150,N'Document',{ts '2020-07-02 16:21:15.147'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
531,-1,1151,N'Document',{ts '2020-07-02 16:21:23.210'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
532,-1,1152,N'Document',{ts '2020-07-02 16:21:32.583'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
533,-1,1113,N'Document',{ts '2020-07-02 16:22:02.677'},N'Publish',NULL,NULL);
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[entityType],[Datestamp],[logHeader],[logComment],[parameters]) VALUES (
534,-1,1113,N'Document',{ts '2020-07-02 16:22:02.683'},N'Save',NULL,NULL);
GO
SET IDENTITY_INSERT [umbracoLog] OFF;
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-1000,1,N'MainDom');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-340,-1,N'Languages');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-339,1,N'KeyValues');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-338,1,N'Domains');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-337,1,N'MemberTypes');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-336,1,N'MediaTypes');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-335,1,N'MemberTree');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-334,-1,N'MediaTree');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-333,1,N'ContentTree');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-332,-1,N'ContentTypes');
GO
INSERT INTO [umbracoLock] ([id],[value],[name]) VALUES (
-331,-1,N'Servers');
GO
SET IDENTITY_INSERT [umbracoLanguage] ON;
GO
INSERT INTO [umbracoLanguage] ([id],[languageISOCode],[languageCultureName],[isDefaultVariantLang],[mandatory],[fallbackLanguageId]) VALUES (
1,N'pl',N'English (United States)',1,0,NULL);
GO
SET IDENTITY_INSERT [umbracoLanguage] OFF;
GO
INSERT INTO [umbracoKeyValue] ([key],[value],[updated]) VALUES (
N'Umbraco.Core.Upgrader.State+Umbraco.Core',N'{2AB29964-02A1-474D-BD6B-72148D2A53A2}',{ts '2020-06-29 09:59:51.567'});
GO
SET IDENTITY_INSERT [umbracoExternalLogin] OFF;
GO
SET IDENTITY_INSERT [umbracoDomain] OFF;
GO
SET IDENTITY_INSERT [umbracoDocumentCultureVariation] OFF;
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-99,N'Umbraco.Label',N'Decimal',N'{"umbracoDataValueType":"DECIMAL"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-98,N'Umbraco.Label',N'Date',N'{"umbracoDataValueType":"TIME"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-97,N'Umbraco.ListView',N'Nvarchar',N'{"pageSize":10, "orderBy":"username", "orderDirection":"asc", "includeProperties":[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-96,N'Umbraco.ListView',N'Nvarchar',N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-95,N'Umbraco.ListView',N'Nvarchar',N'{"pageSize":100,"orderBy":"updateDate","orderDirection":"desc","includeProperties":[{"alias":"updateDate","header":"Last edited","nameTemplate":null,"isSystem":1},{"alias":"owner","header":"Updated by","nameTemplate":null,"isSystem":1},{"alias":"cenaUslugi","header":"Cena","nameTemplate":"Cennik","isSystem":0},{"alias":"czasWykonaniaUslugi","header":"Czas Wykonania","nameTemplate":"Cennik","isSystem":0},{"alias":"nazwaUslugi","header":"Nazwa Usługi","nameTemplate":"Cennik","isSystem":0}],"layouts":[{"name":"List","path":"views/propertyeditors/listview/layouts/list/list.html","icon":"icon-list","isSystem":1,"selected":true},{"name":"Grid","path":"views/propertyeditors/listview/layouts/grid/grid.html","icon":"icon-thumbnails-small","isSystem":1,"selected":true}],"bulkActionPermissions":{"allowBulkPublish":true,"allowBulkUnpublish":true,"allowBulkCopy":true,"allowBulkMove":true,"allowBulkDelete":true},"icon":"icon-list","tabName":"as","showContentFirst":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-94,N'Umbraco.Label',N'Date',N'{"umbracoDataValueType":"DATETIME"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-93,N'Umbraco.Label',N'Nvarchar',N'{"umbracoDataValueType":"BIGINT"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-92,N'Umbraco.Label',N'Nvarchar',N'{"umbracoDataValueType":"STRING"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-91,N'Umbraco.Label',N'Integer',N'{"umbracoDataValueType":"INT"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-90,N'Umbraco.UploadField',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-89,N'Umbraco.TextArea',N'Ntext',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-88,N'Umbraco.TextBox',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-87,N'Umbraco.TinyMCE',N'Ntext',N'{"value":",code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-51,N'Umbraco.Integer',N'Integer',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-49,N'Umbraco.TrueFalse',N'Integer',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-43,N'Umbraco.CheckBoxList',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-42,N'Umbraco.DropDown.Flexible',N'Nvarchar',N'{"multiple":true}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-41,N'Umbraco.DateTime',N'Date',N'{"format":"YYYY-MM-DD"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-40,N'Umbraco.RadioButtonList',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-39,N'Umbraco.DropDown.Flexible',N'Nvarchar',N'{"multiple":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-37,N'Umbraco.ColorPicker',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
-36,N'Umbraco.DateTime',N'Date',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1041,N'Umbraco.Tags',N'Ntext',N'{"group":"default", "storageType":"Json"}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1043,N'Umbraco.ImageCropper',N'Ntext',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1046,N'Umbraco.ContentPicker',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1047,N'Umbraco.MemberPicker',N'Nvarchar',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1048,N'Umbraco.MediaPicker',N'Ntext',NULL);
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1049,N'Umbraco.MediaPicker',N'Ntext',N'{"multiPicker":1}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1050,N'Umbraco.MultiUrlPicker',N'Ntext',N'{"minNumber":0,"maxNumber":0,"ignoreUserStartNodes":false,"hideAnchor":true}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1064,N'Umbraco.TextBox',N'Nvarchar',N'{"maxChars":15}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1065,N'Umbraco.TextBox',N'Nvarchar',N'{"maxChars":20}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1070,N'Umbraco.MediaPicker',N'Ntext',N'{"multiPicker":false,"onlyImages":true,"disableFolderSelect":false,"startNodeId":null,"ignoreUserStartNodes":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1076,N'Umbraco.MediaPicker',N'Ntext',N'{"multiPicker":false,"onlyImages":false,"disableFolderSelect":false,"startNodeId":null,"ignoreUserStartNodes":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1077,N'Umbraco.MediaPicker',N'Ntext',N'{"multiPicker":false,"onlyImages":false,"disableFolderSelect":false,"startNodeId":null,"ignoreUserStartNodes":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1078,N'Umbraco.MultiUrlPicker',N'Ntext',N'{"minNumber":0,"maxNumber":0,"ignoreUserStartNodes":false,"hideAnchor":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1079,N'Umbraco.TextBox',N'Nvarchar',N'{}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1080,N'My.URLPicker',N'Nvarchar',N'{}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1081,N'My.URLPicker',N'Nvarchar',N'{}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1082,N'Umbraco.UploadField',N'Nvarchar',N'{}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1083,N'Umbraco.ContentPicker',N'Nvarchar',N'{"showOpenButton":false,"startNodeId":null,"ignoreUserStartNodes":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1084,N'Umbraco.MediaPicker',N'Ntext',N'{"multiPicker":false,"onlyImages":false,"disableFolderSelect":false,"startNodeId":null,"ignoreUserStartNodes":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1085,N'Umbraco.MediaPicker',N'Ntext',N'{"multiPicker":false,"onlyImages":false,"disableFolderSelect":false,"startNodeId":"umb://media/280dd6f5f1a54b27abec96a74e40d39a","ignoreUserStartNodes":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1106,N'Umbraco.MediaPicker',N'Ntext',N'{"multiPicker":false,"onlyImages":false,"disableFolderSelect":false,"startNodeId":null,"ignoreUserStartNodes":false}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1136,N'Umbraco.Decimal',N'Decimal',N'{"min":0,"step":10,"max":1000}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1141,N'Umbraco.NestedContent',N'Ntext',N'{"contentTypes":[{"ncAlias":"cennikDocument","ncTabAlias":"Usługi","nameTemplate":"Usługa"}],"minItems":1,"maxItems":25,"confirmDeletes":true,"showIcons":true,"hideLabel":true}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1142,N'Umbraco.Slider',N'Nvarchar',N'{"enableRange":false,"initVal1":0.0,"initVal2":0.0,"minVal":0.0,"maxVal":360.0,"step":10.0}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1145,N'Umbraco.TextBox',N'Nvarchar',N'{}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1147,N'Umbraco.TextBox',N'Nvarchar',N'{}');
GO
INSERT INTO [umbracoDataType] ([nodeId],[propertyEditorAlias],[dbType],[config]) VALUES (
1148,N'Umbraco.TextArea',N'Ntext',N'{}');
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1071,1033);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1072,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1073,1033);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1074,1031);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1075,1033);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1086,1033);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1090,1031);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1091,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1092,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1093,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1094,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1095,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1096,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1097,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1098,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1099,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1100,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1101,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1113,1112);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1119,1116);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1120,1116);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1121,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1122,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1123,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1124,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1125,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1126,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1127,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1128,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1129,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1130,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1131,1032);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1144,1140);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1146,1140);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1149,1140);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1150,1140);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1151,1140);
GO
INSERT INTO [umbracoContent] ([nodeId],[contentTypeId]) VALUES (
1152,1140);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1113,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1119,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1120,0,1);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1144,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1146,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1149,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1150,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1151,1,0);
GO
INSERT INTO [umbracoDocument] ([nodeId],[published],[edited]) VALUES (
1152,1,0);
GO
SET IDENTITY_INSERT [umbracoContentVersion] ON;
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
6,1071,{ts '2020-06-29 12:12:36.967'},NULL,1,N'Bg 1');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
7,1072,{ts '2020-06-29 12:12:35.033'},NULL,1,N'Emi-Center-Background');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
9,1073,{ts '2020-06-29 12:12:31.957'},NULL,1,N'Bg 1 (1)');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
10,1074,{ts '2020-06-30 10:08:04.550'},NULL,1,N'Images');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
11,1075,{ts '2020-06-29 12:15:12.387'},NULL,1,N'Bg 1');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
17,1086,{ts '2020-06-29 16:33:49.170'},NULL,1,N'Logo');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
21,1090,{ts '2020-07-01 12:47:00.217'},NULL,1,N'Galeria');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
22,1091,{ts '2020-07-01 12:46:01.663'},NULL,1,N'Img 1');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
23,1092,{ts '2020-07-01 12:46:00.933'},NULL,1,N'Img 2');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
24,1093,{ts '2020-07-01 12:45:59.960'},NULL,1,N'Img 3');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
25,1094,{ts '2020-07-01 12:45:58.997'},NULL,1,N'Img 4');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
26,1095,{ts '2020-07-01 12:45:58.043'},NULL,1,N'Img 5');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
27,1096,{ts '2020-07-01 12:45:57.080'},NULL,1,N'Img 6');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
28,1097,{ts '2020-07-01 12:45:56.090'},NULL,1,N'Img 7');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
29,1098,{ts '2020-07-01 12:45:55.133'},NULL,1,N'Img 8');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
30,1099,{ts '2020-07-01 12:45:54.180'},NULL,1,N'Img 9');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
31,1100,{ts '2020-07-01 12:45:53.170'},NULL,1,N'Img 10');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
32,1101,{ts '2020-07-01 12:45:52.190'},NULL,1,N'Img 11');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
43,1113,{ts '2020-06-30 09:58:49.787'},-1,0,N'Strona Główna');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
44,1113,{ts '2020-06-30 10:05:31.823'},-1,0,N'Strona Główna');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
45,1113,{ts '2020-06-30 10:07:13.747'},-1,0,N'Strona Główna');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
46,1113,{ts '2020-06-30 10:08:41.810'},-1,0,N'Strona Główna');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
48,1113,{ts '2020-06-30 10:09:36.563'},-1,0,N'Strona Główna');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
49,1113,{ts '2020-07-02 16:12:18.487'},-1,0,N'Strona Główna');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
50,1119,{ts '2020-07-01 12:36:08.280'},-1,0,N'Galeria');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
51,1119,{ts '2020-07-01 12:36:15.003'},-1,0,N'Galeria');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
52,1119,{ts '2020-07-01 12:36:21.610'},-1,0,N'Galeria');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
53,1119,{ts '2020-07-01 12:38:38.600'},-1,0,N'Galeria');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
54,1120,{ts '2020-07-01 12:37:44.633'},-1,1,N'Galeria');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
55,1119,{ts '2020-07-01 12:40:20.280'},-1,0,N'Galeria');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
56,1119,{ts '2020-07-01 12:47:45.193'},-1,0,N'Galeria');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
57,1121,{ts '2020-07-01 12:46:49.037'},NULL,1,N'Img 1');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
58,1122,{ts '2020-07-01 12:46:49.807'},NULL,1,N'Img 2');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
59,1123,{ts '2020-07-01 12:46:50.557'},NULL,1,N'Img 3');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
60,1124,{ts '2020-07-01 12:46:51.030'},NULL,1,N'Img 4');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
61,1125,{ts '2020-07-01 12:46:51.883'},NULL,1,N'Img 5');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
62,1126,{ts '2020-07-01 12:46:52.503'},NULL,1,N'Img 6');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
63,1127,{ts '2020-07-01 12:46:53.290'},NULL,1,N'Img 7');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
64,1128,{ts '2020-07-01 12:46:54.153'},NULL,1,N'Img 8');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
65,1129,{ts '2020-07-01 12:46:54.900'},NULL,1,N'Img 9');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
66,1130,{ts '2020-07-01 12:46:55.720'},NULL,1,N'Img 10');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
67,1131,{ts '2020-07-01 12:46:56.507'},NULL,1,N'Img 11');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
68,1119,{ts '2020-07-02 16:11:42.823'},-1,0,N'Galeria');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
69,1144,{ts '2020-07-01 14:00:26.467'},-1,0,N'Cennik-1');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
70,1144,{ts '2020-07-02 10:52:11.340'},-1,0,N'Cennik-1');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
71,1144,{ts '2020-07-02 11:00:48.227'},-1,0,N'Cennik-1');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
72,1144,{ts '2020-07-02 11:10:19.387'},-1,0,N'Cennik-1');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
73,1144,{ts '2020-07-02 15:16:37.837'},-1,1,N'Cennik-1');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
74,1146,{ts '2020-07-02 15:22:11.647'},-1,0,N'Cennik Chirurgia');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
75,1146,{ts '2020-07-02 15:49:27.033'},-1,0,N'Cennik Chirurgia');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
76,1149,{ts '2020-07-02 15:43:36.287'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
77,1149,{ts '2020-07-02 15:44:32.060'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
78,1149,{ts '2020-07-02 15:48:50.940'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
79,1149,{ts '2020-07-02 15:50:38.383'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
80,1146,{ts '2020-07-02 15:53:39.873'},-1,0,N'Cennik - Chirurgia');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
81,1149,{ts '2020-07-02 15:51:32.230'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
82,1149,{ts '2020-07-02 15:52:18.737'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
83,1149,{ts '2020-07-02 15:52:46.070'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
84,1149,{ts '2020-07-02 15:53:00.080'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
85,1149,{ts '2020-07-02 15:56:55.890'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
86,1146,{ts '2020-07-02 16:20:38.020'},-1,0,N'Cennik - Chirurgia');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
87,1149,{ts '2020-07-02 15:57:21.463'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
88,1149,{ts '2020-07-02 16:20:46.740'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
89,1150,{ts '2020-07-02 15:59:24.530'},-1,0,N'Masaż i pielęgnacja ciała');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
90,1150,{ts '2020-07-02 15:59:36.487'},-1,0,N'Cennik - Masaż i pielęgnacja ciała');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
91,1150,{ts '2020-07-02 16:21:15.097'},-1,0,N'Cennik - Masaż i pielęgnacja ciała');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
92,1151,{ts '2020-07-02 16:05:44.410'},-1,0,N'Cennik - Podologia');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
93,1151,{ts '2020-07-02 16:21:23.163'},-1,0,N'Cennik - Podologia');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
94,1152,{ts '2020-07-02 16:07:49.570'},-1,0,N'Cennik - Pielęgnacja dłoni i paznokci');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
95,1152,{ts '2020-07-02 16:21:32.533'},-1,0,N'Cennik - Pielęgnacja dłoni i paznokci');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
96,1119,{ts '2020-07-02 16:20:28.573'},-1,0,N'Galeria');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
97,1113,{ts '2020-07-02 16:20:20.917'},-1,0,N'Strona Główna');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
98,1113,{ts '2020-07-02 16:22:02.383'},-1,0,N'Strona Główna');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
99,1119,{ts '2020-07-02 16:20:28.573'},-1,1,N'Galeria');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
100,1146,{ts '2020-07-02 16:20:38.020'},-1,1,N'Cennik - Chirurgia');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
101,1149,{ts '2020-07-02 16:21:07.160'},-1,0,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
102,1149,{ts '2020-07-02 16:21:07.160'},-1,1,N'Cennik - Kosmetyka');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
103,1150,{ts '2020-07-02 16:21:15.097'},-1,1,N'Cennik - Masaż i pielęgnacja ciała');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
104,1151,{ts '2020-07-02 16:21:23.163'},-1,1,N'Cennik - Podologia');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
105,1152,{ts '2020-07-02 16:21:32.533'},-1,1,N'Cennik - Pielęgnacja dłoni i paznokci');
GO
INSERT INTO [umbracoContentVersion] ([id],[nodeId],[versionDate],[userId],[current],[text]) VALUES (
106,1113,{ts '2020-07-02 16:22:02.383'},-1,1,N'Strona Główna');
GO
SET IDENTITY_INSERT [umbracoContentVersion] OFF;
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
6,N'/media/ednockrx/bg-1.webp');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
7,N'/media/ws2pzmy2/bg-1.webp');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
9,N'/media/354h11cj/bg-1.webp');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
10,NULL);
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
11,N'/media/p5teoa1f/bg-1.webp');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
17,N'/media/ywcf2ylt/logo.webp');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
21,NULL);
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
22,N'/media/q02ddeoa/img-1.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
23,N'/media/n20gzrve/img-2.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
24,N'/media/xaggvw2m/img-3.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
25,N'/media/mk2ngrzf/img-4.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
26,N'/media/esqjl0nl/img-5.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
27,N'/media/ioulty0s/img-6.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
28,N'/media/ww0pkvvw/img-7.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
29,N'/media/opmncpob/img-8.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
30,N'/media/crlghml0/img-9.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
31,N'/media/d4whxtrj/img-10.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
32,N'/media/5mshxuva/img-11.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
57,N'/media/petdvxta/img-1.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
58,N'/media/2wsbxl3i/img-2.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
59,N'/media/duuofc5c/img-3.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
60,N'/media/hd0jywmy/img-4.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
61,N'/media/eroluq4b/img-5.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
62,N'/media/334ndtxc/img-6.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
63,N'/media/sj1co4i1/img-7.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
64,N'/media/csklaqo3/img-8.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
65,N'/media/kkdpivlp/img-9.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
66,N'/media/eyinwqvc/img-10.jpg');
GO
INSERT INTO [umbracoMediaVersion] ([id],[path]) VALUES (
67,N'/media/oimdvsvx/img-11.jpg');
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
43,1068,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
44,1068,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
45,1068,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
46,1068,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
48,1068,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
49,1068,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
50,NULL,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
51,NULL,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
52,NULL,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
53,1118,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
54,1118,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
55,1118,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
56,1118,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
68,1118,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
69,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
70,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
71,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
72,1143,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
73,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
74,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
75,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
76,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
77,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
78,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
79,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
80,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
81,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
82,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
83,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
84,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
85,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
86,1143,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
87,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
88,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
89,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
90,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
91,1143,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
92,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
93,1143,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
94,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
95,1143,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
96,1118,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
97,1068,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
98,1068,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
99,1118,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
100,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
101,1143,1);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
102,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
103,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
104,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
105,1143,0);
GO
INSERT INTO [umbracoDocumentVersion] ([id],[templateId],[published]) VALUES (
106,1068,0);
GO
SET IDENTITY_INSERT [umbracoContentVersionCultureVariation] OFF;
GO
SET IDENTITY_INSERT [umbracoConsent] OFF;
GO
SET IDENTITY_INSERT [umbracoCacheInstruction] ON;
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
266,{ts '2020-07-01 11:27:55.803'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
267,{ts '2020-07-01 11:28:25.617'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1113,\"Key\":\"331fa914-4132-4c4c-940c-bf575ad800f9\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
268,{ts '2020-07-01 11:33:33.083'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
269,{ts '2020-07-01 11:34:14.083'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
270,{ts '2020-07-01 11:35:12.730'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1116,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
271,{ts '2020-07-01 11:36:09.300'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
272,{ts '2020-07-01 11:36:11.310'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
273,{ts '2020-07-01 11:36:15.867'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
274,{ts '2020-07-01 11:36:22.483'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
275,{ts '2020-07-01 11:36:22.790'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
276,{ts '2020-07-01 11:36:26.333'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
277,{ts '2020-07-01 11:36:54.757'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1116,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
278,{ts '2020-07-01 11:37:03.333'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
279,{ts '2020-07-01 11:37:20.520'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
280,{ts '2020-07-01 11:37:36.203'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
281,{ts '2020-07-01 11:38:05.137'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
282,{ts '2020-07-01 11:38:09.703'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1110]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
283,{ts '2020-07-01 11:38:24.933'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1111,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
284,{ts '2020-07-01 11:38:30.467'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
285,{ts '2020-07-01 11:38:36.030'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
286,{ts '2020-07-01 11:38:39.443'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
287,{ts '2020-07-01 11:38:44.517'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
288,{ts '2020-07-01 11:39:02.850'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
289,{ts '2020-07-01 11:39:08.090'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
290,{ts '2020-07-01 11:39:48.617'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
291,{ts '2020-07-01 11:40:04.557'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
292,{ts '2020-07-01 11:40:15.497'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
293,{ts '2020-07-01 11:40:21.160'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
294,{ts '2020-07-01 11:40:22.850'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
295,{ts '2020-07-01 11:41:03.007'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
296,{ts '2020-07-01 11:41:08.083'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
297,{ts '2020-07-01 11:42:04.860'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
298,{ts '2020-07-01 11:42:10.590'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
299,{ts '2020-07-01 11:42:49.133'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
300,{ts '2020-07-01 11:43:17.113'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
301,{ts '2020-07-01 11:43:44.630'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
302,{ts '2020-07-01 11:45:29.613'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1114,\"Key\":\"e8447270-e687-4760-b6a4-c07f733daeaa\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
303,{ts '2020-07-01 11:45:52.817'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1101,\"Key\":\"d26b25fd-79a0-4e0a-b08d-63543b5fb23f\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
304,{ts '2020-07-01 11:45:53.817'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1100,\"Key\":\"ce6bad19-f229-42a0-91f3-eb23abebddd6\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
305,{ts '2020-07-01 11:45:54.807'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1099,\"Key\":\"b1635612-277a-46c2-9644-fb20e7a67916\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
306,{ts '2020-07-01 11:45:55.747'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1098,\"Key\":\"3dc1d975-11c1-48e6-af40-3e7250fcb7c2\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
307,{ts '2020-07-01 11:45:56.700'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1097,\"Key\":\"56f5b4b3-3db6-4a6d-a841-70b6ed593595\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
308,{ts '2020-07-01 11:45:57.687'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1096,\"Key\":\"e3b9a845-0752-4c21-8056-50db413eb67b\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
309,{ts '2020-07-01 11:45:58.650'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1095,\"Key\":\"e985a122-92ab-4bce-943b-a63ce770f21c\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
310,{ts '2020-07-01 11:45:59.613'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1094,\"Key\":\"47d3b964-6625-473c-ac27-c7ca20517ab1\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
311,{ts '2020-07-01 11:46:00.583'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1093,\"Key\":\"db6a0cbe-5b8c-4f5a-8147-7b62098a924b\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
312,{ts '2020-07-01 11:46:01.480'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1092,\"Key\":\"c66c3469-c4a4-43e1-bd1e-f8b4916aa5b3\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
313,{ts '2020-07-01 11:46:02.313'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1091,\"Key\":\"9121b980-96c0-4224-bd2f-6d1d64ad3b51\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
314,{ts '2020-07-01 11:46:29.863'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1114,\"Key\":\"e8447270-e687-4760-b6a4-c07f733daeaa\",\"ChangeTypes\":8}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
315,{ts '2020-07-01 11:46:49.343'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1121,\"Key\":\"de3a267f-f060-4da0-95ed-93229f76953c\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
316,{ts '2020-07-01 11:46:50.103'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1122,\"Key\":\"af1ba5e3-73a8-4d3c-a836-41c99a791859\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
317,{ts '2020-07-01 11:46:50.840'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1123,\"Key\":\"8be2281b-fde2-4132-a231-6db09ad01b03\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
318,{ts '2020-07-01 11:46:51.340'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1124,\"Key\":\"599cf43e-6898-42d5-a464-c4b8e3901127\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
319,{ts '2020-07-01 11:46:52.113'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1125,\"Key\":\"43ba5c22-46c1-4ffd-8787-3404cee217c4\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
320,{ts '2020-07-01 11:46:52.800'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1126,\"Key\":\"ced17de9-3ee2-45ca-a8af-f962df2ceb3d\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
321,{ts '2020-07-01 11:46:53.600'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1127,\"Key\":\"79277694-711b-4019-9773-2242c7e35a98\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
322,{ts '2020-07-01 11:46:54.440'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1128,\"Key\":\"41a09512-2edd-4a6a-a0c1-a7e4219a8484\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
323,{ts '2020-07-01 11:46:55.193'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1129,\"Key\":\"55f48754-556f-4b03-91dd-89955fa58506\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
324,{ts '2020-07-01 11:46:56.007'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1130,\"Key\":\"42db1120-d1a2-406f-8820-67c05978127e\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
325,{ts '2020-07-01 11:46:56.793'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1131,\"Key\":\"ca3a1974-3bb7-49b8-a15c-426fcaeb3520\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
326,{ts '2020-07-01 11:47:00.707'},N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1090,\"Key\":\"f3d0c23d-b6cb-4709-a14a-9dfe8c8f1c4e\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
327,{ts '2020-07-01 11:47:46.047'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
328,{ts '2020-07-01 11:47:48.100'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
329,{ts '2020-07-01 11:52:17.047'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
330,{ts '2020-07-01 11:52:31.563'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
331,{ts '2020-07-01 11:56:32.397'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
332,{ts '2020-07-01 11:57:39.160'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
333,{ts '2020-07-01 11:58:02.117'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
334,{ts '2020-07-01 11:58:07.097'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
335,{ts '2020-07-01 11:58:39.023'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
336,{ts '2020-07-01 11:58:45.927'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
337,{ts '2020-07-01 12:02:08.910'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1112,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
338,{ts '2020-07-01 12:02:21.507'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1112,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
339,{ts '2020-07-01 12:08:55.877'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1132]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1133,\"ChangeTypes\":1}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',2);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
340,{ts '2020-07-01 12:11:36.060'},N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1132,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
341,{ts '2020-07-01 12:11:42.933'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1133,\"ChangeTypes\":8}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
342,{ts '2020-07-01 12:18:09.427'},N'[{"RefreshType":4,"RefresherId":"7b1e683c-5f34-43dd-803d-9699ea1e98ca","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1,\"Alias\":\"Footer\"}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
343,{ts '2020-07-01 12:19:42.600'},N'[{"RefreshType":4,"RefresherId":"7b1e683c-5f34-43dd-803d-9699ea1e98ca","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1,\"Alias\":\"Footer\"}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
344,{ts '2020-07-01 12:20:13.087'},N'[{"RefreshType":4,"RefresherId":"7b1e683c-5f34-43dd-803d-9699ea1e98ca","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1,\"Alias\":\"Footer\"}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
345,{ts '2020-07-01 12:23:21.907'},N'[{"RefreshType":4,"RefresherId":"7b1e683c-5f34-43dd-803d-9699ea1e98ca","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1,\"Alias\":\"Footer\"}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
346,{ts '2020-07-01 12:33:48.210'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1134]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1135,\"ChangeTypes\":1}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D3] 7094E9E9E4614B788639C2C8CAAC277B',2);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
347,{ts '2020-07-01 12:41:17.897'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1136,\"Key\":\"e8758cf6-0acc-4f5a-8d63-b435b5a4aa8f\",\"Removed\":false}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
348,{ts '2020-07-01 12:41:54.467'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1135,\"ChangeTypes\":8}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
349,{ts '2020-07-01 12:42:26.270'},N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1134,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
350,{ts '2020-07-01 12:42:41.957'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1137]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1138,\"ChangeTypes\":1}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',2);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
351,{ts '2020-07-01 12:44:56.950'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1139]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1140,\"ChangeTypes\":1}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',2);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
352,{ts '2020-07-01 12:45:14.383'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1140,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
353,{ts '2020-07-01 12:47:11.730'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":-95,\"Key\":\"c0808dd3-8133-4e4b-8ce8-e2bea84a96a4\",\"Removed\":false}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
354,{ts '2020-07-01 12:47:24.950'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1140,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
355,{ts '2020-07-01 12:48:22.750'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":-95,\"Key\":\"c0808dd3-8133-4e4b-8ce8-e2bea84a96a4\",\"Removed\":false}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
356,{ts '2020-07-01 12:48:47.370'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":-95,\"Key\":\"c0808dd3-8133-4e4b-8ce8-e2bea84a96a4\",\"Removed\":false}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
357,{ts '2020-07-01 12:51:59.537'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1138,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
358,{ts '2020-07-01 12:52:40.760'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1141,\"Key\":\"eece0890-6ebc-4d5f-8f3d-197fa3a731c7\",\"Removed\":false}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
359,{ts '2020-07-01 12:52:51.403'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1140,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
360,{ts '2020-07-01 12:54:14.247'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1142,\"Key\":\"cee075fd-9c6f-4a06-b061-081e169bb1b1\",\"Removed\":false}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
361,{ts '2020-07-01 12:54:21.670'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1138,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
362,{ts '2020-07-01 12:55:32.203'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1141,\"Key\":\"eece0890-6ebc-4d5f-8f3d-197fa3a731c7\",\"Removed\":false}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
363,{ts '2020-07-01 12:55:42.570'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1140,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
364,{ts '2020-07-01 12:56:15.610'},N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1139,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
365,{ts '2020-07-01 12:56:26.587'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
366,{ts '2020-07-01 12:56:43.060'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1140,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
367,{ts '2020-07-01 12:56:48.347'},N'[{"RefreshType":5,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":1137,"JsonIds":null,"JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
368,{ts '2020-07-01 12:57:08.760'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1111,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
369,{ts '2020-07-01 12:57:24.490'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1140,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
370,{ts '2020-07-01 12:58:38.240'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1141,\"Key\":\"eece0890-6ebc-4d5f-8f3d-197fa3a731c7\",\"Removed\":false}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
371,{ts '2020-07-01 12:58:45.470'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1140,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
372,{ts '2020-07-01 13:00:28.133'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1144,\"Key\":\"6011f1c8-19f8-472c-86ea-62cf6baa80a5\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
373,{ts '2020-07-01 13:02:17.653'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1144,\"Key\":\"6011f1c8-19f8-472c-86ea-62cf6baa80a5\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
374,{ts '2020-07-01 13:02:28.493'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1144,\"Key\":\"6011f1c8-19f8-472c-86ea-62cf6baa80a5\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
375,{ts '2020-07-01 13:05:37.407'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P20844/D4] 96EF97627B504957BE3A45F1E5B50F91',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
376,{ts '2020-07-01 13:19:57.020'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P16452/D2] 0545D42048D04E3486981CDEA50BB77E',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
377,{ts '2020-07-01 13:21:31.527'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P16452/D2] 0545D42048D04E3486981CDEA50BB77E',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
378,{ts '2020-07-01 13:22:00.660'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P16452/D2] 0545D42048D04E3486981CDEA50BB77E',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
379,{ts '2020-07-01 13:22:14.787'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P16452/D2] 0545D42048D04E3486981CDEA50BB77E',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
380,{ts '2020-07-01 13:22:15.107'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P16452/D2] 0545D42048D04E3486981CDEA50BB77E',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
381,{ts '2020-07-01 13:29:34.863'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P16452/D2] 0545D42048D04E3486981CDEA50BB77E',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
382,{ts '2020-07-01 13:46:12.550'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P9284/D2] 5B06A46E174E4ADDA2820AB8D88261D6',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
383,{ts '2020-07-02 09:13:35.927'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D2] 7DEBBB0861CD442393ECE85F5E4DBDCB',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
384,{ts '2020-07-02 09:30:15.720'},N'[{"RefreshType":3,"RefresherId":"d1d7e227-f817-4816-bfe9-6c39b6152884","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
385,{ts '2020-07-02 09:36:09.020'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
386,{ts '2020-07-02 09:37:38.897'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
387,{ts '2020-07-02 09:38:52.860'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
388,{ts '2020-07-02 09:49:47.857'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
389,{ts '2020-07-02 09:50:43.803'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1145,\"Key\":\"787b7f93-874c-46c6-8780-10883101f6d7\",\"Removed\":false}]"}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
390,{ts '2020-07-02 09:50:51.803'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1138,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
391,{ts '2020-07-02 09:52:11.567'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1144,\"Key\":\"6011f1c8-19f8-472c-86ea-62cf6baa80a5\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
392,{ts '2020-07-02 09:52:11.807'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1144,\"Key\":\"6011f1c8-19f8-472c-86ea-62cf6baa80a5\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
393,{ts '2020-07-02 09:53:13.627'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
394,{ts '2020-07-02 09:53:41.027'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
395,{ts '2020-07-02 09:53:54.400'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
396,{ts '2020-07-02 09:54:29.457'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
397,{ts '2020-07-02 09:55:09.877'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
398,{ts '2020-07-02 09:55:36.040'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
399,{ts '2020-07-02 09:55:52.207'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
400,{ts '2020-07-02 09:56:32.887'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
401,{ts '2020-07-02 09:56:40.523'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1144,\"Key\":\"6011f1c8-19f8-472c-86ea-62cf6baa80a5\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
402,{ts '2020-07-02 09:57:49.783'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
403,{ts '2020-07-02 09:57:55.900'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
404,{ts '2020-07-02 09:58:46.927'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
405,{ts '2020-07-02 10:00:11.207'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
406,{ts '2020-07-02 10:00:31.630'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
407,{ts '2020-07-02 10:00:49.220'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1144,\"Key\":\"6011f1c8-19f8-472c-86ea-62cf6baa80a5\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
408,{ts '2020-07-02 10:01:15.247'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
409,{ts '2020-07-02 10:09:20.087'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
410,{ts '2020-07-02 10:10:20.383'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1144,\"Key\":\"6011f1c8-19f8-472c-86ea-62cf6baa80a5\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P13316/D3] F56FF83B4B8B4A409405DE43F7152F03',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
411,{ts '2020-07-02 14:15:07.240'},N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
412,{ts '2020-07-02 14:16:41.060'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1144,\"Key\":\"6011f1c8-19f8-472c-86ea-62cf6baa80a5\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
413,{ts '2020-07-02 14:18:01.383'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1140,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
414,{ts '2020-07-02 14:22:12.743'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1146,\"Key\":\"5cbb7903-805b-4e2c-88f8-4b9ab9017493\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
415,{ts '2020-07-02 14:22:20.017'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1146,\"Key\":\"5cbb7903-805b-4e2c-88f8-4b9ab9017493\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
416,{ts '2020-07-02 14:24:40.633'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
417,{ts '2020-07-02 14:26:47.763'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
418,{ts '2020-07-02 14:27:39.300'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
419,{ts '2020-07-02 14:27:44.720'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
420,{ts '2020-07-02 14:28:36.350'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
421,{ts '2020-07-02 14:28:45.633'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
422,{ts '2020-07-02 14:28:52.927'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
423,{ts '2020-07-02 14:28:58.937'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1146,\"Key\":\"5cbb7903-805b-4e2c-88f8-4b9ab9017493\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
424,{ts '2020-07-02 14:31:31.220'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
425,{ts '2020-07-02 14:31:44.560'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1146,\"Key\":\"5cbb7903-805b-4e2c-88f8-4b9ab9017493\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
426,{ts '2020-07-02 14:31:59.883'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1113,\"Key\":\"331fa914-4132-4c4c-940c-bf575ad800f9\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
427,{ts '2020-07-02 14:32:35.767'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
428,{ts '2020-07-02 14:33:33.180'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
429,{ts '2020-07-02 14:34:01.017'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
430,{ts '2020-07-02 14:34:13.710'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
431,{ts '2020-07-02 14:36:04.077'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
432,{ts '2020-07-02 14:37:09.750'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
433,{ts '2020-07-02 14:40:39.433'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1147,\"Key\":\"82aa0a7e-3f7a-4dc1-8f99-217005396b8d\",\"Removed\":false}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
434,{ts '2020-07-02 14:41:00.063'},N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1148,\"Key\":\"ec76d7fd-25df-4b63-ae96-32d1aca8e4a0\",\"Removed\":false}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
435,{ts '2020-07-02 14:41:07.413'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1138,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
436,{ts '2020-07-02 14:43:03.023'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
437,{ts '2020-07-02 14:43:05.107'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
438,{ts '2020-07-02 14:43:37.407'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
439,{ts '2020-07-02 14:43:56.507'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1138,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
440,{ts '2020-07-02 14:44:30.617'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
441,{ts '2020-07-02 14:44:33.083'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
442,{ts '2020-07-02 14:44:34.553'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
443,{ts '2020-07-02 14:45:24.087'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
444,{ts '2020-07-02 14:47:36.947'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
445,{ts '2020-07-02 14:48:08.137'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
446,{ts '2020-07-02 14:48:33.680'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
447,{ts '2020-07-02 14:48:36.013'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
448,{ts '2020-07-02 14:48:51.957'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
449,{ts '2020-07-02 14:49:28.020'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1146,\"Key\":\"5cbb7903-805b-4e2c-88f8-4b9ab9017493\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
450,{ts '2020-07-02 14:50:39.397'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
451,{ts '2020-07-02 14:51:33.237'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
452,{ts '2020-07-02 14:52:19.747'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
453,{ts '2020-07-02 14:52:47.107'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
454,{ts '2020-07-02 14:53:01.060'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
455,{ts '2020-07-02 14:53:24.050'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
456,{ts '2020-07-02 14:53:35.207'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1146,\"Key\":\"5cbb7903-805b-4e2c-88f8-4b9ab9017493\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
457,{ts '2020-07-02 14:53:40.870'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1146,\"Key\":\"5cbb7903-805b-4e2c-88f8-4b9ab9017493\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
458,{ts '2020-07-02 14:56:00.080'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
459,{ts '2020-07-02 14:56:54.977'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
460,{ts '2020-07-02 14:56:56.890'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
461,{ts '2020-07-02 14:56:59.720'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
462,{ts '2020-07-02 14:57:22.477'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
463,{ts '2020-07-02 14:59:25.497'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1150,\"Key\":\"6488d9eb-d5b9-45ff-be96-93ebb4d6876f\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
464,{ts '2020-07-02 14:59:37.567'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1150,\"Key\":\"6488d9eb-d5b9-45ff-be96-93ebb4d6876f\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
465,{ts '2020-07-02 15:00:25.080'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
466,{ts '2020-07-02 15:05:43.340'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1151,\"Key\":\"e6ae01ea-0ec8-40fb-89e6-8d0a321f8d82\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
467,{ts '2020-07-02 15:05:45.063'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1151,\"Key\":\"e6ae01ea-0ec8-40fb-89e6-8d0a321f8d82\",\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
468,{ts '2020-07-02 15:06:13.030'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
469,{ts '2020-07-02 15:06:30.067'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
470,{ts '2020-07-02 15:07:50.557'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1152,\"Key\":\"d2f083ac-8f15-4362-b8ab-63bd57514df3\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
471,{ts '2020-07-02 15:08:35.820'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
472,{ts '2020-07-02 15:09:25.877'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
473,{ts '2020-07-02 15:10:03.807'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
474,{ts '2020-07-02 15:10:18.980'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
475,{ts '2020-07-02 15:11:43.753'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
476,{ts '2020-07-02 15:12:19.400'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1113,\"Key\":\"331fa914-4132-4c4c-940c-bf575ad800f9\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
477,{ts '2020-07-02 15:14:12.847'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
478,{ts '2020-07-02 15:14:39.653'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
479,{ts '2020-07-02 15:14:54.153'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
480,{ts '2020-07-02 15:15:28.357'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1068]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
481,{ts '2020-07-02 15:16:49.913'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1068]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
482,{ts '2020-07-02 15:17:31.263'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1068]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
483,{ts '2020-07-02 15:17:52.053'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
484,{ts '2020-07-02 15:17:56.223'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
485,{ts '2020-07-02 15:18:17.093'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1118]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
486,{ts '2020-07-02 15:18:22.867'},N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1143]","JsonIdCount":1,"JsonPayload":null}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
487,{ts '2020-07-02 15:19:43.907'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1112,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
488,{ts '2020-07-02 15:20:05.403'},N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1111,\"ChangeTypes\":4}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
489,{ts '2020-07-02 15:20:21.897'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1113,\"Key\":\"331fa914-4132-4c4c-940c-bf575ad800f9\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
490,{ts '2020-07-02 15:20:29.490'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1119,\"Key\":\"80adb2e2-b5cf-4abf-ab2b-12fd71267f93\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
491,{ts '2020-07-02 15:20:39.000'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1146,\"Key\":\"5cbb7903-805b-4e2c-88f8-4b9ab9017493\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
492,{ts '2020-07-02 15:20:47.727'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
493,{ts '2020-07-02 15:21:08.160'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1149,\"Key\":\"46d3adfa-cdde-42b6-875f-080a972de1f6\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
494,{ts '2020-07-02 15:21:16.087'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1150,\"Key\":\"6488d9eb-d5b9-45ff-be96-93ebb4d6876f\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
495,{ts '2020-07-02 15:21:24.157'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1151,\"Key\":\"e6ae01ea-0ec8-40fb-89e6-8d0a321f8d82\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
496,{ts '2020-07-02 15:21:33.553'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1152,\"Key\":\"d2f083ac-8f15-4362-b8ab-63bd57514df3\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D2] 86693607BC5E4F98ACEFAA68963515A2',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
497,{ts '2020-07-02 15:22:04.277'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1113,\"Key\":\"331fa914-4132-4c4c-940c-bf575ad800f9\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D3] 99E40B158B6142A0BFB609F179F8CD49',1);
GO
INSERT INTO [umbracoCacheInstruction] ([id],[utcStamp],[jsonInstruction],[originated],[instructionCount]) VALUES (
498,{ts '2020-07-02 15:22:04.387'},N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1113,\"Key\":\"331fa914-4132-4c4c-940c-bf575ad800f9\",\"ChangeTypes\":2}]"}]',N'MSI//LM/W3SVC/2/ROOT [P12352/D3] 99E40B158B6142A0BFB609F179F8CD49',1);
GO
SET IDENTITY_INSERT [umbracoCacheInstruction] OFF;
GO
SET IDENTITY_INSERT [umbracoAudit] ON;
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
1,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 08:59:52.410'},-1,N'User "Administrator" ',N'umbraco/user/save',N'updating RawPasswordValue, LastPasswordChangeDate, UpdateDate, SecurityStamp');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
2,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 08:59:52.730'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating Email, Name, Username, UpdateDate, SecurityStamp');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
3,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 09:00:16.870'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
4,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 09:02:05.633'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
5,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 09:02:05.897'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
6,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 11:20:38.533'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
7,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 11:20:38.720'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
8,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 11:27:53.533'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/logout',N'logout success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
9,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 11:34:59.127'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
10,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 11:34:59.437'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
11,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 11:52:13.977'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/logout',N'logout success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
12,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 12:28:22.097'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
13,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 12:28:22.403'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
14,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 14:42:44.203'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
15,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 14:42:44.513'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
16,-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'::1',{ts '2020-06-29 15:40:00.843'},1,N'User "Damian" <contact@fide-soft.com>',N'umbraco/user/save',N'updating SessionTimeout, SecurityStamp, CreateDate, UpdateDate, Id');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
17,-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'::1',{ts '2020-06-29 15:40:01.130'},1,N'User "Damian" <contact@fide-soft.com>',N'umbraco/user/save',N'updating LastPasswordChangeDate, RawPasswordValue, SecurityStamp, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
18,-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'::1',{ts '2020-06-29 15:40:01.387'},1,N'User "Damian" <contact@fide-soft.com>',N'umbraco/user/save',N'updating Key, IsApproved, Groups, UpdateDate; groups assigned: admin');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
19,-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'::1',{ts '2020-06-29 15:40:58.030'},1,N'User "Damian" <contact@fide-soft.com>',N'umbraco/user/save',N'updating LastPasswordChangeDate, RawPasswordValue, SecurityStamp, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
20,-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'::1',{ts '2020-06-29 15:40:58.287'},1,N'User "Damian" <contact@fide-soft.com>',N'umbraco/user/save',N'updating Language, Key, Groups, UpdateDate; groups assigned: admin');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
21,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 15:41:03.610'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/logout',N'logout success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
22,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 15:52:47.363'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating FailedPasswordAttempts, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
23,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 15:52:56.740'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating FailedPasswordAttempts, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
24,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 15:52:57.407'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
25,0,N'User "SYTEM" ',N'::1',{ts '2020-06-29 15:52:57.610'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
26,0,N'User "SYTEM" ',N'::1',{ts '2020-06-30 07:24:38.640'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
27,0,N'User "SYTEM" ',N'::1',{ts '2020-06-30 07:24:38.950'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
28,0,N'User "SYTEM" ',N'::1',{ts '2020-06-30 08:38:20.467'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
29,0,N'User "SYTEM" ',N'::1',{ts '2020-06-30 08:38:20.787'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
30,0,N'User "SYTEM" ',N'::1',{ts '2020-07-01 11:27:54.977'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
31,0,N'User "SYTEM" ',N'::1',{ts '2020-07-01 11:27:55.277'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
32,0,N'User "SYTEM" ',N'::1',{ts '2020-07-01 13:07:34.070'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/logout',N'logout success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
33,0,N'User "SYTEM" ',N'::1',{ts '2020-07-01 13:19:55.873'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
34,0,N'User "SYTEM" ',N'::1',{ts '2020-07-01 13:19:56.190'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
35,0,N'User "SYTEM" ',N'::1',{ts '2020-07-01 13:29:48.227'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/logout',N'logout success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
36,0,N'User "SYTEM" ',N'::1',{ts '2020-07-01 13:46:11.460'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
37,0,N'User "SYTEM" ',N'::1',{ts '2020-07-01 13:46:11.790'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
38,0,N'User "SYTEM" ',N'::1',{ts '2020-07-02 09:13:34.590'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
39,0,N'User "SYTEM" ',N'::1',{ts '2020-07-02 09:13:34.907'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
40,-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'::1',{ts '2020-07-02 09:37:38.480'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
41,0,N'User "SYTEM" ',N'::1',{ts '2020-07-02 09:37:38.687'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
42,0,N'User "SYTEM" ',N'::1',{ts '2020-07-02 10:14:07.087'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/logout',N'logout success');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
43,0,N'User "SYTEM" ',N'::1',{ts '2020-07-02 14:15:06.107'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/save',N'updating LastLoginDate, UpdateDate');
GO
INSERT INTO [umbracoAudit] ([id],[performingUserId],[performingDetails],[performingIp],[eventDateUtc],[affectedUserId],[affectedDetails],[eventType],[eventDetails]) VALUES (
44,0,N'User "SYTEM" ',N'::1',{ts '2020-07-02 14:15:06.433'},-1,N'User "Pisaqtom" <kontakt@fide-soft.com>',N'umbraco/user/sign-in/login',N'login success');
GO
SET IDENTITY_INSERT [umbracoAudit] OFF;
GO
SET IDENTITY_INSERT [cmsTemplate] ON;
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
5,1068,N'StronaGlowna');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
9,1110,N'master');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
12,1118,N'galeria');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias]) VALUES (
17,1143,N'cennik');
GO
SET IDENTITY_INSERT [cmsTemplate] OFF;
GO
SET IDENTITY_INSERT [cmsTags] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] ON;
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
3,1032,N'Image',1,'79ed4d07-254a-42cf-8fa9-ebe1c116a596');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
4,1033,N'File',1,'50899f9c-023a-4466-b623-aba9049885fe');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
11,1044,N'Membership',1,'0756729d-d665-46e3-b84a-37aceaa614f8');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
16,1111,N'Footer',0,'7173465d-d1c6-4a29-9e71-b39fcfd5213c');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
17,1112,N'Content',1,'93917d44-c6a8-4225-b5c2-b1e05b343b62');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
18,1111,N'Header',1,'e225f62a-3798-4329-ba2f-2058f53fa623');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
19,1116,N'Galeria',2,'f2612141-b672-4e07-b017-c08040f0702d');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
21,1138,N'Usługi',0,'08f08b89-6782-4a77-baa2-d9a7438b0140');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
22,1140,N'Ceny',2,'22dc1e31-d706-4811-b993-d5705b7dd24b');
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyType] ON;
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
6,1043,1032,3,N'umbracoFile',N'Upload image',0,1,NULL,NULL,NULL,NULL,0,'00000006-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
7,-91,1032,3,N'umbracoWidth',N'Width',0,0,NULL,NULL,NULL,N'in pixels',0,'00000007-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
8,-91,1032,3,N'umbracoHeight',N'Height',0,0,NULL,NULL,NULL,N'in pixels',0,'00000008-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
9,-93,1032,3,N'umbracoBytes',N'Size',0,0,NULL,NULL,NULL,N'in bytes',0,'00000009-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
10,-92,1032,3,N'umbracoExtension',N'Type',0,0,NULL,NULL,NULL,NULL,0,'0000000a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
24,-90,1033,4,N'umbracoFile',N'Upload file',0,1,NULL,NULL,NULL,NULL,0,'00000018-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
25,-92,1033,4,N'umbracoExtension',N'Type',0,0,NULL,NULL,NULL,NULL,0,'00000019-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
26,-93,1033,4,N'umbracoBytes',N'Size',0,0,NULL,NULL,NULL,N'in bytes',0,'0000001a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
28,-89,1044,11,N'umbracoMemberComments',N'Comments',0,0,NULL,NULL,NULL,NULL,0,'0000001c-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
29,-91,1044,11,N'umbracoMemberFailedPasswordAttempts',N'Failed Password Attempts',1,0,NULL,NULL,NULL,NULL,0,'0000001d-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
30,-49,1044,11,N'umbracoMemberApproved',N'Is Approved',2,0,NULL,NULL,NULL,NULL,0,'0000001e-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
31,-49,1044,11,N'umbracoMemberLockedOut',N'Is Locked Out',3,0,NULL,NULL,NULL,NULL,0,'0000001f-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
32,-94,1044,11,N'umbracoMemberLastLockoutDate',N'Last Lockout Date',4,0,NULL,NULL,NULL,NULL,0,'00000020-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
33,-94,1044,11,N'umbracoMemberLastLogin',N'Last Login Date',5,0,NULL,NULL,NULL,NULL,0,'00000021-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
34,-94,1044,11,N'umbracoMemberLastPasswordChangeDate',N'Last Password Change Date',6,0,NULL,NULL,NULL,NULL,0,'00000022-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
35,-94,1044,11,N'umbracoMemberPasswordRetrievalQuestion',N'Password Question',7,0,NULL,NULL,NULL,NULL,0,'00000023-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
36,-94,1044,11,N'umbracoMemberPasswordRetrievalAnswer',N'Password Answer',8,0,NULL,NULL,NULL,NULL,0,'00000024-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
66,-88,1111,16,N'telefonRecepcja',N'Telefon Recepcja',0,0,NULL,NULL,NULL,NULL,0,'424bbb45-cbc2-47b9-b1f2-eb54ceb4e55b');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
68,-88,1111,16,N'telefonFirmowy',N'Telefon Firmowy',1,0,NULL,NULL,NULL,NULL,0,'5c27fb27-6272-43fd-bcb4-d0c04cc1adf2');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
69,-88,1111,16,N'adresMailowy',N'Adres Mailowy',2,0,NULL,NULL,NULL,NULL,0,'affcc343-eee7-42a8-a203-b861650f0934');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
70,1048,1111,18,N'logo',N'Logo',0,0,NULL,NULL,NULL,NULL,0,'6a5ad349-e05e-4420-a6b1-68a7c0716722');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
72,-88,1111,18,N'tytulStrony',N'Tytuł Strony',1,0,NULL,NULL,NULL,NULL,0,'5048cf9f-3c92-41f7-a212-349dc99cc3f7');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
73,-88,1112,17,N'tytulH1',N'Tytuł H1',1,0,NULL,NULL,NULL,NULL,0,'4466a459-9d77-4dee-b9b5-f57d0906d48a');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
74,-88,1112,17,N'tytulCenter',N'Tytuł Center',2,0,NULL,NULL,NULL,NULL,0,'0d251350-7500-4fa6-98a4-10cc091d5282');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
75,1049,1116,19,N'zdjeciaGalerii',N'Zdjęcia Galerii',0,0,NULL,NULL,NULL,NULL,0,'df8e010b-675c-4082-a1fe-db1e386773ce');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
79,-88,1138,21,N'nazwaUslugi',N'Nazwa Usługi',0,0,NULL,NULL,NULL,NULL,0,'ea42327d-d615-4c61-b2e3-f077a6261d40');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
80,1147,1138,21,N'czasWykonaniaUslugi',N'Czas Wykonania usługi',1,0,NULL,NULL,NULL,NULL,0,'76f85a07-a93b-461a-b416-7d24be05a7de');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
81,1136,1138,21,N'cenaUslugi',N'Cena Usługi',2,0,NULL,NULL,NULL,NULL,0,'09d49670-b7cb-4db8-bb6d-8dc66f5ed3e6');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
83,1141,1140,22,N'listaUslug',N'Lista Usług',0,0,NULL,NULL,NULL,NULL,0,'cc5cca48-8ad1-498a-9001-ea2980a68c4c');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
84,-87,1138,21,N'opisUslugi',N'Opis Usługi',3,0,NULL,NULL,NULL,NULL,0,'2826607c-470d-4e76-9ded-85231d81c7cf');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[mandatoryMessage],[validationRegExp],[validationRegExpMessage],[Description],[variations],[UniqueID]) VALUES (
85,1048,1111,18,N'zdjecieTla',N'Zdjęcie tła',2,0,NULL,NULL,NULL,NULL,0,'01f2cecc-5525-46d0-9c17-4b2a5bd88f2c');
GO
SET IDENTITY_INSERT [cmsPropertyType] OFF;
GO
SET IDENTITY_INSERT [umbracoPropertyData] ON;
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
72,9,24,NULL,NULL,NULL,NULL,NULL,N'/media/354h11cj/bg-1.webp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
73,9,25,NULL,NULL,NULL,NULL,NULL,N'webp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
74,9,26,NULL,NULL,NULL,NULL,NULL,N'107174',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
75,7,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{
  "crops": null,
  "focalPoint": {
    "left": 0.5,
    "top": 0.5
  },
  "src": "/media/ws2pzmy2/bg-1.webp"
}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
76,7,9,NULL,NULL,NULL,NULL,NULL,N'107174',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
77,7,10,NULL,NULL,NULL,NULL,NULL,N'webp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
78,6,24,NULL,NULL,NULL,NULL,NULL,N'/media/ednockrx/bg-1.webp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
79,6,25,NULL,NULL,NULL,NULL,NULL,N'webp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
80,6,26,NULL,NULL,NULL,NULL,NULL,N'107174',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
87,11,24,NULL,NULL,NULL,NULL,NULL,N'/media/p5teoa1f/bg-1.webp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
88,11,25,NULL,NULL,NULL,NULL,NULL,N'webp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
89,11,26,NULL,NULL,NULL,NULL,NULL,N'107174',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
169,17,24,NULL,NULL,NULL,NULL,NULL,N'/media/ywcf2ylt/logo.webp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
170,17,25,NULL,NULL,NULL,NULL,NULL,N'webp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
171,17,26,NULL,NULL,NULL,NULL,NULL,N'28916',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
324,43,66,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
326,43,68,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
328,43,69,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
330,43,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/9121b98096c04224bd2f6d1d64ad3b51');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
344,44,66,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
346,44,68,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
348,44,69,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
350,44,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/9121b98096c04224bd2f6d1d64ad3b51');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
352,44,72,NULL,NULL,NULL,NULL,NULL,N'Emiii',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
356,44,73,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
358,44,74,NULL,NULL,NULL,NULL,NULL,N'Kosmetologia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
360,45,66,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
362,45,68,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
364,45,69,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
366,45,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/9121b98096c04224bd2f6d1d64ad3b51');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
368,45,72,NULL,NULL,NULL,NULL,NULL,N'Emiii',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
372,45,73,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
374,45,74,NULL,NULL,NULL,NULL,NULL,N'Kosmetologia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
384,46,66,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
386,46,68,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
388,46,69,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
390,46,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
392,46,72,NULL,NULL,NULL,NULL,NULL,N'Emiii',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
396,46,73,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
398,46,74,NULL,NULL,NULL,NULL,NULL,N'Kosmetologia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
400,48,66,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
402,48,68,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
404,48,69,NULL,NULL,NULL,NULL,NULL,N'45',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
406,48,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
408,48,72,NULL,NULL,NULL,NULL,NULL,N'Emiii',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
412,48,73,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
414,48,74,NULL,NULL,NULL,NULL,NULL,N'Kosmetologia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
416,50,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
418,50,68,NULL,NULL,NULL,NULL,NULL,N'01',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
420,50,69,NULL,NULL,NULL,NULL,NULL,N'wp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
422,50,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
424,50,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center Galeria',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
426,50,75,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/d26b25fd79a04e0ab08d63543b5fb23f,umb://media/ce6bad19f22942a091f3eb23abebddd6,umb://media/b1635612277a46c29644fb20e7a67916,umb://media/3dc1d97511c148e6af403e7250fcb7c2,umb://media/56f5b4b33db64a6da84170b6ed593595,umb://media/e3b9a84507524c21805650db413eb67b,umb://media/e985a12292ab4bce943ba63ce770f21c,umb://media/47d3b9646625473cac27c7ca20517ab1,umb://media/db6a0cbe5b8c4f5a81477b62098a924b,umb://media/c66c3469c4a443e1bd1ef8b4916aa5b3,umb://media/9121b98096c04224bd2f6d1d64ad3b51');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
428,51,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
430,51,68,NULL,NULL,NULL,NULL,NULL,N'01',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
432,51,69,NULL,NULL,NULL,NULL,NULL,N'wp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
434,51,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
436,51,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center Galeria',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
438,51,75,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/d26b25fd79a04e0ab08d63543b5fb23f,umb://media/ce6bad19f22942a091f3eb23abebddd6,umb://media/b1635612277a46c29644fb20e7a67916,umb://media/3dc1d97511c148e6af403e7250fcb7c2,umb://media/56f5b4b33db64a6da84170b6ed593595,umb://media/e3b9a84507524c21805650db413eb67b,umb://media/e985a12292ab4bce943ba63ce770f21c,umb://media/47d3b9646625473cac27c7ca20517ab1,umb://media/db6a0cbe5b8c4f5a81477b62098a924b,umb://media/c66c3469c4a443e1bd1ef8b4916aa5b3,umb://media/9121b98096c04224bd2f6d1d64ad3b51');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
440,52,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
442,52,68,NULL,NULL,NULL,NULL,NULL,N'01',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
444,52,69,NULL,NULL,NULL,NULL,NULL,N'wp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
446,52,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
448,52,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center Galeria',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
450,52,75,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/d26b25fd79a04e0ab08d63543b5fb23f,umb://media/ce6bad19f22942a091f3eb23abebddd6,umb://media/b1635612277a46c29644fb20e7a67916,umb://media/3dc1d97511c148e6af403e7250fcb7c2,umb://media/56f5b4b33db64a6da84170b6ed593595,umb://media/e3b9a84507524c21805650db413eb67b,umb://media/e985a12292ab4bce943ba63ce770f21c,umb://media/47d3b9646625473cac27c7ca20517ab1,umb://media/db6a0cbe5b8c4f5a81477b62098a924b,umb://media/c66c3469c4a443e1bd1ef8b4916aa5b3,umb://media/9121b98096c04224bd2f6d1d64ad3b51');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
458,54,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
459,54,68,NULL,NULL,NULL,NULL,NULL,N'01',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
460,54,69,NULL,NULL,NULL,NULL,NULL,N'wp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
461,54,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
462,54,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center Galeria',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
463,54,75,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/d26b25fd79a04e0ab08d63543b5fb23f,umb://media/ce6bad19f22942a091f3eb23abebddd6,umb://media/b1635612277a46c29644fb20e7a67916,umb://media/3dc1d97511c148e6af403e7250fcb7c2,umb://media/56f5b4b33db64a6da84170b6ed593595,umb://media/e3b9a84507524c21805650db413eb67b,umb://media/e985a12292ab4bce943ba63ce770f21c,umb://media/47d3b9646625473cac27c7ca20517ab1,umb://media/db6a0cbe5b8c4f5a81477b62098a924b,umb://media/c66c3469c4a443e1bd1ef8b4916aa5b3,umb://media/9121b98096c04224bd2f6d1d64ad3b51');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
464,53,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
466,53,68,NULL,NULL,NULL,NULL,NULL,N'01',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
468,53,69,NULL,NULL,NULL,NULL,NULL,N'wp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
470,53,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
472,53,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center Galeria',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
474,53,75,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/d26b25fd79a04e0ab08d63543b5fb23f,umb://media/ce6bad19f22942a091f3eb23abebddd6,umb://media/b1635612277a46c29644fb20e7a67916,umb://media/3dc1d97511c148e6af403e7250fcb7c2,umb://media/56f5b4b33db64a6da84170b6ed593595,umb://media/e3b9a84507524c21805650db413eb67b,umb://media/e985a12292ab4bce943ba63ce770f21c,umb://media/47d3b9646625473cac27c7ca20517ab1,umb://media/db6a0cbe5b8c4f5a81477b62098a924b,umb://media/c66c3469c4a443e1bd1ef8b4916aa5b3,umb://media/9121b98096c04224bd2f6d1d64ad3b51');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
476,55,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
478,55,68,NULL,NULL,NULL,NULL,NULL,N'01',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
480,55,69,NULL,NULL,NULL,NULL,NULL,N'wp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
482,55,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
484,55,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center Galeria',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
486,55,75,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/d26b25fd79a04e0ab08d63543b5fb23f,umb://media/ce6bad19f22942a091f3eb23abebddd6,umb://media/b1635612277a46c29644fb20e7a67916,umb://media/3dc1d97511c148e6af403e7250fcb7c2,umb://media/56f5b4b33db64a6da84170b6ed593595,umb://media/e3b9a84507524c21805650db413eb67b,umb://media/e985a12292ab4bce943ba63ce770f21c,umb://media/47d3b9646625473cac27c7ca20517ab1,umb://media/db6a0cbe5b8c4f5a81477b62098a924b,umb://media/c66c3469c4a443e1bd1ef8b4916aa5b3,umb://media/9121b98096c04224bd2f6d1d64ad3b51');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
488,32,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/5mshxuva/img-11.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
489,32,7,NULL,NULL,1373,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
490,32,8,NULL,NULL,962,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
491,32,9,NULL,NULL,NULL,NULL,NULL,N'169018',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
492,32,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
493,31,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/d4whxtrj/img-10.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
494,31,7,NULL,NULL,1536,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
495,31,8,NULL,NULL,2048,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
496,31,9,NULL,NULL,NULL,NULL,NULL,N'145826',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
497,31,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
498,30,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/crlghml0/img-9.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
499,30,7,NULL,NULL,720,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
500,30,8,NULL,NULL,960,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
501,30,9,NULL,NULL,NULL,NULL,NULL,N'36639',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
502,30,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
503,29,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/opmncpob/img-8.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
504,29,7,NULL,NULL,1536,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
505,29,8,NULL,NULL,2048,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
506,29,9,NULL,NULL,NULL,NULL,NULL,N'179356',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
507,29,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
508,28,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/ww0pkvvw/img-7.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
509,28,7,NULL,NULL,984,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
510,28,8,NULL,NULL,1370,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
511,28,9,NULL,NULL,NULL,NULL,NULL,N'113650',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
512,28,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
513,27,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/ioulty0s/img-6.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
514,27,7,NULL,NULL,1000,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
515,27,8,NULL,NULL,375,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
516,27,9,NULL,NULL,NULL,NULL,NULL,N'78614',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
517,27,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
518,26,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/esqjl0nl/img-5.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
519,26,7,NULL,NULL,1386,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
520,26,8,NULL,NULL,2048,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
521,26,9,NULL,NULL,NULL,NULL,NULL,N'159683',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
522,26,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
523,25,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/mk2ngrzf/img-4.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
524,25,7,NULL,NULL,1984,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
525,25,8,NULL,NULL,1120,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
526,25,9,NULL,NULL,NULL,NULL,NULL,N'164253',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
527,25,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
528,24,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/xaggvw2m/img-3.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
529,24,7,NULL,NULL,780,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
530,24,8,NULL,NULL,519,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
531,24,9,NULL,NULL,NULL,NULL,NULL,N'37974',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
532,24,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
533,23,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/n20gzrve/img-2.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
534,23,7,NULL,NULL,720,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
535,23,8,NULL,NULL,960,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
536,23,9,NULL,NULL,NULL,NULL,NULL,N'64696',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
537,23,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
538,22,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/q02ddeoa/img-1.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
539,22,7,NULL,NULL,780,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
540,22,8,NULL,NULL,519,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
541,22,9,NULL,NULL,NULL,NULL,NULL,N'37974',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
542,22,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
543,57,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/petdvxta/img-1.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
544,57,7,NULL,NULL,780,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
545,57,8,NULL,NULL,519,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
546,57,9,NULL,NULL,NULL,NULL,NULL,N'37974',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
547,57,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
548,58,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/2wsbxl3i/img-2.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
549,58,7,NULL,NULL,720,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
550,58,8,NULL,NULL,960,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
551,58,9,NULL,NULL,NULL,NULL,NULL,N'64696',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
552,58,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
553,59,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/duuofc5c/img-3.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
554,59,7,NULL,NULL,780,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
555,59,8,NULL,NULL,519,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
556,59,9,NULL,NULL,NULL,NULL,NULL,N'37974',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
557,59,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
558,60,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/hd0jywmy/img-4.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
559,60,7,NULL,NULL,1984,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
560,60,8,NULL,NULL,1120,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
561,60,9,NULL,NULL,NULL,NULL,NULL,N'164253',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
562,60,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
563,61,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/eroluq4b/img-5.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
564,61,7,NULL,NULL,1386,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
565,61,8,NULL,NULL,2048,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
566,61,9,NULL,NULL,NULL,NULL,NULL,N'159683',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
567,61,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
568,62,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/334ndtxc/img-6.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
569,62,7,NULL,NULL,1000,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
570,62,8,NULL,NULL,375,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
571,62,9,NULL,NULL,NULL,NULL,NULL,N'78614',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
572,62,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
573,63,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/sj1co4i1/img-7.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
574,63,7,NULL,NULL,984,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
575,63,8,NULL,NULL,1370,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
576,63,9,NULL,NULL,NULL,NULL,NULL,N'113650',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
577,63,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
578,64,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/csklaqo3/img-8.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
579,64,7,NULL,NULL,1536,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
580,64,8,NULL,NULL,2048,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
581,64,9,NULL,NULL,NULL,NULL,NULL,N'179356',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
582,64,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
583,65,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/kkdpivlp/img-9.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
584,65,7,NULL,NULL,720,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
585,65,8,NULL,NULL,960,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
586,65,9,NULL,NULL,NULL,NULL,NULL,N'36639',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
587,65,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
588,66,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/eyinwqvc/img-10.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
589,66,7,NULL,NULL,1536,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
590,66,8,NULL,NULL,2048,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
591,66,9,NULL,NULL,NULL,NULL,NULL,N'145826',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
592,66,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
593,67,6,NULL,NULL,NULL,NULL,NULL,NULL,N'{"src":"/media/oimdvsvx/img-11.jpg","crops":null}');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
594,67,7,NULL,NULL,1373,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
595,67,8,NULL,NULL,962,NULL,NULL,NULL,NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
596,67,9,NULL,NULL,NULL,NULL,NULL,N'169018',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
597,67,10,NULL,NULL,NULL,NULL,NULL,N'jpg',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
598,56,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
600,56,68,NULL,NULL,NULL,NULL,NULL,N'01',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
602,56,69,NULL,NULL,NULL,NULL,NULL,N'wp',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
604,56,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
606,56,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center Galeria',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
608,56,75,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/de3a267ff0604da095ed93229f76953c,umb://media/af1ba5e373a84d3ca83641c99a791859,umb://media/8be2281bfde24132a2316db09ad01b03,umb://media/599cf43e689842d5a464c4b8e3901127,umb://media/43ba5c2246c14ffd87873404cee217c4,umb://media/ced17de93ee245caa8aff962df2ceb3d,umb://media/79277694711b401997732242c7e35a98,umb://media/41a095122edd4a6aa0c1a7e4219a8484,umb://media/55f48754556f4b0391dd89955fa58506,umb://media/42db1120d1a2406f882067c05978127e,umb://media/ca3a19743bb749b8a15c426fcaeb3520');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
610,69,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
612,69,68,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
614,69,69,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
616,69,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
618,69,72,NULL,NULL,NULL,NULL,NULL,N'Cennik Usług 1 ',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
620,69,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "ed19ebb6-1ed8-453c-b7bf-661da7c206e6",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Jakaś Usługa Testowa",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 100.0
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
640,70,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
642,70,68,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
644,70,69,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
646,70,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
648,70,72,NULL,NULL,NULL,NULL,NULL,N'Cennik Usług 1 ',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
650,70,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "ed19ebb6-1ed8-453c-b7bf-661da7c206e6",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Jakaś Usługa Testowa",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 50.0,
    "opisUslugi": "Lorem ipsum dolor... "
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
658,71,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
660,71,68,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
662,71,69,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
664,71,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
666,71,72,NULL,NULL,NULL,NULL,NULL,N'Cennik Usług 1 ',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
668,71,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "ed19ebb6-1ed8-453c-b7bf-661da7c206e6",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Jakaś Usługa Testowa",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 50.0,
    "opisUslugi": "Lorem ipsum dolor... "
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
670,72,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
672,72,68,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
674,72,69,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
676,72,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
678,72,72,NULL,NULL,NULL,NULL,NULL,N'Cennik Usług 1 ',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
680,72,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "ed19ebb6-1ed8-453c-b7bf-661da7c206e6",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Jakaś Usługa Testowa",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 50.0,
    "opisUslugi": "Lorem ipsum dolor... "
  },
  {
    "key": "65228c34-d4e7-4d8e-a494-b09ee162a92d",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Usługa Testowa 2",
    "czasWykonaniaUslugi": "120",
    "cenaUslugi": 500.0,
    "opisUslugi": "Oto opis oraz test polskich znaków... ćżśćma XDDD"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
682,73,66,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
683,73,68,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
684,73,69,NULL,NULL,NULL,NULL,NULL,N'00',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
685,73,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
686,73,72,NULL,NULL,NULL,NULL,NULL,N'Cennik Usług 1 ',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
687,73,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "ed19ebb6-1ed8-453c-b7bf-661da7c206e6",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Jakaś Usługa Testowa",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 50.0,
    "opisUslugi": "Lorem ipsum dolor... "
  },
  {
    "key": "65228c34-d4e7-4d8e-a494-b09ee162a92d",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Usługa Testowa 2",
    "czasWykonaniaUslugi": "120",
    "cenaUslugi": 500.0,
    "opisUslugi": "Oto opis oraz test polskich znaków... ćżśćma XDDD"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
688,74,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
690,74,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
692,74,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
694,74,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
696,74,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Chirurgia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
698,74,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "3984b3d7-feeb-4d25-9594-6dd4f3547f47",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kontrola pozabiegowa dla pacjentów Centrum",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 0.0,
    "opisUslugi": "Kontrola pozabiegowa dla pacjentów Centrum"
  },
  {
    "key": "313cdcee-32db-46ea-92ab-b95802358065",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kontrola pozabiegowa dla pacjentów pozostałych",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 50.0,
    "opisUslugi": "Kontrola pozabiegowa dla pacjentów pozostałych"
  },
  {
    "key": "5b979522-eb30-40a5-aaf3-669e273f2b5c",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kwalifikacja do zabiegu",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 50.0,
    "opisUslugi": "Kwalifikacja do zabiegu"
  },
  {
    "key": "afdef961-4762-4a78-9b79-42d9721e54d1",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Plastyka wałów okołopaznokciowych",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 800.0,
    "opisUslugi": "Cena dotyczy 1 palca"
  },
  {
    "key": "ced40776-7b38-4345-91c3-8abef131420b",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Zabieg usunięcia osteofitu",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 900.0,
    "opisUslugi": "Zabieg usunięcia osteofitu"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
730,76,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
732,76,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
734,76,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
736,76,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
738,76,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
740,76,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "Oxybrazja (oxyaquabrazja) nazywana inaczej mikrodermabrazjią wodno-tlenową.\nJest peelingiem mechanicznym\nPolega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej.\nSól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę.\n-pozwala złagodzić okołomieszkowe zapalenie skóry\n-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów\n-wygładza i pojędrnia skórę\n-na ciało pobudza krążenie krwi\n-po kuracjach odmładzających ; napina skórę i działa antycelulitowo\nDo cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej\n\nPrzeciwwskazania :\n\n-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia)\n-wykonany zabieg kwasami (odczekać min. tydzień)\n-przerwanie ciągłości naskórka\n-infekcje skóry (wirusowe, bakteryjne, grzybicze)\n-nowotwory\n-ciężkie choroby ogólnoustrojowe\n-łuszczyca w fazie aktywnej\n-stany zapalne skóry\n-zmiany ropne w obrębie skóry\n-świeże blizny\n-ciąża, laktacja\n-nadciśnienie\n-rozrusznik serca\n-opryszczka\n-diabetycy"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
748,77,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
750,77,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
752,77,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
754,77,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
756,77,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
758,77,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja <em>(oxyaquabrazja)</em> nazywana inaczej mikrodermabrazjią wodno-tlenową.<br />Jest peelingiem mechanicznym<br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej.<br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę.</p>\n<p><br />-pozwala złagodzić okołomieszkowe zapalenie skóry<br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów<br />-wygładza i pojędrnia skórę<br />-na ciało pobudza krążenie krwi<br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo<br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej<br /><br /><strong>Przeciwwskazania :</strong><br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia)<br />-wykonany zabieg kwasami (odczekać min. tydzień)<br />-przerwanie ciągłości naskórka<br />-infekcje skóry (wirusowe, bakteryjne, grzybicze)<br />-nowotwory<br />-ciężkie choroby ogólnoustrojowe<br />-łuszczyca w fazie aktywnej<br />-stany zapalne skóry<br />-zmiany ropne w obrębie skóry<br />-świeże blizny<br />-ciąża, laktacja<br />-nadciśnienie<br />-rozrusznik serca<br />-opryszczka<br />-diabetycy</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
784,78,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
786,78,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
788,78,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
790,78,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
792,78,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
794,78,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja <em>(oxyaquabrazja)</em> nazywana inaczej mikrodermabrazjią wodno-tlenową.<br />Jest peelingiem mechanicznym<br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej.<br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę.</p>\n<p>-pozwala złagodzić okołomieszkowe zapalenie skóry<br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów<br />-wygładza i pojędrnia skórę<br />-na ciało pobudza krążenie krwi<br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo<br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej<br /><strong>Przeciwwskazania :</strong><br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia)<br />-wykonany zabieg kwasami (odczekać min. tydzień)<br />-przerwanie ciągłości naskórka<br />-infekcje skóry (wirusowe, bakteryjne, grzybicze)<br />-nowotwory<br />-ciężkie choroby ogólnoustrojowe<br />-łuszczyca w fazie aktywnej<br />-stany zapalne skóry<br />-zmiany ropne w obrębie skóry<br />-świeże blizny<br />-ciąża, laktacja<br />-nadciśnienie<br />-rozrusznik serca<br />-opryszczka<br />-diabetycy</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
796,75,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
798,75,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
800,75,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
802,75,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
804,75,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Chirurgia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
806,75,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "3984b3d7-feeb-4d25-9594-6dd4f3547f47",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kontrola pozabiegowa dla pacjentów Centrum",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 0.0,
    "opisUslugi": "<p>Kontrola pozabiegowa dla pacjentów Centrum</p>"
  },
  {
    "key": "313cdcee-32db-46ea-92ab-b95802358065",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kontrola pozabiegowa dla pacjentów pozostałych",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 50.0,
    "opisUslugi": "<p>Kontrola pozabiegowa dla pacjentów pozostałych</p>"
  },
  {
    "key": "5b979522-eb30-40a5-aaf3-669e273f2b5c",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kwalifikacja do zabiegu",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 50.0,
    "opisUslugi": "Kwalifikacja do zabiegu"
  },
  {
    "key": "afdef961-4762-4a78-9b79-42d9721e54d1",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Plastyka wałów okołopaznokciowych",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 800.0,
    "opisUslugi": "<p>Cena dotyczy 1 palca</p>"
  },
  {
    "key": "ced40776-7b38-4345-91c3-8abef131420b",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Zabieg usunięcia osteofitu",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 900.0,
    "opisUslugi": "<p>Zabieg usunięcia osteofitu</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
808,79,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
810,79,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
812,79,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
814,79,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
816,79,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
818,79,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja <em>(oxyaquabrazja)</em> nazywana inaczej mikrodermabrazjią wodno-tlenową.<br />Jest peelingiem mechanicznym<br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej.<br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę.</p>\n<p>-pozwala złagodzić okołomieszkowe zapalenie skóry<br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów<br />-wygładza i pojędrnia skórę<br />-na ciało pobudza krążenie krwi<br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo<br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej<br /><strong>Przeciwwskazania :</strong><br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia)<br />-wykonany zabieg kwasami (odczekać min. tydzień)<br />-przerwanie ciągłości naskórka<br />-infekcje skóry (wirusowe, bakteryjne, grzybicze)<br />-nowotwory<br />-ciężkie choroby ogólnoustrojowe<br />-łuszczyca w fazie aktywnej<br />-stany zapalne skóry<br />-zmiany ropne w obrębie skóry<br />-świeże blizny<br />-ciąża, laktacja<br />-nadciśnienie<br />-rozrusznik serca<br />-opryszczka<br />-diabetycy</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
820,81,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
822,81,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
824,81,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
826,81,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
828,81,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
830,81,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja <em>(oxyaquabrazja)</em> nazywana inaczej mikrodermabrazjią wodno-tlenową.<br />Jest peelingiem mechanicznym<br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej.<br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę. -pozwala złagodzić okołomieszkowe zapalenie skóry<br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów<br />-wygładza i pojędrnia skórę<br />-na ciało pobudza krążenie krwi<br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo<br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej<br /><strong>Przeciwwskazania :</strong><br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia)<br />-wykonany zabieg kwasami (odczekać min. tydzień)<br />-przerwanie ciągłości naskórka<br />-infekcje skóry (wirusowe, bakteryjne, grzybicze)<br />-nowotwory<br />-ciężkie choroby ogólnoustrojowe<br />-łuszczyca w fazie aktywnej<br />-stany zapalne skóry<br />-zmiany ropne w obrębie skóry<br />-świeże blizny<br />-ciąża, laktacja<br />-nadciśnienie<br />-rozrusznik serca<br />-opryszczka<br />-diabetycy</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
832,82,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
834,82,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
836,82,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
838,82,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
840,82,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
842,82,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja (oxyaquabrazja) nazywana inaczej mikrodermabrazjią wodno-tlenową. <br />Jest peelingiem mechanicznym <br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej. <br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę. <br />-pozwala złagodzić okołomieszkowe zapalenie skóry <br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów <br />-wygładza i pojędrnia skórę <br />-na ciało pobudza krążenie krwi <br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo <br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej <br /><br /><strong>Przeciwwskazania :</strong> <br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia) <br />-wykonany zabieg kwasami (odczekać min. tydzień) <br />-przerwanie ciągłości naskórka <br />-infekcje skóry (wirusowe, bakteryjne, grzybicze) <br />-nowotwory <br />-ciężkie choroby ogólnoustrojowe <br />-łuszczyca w fazie aktywnej <br />-stany zapalne skóry <br />-zmiany ropne w obrębie skóry <br />-świeże blizny <br />-ciąża, laktacja <br />-nadciśnienie <br />-rozrusznik serca <br />-opryszczka <br />-diabetycy</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
844,83,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
846,83,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
848,83,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
850,83,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
852,83,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
854,83,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja (oxyaquabrazja) nazywana inaczej mikrodermabrazjią wodno-tlenową. <br />Jest peelingiem mechanicznym <br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej. <br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę. <br />-pozwala złagodzić okołomieszkowe zapalenie skóry <br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów <br />-wygładza i pojędrnia skórę <br />-na ciało pobudza krążenie krwi <br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo <br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej <br /><br /><strong>Przeciwwskazania :</strong> <br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia) <br />-wykonany zabieg kwasami (odczekać min. tydzień) <br />-przerwanie ciągłości naskórka <br />-infekcje skóry (wirusowe, bakteryjne, grzybicze) <br />-nowotwory <br />-ciężkie choroby ogólnoustrojowe <br />-łuszczyca w fazie aktywnej <br />-stany zapalne skóry <br />-zmiany ropne w obrębie skóry <br />-świeże blizny <br />-ciąża, laktacja <br />-nadciśnienie <br />-rozrusznik serca <br />-opryszczka <br />-diabetycy</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
856,84,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
858,84,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
860,84,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
862,84,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
864,84,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
866,84,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja (oxyaquabrazja) nazywana inaczej mikrodermabrazjią wodno-tlenową. <br />Jest peelingiem mechanicznym <br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej. <br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę. <br />-pozwala złagodzić okołomieszkowe zapalenie skóry <br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów <br />-wygładza i pojędrnia skórę <br />-na ciało pobudza krążenie krwi <br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo <br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej <br /><br /><strong>Przeciwwskazania :</strong> <br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia) <br />-wykonany zabieg kwasami (odczekać min. tydzień) <br />-przerwanie ciągłości naskórka <br />-infekcje skóry (wirusowe, bakteryjne, grzybicze) <br />-nowotwory <br />-ciężkie choroby ogólnoustrojowe <br />-łuszczyca w fazie aktywnej <br />-stany zapalne skóry <br />-zmiany ropne w obrębie skóry <br />-świeże blizny <br />-ciąża, laktacja <br />-nadciśnienie <br />-rozrusznik serca <br />-opryszczka <br />-diabetycy</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
880,80,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
882,80,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
884,80,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
886,80,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
888,80,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Chirurgia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
890,80,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "3984b3d7-feeb-4d25-9594-6dd4f3547f47",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kontrola pozabiegowa dla pacjentów Centrum",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 0.0,
    "opisUslugi": "<p>Kontrola pozabiegowa dla pacjentów Centrum</p>"
  },
  {
    "key": "313cdcee-32db-46ea-92ab-b95802358065",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kontrola pozabiegowa dla pacjentów pozostałych",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 50.0,
    "opisUslugi": "<p>Kontrola pozabiegowa dla pacjentów pozostałych</p>"
  },
  {
    "key": "5b979522-eb30-40a5-aaf3-669e273f2b5c",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kwalifikacja do zabiegu",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 50.0,
    "opisUslugi": "Kwalifikacja do zabiegu"
  },
  {
    "key": "afdef961-4762-4a78-9b79-42d9721e54d1",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Plastyka wałów okołopaznokciowych",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 800.0,
    "opisUslugi": "<p>Cena dotyczy 1 palca</p>"
  },
  {
    "key": "ced40776-7b38-4345-91c3-8abef131420b",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Zabieg usunięcia osteofitu",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 900.0,
    "opisUslugi": "<p>Zabieg usunięcia osteofitu</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
904,85,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
906,85,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
908,85,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
910,85,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
912,85,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
914,85,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja (oxyaquabrazja) nazywana inaczej mikrodermabrazjią wodno-tlenową. <br />Jest peelingiem mechanicznym <br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej. <br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę. <br />-pozwala złagodzić okołomieszkowe zapalenie skóry <br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów <br />-wygładza i pojędrnia skórę <br />-na ciało pobudza krążenie krwi <br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo <br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej <br /><br /><strong>Przeciwwskazania :</strong> <br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia) <br />-wykonany zabieg kwasami (odczekać min. tydzień) <br />-przerwanie ciągłości naskórka <br />-infekcje skóry (wirusowe, bakteryjne, grzybicze) <br />-nowotwory <br />-ciężkie choroby ogólnoustrojowe <br />-łuszczyca w fazie aktywnej <br />-stany zapalne skóry <br />-zmiany ropne w obrębie skóry <br />-świeże blizny <br />-ciąża, laktacja <br />-nadciśnienie <br />-rozrusznik serca <br />-opryszczka <br />-diabetycy</p>"
  },
  {
    "key": "7332bf29-ba6b-4b5f-aead-31d8eee4257d",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Masaż twarzy, szyi i dekoltu",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, masaż na dobranym preparacie, tonizacja, krem<br />Masaż twarzy nie jest jednak dla każdego. Na masaż twarzy nie powinny decydować się kobiety w ciąży i osoby cierpiące na:<br /><br />liszaj;<br />opryszczkę;<br />trądzik;<br />stany zapalne i ropne w jamie ustnej;<br />gorączkę;<br />powiększone węzły chłonne;<br />stan ropny migdałków;<br />wysokie ciśnienie;<br />zaawansowaną miażdżycę;<br />zakrzepicę;<br />zapalenie żył;<br />choroby nowotworowe.<br /><br />OGÓLNE PRZECIWWSKAZANIA DO MASAŻU KLASYCZNEGO:<br />Ciąża i menstruacja<br />Brak zlecenia lekarskiego<br />Zmiany skórne (rozsiane i ropne)<br />Nowotwory (onkologiczny masaż limfatyczny)<br />Krwawienia, krwotoki lub możliwość ich wystąpienia<br />Hemofilia<br />Żylaki<br />Skaza naczyniowa<br />Nadciśnienie<br />Miażdżyca<br />Wszelkie stany zapalne (RZS w okresie zaostrzenia choroby)<br />Choroby o podłożu bakteryjnym, wirusowym i pasożytniczym<br />Wysoka temperatura ciała (39°C)</p>"
  },
  {
    "key": "2f96e353-a937-4c35-960b-f2532c9c2212",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Masaż twarzy, szyi i dekoltu + maska",
    "czasWykonaniaUslugi": "40",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, masaż, maskę, tonizację i krem.</p>"
  },
  {
    "key": "7c5df320-0c68-4536-8561-f7231df0ae99",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oczyszczanie manualne twarzy",
    "czasWykonaniaUslugi": "90",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, peeling (ziarnisty, enzymatyczny bądź kawitacyjny),oczyszczanie manualne, ampułka, maska, krem.</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
922,87,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
924,87,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
926,87,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
928,87,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
930,87,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
932,87,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja (oxyaquabrazja) nazywana inaczej mikrodermabrazjią wodno-tlenową. <br />Jest peelingiem mechanicznym <br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej. <br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę. <br />-pozwala złagodzić okołomieszkowe zapalenie skóry <br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów <br />-wygładza i pojędrnia skórę <br />-na ciało pobudza krążenie krwi <br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo <br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej <br /><br /><strong>Przeciwwskazania :</strong> <br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia) <br />-wykonany zabieg kwasami (odczekać min. tydzień) <br />-przerwanie ciągłości naskórka <br />-infekcje skóry (wirusowe, bakteryjne, grzybicze) <br />-nowotwory <br />-ciężkie choroby ogólnoustrojowe <br />-łuszczyca w fazie aktywnej <br />-stany zapalne skóry <br />-zmiany ropne w obrębie skóry <br />-świeże blizny <br />-ciąża, laktacja <br />-nadciśnienie <br />-rozrusznik serca <br />-opryszczka <br />-diabetycy</p>"
  },
  {
    "key": "7332bf29-ba6b-4b5f-aead-31d8eee4257d",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Masaż twarzy, szyi i dekoltu",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, masaż na dobranym preparacie, tonizacja, krem<br />Masaż twarzy nie jest jednak dla każdego. Na masaż twarzy nie powinny decydować się kobiety w ciąży i osoby cierpiące na:<br /><br />liszaj;<br />opryszczkę;<br />trądzik;<br />stany zapalne i ropne w jamie ustnej;<br />gorączkę;<br />powiększone węzły chłonne;<br />stan ropny migdałków;<br />wysokie ciśnienie;<br />zaawansowaną miażdżycę;<br />zakrzepicę;<br />zapalenie żył;<br />choroby nowotworowe.<br /><br />OGÓLNE PRZECIWWSKAZANIA DO MASAŻU KLASYCZNEGO:<br />Ciąża i menstruacja<br />Brak zlecenia lekarskiego<br />Zmiany skórne (rozsiane i ropne)<br />Nowotwory (onkologiczny masaż limfatyczny)<br />Krwawienia, krwotoki lub możliwość ich wystąpienia<br />Hemofilia<br />Żylaki<br />Skaza naczyniowa<br />Nadciśnienie<br />Miażdżyca<br />Wszelkie stany zapalne (RZS w okresie zaostrzenia choroby)<br />Choroby o podłożu bakteryjnym, wirusowym i pasożytniczym<br />Wysoka temperatura ciała (39°C)</p>"
  },
  {
    "key": "2f96e353-a937-4c35-960b-f2532c9c2212",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Masaż twarzy, szyi i dekoltu + maska",
    "czasWykonaniaUslugi": "40",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, masaż, maskę, tonizację i krem.</p>"
  },
  {
    "key": "7c5df320-0c68-4536-8561-f7231df0ae99",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oczyszczanie manualne twarzy",
    "czasWykonaniaUslugi": "90",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, peeling (ziarnisty, enzymatyczny bądź kawitacyjny),oczyszczanie manualne, ampułka, maska, krem.</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
934,89,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
936,89,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
938,89,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
940,89,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
942,89,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Masaż i Pielęgnacja',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
944,89,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "17ded365-4710-4110-b36f-f0ce9b2691c3",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "test",
    "czasWykonaniaUslugi": "test",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>sdfghfhkjhkfghgdsg</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
946,90,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
948,90,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
950,90,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
952,90,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
954,90,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Masaż i Pielęgnacja',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
956,90,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "17ded365-4710-4110-b36f-f0ce9b2691c3",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "test",
    "czasWykonaniaUslugi": "test",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>sdfghfhkjhkfghgdsg</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
964,92,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
966,92,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
968,92,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
970,92,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
972,92,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Podologia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
974,92,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a197e038-b0fb-4dae-82c1-17b72877397e",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Test",
    "czasWykonaniaUslugi": "Test",
    "cenaUslugi": 10.0,
    "opisUslugi": "<p>TEST</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
976,94,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
978,94,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
980,94,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
982,94,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
984,94,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Dłonie i paznokcie',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
986,94,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "9f6657c6-9dde-445d-87ed-0a15cc564051",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "+48 697 779 768",
    "czasWykonaniaUslugi": "+48 697 779 768",
    "cenaUslugi": 40.0,
    "opisUslugi": "<p>sfdsdsaasd</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
988,68,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
990,68,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
992,68,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
994,68,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
996,68,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center - Galeria',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
998,68,75,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/de3a267ff0604da095ed93229f76953c,umb://media/af1ba5e373a84d3ca83641c99a791859,umb://media/8be2281bfde24132a2316db09ad01b03,umb://media/599cf43e689842d5a464c4b8e3901127,umb://media/43ba5c2246c14ffd87873404cee217c4,umb://media/ced17de93ee245caa8aff962df2ceb3d,umb://media/79277694711b401997732242c7e35a98,umb://media/41a095122edd4a6aa0c1a7e4219a8484,umb://media/55f48754556f4b0391dd89955fa58506,umb://media/42db1120d1a2406f882067c05978127e,umb://media/ca3a19743bb749b8a15c426fcaeb3520');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1000,49,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1002,49,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1004,49,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1006,49,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1008,49,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1012,49,73,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1014,49,74,NULL,NULL,NULL,NULL,NULL,N'Kosmetologia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1016,97,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1018,97,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1020,97,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1022,97,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1024,97,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1026,97,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1028,97,73,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1030,97,74,NULL,NULL,NULL,NULL,NULL,N'Kosmetologia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1032,96,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1033,99,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1034,96,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1035,99,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1036,96,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1037,99,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1038,96,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1039,99,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1040,96,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center - Galeria',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1041,99,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center - Galeria',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1042,96,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1043,99,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1044,96,75,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/de3a267ff0604da095ed93229f76953c,umb://media/af1ba5e373a84d3ca83641c99a791859,umb://media/8be2281bfde24132a2316db09ad01b03,umb://media/599cf43e689842d5a464c4b8e3901127,umb://media/43ba5c2246c14ffd87873404cee217c4,umb://media/ced17de93ee245caa8aff962df2ceb3d,umb://media/79277694711b401997732242c7e35a98,umb://media/41a095122edd4a6aa0c1a7e4219a8484,umb://media/55f48754556f4b0391dd89955fa58506,umb://media/42db1120d1a2406f882067c05978127e,umb://media/ca3a19743bb749b8a15c426fcaeb3520');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1045,99,75,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/de3a267ff0604da095ed93229f76953c,umb://media/af1ba5e373a84d3ca83641c99a791859,umb://media/8be2281bfde24132a2316db09ad01b03,umb://media/599cf43e689842d5a464c4b8e3901127,umb://media/43ba5c2246c14ffd87873404cee217c4,umb://media/ced17de93ee245caa8aff962df2ceb3d,umb://media/79277694711b401997732242c7e35a98,umb://media/41a095122edd4a6aa0c1a7e4219a8484,umb://media/55f48754556f4b0391dd89955fa58506,umb://media/42db1120d1a2406f882067c05978127e,umb://media/ca3a19743bb749b8a15c426fcaeb3520');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1046,86,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1047,100,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1048,86,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1049,100,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1050,86,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1051,100,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1052,86,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1053,100,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1054,86,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Chirurgia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1055,100,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Chirurgia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1056,86,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1057,100,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1058,86,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "3984b3d7-feeb-4d25-9594-6dd4f3547f47",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kontrola pozabiegowa dla pacjentów Centrum",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 0.0,
    "opisUslugi": "<p>Kontrola pozabiegowa dla pacjentów Centrum</p>"
  },
  {
    "key": "313cdcee-32db-46ea-92ab-b95802358065",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kontrola pozabiegowa dla pacjentów pozostałych",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 50.0,
    "opisUslugi": "<p>Kontrola pozabiegowa dla pacjentów pozostałych</p>"
  },
  {
    "key": "5b979522-eb30-40a5-aaf3-669e273f2b5c",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kwalifikacja do zabiegu",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 50.0,
    "opisUslugi": "Kwalifikacja do zabiegu"
  },
  {
    "key": "afdef961-4762-4a78-9b79-42d9721e54d1",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Plastyka wałów okołopaznokciowych",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 800.0,
    "opisUslugi": "<p>Cena dotyczy 1 palca</p>"
  },
  {
    "key": "ced40776-7b38-4345-91c3-8abef131420b",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Zabieg usunięcia osteofitu",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 900.0,
    "opisUslugi": "<p>Zabieg usunięcia osteofitu</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1059,100,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "3984b3d7-feeb-4d25-9594-6dd4f3547f47",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kontrola pozabiegowa dla pacjentów Centrum",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 0.0,
    "opisUslugi": "<p>Kontrola pozabiegowa dla pacjentów Centrum</p>"
  },
  {
    "key": "313cdcee-32db-46ea-92ab-b95802358065",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kontrola pozabiegowa dla pacjentów pozostałych",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 50.0,
    "opisUslugi": "<p>Kontrola pozabiegowa dla pacjentów pozostałych</p>"
  },
  {
    "key": "5b979522-eb30-40a5-aaf3-669e273f2b5c",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Kwalifikacja do zabiegu",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 50.0,
    "opisUslugi": "Kwalifikacja do zabiegu"
  },
  {
    "key": "afdef961-4762-4a78-9b79-42d9721e54d1",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Plastyka wałów okołopaznokciowych",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 800.0,
    "opisUslugi": "<p>Cena dotyczy 1 palca</p>"
  },
  {
    "key": "ced40776-7b38-4345-91c3-8abef131420b",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Zabieg usunięcia osteofitu",
    "czasWykonaniaUslugi": "60",
    "cenaUslugi": 900.0,
    "opisUslugi": "<p>Zabieg usunięcia osteofitu</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1060,88,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1062,88,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1064,88,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1066,88,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1068,88,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1070,88,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1072,88,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja (oxyaquabrazja) nazywana inaczej mikrodermabrazjią wodno-tlenową. <br />Jest peelingiem mechanicznym <br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej. <br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę. <br />-pozwala złagodzić okołomieszkowe zapalenie skóry <br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów <br />-wygładza i pojędrnia skórę <br />-na ciało pobudza krążenie krwi <br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo <br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej <br /><br /><strong>Przeciwwskazania :</strong> <br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia) <br />-wykonany zabieg kwasami (odczekać min. tydzień) <br />-przerwanie ciągłości naskórka <br />-infekcje skóry (wirusowe, bakteryjne, grzybicze) <br />-nowotwory <br />-ciężkie choroby ogólnoustrojowe <br />-łuszczyca w fazie aktywnej <br />-stany zapalne skóry <br />-zmiany ropne w obrębie skóry <br />-świeże blizny <br />-ciąża, laktacja <br />-nadciśnienie <br />-rozrusznik serca <br />-opryszczka <br />-diabetycy</p>"
  },
  {
    "key": "7332bf29-ba6b-4b5f-aead-31d8eee4257d",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Masaż twarzy, szyi i dekoltu",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, masaż na dobranym preparacie, tonizacja, krem<br />Masaż twarzy nie jest jednak dla każdego. Na masaż twarzy nie powinny decydować się kobiety w ciąży i osoby cierpiące na:<br /><br />liszaj;<br />opryszczkę;<br />trądzik;<br />stany zapalne i ropne w jamie ustnej;<br />gorączkę;<br />powiększone węzły chłonne;<br />stan ropny migdałków;<br />wysokie ciśnienie;<br />zaawansowaną miażdżycę;<br />zakrzepicę;<br />zapalenie żył;<br />choroby nowotworowe.<br /><br />OGÓLNE PRZECIWWSKAZANIA DO MASAŻU KLASYCZNEGO:<br />Ciąża i menstruacja<br />Brak zlecenia lekarskiego<br />Zmiany skórne (rozsiane i ropne)<br />Nowotwory (onkologiczny masaż limfatyczny)<br />Krwawienia, krwotoki lub możliwość ich wystąpienia<br />Hemofilia<br />Żylaki<br />Skaza naczyniowa<br />Nadciśnienie<br />Miażdżyca<br />Wszelkie stany zapalne (RZS w okresie zaostrzenia choroby)<br />Choroby o podłożu bakteryjnym, wirusowym i pasożytniczym<br />Wysoka temperatura ciała (39°C)</p>"
  },
  {
    "key": "2f96e353-a937-4c35-960b-f2532c9c2212",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Masaż twarzy, szyi i dekoltu + maska",
    "czasWykonaniaUslugi": "40",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, masaż, maskę, tonizację i krem.</p>"
  },
  {
    "key": "7c5df320-0c68-4536-8561-f7231df0ae99",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oczyszczanie manualne twarzy",
    "czasWykonaniaUslugi": "90",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, peeling (ziarnisty, enzymatyczny bądź kawitacyjny),oczyszczanie manualne, ampułka, maska, krem.</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1074,101,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1075,102,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1076,101,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1077,102,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1078,101,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1079,102,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1080,101,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1081,102,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1082,101,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1083,102,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Kosmetyka',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1084,101,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1085,102,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1086,101,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja (oxyaquabrazja) nazywana inaczej mikrodermabrazjią wodno-tlenową. <br />Jest peelingiem mechanicznym <br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej. <br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę. <br />-pozwala złagodzić okołomieszkowe zapalenie skóry <br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów <br />-wygładza i pojędrnia skórę <br />-na ciało pobudza krążenie krwi <br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo <br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej <br /><br /><strong>Przeciwwskazania :</strong> <br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia) <br />-wykonany zabieg kwasami (odczekać min. tydzień) <br />-przerwanie ciągłości naskórka <br />-infekcje skóry (wirusowe, bakteryjne, grzybicze) <br />-nowotwory <br />-ciężkie choroby ogólnoustrojowe <br />-łuszczyca w fazie aktywnej <br />-stany zapalne skóry <br />-zmiany ropne w obrębie skóry <br />-świeże blizny <br />-ciąża, laktacja <br />-nadciśnienie <br />-rozrusznik serca <br />-opryszczka <br />-diabetycy</p>"
  },
  {
    "key": "7332bf29-ba6b-4b5f-aead-31d8eee4257d",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Masaż twarzy, szyi i dekoltu",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, masaż na dobranym preparacie, tonizacja, krem<br />Masaż twarzy nie jest jednak dla każdego. Na masaż twarzy nie powinny decydować się kobiety w ciąży i osoby cierpiące na:<br /><br />liszaj;<br />opryszczkę;<br />trądzik;<br />stany zapalne i ropne w jamie ustnej;<br />gorączkę;<br />powiększone węzły chłonne;<br />stan ropny migdałków;<br />wysokie ciśnienie;<br />zaawansowaną miażdżycę;<br />zakrzepicę;<br />zapalenie żył;<br />choroby nowotworowe.<br /><br />OGÓLNE PRZECIWWSKAZANIA DO MASAŻU KLASYCZNEGO:<br />Ciąża i menstruacja<br />Brak zlecenia lekarskiego<br />Zmiany skórne (rozsiane i ropne)<br />Nowotwory (onkologiczny masaż limfatyczny)<br />Krwawienia, krwotoki lub możliwość ich wystąpienia<br />Hemofilia<br />Żylaki<br />Skaza naczyniowa<br />Nadciśnienie<br />Miażdżyca<br />Wszelkie stany zapalne (RZS w okresie zaostrzenia choroby)<br />Choroby o podłożu bakteryjnym, wirusowym i pasożytniczym<br />Wysoka temperatura ciała (39°C)</p>"
  },
  {
    "key": "2f96e353-a937-4c35-960b-f2532c9c2212",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Masaż twarzy, szyi i dekoltu + maska",
    "czasWykonaniaUslugi": "40",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, masaż, maskę, tonizację i krem.</p>"
  },
  {
    "key": "7c5df320-0c68-4536-8561-f7231df0ae99",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oczyszczanie manualne twarzy",
    "czasWykonaniaUslugi": "90",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, peeling (ziarnisty, enzymatyczny bądź kawitacyjny),oczyszczanie manualne, ampułka, maska, krem.</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1087,102,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a28c6c86-143c-42eb-a6b3-4c8f32ca7d79",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oxybrazja",
    "czasWykonaniaUslugi": "60 - 70",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Oxybrazja (oxyaquabrazja) nazywana inaczej mikrodermabrazjią wodno-tlenową. <br />Jest peelingiem mechanicznym <br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej. <br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę. <br />-pozwala złagodzić okołomieszkowe zapalenie skóry <br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów <br />-wygładza i pojędrnia skórę <br />-na ciało pobudza krążenie krwi <br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo <br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej <br /><br /><strong>Przeciwwskazania :</strong> <br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia) <br />-wykonany zabieg kwasami (odczekać min. tydzień) <br />-przerwanie ciągłości naskórka <br />-infekcje skóry (wirusowe, bakteryjne, grzybicze) <br />-nowotwory <br />-ciężkie choroby ogólnoustrojowe <br />-łuszczyca w fazie aktywnej <br />-stany zapalne skóry <br />-zmiany ropne w obrębie skóry <br />-świeże blizny <br />-ciąża, laktacja <br />-nadciśnienie <br />-rozrusznik serca <br />-opryszczka <br />-diabetycy</p>"
  },
  {
    "key": "7332bf29-ba6b-4b5f-aead-31d8eee4257d",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Masaż twarzy, szyi i dekoltu",
    "czasWykonaniaUslugi": "30",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, masaż na dobranym preparacie, tonizacja, krem<br />Masaż twarzy nie jest jednak dla każdego. Na masaż twarzy nie powinny decydować się kobiety w ciąży i osoby cierpiące na:<br /><br />liszaj;<br />opryszczkę;<br />trądzik;<br />stany zapalne i ropne w jamie ustnej;<br />gorączkę;<br />powiększone węzły chłonne;<br />stan ropny migdałków;<br />wysokie ciśnienie;<br />zaawansowaną miażdżycę;<br />zakrzepicę;<br />zapalenie żył;<br />choroby nowotworowe.<br /><br />OGÓLNE PRZECIWWSKAZANIA DO MASAŻU KLASYCZNEGO:<br />Ciąża i menstruacja<br />Brak zlecenia lekarskiego<br />Zmiany skórne (rozsiane i ropne)<br />Nowotwory (onkologiczny masaż limfatyczny)<br />Krwawienia, krwotoki lub możliwość ich wystąpienia<br />Hemofilia<br />Żylaki<br />Skaza naczyniowa<br />Nadciśnienie<br />Miażdżyca<br />Wszelkie stany zapalne (RZS w okresie zaostrzenia choroby)<br />Choroby o podłożu bakteryjnym, wirusowym i pasożytniczym<br />Wysoka temperatura ciała (39°C)</p>"
  },
  {
    "key": "2f96e353-a937-4c35-960b-f2532c9c2212",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Masaż twarzy, szyi i dekoltu + maska",
    "czasWykonaniaUslugi": "40",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, masaż, maskę, tonizację i krem.</p>"
  },
  {
    "key": "7c5df320-0c68-4536-8561-f7231df0ae99",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Oczyszczanie manualne twarzy",
    "czasWykonaniaUslugi": "90",
    "cenaUslugi": 150.0,
    "opisUslugi": "<p>Usługa obejmuje:<br /><br />demakijaż, peeling (ziarnisty, enzymatyczny bądź kawitacyjny),oczyszczanie manualne, ampułka, maska, krem.</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1088,91,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1089,103,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1090,91,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1091,103,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1092,91,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1093,103,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1094,91,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1095,103,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1096,91,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Masaż i Pielęgnacja',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1097,103,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Masaż i Pielęgnacja',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1098,91,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1099,103,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1100,91,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "17ded365-4710-4110-b36f-f0ce9b2691c3",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "test",
    "czasWykonaniaUslugi": "test",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>sdfghfhkjhkfghgdsg</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1101,103,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "17ded365-4710-4110-b36f-f0ce9b2691c3",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "test",
    "czasWykonaniaUslugi": "test",
    "cenaUslugi": 80.0,
    "opisUslugi": "<p>sdfghfhkjhkfghgdsg</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1102,93,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1103,104,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1104,93,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1105,104,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1106,93,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1107,104,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1108,93,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1109,104,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1110,93,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Podologia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1111,104,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Podologia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1112,93,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1113,104,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1114,93,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a197e038-b0fb-4dae-82c1-17b72877397e",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Test",
    "czasWykonaniaUslugi": "Test",
    "cenaUslugi": 10.0,
    "opisUslugi": "<p>TEST</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1115,104,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "a197e038-b0fb-4dae-82c1-17b72877397e",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "Test",
    "czasWykonaniaUslugi": "Test",
    "cenaUslugi": 10.0,
    "opisUslugi": "<p>TEST</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1116,95,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1117,105,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1118,95,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1119,105,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1120,95,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1121,105,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1122,95,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1123,105,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1124,95,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Dłonie i paznokcie',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1125,105,72,NULL,NULL,NULL,NULL,NULL,N'Cennik - Dłonie i paznokcie',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1126,95,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1127,105,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1128,95,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "9f6657c6-9dde-445d-87ed-0a15cc564051",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "+48 697 779 768",
    "czasWykonaniaUslugi": "+48 697 779 768",
    "cenaUslugi": 40.0,
    "opisUslugi": "<p>sfdsdsaasd</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1129,105,83,NULL,NULL,NULL,NULL,NULL,NULL,N'[
  {
    "key": "9f6657c6-9dde-445d-87ed-0a15cc564051",
    "name": "Usługa",
    "ncContentTypeAlias": "cennikDocument",
    "nazwaUslugi": "+48 697 779 768",
    "czasWykonaniaUslugi": "+48 697 779 768",
    "cenaUslugi": 40.0,
    "opisUslugi": "<p>sfdsdsaasd</p>"
  }
]');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1130,98,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1131,106,66,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1132,98,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1133,106,68,NULL,NULL,NULL,NULL,NULL,N'+48 697 779 768',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1134,98,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1135,106,69,NULL,NULL,NULL,NULL,NULL,N'kontakt@emi-center.pl',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1136,98,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1137,106,70,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/615e84dd7c7344f09f2706b0aea2efff');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1138,98,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1139,106,72,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1140,98,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1141,106,85,NULL,NULL,NULL,NULL,NULL,NULL,N'umb://media/0347e667726541af95585b875808cf38');
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1142,98,73,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1143,106,73,NULL,NULL,NULL,NULL,NULL,N'Emi-Center',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1144,98,74,NULL,NULL,NULL,NULL,NULL,N'Kosmetologia',NULL);
GO
INSERT INTO [umbracoPropertyData] ([id],[versionId],[propertyTypeId],[languageId],[segment],[intValue],[decimalValue],[dateValue],[varcharValue],[textValue]) VALUES (
1145,106,74,NULL,NULL,NULL,NULL,NULL,N'Kosmetologia',NULL);
GO
SET IDENTITY_INSERT [umbracoPropertyData] OFF;
GO
SET IDENTITY_INSERT [cmsMemberType] OFF;
GO
SET IDENTITY_INSERT [cmsMacro] OFF;
GO
SET IDENTITY_INSERT [cmsMacroProperty] OFF;
GO
SET IDENTITY_INSERT [cmsLanguageText] OFF;
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1111,1110,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1111,1118,0);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1111,1143,0);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1112,1068,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1116,1118,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1140,1110,0);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1140,1143,1);
GO
SET IDENTITY_INSERT [cmsDictionary] ON;
GO
INSERT INTO [cmsDictionary] ([pk],[id],[parent],[key]) VALUES (
1,'350c19f0-d483-47d4-bf9a-858f4e45cbdb',NULL,N'Polski');
GO
SET IDENTITY_INSERT [cmsDictionary] OFF;
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1031,1031,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1031,1032,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1031,1033,0);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1111,1112);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1111,1116);
GO
INSERT INTO [cmsContentType2ContentType] ([parentContentTypeId],[childContentTypeId]) VALUES (
1111,1140);
GO
SET IDENTITY_INSERT [cmsContentType] ON;
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
531,1044,N'Member',N'icon-user',N'icon-user',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
532,1031,N'Folder',N'icon-folder',N'icon-folder',NULL,0,0,1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
533,1032,N'Image',N'icon-picture',N'icon-picture',NULL,0,0,1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
534,1033,N'File',N'icon-document',N'icon-document',NULL,0,0,1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
539,1111,N'master',N'icon-zip color-black',N'folder.png',NULL,0,0,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
540,1112,N'stronaGlowna',N'icon-home color-black',N'folder.png',NULL,0,0,1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
541,1116,N'galeria',N'icon-photo-album color-black',N'folder.png',NULL,0,0,1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
544,1138,N'cennikDocument',N'icon-receipt-euro color-black',N'folder.png',NULL,1,1,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[isElement],[allowAtRoot],[variations]) VALUES (
545,1140,N'cennik',N'icon-receipt-euro color-black',N'folder.png',NULL,0,0,1,0);
GO
SET IDENTITY_INSERT [cmsContentType] OFF;
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1071,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"/media/ednockrx/bg-1.webp"}],"umbracoExtension":[{"culture":"","seg":"","val":"webp"}],"umbracoBytes":[{"culture":"","seg":"","val":"107174"}]},"cultureData":{},"urlSegment":"bg-1"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1072,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\r\n  \"crops\": null,\r\n  \"focalPoint\": {\r\n    \"left\": 0.5,\r\n    \"top\": 0.5\r\n  },\r\n  \"src\": \"/media/ws2pzmy2/bg-1.webp\"\r\n}"}],"umbracoWidth":[],"umbracoHeight":[],"umbracoBytes":[{"culture":"","seg":"","val":"107174"}],"umbracoExtension":[{"culture":"","seg":"","val":"webp"}]},"cultureData":{},"urlSegment":"emi-center-background"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1073,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"/media/354h11cj/bg-1.webp"}],"umbracoExtension":[{"culture":"","seg":"","val":"webp"}],"umbracoBytes":[{"culture":"","seg":"","val":"107174"}]},"cultureData":{},"urlSegment":"bg-1-1"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1074,0,N'{"properties":{},"cultureData":{},"urlSegment":"images"}',2);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1075,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"/media/p5teoa1f/bg-1.webp"}],"umbracoExtension":[{"culture":"","seg":"","val":"webp"}],"umbracoBytes":[{"culture":"","seg":"","val":"107174"}]},"cultureData":{},"urlSegment":"bg-1"}',2);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1086,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"/media/ywcf2ylt/logo.webp"}],"umbracoExtension":[{"culture":"","seg":"","val":"webp"}],"umbracoBytes":[{"culture":"","seg":"","val":"28916"}]},"cultureData":{},"urlSegment":"logo"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1090,0,N'{"properties":{},"cultureData":{},"urlSegment":"galeria"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1091,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/q02ddeoa/img-1.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":780}],"umbracoHeight":[{"culture":"","seg":"","val":519}],"umbracoBytes":[{"culture":"","seg":"","val":"37974"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-1"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1092,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/n20gzrve/img-2.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":720}],"umbracoHeight":[{"culture":"","seg":"","val":960}],"umbracoBytes":[{"culture":"","seg":"","val":"64696"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-2"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1093,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/xaggvw2m/img-3.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":780}],"umbracoHeight":[{"culture":"","seg":"","val":519}],"umbracoBytes":[{"culture":"","seg":"","val":"37974"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-3"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1094,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/mk2ngrzf/img-4.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1984}],"umbracoHeight":[{"culture":"","seg":"","val":1120}],"umbracoBytes":[{"culture":"","seg":"","val":"164253"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-4"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1095,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/esqjl0nl/img-5.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1386}],"umbracoHeight":[{"culture":"","seg":"","val":2048}],"umbracoBytes":[{"culture":"","seg":"","val":"159683"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-5"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1096,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/ioulty0s/img-6.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1000}],"umbracoHeight":[{"culture":"","seg":"","val":375}],"umbracoBytes":[{"culture":"","seg":"","val":"78614"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-6"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1097,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/ww0pkvvw/img-7.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":984}],"umbracoHeight":[{"culture":"","seg":"","val":1370}],"umbracoBytes":[{"culture":"","seg":"","val":"113650"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-7"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1098,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/opmncpob/img-8.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1536}],"umbracoHeight":[{"culture":"","seg":"","val":2048}],"umbracoBytes":[{"culture":"","seg":"","val":"179356"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-8"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1099,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/crlghml0/img-9.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":720}],"umbracoHeight":[{"culture":"","seg":"","val":960}],"umbracoBytes":[{"culture":"","seg":"","val":"36639"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-9"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1100,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/d4whxtrj/img-10.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1536}],"umbracoHeight":[{"culture":"","seg":"","val":2048}],"umbracoBytes":[{"culture":"","seg":"","val":"145826"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-10"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1101,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/5mshxuva/img-11.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1373}],"umbracoHeight":[{"culture":"","seg":"","val":962}],"umbracoBytes":[{"culture":"","seg":"","val":"169018"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-11"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1113,0,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Emi-Center"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"tytulH1":[{"culture":"","seg":"","val":"Emi-Center"}],"tytulCenter":[{"culture":"","seg":"","val":"Kosmetologia"}]},"cultureData":{},"urlSegment":"strona-glowna"}',2);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1113,1,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Emi-Center"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"tytulH1":[{"culture":"","seg":"","val":"Emi-Center"}],"tytulCenter":[{"culture":"","seg":"","val":"Kosmetologia"}]},"cultureData":{},"urlSegment":"strona-glowna"}',2);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1119,0,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Emi-Center - Galeria"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"zdjeciaGalerii":[{"culture":"","seg":"","val":"umb://media/de3a267ff0604da095ed93229f76953c,umb://media/af1ba5e373a84d3ca83641c99a791859,umb://media/8be2281bfde24132a2316db09ad01b03,umb://media/599cf43e689842d5a464c4b8e3901127,umb://media/43ba5c2246c14ffd87873404cee217c4,umb://media/ced17de93ee245caa8aff962df2ceb3d,umb://media/79277694711b401997732242c7e35a98,umb://media/41a095122edd4a6aa0c1a7e4219a8484,umb://media/55f48754556f4b0391dd89955fa58506,umb://media/42db1120d1a2406f882067c05978127e,umb://media/ca3a19743bb749b8a15c426fcaeb3520"}]},"cultureData":{},"urlSegment":"galeria"}',6);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1119,1,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Emi-Center - Galeria"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"zdjeciaGalerii":[{"culture":"","seg":"","val":"umb://media/de3a267ff0604da095ed93229f76953c,umb://media/af1ba5e373a84d3ca83641c99a791859,umb://media/8be2281bfde24132a2316db09ad01b03,umb://media/599cf43e689842d5a464c4b8e3901127,umb://media/43ba5c2246c14ffd87873404cee217c4,umb://media/ced17de93ee245caa8aff962df2ceb3d,umb://media/79277694711b401997732242c7e35a98,umb://media/41a095122edd4a6aa0c1a7e4219a8484,umb://media/55f48754556f4b0391dd89955fa58506,umb://media/42db1120d1a2406f882067c05978127e,umb://media/ca3a19743bb749b8a15c426fcaeb3520"}]},"cultureData":{},"urlSegment":"galeria"}',5);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1120,0,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"00"}],"telefonFirmowy":[{"culture":"","seg":"","val":"01"}],"adresMailowy":[{"culture":"","seg":"","val":"wp"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Emi-Center Galeria"}],"zdjeciaGalerii":[{"culture":"","seg":"","val":"umb://media/d26b25fd79a04e0ab08d63543b5fb23f,umb://media/ce6bad19f22942a091f3eb23abebddd6,umb://media/b1635612277a46c29644fb20e7a67916,umb://media/3dc1d97511c148e6af403e7250fcb7c2,umb://media/56f5b4b33db64a6da84170b6ed593595,umb://media/e3b9a84507524c21805650db413eb67b,umb://media/e985a12292ab4bce943ba63ce770f21c,umb://media/47d3b9646625473cac27c7ca20517ab1,umb://media/db6a0cbe5b8c4f5a81477b62098a924b,umb://media/c66c3469c4a443e1bd1ef8b4916aa5b3,umb://media/9121b98096c04224bd2f6d1d64ad3b51"}]},"cultureData":{},"urlSegment":"galeria"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1121,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/petdvxta/img-1.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":780}],"umbracoHeight":[{"culture":"","seg":"","val":519}],"umbracoBytes":[{"culture":"","seg":"","val":"37974"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-1"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1122,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/2wsbxl3i/img-2.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":720}],"umbracoHeight":[{"culture":"","seg":"","val":960}],"umbracoBytes":[{"culture":"","seg":"","val":"64696"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-2"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1123,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/duuofc5c/img-3.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":780}],"umbracoHeight":[{"culture":"","seg":"","val":519}],"umbracoBytes":[{"culture":"","seg":"","val":"37974"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-3"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1124,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/hd0jywmy/img-4.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1984}],"umbracoHeight":[{"culture":"","seg":"","val":1120}],"umbracoBytes":[{"culture":"","seg":"","val":"164253"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-4"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1125,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/eroluq4b/img-5.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1386}],"umbracoHeight":[{"culture":"","seg":"","val":2048}],"umbracoBytes":[{"culture":"","seg":"","val":"159683"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-5"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1126,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/334ndtxc/img-6.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1000}],"umbracoHeight":[{"culture":"","seg":"","val":375}],"umbracoBytes":[{"culture":"","seg":"","val":"78614"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-6"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1127,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/sj1co4i1/img-7.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":984}],"umbracoHeight":[{"culture":"","seg":"","val":1370}],"umbracoBytes":[{"culture":"","seg":"","val":"113650"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-7"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1128,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/csklaqo3/img-8.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1536}],"umbracoHeight":[{"culture":"","seg":"","val":2048}],"umbracoBytes":[{"culture":"","seg":"","val":"179356"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-8"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1129,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/kkdpivlp/img-9.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":720}],"umbracoHeight":[{"culture":"","seg":"","val":960}],"umbracoBytes":[{"culture":"","seg":"","val":"36639"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-9"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1130,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/eyinwqvc/img-10.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1536}],"umbracoHeight":[{"culture":"","seg":"","val":2048}],"umbracoBytes":[{"culture":"","seg":"","val":"145826"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-10"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1131,0,N'{"properties":{"umbracoFile":[{"culture":"","seg":"","val":"{\"src\":\"/media/oimdvsvx/img-11.jpg\",\"crops\":null}"}],"umbracoWidth":[{"culture":"","seg":"","val":1373}],"umbracoHeight":[{"culture":"","seg":"","val":962}],"umbracoBytes":[{"culture":"","seg":"","val":"169018"}],"umbracoExtension":[{"culture":"","seg":"","val":"jpg"}]},"cultureData":{},"urlSegment":"img-11"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1144,0,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"00"}],"telefonFirmowy":[{"culture":"","seg":"","val":"00"}],"adresMailowy":[{"culture":"","seg":"","val":"00"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik Usług 1 "}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"ed19ebb6-1ed8-453c-b7bf-661da7c206e6\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Jakaś Usługa Testowa\",\r\n    \"czasWykonaniaUslugi\": \"60\",\r\n    \"cenaUslugi\": 50.0,\r\n    \"opisUslugi\": \"Lorem ipsum dolor... \"\r\n  },\r\n  {\r\n    \"key\": \"65228c34-d4e7-4d8e-a494-b09ee162a92d\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Usługa Testowa 2\",\r\n    \"czasWykonaniaUslugi\": \"120\",\r\n    \"cenaUslugi\": 500.0,\r\n    \"opisUslugi\": \"Oto opis oraz test polskich znaków... ćżśćma XDDD\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-1"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1144,1,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"00"}],"telefonFirmowy":[{"culture":"","seg":"","val":"00"}],"adresMailowy":[{"culture":"","seg":"","val":"00"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik Usług 1 "}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"ed19ebb6-1ed8-453c-b7bf-661da7c206e6\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Jakaś Usługa Testowa\",\r\n    \"czasWykonaniaUslugi\": \"60\",\r\n    \"cenaUslugi\": 50.0,\r\n    \"opisUslugi\": \"Lorem ipsum dolor... \"\r\n  },\r\n  {\r\n    \"key\": \"65228c34-d4e7-4d8e-a494-b09ee162a92d\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Usługa Testowa 2\",\r\n    \"czasWykonaniaUslugi\": \"120\",\r\n    \"cenaUslugi\": 500.0,\r\n    \"opisUslugi\": \"Oto opis oraz test polskich znaków... ćżśćma XDDD\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-1"}',0);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1146,0,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik - Chirurgia"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"3984b3d7-feeb-4d25-9594-6dd4f3547f47\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Kontrola pozabiegowa dla pacjentów Centrum\",\r\n    \"czasWykonaniaUslugi\": \"30\",\r\n    \"cenaUslugi\": 0.0,\r\n    \"opisUslugi\": \"<p>Kontrola pozabiegowa dla pacjentów Centrum</p>\"\r\n  },\r\n  {\r\n    \"key\": \"313cdcee-32db-46ea-92ab-b95802358065\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Kontrola pozabiegowa dla pacjentów pozostałych\",\r\n    \"czasWykonaniaUslugi\": \"30\",\r\n    \"cenaUslugi\": 50.0,\r\n    \"opisUslugi\": \"<p>Kontrola pozabiegowa dla pacjentów pozostałych</p>\"\r\n  },\r\n  {\r\n    \"key\": \"5b979522-eb30-40a5-aaf3-669e273f2b5c\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Kwalifikacja do zabiegu\",\r\n    \"czasWykonaniaUslugi\": \"30\",\r\n    \"cenaUslugi\": 50.0,\r\n    \"opisUslugi\": \"Kwalifikacja do zabiegu\"\r\n  },\r\n  {\r\n    \"key\": \"afdef961-4762-4a78-9b79-42d9721e54d1\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Plastyka wałów okołopaznokciowych\",\r\n    \"czasWykonaniaUslugi\": \"60\",\r\n    \"cenaUslugi\": 800.0,\r\n    \"opisUslugi\": \"<p>Cena dotyczy 1 palca</p>\"\r\n  },\r\n  {\r\n    \"key\": \"ced40776-7b38-4345-91c3-8abef131420b\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Zabieg usunięcia osteofitu\",\r\n    \"czasWykonaniaUslugi\": \"60\",\r\n    \"cenaUslugi\": 900.0,\r\n    \"opisUslugi\": \"<p>Zabieg usunięcia osteofitu</p>\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-chirurgia"}',7);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1146,1,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik - Chirurgia"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"3984b3d7-feeb-4d25-9594-6dd4f3547f47\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Kontrola pozabiegowa dla pacjentów Centrum\",\r\n    \"czasWykonaniaUslugi\": \"30\",\r\n    \"cenaUslugi\": 0.0,\r\n    \"opisUslugi\": \"<p>Kontrola pozabiegowa dla pacjentów Centrum</p>\"\r\n  },\r\n  {\r\n    \"key\": \"313cdcee-32db-46ea-92ab-b95802358065\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Kontrola pozabiegowa dla pacjentów pozostałych\",\r\n    \"czasWykonaniaUslugi\": \"30\",\r\n    \"cenaUslugi\": 50.0,\r\n    \"opisUslugi\": \"<p>Kontrola pozabiegowa dla pacjentów pozostałych</p>\"\r\n  },\r\n  {\r\n    \"key\": \"5b979522-eb30-40a5-aaf3-669e273f2b5c\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Kwalifikacja do zabiegu\",\r\n    \"czasWykonaniaUslugi\": \"30\",\r\n    \"cenaUslugi\": 50.0,\r\n    \"opisUslugi\": \"Kwalifikacja do zabiegu\"\r\n  },\r\n  {\r\n    \"key\": \"afdef961-4762-4a78-9b79-42d9721e54d1\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Plastyka wałów okołopaznokciowych\",\r\n    \"czasWykonaniaUslugi\": \"60\",\r\n    \"cenaUslugi\": 800.0,\r\n    \"opisUslugi\": \"<p>Cena dotyczy 1 palca</p>\"\r\n  },\r\n  {\r\n    \"key\": \"ced40776-7b38-4345-91c3-8abef131420b\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Zabieg usunięcia osteofitu\",\r\n    \"czasWykonaniaUslugi\": \"60\",\r\n    \"cenaUslugi\": 900.0,\r\n    \"opisUslugi\": \"<p>Zabieg usunięcia osteofitu</p>\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-chirurgia"}',3);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1149,0,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik - Kosmetyka"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"a28c6c86-143c-42eb-a6b3-4c8f32ca7d79\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Oxybrazja\",\r\n    \"czasWykonaniaUslugi\": \"60 - 70\",\r\n    \"cenaUslugi\": 150.0,\r\n    \"opisUslugi\": \"<p>Oxybrazja (oxyaquabrazja) nazywana inaczej mikrodermabrazjią wodno-tlenową. <br />Jest peelingiem mechanicznym <br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej. <br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę. <br />-pozwala złagodzić okołomieszkowe zapalenie skóry <br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów <br />-wygładza i pojędrnia skórę <br />-na ciało pobudza krążenie krwi <br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo <br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej <br /><br /><strong>Przeciwwskazania :</strong> <br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia) <br />-wykonany zabieg kwasami (odczekać min. tydzień) <br />-przerwanie ciągłości naskórka <br />-infekcje skóry (wirusowe, bakteryjne, grzybicze) <br />-nowotwory <br />-ciężkie choroby ogólnoustrojowe <br />-łuszczyca w fazie aktywnej <br />-stany zapalne skóry <br />-zmiany ropne w obrębie skóry <br />-świeże blizny <br />-ciąża, laktacja <br />-nadciśnienie <br />-rozrusznik serca <br />-opryszczka <br />-diabetycy</p>\"\r\n  },\r\n  {\r\n    \"key\": \"7332bf29-ba6b-4b5f-aead-31d8eee4257d\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Masaż twarzy, szyi i dekoltu\",\r\n    \"czasWykonaniaUslugi\": \"30\",\r\n    \"cenaUslugi\": 80.0,\r\n    \"opisUslugi\": \"<p>Usługa obejmuje:<br /><br />demakijaż, masaż na dobranym preparacie, tonizacja, krem<br />Masaż twarzy nie jest jednak dla każdego. Na masaż twarzy nie powinny decydować się kobiety w ciąży i osoby cierpiące na:<br /><br />liszaj;<br />opryszczkę;<br />trądzik;<br />stany zapalne i ropne w jamie ustnej;<br />gorączkę;<br />powiększone węzły chłonne;<br />stan ropny migdałków;<br />wysokie ciśnienie;<br />zaawansowaną miażdżycę;<br />zakrzepicę;<br />zapalenie żył;<br />choroby nowotworowe.<br /><br />OGÓLNE PRZECIWWSKAZANIA DO MASAŻU KLASYCZNEGO:<br />Ciąża i menstruacja<br />Brak zlecenia lekarskiego<br />Zmiany skórne (rozsiane i ropne)<br />Nowotwory (onkologiczny masaż limfatyczny)<br />Krwawienia, krwotoki lub możliwość ich wystąpienia<br />Hemofilia<br />Żylaki<br />Skaza naczyniowa<br />Nadciśnienie<br />Miażdżyca<br />Wszelkie stany zapalne (RZS w okresie zaostrzenia choroby)<br />Choroby o podłożu bakteryjnym, wirusowym i pasożytniczym<br />Wysoka temperatura ciała (39°C)</p>\"\r\n  },\r\n  {\r\n    \"key\": \"2f96e353-a937-4c35-960b-f2532c9c2212\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Masaż twarzy, szyi i dekoltu + maska\",\r\n    \"czasWykonaniaUslugi\": \"40\",\r\n    \"cenaUslugi\": 80.0,\r\n    \"opisUslugi\": \"<p>Usługa obejmuje:<br /><br />demakijaż, masaż, maskę, tonizację i krem.</p>\"\r\n  },\r\n  {\r\n    \"key\": \"7c5df320-0c68-4536-8561-f7231df0ae99\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Oczyszczanie manualne twarzy\",\r\n    \"czasWykonaniaUslugi\": \"90\",\r\n    \"cenaUslugi\": 150.0,\r\n    \"opisUslugi\": \"<p>Usługa obejmuje:<br /><br />demakijaż, peeling (ziarnisty, enzymatyczny bądź kawitacyjny),oczyszczanie manualne, ampułka, maska, krem.</p>\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-kosmetyka"}',22);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1149,1,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik - Kosmetyka"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"a28c6c86-143c-42eb-a6b3-4c8f32ca7d79\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Oxybrazja\",\r\n    \"czasWykonaniaUslugi\": \"60 - 70\",\r\n    \"cenaUslugi\": 150.0,\r\n    \"opisUslugi\": \"<p>Oxybrazja (oxyaquabrazja) nazywana inaczej mikrodermabrazjią wodno-tlenową. <br />Jest peelingiem mechanicznym <br />Polega na złuszczeniu martwych komórek naskórka za pomocą tlenu oraz aplikowanej pod ciśnieniem soli fizjologicznej. <br />Sól fizjologiczna- wygładza, dotlenia i odżywia skórę, pobudza krążenie w komórkach, likwiduje drobne niedoskonałości skóry. Ma zdolność przenikania przez skórę. <br />-pozwala złagodzić okołomieszkowe zapalenie skóry <br />-jest bogactwem minerałów zawiera około 104 mikroelementów i minerałów <br />-wygładza i pojędrnia skórę <br />-na ciało pobudza krążenie krwi <br />-po kuracjach odmładzających ; napina skórę i działa antycelulitowo <br />Do cery: normalnej, suchej, naczyniowej, wrażliwej, dojrzałej <br /><br /><strong>Przeciwwskazania :</strong> <br />-terapia przeciwtrądzikowa retinoidami (należy odczekać ok. pół roku po zakończeniu leczenia) <br />-wykonany zabieg kwasami (odczekać min. tydzień) <br />-przerwanie ciągłości naskórka <br />-infekcje skóry (wirusowe, bakteryjne, grzybicze) <br />-nowotwory <br />-ciężkie choroby ogólnoustrojowe <br />-łuszczyca w fazie aktywnej <br />-stany zapalne skóry <br />-zmiany ropne w obrębie skóry <br />-świeże blizny <br />-ciąża, laktacja <br />-nadciśnienie <br />-rozrusznik serca <br />-opryszczka <br />-diabetycy</p>\"\r\n  },\r\n  {\r\n    \"key\": \"7332bf29-ba6b-4b5f-aead-31d8eee4257d\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Masaż twarzy, szyi i dekoltu\",\r\n    \"czasWykonaniaUslugi\": \"30\",\r\n    \"cenaUslugi\": 80.0,\r\n    \"opisUslugi\": \"<p>Usługa obejmuje:<br /><br />demakijaż, masaż na dobranym preparacie, tonizacja, krem<br />Masaż twarzy nie jest jednak dla każdego. Na masaż twarzy nie powinny decydować się kobiety w ciąży i osoby cierpiące na:<br /><br />liszaj;<br />opryszczkę;<br />trądzik;<br />stany zapalne i ropne w jamie ustnej;<br />gorączkę;<br />powiększone węzły chłonne;<br />stan ropny migdałków;<br />wysokie ciśnienie;<br />zaawansowaną miażdżycę;<br />zakrzepicę;<br />zapalenie żył;<br />choroby nowotworowe.<br /><br />OGÓLNE PRZECIWWSKAZANIA DO MASAŻU KLASYCZNEGO:<br />Ciąża i menstruacja<br />Brak zlecenia lekarskiego<br />Zmiany skórne (rozsiane i ropne)<br />Nowotwory (onkologiczny masaż limfatyczny)<br />Krwawienia, krwotoki lub możliwość ich wystąpienia<br />Hemofilia<br />Żylaki<br />Skaza naczyniowa<br />Nadciśnienie<br />Miażdżyca<br />Wszelkie stany zapalne (RZS w okresie zaostrzenia choroby)<br />Choroby o podłożu bakteryjnym, wirusowym i pasożytniczym<br />Wysoka temperatura ciała (39°C)</p>\"\r\n  },\r\n  {\r\n    \"key\": \"2f96e353-a937-4c35-960b-f2532c9c2212\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Masaż twarzy, szyi i dekoltu + maska\",\r\n    \"czasWykonaniaUslugi\": \"40\",\r\n    \"cenaUslugi\": 80.0,\r\n    \"opisUslugi\": \"<p>Usługa obejmuje:<br /><br />demakijaż, masaż, maskę, tonizację i krem.</p>\"\r\n  },\r\n  {\r\n    \"key\": \"7c5df320-0c68-4536-8561-f7231df0ae99\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Oczyszczanie manualne twarzy\",\r\n    \"czasWykonaniaUslugi\": \"90\",\r\n    \"cenaUslugi\": 150.0,\r\n    \"opisUslugi\": \"<p>Usługa obejmuje:<br /><br />demakijaż, peeling (ziarnisty, enzymatyczny bądź kawitacyjny),oczyszczanie manualne, ampułka, maska, krem.</p>\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-kosmetyka"}',11);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1150,0,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik - Masaż i Pielęgnacja"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"17ded365-4710-4110-b36f-f0ce9b2691c3\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"test\",\r\n    \"czasWykonaniaUslugi\": \"test\",\r\n    \"cenaUslugi\": 80.0,\r\n    \"opisUslugi\": \"<p>sdfghfhkjhkfghgdsg</p>\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-masaz-i-pielegnacja-ciala"}',2);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1150,1,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik - Masaż i Pielęgnacja"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"17ded365-4710-4110-b36f-f0ce9b2691c3\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"test\",\r\n    \"czasWykonaniaUslugi\": \"test\",\r\n    \"cenaUslugi\": 80.0,\r\n    \"opisUslugi\": \"<p>sdfghfhkjhkfghgdsg</p>\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-masaz-i-pielegnacja-ciala"}',2);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1151,0,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik - Podologia"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"a197e038-b0fb-4dae-82c1-17b72877397e\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Test\",\r\n    \"czasWykonaniaUslugi\": \"Test\",\r\n    \"cenaUslugi\": 10.0,\r\n    \"opisUslugi\": \"<p>TEST</p>\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-podologia"}',2);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1151,1,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik - Podologia"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"a197e038-b0fb-4dae-82c1-17b72877397e\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"Test\",\r\n    \"czasWykonaniaUslugi\": \"Test\",\r\n    \"cenaUslugi\": 10.0,\r\n    \"opisUslugi\": \"<p>TEST</p>\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-podologia"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1152,0,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik - Dłonie i paznokcie"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"9f6657c6-9dde-445d-87ed-0a15cc564051\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"+48 697 779 768\",\r\n    \"czasWykonaniaUslugi\": \"+48 697 779 768\",\r\n    \"cenaUslugi\": 40.0,\r\n    \"opisUslugi\": \"<p>sfdsdsaasd</p>\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-pielegnacja-dloni-i-paznokci"}',1);
GO
INSERT INTO [cmsContentNu] ([nodeId],[published],[data],[rv]) VALUES (
1152,1,N'{"properties":{"telefonRecepcja":[{"culture":"","seg":"","val":"+48 697 779 768"}],"telefonFirmowy":[{"culture":"","seg":"","val":"+48 697 779 768"}],"adresMailowy":[{"culture":"","seg":"","val":"kontakt@emi-center.pl"}],"logo":[{"culture":"","seg":"","val":"umb://media/615e84dd7c7344f09f2706b0aea2efff"}],"tytulStrony":[{"culture":"","seg":"","val":"Cennik - Dłonie i paznokcie"}],"zdjecieTla":[{"culture":"","seg":"","val":"umb://media/0347e667726541af95585b875808cf38"}],"listaUslug":[{"culture":"","seg":"","val":"[\r\n  {\r\n    \"key\": \"9f6657c6-9dde-445d-87ed-0a15cc564051\",\r\n    \"name\": \"Usługa\",\r\n    \"ncContentTypeAlias\": \"cennikDocument\",\r\n    \"nazwaUslugi\": \"+48 697 779 768\",\r\n    \"czasWykonaniaUslugi\": \"+48 697 779 768\",\r\n    \"cenaUslugi\": 40.0,\r\n    \"opisUslugi\": \"<p>sfdsdsaasd</p>\"\r\n  }\r\n]"}]},"cultureData":{},"urlSegment":"cennik-pielegnacja-dloni-i-paznokci"}',1);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [PK_user] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUserLogin] ADD CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY ([sessionId]);
GO
ALTER TABLE [umbracoServer] ADD CONSTRAINT [PK_umbracoServer] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRedirectUrl] ADD CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [PK_umbracoNode] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [PK_userStartNode] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY ([userGroupId],[nodeId],[permission]);
GO
ALTER TABLE [umbracoUserGroup2App] ADD CONSTRAINT [PK_userGroup2App] PRIMARY KEY ([userGroupId],[app]);
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [PK_user2userGroup] PRIMARY KEY ([userId],[userGroupId]);
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY ([userId],[nodeId],[action]);
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [PK_umbracoRelation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLog] ADD CONSTRAINT [PK_umbracoLog] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLock] ADD CONSTRAINT [PK_umbracoLock] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoKeyValue] ADD CONSTRAINT [PK_umbracoKeyValue] PRIMARY KEY ([key]);
GO
ALTER TABLE [umbracoExternalLogin] ADD CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDomain] ADD CONSTRAINT [PK_umbracoDomain] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDocumentCultureVariation] ADD CONSTRAINT [PK_umbracoDocumentCultureVariation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDataType] ADD CONSTRAINT [PK_umbracoDataType] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [umbracoContent] ADD CONSTRAINT [PK_umbracoContent] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [umbracoDocument] ADD CONSTRAINT [PK_umbracoDocument] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [umbracoContentVersion] ADD CONSTRAINT [PK_umbracoContentVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoMediaVersion] ADD CONSTRAINT [PK_umbracoMediaVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDocumentVersion] ADD CONSTRAINT [PK_umbracoDocumentVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoContentVersionCultureVariation] ADD CONSTRAINT [PK_umbracoContentVersionCultureVariation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoContentSchedule] ADD CONSTRAINT [PK_umbracoContentSchedule] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoConsent] ADD CONSTRAINT [PK_umbracoConsent] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoCacheInstruction] ADD CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAudit] ADD CONSTRAINT [PK_umbracoAudit] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [PK_umbracoAccess] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [PK_cmsTemplate] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [PK_cmsTags] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoPropertyData] ADD CONSTRAINT [PK_umbracoPropertyData] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY ([nodeId],[propertyTypeId],[tagId]);
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [PK_cmsMemberType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [PK_cmsMember] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY ([Member],[MemberGroup]);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [PK_cmsMacro] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY ([contentTypeNodeId],[templateNodeId]);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [PK_cmsDictionary] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentTypeAllowedContentType] ADD CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY ([Id],[AllowedId]);
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY ([parentContentTypeId],[childContentTypeId]);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [PK_cmsContentType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentNu] ADD CONSTRAINT [PK_cmsContentNu] PRIMARY KEY ([nodeId],[published]);
GO
CREATE INDEX [IX_umbracoUser_userLogin] ON [umbracoUser] ([userLogin] ASC);
GO
CREATE INDEX [IX_umbracoUserLogin_lastValidatedUtc] ON [umbracoUserLogin] ([lastValidatedUtc] ASC);
GO
ALTER TABLE [umbracoServer] ADD CONSTRAINT [IX_computerName] UNIQUE ([computerName]);
GO
CREATE INDEX [IX_umbracoServer_isActive] ON [umbracoServer] ([isActive] ASC);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [IX_umbracoRelationType_alias] UNIQUE ([alias]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [IX_umbracoRelationType_name] UNIQUE ([name]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [IX_umbracoRelationType_UniqueId] UNIQUE ([typeUniqueId]);
GO
ALTER TABLE [umbracoRedirectUrl] ADD CONSTRAINT [IX_umbracoRedirectUrl] UNIQUE ([urlHash],[contentKey],[culture],[createDateUtc]);
GO
CREATE INDEX [IX_umbracoNode_ObjectType] ON [umbracoNode] ([nodeObjectType] ASC);
GO
CREATE INDEX [IX_umbracoNode_ParentId] ON [umbracoNode] ([parentId] ASC);
GO
CREATE INDEX [IX_umbracoNode_Path] ON [umbracoNode] ([path] ASC);
GO
CREATE INDEX [IX_umbracoNode_Trashed] ON [umbracoNode] ([trashed] ASC);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [IX_umbracoNode_UniqueId] UNIQUE ([uniqueId]);
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [IX_umbracoUserStartNode_startNodeType] UNIQUE ([startNodeType],[startNode],[userId]);
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [IX_umbracoUserGroup_userGroupAlias] UNIQUE ([userGroupAlias]);
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [IX_umbracoUserGroup_userGroupName] UNIQUE ([userGroupName]);
GO
CREATE INDEX [IX_umbracoUser2NodePermission_nodeId] ON [umbracoUserGroup2NodePermission] ([nodeId] ASC);
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [IX_umbracoRelation_parentChildType] UNIQUE ([parentId],[childId],[relType]);
GO
CREATE INDEX [IX_umbracoLog] ON [umbracoLog] ([NodeId] ASC);
GO
CREATE INDEX [IX_umbracoLanguage_fallbackLanguageId] ON [umbracoLanguage] ([fallbackLanguageId] ASC);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [IX_umbracoLanguage_languageISOCode] UNIQUE ([languageISOCode]);
GO
CREATE INDEX [IX_umbracoDocumentCultureVariation_LanguageId] ON [umbracoDocumentCultureVariation] ([languageId] ASC);
GO
ALTER TABLE [umbracoDocumentCultureVariation] ADD CONSTRAINT [IX_umbracoDocumentCultureVariation_NodeId] UNIQUE ([nodeId],[languageId]);
GO
CREATE INDEX [IX_umbracoDocument_Published] ON [umbracoDocument] ([published] ASC);
GO
CREATE INDEX [IX_umbracoContentVersion_NodeId] ON [umbracoContentVersion] ([nodeId] ASC,[current] ASC);
GO
ALTER TABLE [umbracoMediaVersion] ADD CONSTRAINT [IX_umbracoMediaVersion] UNIQUE ([id],[path]);
GO
CREATE INDEX [IX_umbracoContentVersionCultureVariation_LanguageId] ON [umbracoContentVersionCultureVariation] ([languageId] ASC);
GO
ALTER TABLE [umbracoContentVersionCultureVariation] ADD CONSTRAINT [IX_umbracoContentVersionCultureVariation_VersionId] UNIQUE ([versionId],[languageId]);
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [IX_umbracoAccess_nodeId] UNIQUE ([nodeId]);
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [IX_umbracoAccessRule] UNIQUE ([ruleValue],[ruleType],[accessId]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [IX_cmsTemplate_nodeId] UNIQUE ([nodeId]);
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [IX_cmsTags] UNIQUE ([group],[tag],[languageId]);
GO
CREATE INDEX [IX_cmsTags_LanguageId] ON [cmsTags] ([languageId] ASC);
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [IX_cmsPropertyTypeGroupUniqueID] UNIQUE ([uniqueID]);
GO
CREATE INDEX [IX_cmsPropertyTypeAlias] ON [cmsPropertyType] ([Alias] ASC);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [IX_cmsPropertyTypeUniqueID] UNIQUE ([UniqueID]);
GO
CREATE INDEX [IX_umbracoPropertyData_LanguageId] ON [umbracoPropertyData] ([languageId] ASC);
GO
CREATE INDEX [IX_umbracoPropertyData_PropertyTypeId] ON [umbracoPropertyData] ([propertyTypeId] ASC);
GO
CREATE INDEX [IX_umbracoPropertyData_Segment] ON [umbracoPropertyData] ([segment] ASC);
GO
ALTER TABLE [umbracoPropertyData] ADD CONSTRAINT [IX_umbracoPropertyData_VersionId] UNIQUE ([versionId],[propertyTypeId],[languageId],[segment]);
GO
CREATE INDEX [IX_cmsMember_LoginName] ON [cmsMember] ([LoginName] ASC);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [IX_cmsMacro_UniqueId] UNIQUE ([uniqueId]);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [IX_cmsMacroPropertyAlias] UNIQUE ([macroAlias]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [IX_cmsMacroProperty_Alias] UNIQUE ([macro],[macroPropertyAlias]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [IX_cmsMacroProperty_UniquePropertyId] UNIQUE ([uniquePropertyId]);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [IX_cmsDictionary_id] UNIQUE ([id]);
GO
CREATE INDEX [IX_cmsDictionary_key] ON [cmsDictionary] ([key] ASC);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [IX_cmsContentType] UNIQUE ([nodeId]);
GO
CREATE INDEX [IX_cmsContentType_icon] ON [cmsContentType] ([icon] ASC);
GO
ALTER TABLE [umbracoUserLogin] ADD CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY ([parentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [FK_umbracoNode_umbracoUser_id] FOREIGN KEY ([nodeUser]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY ([startNode]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserStartNode] ADD CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY ([startContentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup] ADD CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY ([startMediaId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2NodePermission] ADD CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUserGroup2App] ADD CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2UserGroup] ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [umbracoUserGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY ([parentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY ([childId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY ([relType]) REFERENCES [umbracoRelationType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoLog] ADD CONSTRAINT [FK_umbracoLog_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id] FOREIGN KEY ([fallbackLanguageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDomain] ADD CONSTRAINT [FK_umbracoDomain_umbracoNode_id] FOREIGN KEY ([domainRootStructureID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDocumentCultureVariation] ADD CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDocumentCultureVariation] ADD CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDataType] ADD CONSTRAINT [FK_umbracoDataType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContent] ADD CONSTRAINT [FK_umbracoContent_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDocument] ADD CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentVersion] ADD CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentVersion] ADD CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoMediaVersion] ADD CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id] FOREIGN KEY ([id]) REFERENCES [umbracoContentVersion]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDocumentVersion] ADD CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id] FOREIGN KEY ([id]) REFERENCES [umbracoContentVersion]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentVersionCultureVariation] ADD CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id] FOREIGN KEY ([versionId]) REFERENCES [umbracoContentVersion]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentVersionCultureVariation] ADD CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentVersionCultureVariation] ADD CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id] FOREIGN KEY ([availableUserId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentSchedule] ADD CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoContentSchedule] ADD CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY ([loginNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY ([noAccessNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY ([accessId]) REFERENCES [umbracoAccess]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [FK_cmsTags_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY ([propertyTypeGroupId]) REFERENCES [cmsPropertyTypeGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId] FOREIGN KEY ([dataTypeId]) REFERENCES [umbracoDataType]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoPropertyData] ADD CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id] FOREIGN KEY ([propertyTypeId]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoPropertyData] ADD CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id] FOREIGN KEY ([versionId]) REFERENCES [umbracoContentVersion]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoPropertyData] ADD CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY ([propertyTypeId]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY ([tagId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY ([NodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [FK_cmsMember_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY ([Member]) REFERENCES [cmsMember]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY ([MemberGroup]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY ([macro]) REFERENCES [cmsMacro]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY ([contentTypeNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY ([childContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY ([parentContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentNu] ADD CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [umbracoContent]([nodeId]) ON DELETE CASCADE ON UPDATE NO ACTION;
GO


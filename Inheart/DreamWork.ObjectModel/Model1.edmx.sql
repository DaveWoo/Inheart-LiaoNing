
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/29/2016 11:46:04
-- Generated from EDMX file: E:\360云盘\My Projects\www.lnheart.com\DreamWork_Dave\DreamWork.ObjectModel\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MedicalBase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Report_Summation_JieRuZhiLiao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_Report_Summation_JieRuZhiLiao];
GO
IF OBJECT_ID(N'[dbo].[FK_Report_Summation_LinChuangZhuanGui]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_Report_Summation_LinChuangZhuanGui];
GO
IF OBJECT_ID(N'[dbo].[FK_Report_Summation_Report_Summation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_Report_Summation_Report_Summation];
GO
IF OBJECT_ID(N'[dbo].[FK_Report_Summation_WeiJinXingJingMaiRongSuanLiYou]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_Report_Summation_WeiJinXingJingMaiRongSuanLiYou];
GO
IF OBJECT_ID(N'[dbo].[FK_Report_Summation_WeiJinXingZhenDuan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_Report_Summation_WeiJinXingZhenDuan];
GO
IF OBJECT_ID(N'[dbo].[FK_Report_Summation_ZhuSuAndXianBingShi]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_Report_Summation_ZhuSuAndXianBingShi];
GO
IF OBJECT_ID(N'[dbo].[FK_ReportSummation_Hospital]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_ReportSummation_Hospital];
GO
IF OBJECT_ID(N'[dbo].[FK_ReportSummation_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_ReportSummation_Person];
GO
IF OBJECT_ID(N'[dbo].[FK_ReportSummation_ReportBinLiBanSuiZhuangTai]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_ReportSummation_ReportBinLiBanSuiZhuangTai];
GO
IF OBJECT_ID(N'[dbo].[FK_ReportSummation_ReportChuBuZhengDuan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_ReportSummation_ReportChuBuZhengDuan];
GO
IF OBJECT_ID(N'[dbo].[FK_ReportSummation_ReportFuZhuYongYao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_ReportSummation_ReportFuZhuYongYao];
GO
IF OBJECT_ID(N'[dbo].[FK_ReportSummation_ReportJinMaiRongShuan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_ReportSummation_ReportJinMaiRongShuan];
GO
IF OBJECT_ID(N'[dbo].[FK_ReportSummation_ReportJiWangBingShi]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_ReportSummation_ReportJiWangBingShi];
GO
IF OBJECT_ID(N'[dbo].[FK_ReportSummation_ReportLinChuangZhengZhuang]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_ReportSummation_ReportLinChuangZhengZhuang];
GO
IF OBJECT_ID(N'[dbo].[FK_ReportSummation_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Report_Summation] DROP CONSTRAINT [FK_ReportSummation_User];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Hospital]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Hospital];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Person]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Person];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Hospital]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Hospital];
GO
IF OBJECT_ID(N'[dbo].[Log_Login]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Log_Login];
GO
IF OBJECT_ID(N'[dbo].[Person]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Person];
GO
IF OBJECT_ID(N'[dbo].[Region]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Region];
GO
IF OBJECT_ID(N'[dbo].[Report_ChuBuZhenDuan]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Report_ChuBuZhenDuan];
GO
IF OBJECT_ID(N'[dbo].[Report_FuZhuYongYao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Report_FuZhuYongYao];
GO
IF OBJECT_ID(N'[dbo].[Report_JiBingBanSuiZhuangTai]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Report_JiBingBanSuiZhuangTai];
GO
IF OBJECT_ID(N'[dbo].[Report_JieRuZhiLiao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Report_JieRuZhiLiao];
GO
IF OBJECT_ID(N'[dbo].[Report_JingMaiRongShuan]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Report_JingMaiRongShuan];
GO
IF OBJECT_ID(N'[dbo].[Report_JiWangBingShi]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Report_JiWangBingShi];
GO
IF OBJECT_ID(N'[dbo].[Report_LinChuangZhuanGui]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Report_LinChuangZhuanGui];
GO
IF OBJECT_ID(N'[dbo].[Report_Summation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Report_Summation];
GO
IF OBJECT_ID(N'[dbo].[Report_WeiJinXingJingMaiRongSuanLiYou]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Report_WeiJinXingJingMaiRongSuanLiYou];
GO
IF OBJECT_ID(N'[dbo].[Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao];
GO
IF OBJECT_ID(N'[dbo].[Report_ZhuSuAndXianBingShi]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Report_ZhuSuAndXianBingShi];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Hospitals'
CREATE TABLE [dbo].[Hospitals] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [HospitalName] nvarchar(50)  NOT NULL,
    [Description] nvarchar(500)  NULL,
    [HospitalLevel] int  NULL,
    [RegionID] int  NULL
);
GO

-- Creating table 'Log_Login'
CREATE TABLE [dbo].[Log_Login] (
    [LogID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NOT NULL,
    [LoginDate] datetime  NOT NULL,
    [Detail] nvarchar(200)  NULL,
    [BroswerType] nvarchar(50)  NULL,
    [HospitalID] int  NOT NULL
);
GO

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [ID] uniqueidentifier  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Sex] nvarchar(50)  NULL,
    [Nationality] nvarchar(50)  NULL,
    [Birthday] datetime  NULL,
    [IdentityNumber] varchar(19)  NULL,
    [CellPhone] nchar(10)  NULL,
    [Mobile] nvarchar(11)  NULL,
    [Address] nvarchar(50)  NULL,
    [Occupation] nvarchar(50)  NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'Regions'
CREATE TABLE [dbo].[Regions] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [RegionName] nvarchar(50)  NOT NULL,
    [RegionShortName] nvarchar(50)  NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'Report_ChuBuZhenDuan'
CREATE TABLE [dbo].[Report_ChuBuZhenDuan] (
    [ID] uniqueidentifier  NOT NULL,
    [BloodPressure] nvarchar(50)  NULL,
    [DiastolicPressure] nvarchar(50)  NULL,
    [FirstTimeXinDianTu] datetime  NULL,
    [FirstTimeBlood] datetime  NULL,
    [FisrtTimeReturn] datetime  NULL,
    [CNTResult] nvarchar(50)  NULL,
    [RegularCNT] nvarchar(50)  NULL,
    [AcuteST] nvarchar(50)  NULL,
    [Anteroseptal] bit  NULL,
    [Antetheca] bit  NULL,
    [Extensive] bit  NULL,
    [HeartWall] bit  NULL,
    [HighWall] bit  NULL,
    [InteriorWall] bit  NULL,
    [BackWall] bit  NULL,
    [RightVentricular] bit  NULL,
    [PrtreatOther] nvarchar(50)  NULL,
    [FirstTimeHeartRate] nvarchar(50)  NULL,
    [FirstTimeImage] datetime  NULL,
    [IntroduceThrombolysisSuggestion] bit  NULL
);
GO

-- Creating table 'Report_FuZhuYongYao'
CREATE TABLE [dbo].[Report_FuZhuYongYao] (
    [ID] uniqueidentifier  NOT NULL,
    [AspirinDosage] nvarchar(50)  NULL,
    [ClopidogrelDosage] nvarchar(50)  NULL,
    [LoadStatinUsed] nvarchar(50)  NULL,
    [Simvastatin] bit  NULL,
    [Pravastatin] bit  NULL,
    [Fluvastatin] bit  NULL,
    [Atorvastatin] bit  NULL,
    [Rosuvastatin] bit  NULL,
    [Pitavastatin] bit  NULL,
    [ACEIConfirm] nvarchar(50)  NULL,
    [BRBConfrim] nvarchar(50)  NULL
);
GO

-- Creating table 'Report_JiBingBanSuiZhuangTai'
CREATE TABLE [dbo].[Report_JiBingBanSuiZhuangTai] (
    [ID] uniqueidentifier  NOT NULL,
    [HypotensionExist] nchar(10)  NULL,
    [CardiogenicShockExist] nchar(10)  NULL,
    [ArrhythmiaExist] nchar(10)  NULL,
    [VPB] bit  NULL,
    [VT] bit  NULL,
    [VF] bit  NULL,
    [Ats] bit  NULL,
    [AFS1] bit  NULL,
    [AF] bit  NULL,
    [APB] bit  NULL,
    [AVBI] bit  NULL,
    [AVBII] bit  NULL,
    [AVBIII] bit  NULL,
    [AFS] bit  NULL,
    [RBBB] bit  NULL,
    [AVBOther] bit  NULL,
    [MitralValveProlapseOrBreakExist] nvarchar(50)  NULL,
    [PerforationofVentricularSeptumConfirm] nvarchar(50)  NULL,
    [StrokeExist] nvarchar(50)  NULL,
    [OGLBExist] nvarchar(50)  NULL,
    [KilipLevel] nvarchar(50)  NULL
);
GO

-- Creating table 'Report_JieRuZhiLiao'
CREATE TABLE [dbo].[Report_JieRuZhiLiao] (
    [ID] uniqueidentifier  NOT NULL,
    [D2BTime] nvarchar(50)  NULL,
    [Succeed] nvarchar(50)  NULL
);
GO

-- Creating table 'Report_JingMaiRongShuan'
CREATE TABLE [dbo].[Report_JingMaiRongShuan] (
    [ID] uniqueidentifier  NOT NULL,
    [Urokinase] nvarchar(50)  NULL,
    [UrokinaseOther] nvarchar(50)  NULL,
    [Alteplase] nvarchar(50)  NULL,
    [Reteplase] nvarchar(50)  NULL,
    [Pass] nvarchar(50)  NULL,
    [Anaphylaxis] bit  NULL,
    [Bleed] nvarchar(50)  NULL,
    [ReperfusionArrhythmia] bit  NULL,
    [TreatTime] nvarchar(50)  NULL
);
GO

-- Creating table 'Report_JiWangBingShi'
CREATE TABLE [dbo].[Report_JiWangBingShi] (
    [ID] uniqueidentifier  NOT NULL,
    [MIConfirm] nvarchar(50)  NULL,
    [HypertensionConfirm] nvarchar(50)  NULL,
    [HypertensionLasted] nvarchar(50)  NULL,
    [HypertensionTreatedState] nvarchar(50)  NULL,
    [GlycuresisConfirm] nvarchar(50)  NULL,
    [GlycuresisLasted] nvarchar(50)  NULL,
    [GlycuresisTreatedState] nvarchar(50)  NULL,
    [CerebralHemorrhageConfirm] nvarchar(50)  NULL,
    [CerebralHemorrhageTreateLasted] nvarchar(50)  NULL,
    [PeripheralVascularConfirm] nvarchar(50)  NULL,
    [AnemiaOrOtherConfirm] nvarchar(50)  NULL
);
GO

-- Creating table 'Report_LinChuangZhuanGui'
CREATE TABLE [dbo].[Report_LinChuangZhuanGui] (
    [ID] uniqueidentifier  NOT NULL,
    [CPR] nvarchar(50)  NULL,
    [CPRTimes] nvarchar(50)  NULL,
    [TreatResult] nvarchar(50)  NULL,
    [DeadTime] nvarchar(50)  NULL,
    [DeadForVentriclarArrhythmias] bit  NULL,
    [DeadForCardiacArrest] bit  NULL,
    [DeadForCardiogenicShock] bit  NULL,
    [DeadForACVD] bit  NULL,
    [DeadForGIH] bit  NULL,
    [DeadForOther] bit  NULL,
    [TransUpHospitalConfirm] nvarchar(50)  NULL,
    [TransUpHospitalLever] nvarchar(50)  NULL,
    [TransUpHospitalDate] datetime  NULL,
    [IntroduceEmergencyCoronaryConfirm] nvarchar(50)  NULL,
    [IntroduceEmergencyCoronaryDate] datetime  NULL,
    [AgreeEmergencyCoronaryConfirm] nvarchar(50)  NULL,
    [ThrombolyticForDisagree] bit  NULL,
    [ThrombolyticForEconomicReason] bit  NULL,
    [ThrombolyticForDream] bit  NULL,
    [ThrombolyticForTimeLimited] bit  NULL,
    [ConnectUpHospitalConfirm] nvarchar(50)  NULL,
    [UpHospitalLaboratory] nvarchar(50)  NULL,
    [IntroduceThrombolysisSuggestionConfirm] nvarchar(50)  NULL,
    [IntroduceThrombolysisSuggestionDate] datetime  NULL,
    [ThrombolysisTreateConfirm] nvarchar(50)  NULL,
    [EmergencyCoronaryTreateConfirm] nvarchar(50)  NULL,
    [CheckOutDate] datetime  NULL
);
GO

-- Creating table 'Report_Summation'
CREATE TABLE [dbo].[Report_Summation] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ReportBinLiBanSuiZhuangTaiID] uniqueidentifier  NULL,
    [ReportChunBuZhengDuanID] uniqueidentifier  NULL,
    [ReportFuZhuYongYaoID] uniqueidentifier  NULL,
    [ReportJinMaiRongShuanID] uniqueidentifier  NULL,
    [ReportJiWangBingShiID] uniqueidentifier  NULL,
    [ReportLinChuangZhengZhuangID] uniqueidentifier  NULL,
    [ReportTreatResultID] uniqueidentifier  NULL,
    [JieRuZhiLiaoID] uniqueidentifier  NULL,
    [WeiJinXingJiZhenGuanMaiJieRuZhiLiaoID] uniqueidentifier  NULL,
    [ZhuSuAndXianBingShiID] uniqueidentifier  NULL,
    [LinChuangZhuanGuiID] uniqueidentifier  NULL,
    [WeiJinXingJingMaiRongSuanLiYouID] uniqueidentifier  NULL,
    [PersonID] uniqueidentifier  NULL,
    [DiseaseTimeState] nvarchar(50)  NULL,
    [DiseaseTime] datetime  NULL,
    [DiseaseHour] int  NULL,
    [TreatDate] datetime  NULL,
    [TrafficWay] nvarchar(50)  NULL,
    [DiseaseDescriber] nvarchar(50)  NULL,
    [Reliability] nvarchar(50)  NULL,
    [UserID] int  NOT NULL,
    [HospitalID] int  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [LastUpdateDate] datetime  NOT NULL,
    [IsSubmit] bit  NULL
);
GO

-- Creating table 'Report_WeiJinXingJingMaiRongSuanLiYou'
CREATE TABLE [dbo].[Report_WeiJinXingJingMaiRongSuanLiYou] (
    [ID] uniqueidentifier  NOT NULL,
    [UnThrombolysisReasonForUnSute] bit  NULL,
    [UnThrombolysisReasonForPatientDisagree] bit  NULL,
    [UnThrombolyticForEconomicReason] bit  NULL,
    [UnThrombolyticForHospitalCanNotDid] bit  NULL,
    [UnThrombolyticForContraindication] bit  NULL
);
GO

-- Creating table 'Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao'
CREATE TABLE [dbo].[Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao] (
    [ID] uniqueidentifier  NOT NULL,
    [UnEmergencyCoronaryTreateForHospitalUnable] bit  NULL,
    [UnEmergencyCoronaryTreateForOverTreateTime] bit  NULL,
    [UnEmergencyCoronaryTreateForPatientDisagree] bit  NULL,
    [UnEmergencyCoronaryTreateForEmergency] bit  NULL,
    [UnEmergencyCoronaryTreateForContraindication] bit  NULL
);
GO

-- Creating table 'Report_ZhuSuAndXianBingShi'
CREATE TABLE [dbo].[Report_ZhuSuAndXianBingShi] (
    [ID] uniqueidentifier  NOT NULL,
    [ChestPainExist] nvarchar(50)  NULL,
    [IncentiveExist] nvarchar(50)  NULL,
    [PositionExist] nvarchar(50)  NULL,
    [RadiationPainExist] nvarchar(50)  NULL,
    [ConcomitantSymptomExist] nvarchar(50)  NULL,
    [IncentiveTypePhysical] bit  NULL,
    [IncentiveTypeExcite] bit  NULL,
    [IncentiveTypeEatMuch] bit  NULL,
    [IncentiveTypeDefecate] bit  NULL,
    [IncentiveTypeColdStimulation] bit  NULL,
    [IncentiveTypeOther] bit  NULL,
    [PositionTypePrecordium] bit  NULL,
    [PositionTypeChest] bit  NULL,
    [PositionTypeBelowXiphoid] bit  NULL,
    [PositionTypeShoulder] bit  NULL,
    [PositionTypeOther] bit  NULL,
    [PropertiesTypeChestPain] bit  NULL,
    [PropertiesTypePharyngeal] bit  NULL,
    [PropertiesTypeChestCut] bit  NULL,
    [PropertiesTypeOther] bit  NULL,
    [RadiationPainTypeLeftShoulder] bit  NULL,
    [RadiationPainTypePharyngeal] bit  NULL,
    [RadiationPainTypeEpigastralgia] bit  NULL,
    [RadiationPainTypeOther] bit  NULL,
    [ConcomitantSymptomTypePalpitation] bit  NULL,
    [ConcomitantSymptomTypeTiredBreath] bit  NULL,
    [ConcomitantSymptomTypeAmaurosis] bit  NULL,
    [ConcomitantSymptomTypeSyncope] bit  NULL,
    [ConcomitantSymptomTypeOther] bit  NULL,
    [RelievingFactorsRest] bit  NULL,
    [RelievingFactorsNitrate] bit  NULL,
    [RelievingFactorsBlackCa] bit  NULL,
    [RelievingFactorsCaRivalry] bit  NULL,
    [RelievingFactorsOther] bit  NULL,
    [RelievingFactorsLastRespond] bit  NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RoleID] int  NOT NULL,
    [RoleName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [UserName] varchar(16)  NOT NULL,
    [Password] nvarchar(50)  NOT NULL,
    [PersonID] uniqueidentifier  NULL,
    [HospitalID] int  NOT NULL,
    [RoleID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Hospitals'
ALTER TABLE [dbo].[Hospitals]
ADD CONSTRAINT [PK_Hospitals]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [LogID] in table 'Log_Login'
ALTER TABLE [dbo].[Log_Login]
ADD CONSTRAINT [PK_Log_Login]
    PRIMARY KEY CLUSTERED ([LogID] ASC);
GO

-- Creating primary key on [ID] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Regions'
ALTER TABLE [dbo].[Regions]
ADD CONSTRAINT [PK_Regions]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Report_ChuBuZhenDuan'
ALTER TABLE [dbo].[Report_ChuBuZhenDuan]
ADD CONSTRAINT [PK_Report_ChuBuZhenDuan]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Report_FuZhuYongYao'
ALTER TABLE [dbo].[Report_FuZhuYongYao]
ADD CONSTRAINT [PK_Report_FuZhuYongYao]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Report_JiBingBanSuiZhuangTai'
ALTER TABLE [dbo].[Report_JiBingBanSuiZhuangTai]
ADD CONSTRAINT [PK_Report_JiBingBanSuiZhuangTai]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Report_JieRuZhiLiao'
ALTER TABLE [dbo].[Report_JieRuZhiLiao]
ADD CONSTRAINT [PK_Report_JieRuZhiLiao]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Report_JingMaiRongShuan'
ALTER TABLE [dbo].[Report_JingMaiRongShuan]
ADD CONSTRAINT [PK_Report_JingMaiRongShuan]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Report_JiWangBingShi'
ALTER TABLE [dbo].[Report_JiWangBingShi]
ADD CONSTRAINT [PK_Report_JiWangBingShi]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Report_LinChuangZhuanGui'
ALTER TABLE [dbo].[Report_LinChuangZhuanGui]
ADD CONSTRAINT [PK_Report_LinChuangZhuanGui]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [PK_Report_Summation]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Report_WeiJinXingJingMaiRongSuanLiYou'
ALTER TABLE [dbo].[Report_WeiJinXingJingMaiRongSuanLiYou]
ADD CONSTRAINT [PK_Report_WeiJinXingJingMaiRongSuanLiYou]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao'
ALTER TABLE [dbo].[Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao]
ADD CONSTRAINT [PK_Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Report_ZhuSuAndXianBingShi'
ALTER TABLE [dbo].[Report_ZhuSuAndXianBingShi]
ADD CONSTRAINT [PK_Report_ZhuSuAndXianBingShi]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [RoleID] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RoleID] ASC);
GO

-- Creating primary key on [ID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [HospitalID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_ReportSummation_Hospital]
    FOREIGN KEY ([HospitalID])
    REFERENCES [dbo].[Hospitals]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ReportSummation_Hospital'
CREATE INDEX [IX_FK_ReportSummation_Hospital]
ON [dbo].[Report_Summation]
    ([HospitalID]);
GO

-- Creating foreign key on [HospitalID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_User_Hospital]
    FOREIGN KEY ([HospitalID])
    REFERENCES [dbo].[Hospitals]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_User_Hospital'
CREATE INDEX [IX_FK_User_Hospital]
ON [dbo].[Users]
    ([HospitalID]);
GO

-- Creating foreign key on [PersonID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_ReportSummation_Person]
    FOREIGN KEY ([PersonID])
    REFERENCES [dbo].[People]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ReportSummation_Person'
CREATE INDEX [IX_FK_ReportSummation_Person]
ON [dbo].[Report_Summation]
    ([PersonID]);
GO

-- Creating foreign key on [PersonID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_User_Person]
    FOREIGN KEY ([PersonID])
    REFERENCES [dbo].[People]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_User_Person'
CREATE INDEX [IX_FK_User_Person]
ON [dbo].[Users]
    ([PersonID]);
GO

-- Creating foreign key on [ReportChunBuZhengDuanID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_ReportSummation_ReportChuBuZhengDuan]
    FOREIGN KEY ([ReportChunBuZhengDuanID])
    REFERENCES [dbo].[Report_ChuBuZhenDuan]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ReportSummation_ReportChuBuZhengDuan'
CREATE INDEX [IX_FK_ReportSummation_ReportChuBuZhengDuan]
ON [dbo].[Report_Summation]
    ([ReportChunBuZhengDuanID]);
GO

-- Creating foreign key on [ReportFuZhuYongYaoID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_ReportSummation_ReportFuZhuYongYao]
    FOREIGN KEY ([ReportFuZhuYongYaoID])
    REFERENCES [dbo].[Report_FuZhuYongYao]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ReportSummation_ReportFuZhuYongYao'
CREATE INDEX [IX_FK_ReportSummation_ReportFuZhuYongYao]
ON [dbo].[Report_Summation]
    ([ReportFuZhuYongYaoID]);
GO

-- Creating foreign key on [ReportBinLiBanSuiZhuangTaiID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_ReportSummation_ReportBinLiBanSuiZhuangTai]
    FOREIGN KEY ([ReportBinLiBanSuiZhuangTaiID])
    REFERENCES [dbo].[Report_JiBingBanSuiZhuangTai]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ReportSummation_ReportBinLiBanSuiZhuangTai'
CREATE INDEX [IX_FK_ReportSummation_ReportBinLiBanSuiZhuangTai]
ON [dbo].[Report_Summation]
    ([ReportBinLiBanSuiZhuangTaiID]);
GO

-- Creating foreign key on [JieRuZhiLiaoID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_Report_Summation_JieRuZhiLiao]
    FOREIGN KEY ([JieRuZhiLiaoID])
    REFERENCES [dbo].[Report_JieRuZhiLiao]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Report_Summation_JieRuZhiLiao'
CREATE INDEX [IX_FK_Report_Summation_JieRuZhiLiao]
ON [dbo].[Report_Summation]
    ([JieRuZhiLiaoID]);
GO

-- Creating foreign key on [ReportJinMaiRongShuanID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_ReportSummation_ReportJinMaiRongShuan]
    FOREIGN KEY ([ReportJinMaiRongShuanID])
    REFERENCES [dbo].[Report_JingMaiRongShuan]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ReportSummation_ReportJinMaiRongShuan'
CREATE INDEX [IX_FK_ReportSummation_ReportJinMaiRongShuan]
ON [dbo].[Report_Summation]
    ([ReportJinMaiRongShuanID]);
GO

-- Creating foreign key on [ReportJiWangBingShiID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_ReportSummation_ReportJiWangBingShi]
    FOREIGN KEY ([ReportJiWangBingShiID])
    REFERENCES [dbo].[Report_JiWangBingShi]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ReportSummation_ReportJiWangBingShi'
CREATE INDEX [IX_FK_ReportSummation_ReportJiWangBingShi]
ON [dbo].[Report_Summation]
    ([ReportJiWangBingShiID]);
GO

-- Creating foreign key on [LinChuangZhuanGuiID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_Report_Summation_LinChuangZhuanGui]
    FOREIGN KEY ([LinChuangZhuanGuiID])
    REFERENCES [dbo].[Report_LinChuangZhuanGui]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Report_Summation_LinChuangZhuanGui'
CREATE INDEX [IX_FK_Report_Summation_LinChuangZhuanGui]
ON [dbo].[Report_Summation]
    ([LinChuangZhuanGuiID]);
GO

-- Creating foreign key on [ID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_Report_Summation_Report_Summation]
    FOREIGN KEY ([ID])
    REFERENCES [dbo].[Report_Summation]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [WeiJinXingJingMaiRongSuanLiYouID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_Report_Summation_WeiJinXingJingMaiRongSuanLiYou]
    FOREIGN KEY ([WeiJinXingJingMaiRongSuanLiYouID])
    REFERENCES [dbo].[Report_WeiJinXingJingMaiRongSuanLiYou]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Report_Summation_WeiJinXingJingMaiRongSuanLiYou'
CREATE INDEX [IX_FK_Report_Summation_WeiJinXingJingMaiRongSuanLiYou]
ON [dbo].[Report_Summation]
    ([WeiJinXingJingMaiRongSuanLiYouID]);
GO

-- Creating foreign key on [WeiJinXingJiZhenGuanMaiJieRuZhiLiaoID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_Report_Summation_WeiJinXingZhenDuan]
    FOREIGN KEY ([WeiJinXingJiZhenGuanMaiJieRuZhiLiaoID])
    REFERENCES [dbo].[Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Report_Summation_WeiJinXingZhenDuan'
CREATE INDEX [IX_FK_Report_Summation_WeiJinXingZhenDuan]
ON [dbo].[Report_Summation]
    ([WeiJinXingJiZhenGuanMaiJieRuZhiLiaoID]);
GO

-- Creating foreign key on [ZhuSuAndXianBingShiID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_Report_Summation_ZhuSuAndXianBingShi]
    FOREIGN KEY ([ZhuSuAndXianBingShiID])
    REFERENCES [dbo].[Report_ZhuSuAndXianBingShi]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Report_Summation_ZhuSuAndXianBingShi'
CREATE INDEX [IX_FK_Report_Summation_ZhuSuAndXianBingShi]
ON [dbo].[Report_Summation]
    ([ZhuSuAndXianBingShiID]);
GO

-- Creating foreign key on [ReportLinChuangZhengZhuangID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_ReportSummation_ReportLinChuangZhengZhuang]
    FOREIGN KEY ([ReportLinChuangZhengZhuangID])
    REFERENCES [dbo].[Report_ZhuSuAndXianBingShi]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ReportSummation_ReportLinChuangZhengZhuang'
CREATE INDEX [IX_FK_ReportSummation_ReportLinChuangZhengZhuang]
ON [dbo].[Report_Summation]
    ([ReportLinChuangZhengZhuangID]);
GO

-- Creating foreign key on [UserID] in table 'Report_Summation'
ALTER TABLE [dbo].[Report_Summation]
ADD CONSTRAINT [FK_ReportSummation_User]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ReportSummation_User'
CREATE INDEX [IX_FK_ReportSummation_User]
ON [dbo].[Report_Summation]
    ([UserID]);
GO

-- Creating foreign key on [RoleID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_User_Role]
    FOREIGN KEY ([RoleID])
    REFERENCES [dbo].[Roles]
        ([RoleID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_User_Role'
CREATE INDEX [IX_FK_User_Role]
ON [dbo].[Users]
    ([RoleID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
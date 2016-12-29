use MedicalBase

--Hospitals default value
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'卫生部', N'国务院直属', 1,1)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市120急救中心'		, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市七三九医院'			, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市二四五医院'			, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市二四二医院'			, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市益民医院'			, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市157医院'			, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市于洪区人民医院'		, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市浑南新区中心医院'	, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市沈北新区中心医院'	, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市苏家屯中心医院'		, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市辽中县人民医院'		, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市新民市中心医院'		, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市康平县人民医院'		, N'一所优秀的医院',			 2,54)
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel], [RegionID]) VALUES ( N'沈阳市法库县第一医院'		, N'一所优秀的医院',			 2,54)

--Roles default value
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'超级管理员')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'管理员')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'用户')

--Users default value, default password is '111111'
INSERT [dbo].[Users] ([UserName], [Password], [PersonID], [HospitalID], [RoleID]) VALUES (N'超级管理员1', N'MTExMTEx', NULL, 1, 1)
INSERT [dbo].[Users] ([UserName], [Password], [PersonID], [HospitalID], [RoleID]) VALUES (N'超级管理员2', N'MTExMTEx', NULL, 1, 1)
INSERT [dbo].[Users] ([UserName], [Password], [PersonID], [HospitalID], [RoleID]) VALUES (N'超级管理员3', N'MTExMTEx', NULL, 1, 1)

insert into Regions values(N'沈阳市',		'shenyang',		N'一座美丽的城市')
insert into Regions values(N'大连市',		'dalian',		N'一座美丽的城市')
insert into Regions values(N'鞍山市',		'anshan',		N'一座美丽的城市')
insert into Regions values(N'抚顺市',		'fushun',		N'一座美丽的城市')
insert into Regions values(N'本溪市',		'benxi',		N'一座美丽的城市')
insert into Regions values(N'丹东市',		'dandong',		N'一座美丽的城市')
insert into Regions values(N'锦州市',		'jinzhou',		N'一座美丽的城市')
insert into Regions values(N'营口市',		'yingkou',		N'一座美丽的城市')
insert into Regions values(N'阜新市',		'fuxin',		N'一座美丽的城市')
insert into Regions values(N'辽阳市',		'liaoyang',		N'一座美丽的城市')
insert into Regions values(N'盘锦市',		'panjin',		N'一座美丽的城市')
insert into Regions values(N'铁岭市',		'tieling',		N'一座美丽的城市')
insert into Regions values(N'朝阳市',		'chaoyang',		N'一座美丽的城市')
insert into Regions values(N'葫芦岛市',		'huludao',		N'一座美丽的城市')
SELECT * FROM [MedicalBase].[dbo].[Regions]


















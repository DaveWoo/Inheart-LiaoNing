use MedicalBase

--Hospitials default value
INSERT [dbo].[Hospitals]([HospitalName], [Description], [HospitalLevel]) VALUES ( N'卫生部', N'3', NULL)

--Roles default value
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'超级管理员')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'管理员')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'用户')

--Users default value, default password is '111111'
INSERT [dbo].[Users] ([UserName], [Password], [PersonID], [HospitalID], [RoleID]) VALUES (N'超级管理员1', N'MTExMTEx', NULL, 1, 1)
INSERT [dbo].[Users] ([UserName], [Password], [PersonID], [HospitalID], [RoleID]) VALUES (N'超级管理员2', N'METxMETx', NULL, 1, 1)
INSERT [dbo].[Users] ([UserName], [Password], [PersonID], [HospitalID], [RoleID]) VALUES (N'超级管理员3', N'MTExMTEx', NULL, 1, 1)


insert into Regions values('大连市',		'dalian',		'')
insert into Regions values('鞍山市',		'anshan',		'')
insert into Regions values('抚顺市',		'fushun',		'')
insert into Regions values('本溪市',		'benxi',		'')
insert into Regions values('丹东市',		'dandong',		'')
insert into Regions values('锦州市',		'jinzhou',		'')
insert into Regions values('营口市',		'yingkou',		'')
insert into Regions values('阜新市',		'fuxin',		'')
insert into Regions values('辽阳市',		'liaoyang',		'')
insert into Regions values('盘锦市',		'panjin',		'')
insert into Regions values('铁岭市',		'tieling',		'')
insert into Regions values('朝阳市',		'chaoyang',		'')
insert into Regions values('葫芦岛市',		'huludao',		'')
SELECT * FROM [MedicalBase].[dbo].[Regions]



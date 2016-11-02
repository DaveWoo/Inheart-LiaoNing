using System;
using System.Collections.Generic;
using System.Linq;
using DreamWork.ObjectModel;

namespace DreamWork.BussinessLogic
{
	/// <summary>
	/// 用户管理类
	/// </summary>
	public class SiteManagement
	{
		private List<User> userTable;
		private Role userRole;
		public static int PageSize = 12;
		public static int TotalNums;

		public SiteManagement() { }

		/// <summary>
		/// 用户管理类的构造器
		/// </summary>
		/// <param name="userName">用户名</param>
		/// <param name="password">密码</param>
		public SiteManagement(string userName, string password)
		{
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				userTable = new List<User>();
				userTable = (from p in context.Users
							 where (p.UserName == userName && p.Password == password)
							 select p).ToList<User>();
				userRole = userTable.FirstOrDefault().Role;
			}
		}

		/// <summary>
		/// 用户是否登陆
		/// </summary>
		/// <param name="userName">用户名</param>
		/// <param name="password">密码</param>
		/// <returns>用户是否登陆</returns>
		public static bool IsLogon(string userName, string password)
		{
			bool result = false;

			// 对密码进行加密
			byte[] bytes = System.Text.Encoding.Default.GetBytes(password);
			string strPassword = Convert.ToBase64String(bytes);

			try
			{
				using (MedicalBaseEntities context = new MedicalBaseEntities())
				{
					List<User> userTable = new List<User>();
					userTable = (from p in context.Users
								 where (p.UserName == userName.Trim()
								 && p.Password == strPassword)
								 select p).ToList<User>();
					if (userTable.Count > 0)
					{
						// 写入日志中
						WriteLogLogin(userTable[0].ID, userTable[0].HospitalID, null);
						result = true;
					}
				}
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		/// <summary>
		/// 用户是否登陆
		/// </summary>
		/// <param name="userName">用户名</param>
		/// <param name="password">密码</param>
		/// <param name="hospitalName">所在医院</param>
		/// <returns>用户是否登陆</returns>
		public static bool IsLogon(string userName, string password, string hospitalName)
		{
			bool result = false;

			// 对密码进行加密
			byte[] bytes = System.Text.Encoding.Default.GetBytes(password);
			string strPassword = Convert.ToBase64String(bytes);

			try
			{
				using (MedicalBaseEntities context = new MedicalBaseEntities())
				{
					context.ContextOptions.LazyLoadingEnabled = true;
					List<User> userTable = new List<User>();
					userTable = (from p in context.Users
								 where (p.UserName == userName.Trim()
								 && p.Password == strPassword
								 && p.Hospital.HospitalName == hospitalName)
								 select p).ToList<User>();
					if (userTable.Count > 0)
					{
						// Write log
						WriteLogLogin(userTable[0].ID, userTable[0].HospitalID, null);
						result = true;
					}
					context.ContextOptions.LazyLoadingEnabled = false;
				}
			}
			catch (Exception)
			{
				result = false;
			}

			return result;
		}

		/// <summary>
		/// 获得用户的身份信息
		/// </summary>
		/// <returns></returns>
		public UserRole GetUserRole()
		{
			UserRole role = UserRole.NA;

			if (this.userRole != null)
			{
				if (this.userRole.RoleName == "Admin")
				{
					role = UserRole.Admin;
				}
				else if (this.userRole.RoleName == "SupperAdmin")
				{
					role = UserRole.SA;
				}
				else if (this.userRole.RoleName == "User")
				{
					role = UserRole.User;
				}
			}
			return role;
		}

		#region 登陆日志

		/// <summary>
		/// 登陆信息写入日志
		/// </summary>
		/// <param name="userID">用户ID</param>
		/// <param name="hospitalID">医院ID</param>
		/// <param name="detail">详细登陆信息</param>
		public static void WriteLogLogin(int userID, int hospitalID, string detail)
		{
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				List<Log_Login> loginList = new List<Log_Login>();
				loginList = (from p in context.Log_Login
							 select p).ToList<Log_Login>();

				var login = new Log_Login();
				login.LoginDate = System.DateTime.UtcNow;
				login.UserID = userID;
				login.HospitalID = hospitalID;
				login.Detail = detail;

				context.Log_Login.AddObject(login);
				context.SaveChanges();
			}
		}

		/// <summary>
		/// 获得所属医院的登陆信息
		/// </summary>
		/// <param name="hospitalID">医院ID</param>
		/// <returns>返回所有登陆信息</returns>
		public static List<Log_Login> GetLogLogin(int hospitalID)
		{
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				List<Log_Login> loginList = (from p in context.Log_Login
											 where p.HospitalID == hospitalID
											 select p).ToList<Log_Login>();

				return loginList;
			}
		}

		#endregion 登陆日志

		#region 医院管理

		/// <summary>
		/// 创建一家医院
		/// </summary>
		/// <param name="name">医院名称</param>
		/// <param name="RegionName">医院所在区域</param>
		/// <param name="desciption">医院描述</param>
		/// <param name="message">相关信息</param>
		/// <returns>是否创建成功</returns>
		public static bool CreateHospital(string name, string RegionName, string desciption, out string message)
		{
			message = string.Empty;
			bool isSuccess = false;
			if (string.IsNullOrWhiteSpace(RegionName))
			{
				return false;
			}

			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<Hospital> hospitalList = new List<Hospital>();
					hospitalList = (from p in context.Hospitals
									select p).ToList<Hospital>();

					var hos = SiteManagement.GetHospital(name);
					if (hos == null)
					{
						Region region = GetRegion(RegionName);
						if (region == null)
							return false;

						var newHospital = new Hospital();
						newHospital.Description = desciption;
						newHospital.HospitalName = name;
						newHospital.RegionID = region.ID;
						// context.Hospitals.ApplyCurrentValues(newHospital);
						context.Hospitals.AddObject(newHospital);
						context.SaveChanges();
						isSuccess = true;
					}
					else
					{
						isSuccess = false;
					}
				}
				catch (Exception ex)
				{
					// 出错信息返回
					message = ex.Message.ToString();
					isSuccess = false;
				}
			}
			return isSuccess;
		}

		/// <summary>
		/// 获得所有区域
		/// </summary>
		/// <returns>返回所有区域信息</returns>
		public static List<Region> GetRegion()
		{
			List<Region> regionList;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					regionList = new List<Region>();
					regionList = (from p in context.Regions
								  select p).ToList<Region>();
				}
				catch (Exception ex)
				{
					regionList = null;
				}
			}
			return regionList;
		}

		/// <summary>
		/// 通过区域名称获得相应的区域信息
		/// </summary>
		/// <param name="regionName">区域名称</param>
		/// <returns>返回区域的具体信息</returns>
		public static Region GetRegion(string regionName)
		{
			if (string.IsNullOrWhiteSpace(regionName))
			{
				return null;
			}
			Region region = null;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<Region> regionList = new List<Region>();
					regionList = (from p in context.Regions
								  select p).ToList<Region>();
					region = regionList.Find(p => p.RegionName == regionName.Trim());
				}
				catch (Exception ex)
				{
					region = null;
				}
			}
			return region;
		}

		/// <summary>
		/// 通过区域ID获得相应的区域信息
		/// </summary>
		/// <param name="regionID">区域ID</param>
		/// <returns>返回区域的具体信息<</returns>
		public static Region GetRegionByID(int regionID)
		{
			Region region = null;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<Region> regionList = new List<Region>();
					regionList = (from p in context.Regions
								  select p).ToList<Region>();
					region = regionList.Find(p => p.ID == regionID);
				}
				catch (Exception ex)
				{
					region = null;
				}
			}
			return region;
		}

		/// <summary>
		/// 通过区域名称获得相应的区域信息
		/// </summary>
		/// <param name="regionName">区域名称</param>
		/// <returns>返回区域的具体信息</returns>
		public static Region GetRegionByShortName(string shortName)
		{
			if (shortName == null)
				return null;

			Region region = null;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<Region> regionList = new List<Region>();
					regionList = (from p in context.Regions
								  select p).ToList<Region>();
					region = regionList.Find(p => p.RegionShortName == shortName);
				}
				catch (Exception ex)
				{
					region = null;
				}
			}
			return region;
		}

		/// <summary>
		/// 修改医院信息
		/// </summary>
		/// <param name="name">医院名称</param>
		/// <param name="newHostpitalName">新医院名称</param>
		/// <param name="newDesciption">新医院描述</param>
		/// <returns>是否修改成功</returns>
		public static bool UpdateHospital(string name, string newHostpitalName, string newDesciption)
		{
			bool isSuccess = false;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<Hospital> hospitalList = new List<Hospital>();
					hospitalList = (from p in context.Hospitals
									where p.HospitalName == name
									select p).ToList<Hospital>();

					if (hospitalList.Count > 0)
					{
						hospitalList[0].Description = newDesciption;
						hospitalList[0].HospitalName = newHostpitalName;
						context.Hospitals.ApplyCurrentValues(hospitalList[0]);
						// context.Hospitals.AddObject(hospitalList[0]);
						context.SaveChanges();
						isSuccess = true;
					}
				}
				catch
				{
					isSuccess = false;
				}
			}
			return isSuccess;
		}

		/// <summary>
		/// 修改医院信息
		/// </summary>
		/// <param name="name">医院名称</param>
		/// <param name="newHostpitalName">新医院名称</param>
		/// <param name="newDesciption">新医院描述</param>
		/// <param name="message">返回信息</param>
		/// <returns>是否修改成功</returns>
		public static bool UpdateHospital(string name, string newHostpitalName, string newDesciption, out string message)
		{
			bool isSuccess = false;
			message = string.Empty;

			Hospital hos = GetHospital(newHostpitalName);

			if (hos != null)
			{
				message = "此医院: " + newDesciption + " 已经存在！";
				return false;
			}

			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<Hospital> hospitalList = new List<Hospital>();
					hospitalList = (from p in context.Hospitals
									where p.HospitalName == name
									select p).ToList<Hospital>();

					if (hospitalList.Count > 0)
					{
						hospitalList[0].Description = newDesciption;
						hospitalList[0].HospitalName = newHostpitalName;
						context.Hospitals.ApplyCurrentValues(hospitalList[0]);
						// context.Hospitals.AddObject(hospitalList[0]);
						context.SaveChanges();
						isSuccess = true;
					}
				}
				catch (Exception ex)
				{
					message = "Error: " + ex.Message.ToString();
					isSuccess = false;
				}
			}
			return isSuccess;
		}

		/// <summary>
		/// 修改医院信息
		/// </summary>
		/// <param name="ID">医院ID</param>
		/// <param name="newHostpitalName">新医院名称</param>
		/// <param name="newDesciption">新医院描述</param>
		/// <param name="message">返回信息</param>
		/// <returns>是否修改成功</returns>
		public static bool UpdateHospital(uint ID, string newHostpitalName, string newDesciption, out string message)
		{
			bool isSuccess = false;
			message = string.Empty;

			Hospital hos = GetHospital(newHostpitalName);

			if (hos != null)
			{
				message = "此医院: " + newDesciption + " 已经存在！";
				return false;
			}
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<Hospital> hospitalList = new List<Hospital>();
					hospitalList = (from p in context.Hospitals
									where p.ID == ID
									select p).ToList<Hospital>();

					if (hospitalList.Count > 0)
					{
						hospitalList[0].Description = newDesciption;
						hospitalList[0].HospitalName = newHostpitalName;
						context.Hospitals.ApplyCurrentValues(hospitalList[0]);
						// context.Hospitals.AddObject(hospitalList[0]);
						context.SaveChanges();
						isSuccess = true;
					}
				}
				catch (Exception ex)
				{
					isSuccess = false;
					message = ex.Message.ToString();
				}
			}
			return isSuccess;
		}

		/// <summary>
		/// 获得所有医院
		/// </summary>
		/// <returns>返回所有医院</returns>
		private static List<Hospital> GetAllHospital()
		{
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				List<Hospital> hospital = (from p in context.Hospitals
										   select p).ToList<Hospital>();
				return hospital;
			}
			return null;
		}

		/// <summary>
		/// 所有下级医院
		/// </summary>
		/// <param name="userID">用户ID</param>
		/// <returns>返回所有下级医院</returns>
		public static List<Hospital> GetHospitals(int userID)
		{
			List<Hospital> hospital = GetAllHospital();

			string message = string.Empty;
			SiteUser user = GetUser(userID, ref message);
			if (user.Hospital != null)
			{
				int managerHospitalID = hospital.FindIndex(p => p.ID == user.Hospital.ID);
				hospital.RemoveAt(managerHospitalID);
				return hospital;
			}
			return null;
		}

		/// <summary>
		/// 获得指定区域的所有医院
		/// </summary>
		/// <param name="hospitialRegionName">区域名称</param>
		/// <returns>返回指定区域的所有医院</returns>
		public static List<Hospital> GetAllHospital(string hospitialRegionName)
		{
			List<Hospital> temp = new List<Hospital>();
			List<Hospital> hospital = GetAllHospital();

			try
			{
				string message = string.Empty;
				Region region = GetRegionByShortName(hospitialRegionName);

				if (region != null)
				{
					temp = hospital.FindAll(p => p.RegionID == region.ID);
				}
			}
			catch (Exception)
			{
				temp = null;
			}

			return temp;
		}

		/// <summary>
		/// 获得医院的具体信息
		/// </summary>
		/// <param name="name">医院名称</param>
		/// <returns>返回医院的具体信息</returns>
		public static Hospital GetHospital(string name)
		{
			if (string.IsNullOrEmpty(name))
			{
				return null;
			}

			Hospital hos = null;
			List<Hospital> hospitalList;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				hospitalList = new List<Hospital>();
				hospitalList = (from p in context.Hospitals
								where p.HospitalName == name.Trim()
								select p).ToList<Hospital>();
			}
			if (hospitalList.Count > 0)
			{
				hos = new Hospital();
				hos = hospitalList[0];
			}

			return hos;
		}

		/// <summary>
		/// 获得医院的具体信息
		/// </summary>
		/// <param name="ID">医院ID</param>
		/// <returns>返回医院的具体信息</returns>
		public static Hospital GetHospital(uint ID)
		{
			Hospital hos = null;
			List<Hospital> hospitalList;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				hospitalList = new List<Hospital>();
				hospitalList = (from p in context.Hospitals
								where p.ID == ID
								select p).ToList<Hospital>();
			}
			if (hospitalList.Count > 0)
			{
				hos = new Hospital();
				hos = hospitalList[0];
			}

			return hos;
		}

		/// <summary>
		/// 删除医院
		/// </summary>
		/// <param name="id">医院ID</param>
		/// <returns>是否删除成功</returns>
		public static bool DeleteHospital(int id)
		{
			bool isSuccess = false;

			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<Hospital> hospitalList = new List<Hospital>();
					hospitalList = (from p in context.Hospitals
									where p.ID == id
									select p).ToList<Hospital>();

					if (hospitalList.Count > 0)
					{
						context.DeleteObject(hospitalList[0]);
						context.SaveChanges();
						isSuccess = true;
					}
				}
				catch
				{
					isSuccess = false;
				}
			}

			return isSuccess;
		}

		/// <summary>
		/// 获得所有医院数目
		/// </summary>
		/// <returns>返回所有医院数目</returns>
		public static int GetTotalHospitalRecord()
		{
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<Hospital> hospitalList = new List<Hospital>();
					hospitalList = (from p in context.Hospitals
									select p).ToList<Hospital>();

					return hospitalList.Count;
				}
				catch (Exception ex)
				{
					return -1;
				}
			}
		}

		/// <summary>
		/// 返回所有用户个数
		/// </summary>
		/// <param name="roleID">角色ID</param>
		/// <returns>返回指定角色的所有用户</returns>
		public static int GetTotalUserRecord(int roleID)
		{
			if (roleID > 3 || roleID < 0)
			{
				return -1;
			}

			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<User> userList = new List<User>();
					userList = (from p in context.Users
								where p.RoleID == roleID
								select p).ToList<User>();

					return userList.Count;
				}
				catch (Exception ex)
				{
					return -1;
				}
			}
		}

		#endregion 医院管理

		#region 用户管理

		/// <summary>
		/// 创建用户
		/// </summary>
		/// <param name="name">用户名称</param>
		/// <param name="password">密码</param>
		/// <param name="hospitalID">医院ID</param>
		/// <param name="roleID">角色信息</param>
		/// <param name="errorMessage">错误信息</param>
		/// <returns>是否创建成功</returns>
		public static bool CreateUser(string name, string password, int hospitalID, int roleID, ref string errorMessage)
		{
			bool isSuccess = false;

			byte[] bytes = System.Text.Encoding.Default.GetBytes(password);
			string strPassword = Convert.ToBase64String(bytes);

			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<User> userList = new List<User>();
					userList = (from p in context.Users
								where p.UserName == name
								select p).ToList<User>();

					if (userList.Count == 0)
					{
						List<SiteUser> siteUser = GetAllUserByHospitalID(hospitalID, roleID);
						if (siteUser != null && roleID == 2)
						{
							if (siteUser.Count > 0)
							{
								errorMessage = siteUser[0].Hospital.HospitalName + "： 已经存在一个管理员，此次不能再添加新管理员！！";
								return false;
							}
						}
						else if (siteUser != null && roleID == 3)
						{
							if (siteUser.Count > 3)
							{
								errorMessage = siteUser[0].Hospital.HospitalName + "： 已经达到用户使用上限，此次不能再添加新用户！！";
								return false;
							}
						}

						// 增加用户基本信息
						Person newPerson = new Person();
						newPerson.ID = Guid.NewGuid();
						newPerson.Name = name;
						newPerson.CreateDate = System.DateTime.UtcNow;
						newPerson.UpdatedDate = System.DateTime.UtcNow;
						context.People.AddObject(newPerson);

						context.SaveChanges();

						// 增加用户
						User newUser = new User();
						newUser.PersonID = newPerson.ID;
						newUser.UserName = name;
						newUser.Password = strPassword;
						newUser.HospitalID = hospitalID;
						newUser.RoleID = roleID;
						context.Users.AddObject(newUser);
						context.SaveChanges();

						isSuccess = true;
					}
					else
					{
						errorMessage = "此用户已存在！！";
						return false;
					}
				}
				catch (Exception ex)
				{
					errorMessage = ex.Message.ToString();
					isSuccess = false;
				}
			}
			return isSuccess;
		}

		/// <summary>
		/// 修改用户密码
		/// </summary>
		/// <param name="name">用户姓名</param>
		/// <param name="oringinalPassword">原始密码</param>
		/// <param name="newPassword">新密码</param>
		public static void UpdateUserPassword(string name, string oringinalPassword, string newPassword)
		{
			byte[] bytes = System.Text.Encoding.Default.GetBytes(oringinalPassword);
			string strPassword = Convert.ToBase64String(bytes);

			bytes = System.Text.Encoding.Default.GetBytes(newPassword);
			string strNewPassword = Convert.ToBase64String(bytes);

			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				List<User> userList = new List<User>();
				userList = (from p in context.Users
							where p.UserName == name && p.Password == strPassword
							select p).ToList<User>();

				if (userList.Count > 0)
				{
					userList[0].UserName = name;
					userList[0].Password = strNewPassword;
					context.Users.ApplyCurrentValues(userList[0]);
					context.SaveChanges();
				}
			}
		}

		/// <summary>
		/// 修改用户密码
		/// </summary>
		/// <param name="name">用户名</param>
		/// <param name="newPassword">新密码</param>
		/// <returns>是否修改成功</returns>
		public static bool UpdateUserPassword(string name, string newPassword)
		{
			byte[] bytes = System.Text.Encoding.Default.GetBytes(newPassword);
			string strPassword = Convert.ToBase64String(bytes);

			bool isSucess = false;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<User> userList = new List<User>();
					userList = (from p in context.Users
								where p.UserName == name
								select p).ToList<User>();

					if (userList.Count > 0)
					{
						userList[0].UserName = name;
						userList[0].Password = strPassword;
						context.Users.ApplyCurrentValues(userList[0]);
						context.SaveChanges();
						isSucess = true;
					}
				}
				catch (Exception ex)
				{
					isSucess = false;
				}
			}

			return isSucess;
		}

		/// <summary>
		/// 获得用户信息
		/// </summary>
		/// <param name="name">用户名</param>
		/// <param name="message">出错信息</param>
		/// <returns>返回用户的基本信息</returns>
		public static SiteUser GetUser(string name, ref string message)
		{
			List<User> userList = null;
			SiteUser siteUser = null;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				userList = new List<User>();
				userList = (from p in context.Users
							where p.UserName == name
							select p).ToList<User>();

				int order = 1;
				foreach (var item in userList)
				{
					siteUser = new SiteUser();
					siteUser.ID = item.ID;
					siteUser.OrderID = order++;
					siteUser.UserName = item.UserName;
					siteUser.Hospital = item.Hospital;
					siteUser.Role = item.Role;
				}
			}

			return siteUser;
		}

		/// <summary>
		/// 获得用户信息
		/// </summary>
		/// <param name="ID">用户ID</param>
		/// <param name="message">出错信息</param>
		/// <returns>返回用户的基本信息</returns>
		public static SiteUser GetUser(int ID, ref string message)
		{
			List<User> userList = null;
			SiteUser siteUser = null;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					userList = new List<User>();
					userList = (from p in context.Users
								where p.ID == ID
								select p).ToList<User>();

					int order = 1;
					foreach (var item in userList)
					{
						siteUser = new SiteUser();
						siteUser.ID = item.ID;
						siteUser.OrderID = order++;
						siteUser.UserName = item.UserName;
						siteUser.Hospital = item.Hospital;
						siteUser.Role = item.Role;
					}
				}
				catch (Exception ex)
				{
					message = ex.Message.ToString();
				}
			}

			return siteUser;
		}

		/// <summary>
		/// 获得所有用户信息
		/// </summary>
		/// <param name="roleID">角色ID</param>
		/// <returns>返回所有用户信息</returns>
		public static List<SiteUser> GetAllUser(int roleID)
		{
			List<User> userList = null;
			List<SiteUser> siteUserList = null;
			SiteUser siteUser = null;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				userList = new List<User>();
				siteUserList = new List<SiteUser>();

				userList = (from p in context.Users
							where p.RoleID == roleID
							select p).ToList<User>();
				int order = 1;
				foreach (var item in userList)
				{
					siteUser = new SiteUser();
					siteUser.ID = item.ID;
					siteUser.OrderID = order++;
					siteUser.UserName = item.UserName;
					siteUser.Hospital = item.Hospital;
					siteUser.Role = item.Role;

					siteUserList.Add(siteUser);
				}
			}

			return siteUserList;
		}

		/// <summary>
		/// 返回指定医院的所有用户
		/// </summary>
		/// <param name="hospitalID">医院ID</param>
		/// <returns>返回医院所有的用户信息</returns>
		public static List<SiteUser> GetAllUserByHospitalID(int hospitalID)
		{
			List<User> userList = null;
			List<SiteUser> siteUserList = null;
			SiteUser siteUser = null;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				userList = new List<User>();
				siteUserList = new List<SiteUser>();

				userList = (from p in context.Users
							where p.HospitalID == hospitalID
							&& p.RoleID == 3
							select p).ToList<User>();
				int order = 1;
				foreach (var item in userList)
				{
					siteUser = new SiteUser();
					siteUser.ID = item.ID;
					siteUser.OrderID = order++;
					siteUser.UserName = item.UserName;
					siteUser.Hospital = item.Hospital;
					siteUser.Role = item.Role;
					siteUserList.Add(siteUser);
				}
			}

			return siteUserList;
		}

		/// <summary>
		/// 返回指定医院的所有用户
		/// </summary>
		/// <param name="hospitalID">医院ID</param>
		/// <param name="roleID">用户角色</param>
		/// <returns>返回医院所有的用户信息</returns>
		public static List<SiteUser> GetAllUserByHospitalID(int hospitalID, int roleID)
		{
			List<User> userList = null;
			List<SiteUser> siteUserList = null;
			SiteUser siteUser = null;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				userList = new List<User>();
				siteUserList = new List<SiteUser>();

				userList = (from p in context.Users
							where p.HospitalID == hospitalID &&
							p.RoleID == roleID
							select p).ToList<User>();
				int order = 1;
				foreach (var item in userList)
				{
					siteUser = new SiteUser();
					siteUser.ID = item.ID;
					siteUser.OrderID = order++;
					siteUser.UserName = item.UserName;
					siteUser.Hospital = item.Hospital;
					siteUser.Role = item.Role;
					siteUserList.Add(siteUser);
				}
			}

			return siteUserList;
		}

		/// <summary>
		/// 删除用户
		/// </summary>
		/// <param name="ID">用户ID</param>
		/// <returns>是否删除成功</returns>
		public static bool DeleteUser(int ID)
		{
			bool isSuccess = false;
			using (MedicalBaseEntities context = new MedicalBaseEntities())
			{
				try
				{
					List<User> userList = new List<User>();
					userList = (from p in context.Users
								where p.ID == ID
								select p).ToList<User>();

					if (userList != null && userList.Count > 0)
					{
						context.DeleteObject(userList[0]);
						context.SaveChanges();
						// context.CascadingDeleteOnSubmit(user);
					}
					isSuccess = true;
				}
				catch
				{
					isSuccess = false;
				}
			}
			return isSuccess;
		}

		#endregion 用户管理

		/// <summary>
		/// 获得用户
		/// </summary>
		/// <param name="user">获得用户</param>
		/// <param name="message">出错信息</param>
		public static SiteUser GetUser(SiteUser user, ref string message)
		{
			throw new NotImplementedException();
		}

		/// <summary>
		/// 是否对此条记录枷锁
		/// </summary>
		/// <param name="report">病例信息</param>
		/// <returns>是否枷锁成功</returns>
		public static bool IsLocked(Report_Summation report)
		{
			bool isLocked = false;

			if (report == null)
			{
				isLocked = true;
			}
			if (report.CreateDate.AddDays(3) < DateTime.Now)
			{
				isLocked = true;
			}
			return isLocked;
		}

		/// <summary>
		/// 是否对此条记录枷锁
		/// </summary>
		/// <param name="reportID">病例信息ID</param>
		/// <returns>是否枷锁成功</returns>
		public static bool IsLocked(string reportID)
		{
			bool isLocked = true;

			int nReportID = 0;
			if (!Int32.TryParse(reportID, out nReportID))
			{
				return false;
			}
			MedicalReportBLO medicalReportBLO = new MedicalReportBLO();
			Report_Summation report = medicalReportBLO.GetReportSummationByReportID(nReportID);
			if (report == null)
			{
				return false;
			}
			if (report.LastUpdateDate.AddDays(10) < DateTime.Now)
			{
				return false;
			}
			return isLocked;
		}
	}

	/// <summary>
	/// 用户权限类
	/// </summary>
	public enum UserRole
	{
		/// <summary>
		/// 超级管理员
		/// </summary>
		SA,

		/// <summary>
		/// 系统管理员
		/// </summary>
		Admin,

		/// <summary>
		/// 基层医生
		/// </summary>
		User,

		NA
	}

	/// <summary>
	/// 用户角色信息类
	/// </summary>
	public class SiteUser
	{
		public int ID { get; set; }
		public int OrderID { get; set; }
		public string UserName { get; set; }
		public Person Person { get; set; }
		public Role Role { get; set; }
		public Hospital Hospital { get; set; }
	}

	/// <summary>
	/// 报告类
	/// </summary>
	public class SiteMedicalReport
	{
		public string PatientID { get; set; }
		public string ReportID { get; set; }
	}
}
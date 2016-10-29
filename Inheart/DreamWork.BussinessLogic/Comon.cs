

namespace DreamWork.BussinessLogic
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Data.Objects.DataClasses;
    using DreamWork.ObjectModel;

    public class SiteManagement
    {
        List<User> userTable;
        Role userRole;
        public static int PageSize = 12;
        public static int TotalNums;

        public SiteManagement() { }

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
        public static bool IsLogon(string userName, string password)
        {
            bool result = false;

            byte[] bytes = System.Text.Encoding.Default.GetBytes(password);
            string strPassword = Convert.ToBase64String(bytes);

            //base 64 decode 
            //bytes = Convert.FromBase64String(str);
            //string s = System.Text.Encoding.Default.GetString(bytes);
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
                        // Write log
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


        public static bool IsLogon(string userName, string password, string hospitalName)
        {
            bool result = false;

            byte[] bytes = System.Text.Encoding.Default.GetBytes(password);
            string strPassword = Convert.ToBase64String(bytes);

            //base 64 decode 
            //bytes = Convert.FromBase64String(str);
            //string s = System.Text.Encoding.Default.GetString(bytes);
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

        #region Lonin Log

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

        public static List<Log_Login> GetLogLogin(int hospitalID)
        {
            List<Log_Login> loginHospitalList;
            using (MedicalBaseEntities context = new MedicalBaseEntities())
            {
                List<Log_Login> loginList = (from p in context.Log_Login
                                             where p.HospitalID == hospitalID
                                             select p).ToList<Log_Login>();

                //loginHospitalList = loginList.FindAll(p => p.HospitalID == hospitalID);

                return loginList;
            }
        }


        #endregion

        #region Hospital

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
                        //  context.Hospitals.ApplyCurrentValues(newHospital);
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
                    // message = ex.Message.ToString();
                    isSuccess = false;
                }
            }
            return isSuccess;
        }

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
        /// The method is used to Update hospital name and comment.
        /// </summary>
        /// <param name="name"></param>
        /// <param name="newHostpitalName"></param>
        /// <param name="newDesciption"></param>
        /// <returns></returns>
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
        /// The method is used to Update hospital name and comment.
        /// </summary>
        /// <param name="name"></param>
        /// <param name="newHostpitalName"></param>
        /// <param name="newDesciption"></param>
        /// <returns></returns>
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
                    // message = ex.Message.ToString();
                }
            }
            return isSuccess;
        }

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

        #endregion

        #region User Manage

        /// <summary>
        /// 
        /// </summary>
        /// <param name="name"></param>
        /// <param name="password"></param>
        /// <param name="hospitalName"></param>
        /// <param name="roleID">the value in 1,2,3; 1=sa, 2=admin,3=user</param>
        /// <returns></returns>
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

                        // Add Person
                        Person newPerson = new Person();
                        newPerson.ID = Guid.NewGuid();
                        newPerson.Name = name;
                        newPerson.CreateDate = System.DateTime.UtcNow;
                        newPerson.UpdatedDate = System.DateTime.UtcNow;
                        context.People.AddObject(newPerson);

                        context.SaveChanges();

                        // Add user
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
                    // errorMessage = ex.Message.ToString();
                    isSuccess = false;
                }
            }
            return isSuccess;
        }

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
                    // message = ex.Message.ToString();
                }
            }

            return siteUser;
        }

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

        #endregion

        #region Persoin

        #endregion

        public static SiteUser GetUser(SiteUser user, ref string message)
        {
            throw new NotImplementedException();
        }

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
            // todo;
            return isLocked;
        }

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
            // todo;
            return isLocked;
        }
    }

    public enum UserRole
    {
        SA,
        Admin,
        User,
        NA
    }

    public class SiteUser
    {
        public int ID { get; set; }
        public int OrderID { get; set; }
        public string UserName { get; set; }
        public Person Person { get; set; }
        public Role Role { get; set; }
        public Hospital Hospital { get; set; }
    }

    public class SiteMedicalReport
    {
        public string PatientID { get; set; }
        public string ReportID { get; set; }
    }
}

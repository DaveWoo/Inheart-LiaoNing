using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DreamWork.ObjectModel;

namespace DreamWork.BussinessLogic
{
    public class MedicalReportBLO
    {
        public List<Report_Summation> GetReportSummationByPersonName(string personName)
        {
            List<Report_Summation> reportSummationList = new List<Report_Summation>();
            try
            {
                using (MedicalBaseEntities context = new MedicalBaseEntities())
                {
                    reportSummationList = (from p in context.Report_Summation
                                           where p.Person.Name == personName
                                           select p).ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
            return reportSummationList;
        }

        public Report_Summation GetReportSummationByReportID(int reportID)
        {
            Report_Summation reportSummation = null;
            try
            {
                using (MedicalBaseEntities context = new MedicalBaseEntities())
                {
                    context.ContextOptions.LazyLoadingEnabled = true;
                    Report_Summation temp = (from p in context.Report_Summation
                                             where p.ID == reportID
                                             orderby p.LastUpdateDate descending
                                             select p).FirstOrDefault();
                    if (temp != null)
                    {
                        reportSummation = temp;
                        reportSummation.Person = temp.Person;
                        reportSummation.Report_ChuBuZhenDuan = temp.Report_ChuBuZhenDuan;
                        reportSummation.Report_FuZhuYongYao = temp.Report_FuZhuYongYao;
                        reportSummation.Report_JiBingBanSuiZhuangTai = temp.Report_JiBingBanSuiZhuangTai;
                        reportSummation.Report_JieRuZhiLiao = temp.Report_JieRuZhiLiao;
                        reportSummation.Report_JingMaiRongShuan = temp.Report_JingMaiRongShuan;
                        reportSummation.Report_JiWangBingShi = temp.Report_JiWangBingShi;
                        reportSummation.Report_LinChuangZhuanGui = temp.Report_LinChuangZhuanGui;
                        reportSummation.Report_WeiJinXingJingMaiRongSuanLiYou = temp.Report_WeiJinXingJingMaiRongSuanLiYou;
                        reportSummation.Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao = temp.Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao;
                        reportSummation.Report_ZhuSuAndXianBingShi = temp.Report_ZhuSuAndXianBingShi;
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
            return reportSummation;
        }

        public void InsertReportSummation(
            Person person,
            Report_JiBingBanSuiZhuangTai reportBinLiBanSuiZhuangTai,
            Report_ChuBuZhenDuan reportChuBuZhengDuan,
            Report_FuZhuYongYao reportFuZhuYongYao,
            Report_JingMaiRongShuan reportJinMaiRongShuan,
            Report_JiWangBingShi reportJiWangBingShi,
            Report_JieRuZhiLiao reportJieRuZhiLiao,
            Report_WeiJinXingJingMaiRongSuanLiYou reportWeiJinXingJingMaiRongSuanLiYou,
            Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao,
            Report_ZhuSuAndXianBingShi reportZhuSuAndXianBingShi,
            Report_LinChuangZhuanGui reportLinChuangZhuangGui,
            Report_ZhuSuAndXianBingShi reportLinChuangZhengZhuang,
            Report_Summation reportSummation, out int reportID)
        {
            try
            {
                using (System.Transactions.TransactionScope transactionScope = new System.Transactions.TransactionScope())
                {
                    using (MedicalBaseEntities context = new MedicalBaseEntities())
                    {
                        #region Person
                        Person personInDB = (from p in context.People
                                             where p.ID == person.ID
                                             select p).FirstOrDefault();
                        if (personInDB == null)
                        {
                            context.People.AddObject(person);
                        }
                        else
                        {
                            context.People.ApplyCurrentValues(person);
                        }
                        context.SaveChanges();
                        #endregion

                        #region Report_JiBingBanSuiZhuangTai
                        Report_JiBingBanSuiZhuangTai reportBinLiBanSuiZhuangTaiInDB = (from p in context.Report_JiBingBanSuiZhuangTai
                                                                                       where p.ID == reportBinLiBanSuiZhuangTai.ID
                                                                                       select p).FirstOrDefault();
                        if (reportBinLiBanSuiZhuangTaiInDB == null)
                        {
                            context.Report_JiBingBanSuiZhuangTai.AddObject(reportBinLiBanSuiZhuangTai);
                        }
                        else
                        {
                            context.Report_JiBingBanSuiZhuangTai.ApplyCurrentValues(reportBinLiBanSuiZhuangTai);
                        }
                        context.SaveChanges();
                        #endregion

                        #region Report_ChuBuZhengDuan
                        Report_ChuBuZhenDuan reportChuBuZhengDuanInDB = (from p in context.Report_ChuBuZhenDuan
                                                                         where p.ID == reportChuBuZhengDuan.ID
                                                                         select p).FirstOrDefault();
                        if (reportChuBuZhengDuanInDB == null)
                        {
                            context.Report_ChuBuZhenDuan.AddObject(reportChuBuZhengDuan);
                        }
                        else
                        {
                            context.Report_ChuBuZhenDuan.ApplyCurrentValues(reportChuBuZhengDuan);
                        }
                        context.SaveChanges();
                        #endregion

                        #region ReportFuZhuYongYao
                        Report_FuZhuYongYao reportFuZhuYongYaoInDB = (from p in context.Report_FuZhuYongYao
                                                                      where p.ID == reportFuZhuYongYao.ID
                                                                      select p).FirstOrDefault();
                        if (reportFuZhuYongYaoInDB == null)
                        {
                            context.Report_FuZhuYongYao.AddObject(reportFuZhuYongYao);
                        }
                        else
                        {
                            context.Report_FuZhuYongYao.ApplyCurrentValues(reportFuZhuYongYao);
                        }
                        context.SaveChanges();
                        #endregion

                        #region ReportJinMaiRongShuan
                        Report_JingMaiRongShuan reportJinMaiRongShuanInDB = (from p in context.Report_JingMaiRongShuan
                                                                             where p.ID == reportJinMaiRongShuan.ID
                                                                             select p).FirstOrDefault();
                        if (reportJinMaiRongShuanInDB == null)
                        {
                            context.Report_JingMaiRongShuan.AddObject(reportJinMaiRongShuan);
                        }
                        else
                        {
                            context.Report_JingMaiRongShuan.ApplyCurrentValues(reportJinMaiRongShuan);
                        }
                        context.SaveChanges();
                        #endregion

                        #region Report_JiWangBingShi
                        Report_JiWangBingShi reportJiWangBingShiInDB = (from p in context.Report_JiWangBingShi
                                                                        where p.ID == reportJiWangBingShi.ID
                                                                        select p).FirstOrDefault();
                        if (reportJiWangBingShiInDB == null)
                        {
                            context.Report_JiWangBingShi.AddObject(reportJiWangBingShi);
                        }
                        else
                        {
                            context.Report_JiWangBingShi.ApplyCurrentValues(reportJiWangBingShi);
                        }
                        context.SaveChanges();
                        #endregion

                        #region Report_ZhuSuAndXianBingShi
                        Report_ZhuSuAndXianBingShi reportLinChuangZhengZhuangInDB = (from p in context.Report_ZhuSuAndXianBingShi
                                                                                     where p.ID == reportLinChuangZhengZhuang.ID
                                                                                     select p).FirstOrDefault();
                        if (reportLinChuangZhengZhuangInDB == null)
                        {
                            context.Report_ZhuSuAndXianBingShi.AddObject(reportLinChuangZhengZhuang);
                        }
                        else
                        {
                            context.Report_ZhuSuAndXianBingShi.ApplyCurrentValues(reportLinChuangZhengZhuang);
                        }
                        context.SaveChanges();
                        #endregion

                        #region Report  JieRuZhiLiao
                        Report_JieRuZhiLiao reportJieRuZhiLiaoInDB = (from p in context.Report_JieRuZhiLiao
                                                                      where p.ID == reportJieRuZhiLiao.ID
                                                                      select p).FirstOrDefault();
                        if (reportJieRuZhiLiaoInDB == null)
                        {
                            context.Report_JieRuZhiLiao.AddObject(reportJieRuZhiLiao);
                        }
                        else
                        {
                            context.Report_JieRuZhiLiao.ApplyCurrentValues(reportJieRuZhiLiao);
                        }
                        context.SaveChanges();
                        #endregion

                        #region Report  Report_WeiJinXingJingMaiRongSuanLiYou
                        Report_WeiJinXingJingMaiRongSuanLiYou reportWeiJinXingJingMaiRongSuanLiYouInDB = (from p in context.Report_WeiJinXingJingMaiRongSuanLiYou
                                                                                                          where p.ID == reportWeiJinXingJingMaiRongSuanLiYou.ID
                                                                                                          select p).FirstOrDefault();
                        if (reportWeiJinXingJingMaiRongSuanLiYouInDB == null)
                        {
                            context.Report_WeiJinXingJingMaiRongSuanLiYou.AddObject(reportWeiJinXingJingMaiRongSuanLiYou);
                        }
                        else
                        {
                            context.Report_WeiJinXingJingMaiRongSuanLiYou.ApplyCurrentValues(reportWeiJinXingJingMaiRongSuanLiYou);
                        }
                        context.SaveChanges();
                        #endregion

                        #region Report  Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao
                        Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao reportWeiJinXingJiZhenGuanMaiJieRuZhiLia = (from p in context.Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao
                                                                                                               where p.ID == reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.ID
                                                                                                               select p).FirstOrDefault();
                        if (reportWeiJinXingJiZhenGuanMaiJieRuZhiLia == null)
                        {
                            context.Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao.AddObject(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao);
                        }
                        else
                        {
                            context.Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao.ApplyCurrentValues(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao);
                        }
                        context.SaveChanges();
                        #endregion

                        #region Report  Report_ZhuSuAndXianBingShi
                        Report_ZhuSuAndXianBingShi rreportZhuSuAndXianBingShiInDB = (from p in context.Report_ZhuSuAndXianBingShi
                                                                                     where p.ID == reportZhuSuAndXianBingShi.ID
                                                                                     select p).FirstOrDefault();
                        if (rreportZhuSuAndXianBingShiInDB == null)
                        {
                            context.Report_ZhuSuAndXianBingShi.AddObject(reportZhuSuAndXianBingShi);
                        }
                        else
                        {
                            context.Report_ZhuSuAndXianBingShi.ApplyCurrentValues(reportZhuSuAndXianBingShi);
                        }
                        context.SaveChanges();
                        #endregion

                        #region Report_LinChuangZhuanGui
                        Report_LinChuangZhuanGui reportTreatResultInDB = (from p in context.Report_LinChuangZhuanGui
                                                                          where p.ID == reportLinChuangZhuangGui.ID
                                                                          select p).FirstOrDefault();
                        if (reportTreatResultInDB == null)
                        {
                            context.Report_LinChuangZhuanGui.AddObject(reportLinChuangZhuangGui);
                        }
                        else
                        {
                            context.Report_LinChuangZhuanGui.ApplyCurrentValues(reportLinChuangZhuangGui);
                        }
                        context.SaveChanges();
                        #endregion

                        #region ReportTreatResult
                        Report_Summation reportSummationInDB = (from p in context.Report_Summation
                                                                where p.ID == reportSummation.ID
                                                                select p).FirstOrDefault();
                        if (reportSummationInDB == null)
                        {
                            context.Report_Summation.AddObject(reportSummation);
                        }
                        else
                        {
                            context.Report_Summation.ApplyCurrentValues(reportSummation);
                        }
                        context.SaveChanges();

                        reportID = reportSummation.ID;
                        #endregion
                    }
                    transactionScope.Complete();
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

        public List<MedicalReportSource> GetAllReportSummationByUserID(int userID)
        {
            List<MedicalReportSource> medicalReportResourceList = new List<MedicalReportSource>();
            try
            {
                using (MedicalBaseEntities context = new MedicalBaseEntities())
                {
                    context.ContextOptions.LazyLoadingEnabled = true;

                    Report_Summation[] reportSummationList = null;
                    User user = (from p in context.Users
                                 where p.ID == userID
                                 select p).FirstOrDefault();
                    if (user != null)
                    {
                        if (user.Role.RoleName == "超级管理员")
                        {
                            reportSummationList = (from p in context.Report_Summation
                                                   where (p.IsSubmit != null) && (p.IsSubmit == true)
                                                   orderby p.ID descending
                                                   select p).ToArray<Report_Summation>();
                        }
                        else if (user.Role.RoleName == "管理员")
                        {
                            int adminHospitalID = user.HospitalID;

                            reportSummationList = (from p in context.Report_Summation
                                                   where adminHospitalID == p.HospitalID
                                                   && (p.IsSubmit != null) && (p.IsSubmit == true)
                                                   orderby p.ID descending
                                                   select p).ToArray<Report_Summation>();
                        }
                        else
                        {
                            reportSummationList = (from p in context.Report_Summation
                                                   where p.UserID == userID
                                                   orderby p.ID descending
                                                   select p).ToArray<Report_Summation>();
                        }
                    }

                    medicalReportResourceList = SetMedicalReportSource(reportSummationList);
                }
            }
            catch (Exception e)
            {
                throw;
            }
            return medicalReportResourceList;
        }

        public List<MedicalReportSource> GetAllReportSummationByUser(int userID)
        {
            List<MedicalReportSource> medicalReportResourceList = new List<MedicalReportSource>();
            try
            {
                using (MedicalBaseEntities context = new MedicalBaseEntities())
                {
                    context.ContextOptions.LazyLoadingEnabled = true;

                    Report_Summation[] reportSummationList = null;
                    User user = (from p in context.Users
                                 where p.Role.RoleName == "管理员"
                                 && p.ID == userID
                                 select p).FirstOrDefault();
                    if (user != null)
                    {
                        reportSummationList = (from p in context.Report_Summation
                                               orderby p.LastUpdateDate descending
                                               select p).ToArray<Report_Summation>();
                    }
                    else
                    {
                        reportSummationList = (from p in context.Report_Summation
                                               where p.UserID == userID
                                               orderby p.LastUpdateDate descending
                                               select p).ToArray<Report_Summation>();
                    }
                    medicalReportResourceList = SetMedicalReportSource(reportSummationList);
                }
            }
            catch (Exception e)
            {
                throw;
            }
            return medicalReportResourceList;
        }


        public List<MedicalReportSource> GetAllReportSummations()
        {
            List<MedicalReportSource> medicalReportResourceList = new List<MedicalReportSource>();
            try
            {
                using (MedicalBaseEntities context = new MedicalBaseEntities())
                {
                    context.ContextOptions.LazyLoadingEnabled = true;
                    Report_Summation[] reportSummationList = (from p in context.Report_Summation
                                                              orderby p.LastUpdateDate descending
                                                              select p).ToArray<Report_Summation>();
                    medicalReportResourceList = SetMedicalReportSource(reportSummationList);
                }
            }
            catch (Exception e)
            {
                throw;
            }
            return medicalReportResourceList;
        }

        //public Person GetPersonByID(Guid personID)
        //{
        //    Person person = new Person();
        //    try
        //    {
        //        using (MedicalBaseEntities context = new MedicalBaseEntities())
        //        {
        //            person = (from p in context.People
        //                      where p.ID == personID
        //                      select p).FirstOrDefault();
        //        }

        //    }
        //    catch (Exception e)
        //    {
        //        throw;
        //    }
        //    return person;
        //}

        //public List<MedicalReportSource> GetMedicalReportByPatientID(Guid personID)
        //{
        //    List<MedicalReportSource> medicalReportResourceList = new List<MedicalReportSource>();

        //    try
        //    {
        //        using (MedicalBaseEntities context = new MedicalBaseEntities())
        //        {
        //            ReportSummation[] reportSummationList = (from p in context.ReportSummations
        //                                                     where p.PersonID == personID
        //                                                     select p).ToArray<ReportSummation>();
        //            medicalReportResourceList = SetMedicalReportSource(reportSummationList);
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //    return medicalReportResourceList;
        //}

        public List<MedicalReportSource> GetReportSummationByPatientName(string patientName, int userID)
        {
            List<MedicalReportSource> medicalReportResourceList = new List<MedicalReportSource>();

            try
            {
                using (MedicalBaseEntities context = new MedicalBaseEntities())
                {
                    Report_Summation[] reportSummationList;
                    User user = GetAdminByUseID(userID, context);
                    if (user != null)
                    {
                        reportSummationList = (from p in context.Report_Summation
                                               where p.Person.Name.Contains(patientName.Trim())
                                               orderby p.LastUpdateDate descending
                                               select p).ToArray<Report_Summation>();
                    }
                    else
                    {
                        //获取和登录医生同一医院的医生登记的病例
                        int hospitalID = (from p in context.Users
                                          where p.ID == userID
                                          select p.HospitalID).FirstOrDefault();
                        List<int> userIDList = (from p in context.Users
                                                where p.Hospital.ID == hospitalID
                                                select p.ID).ToList();
                        reportSummationList = (from p in context.Report_Summation
                                               where p.Person.Name.Contains(patientName.Trim())
                                               && userIDList.Contains(p.UserID)
                                               orderby p.LastUpdateDate descending
                                               select p).ToArray<Report_Summation>();
                    }

                    medicalReportResourceList = SetMedicalReportSource(reportSummationList);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return medicalReportResourceList;
        }

        private static User GetAdminByUseID(int userID, MedicalBaseEntities context)
        {
            User user = (from p in context.Users
                         where p.Role.RoleName == "管理员"
                         && p.ID == userID
                         select p).FirstOrDefault();
            return user;
        }

        public List<MedicalReportSource> GetReportSummationByLastUpdateDate(DateTime lastUpdateDate)
        {
            List<MedicalReportSource> medicalReportResourceList = new List<MedicalReportSource>();

            try
            {
                using (MedicalBaseEntities context = new MedicalBaseEntities())
                {
                    Report_Summation[] reportSummationList = null;

                    reportSummationList = (from p in context.Report_Summation
                                           where p.LastUpdateDate.Date == lastUpdateDate.Date
                                           orderby p.LastUpdateDate descending
                                           select p).ToArray<Report_Summation>();

                    medicalReportResourceList = SetMedicalReportSource(reportSummationList);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return medicalReportResourceList;
        }

        public List<MedicalReportSource> GetReportSummationByUser(string userName)
        {
            List<MedicalReportSource> medicalReportResourceList = new List<MedicalReportSource>();

            try
            {
                using (MedicalBaseEntities context = new MedicalBaseEntities())
                {
                    Report_Summation[] reportSummationList = null;

                    reportSummationList = (from p in context.Report_Summation
                                           where p.User.UserName.Contains(userName.Trim())
                                           orderby p.LastUpdateDate descending
                                           select p).ToArray<Report_Summation>();

                    medicalReportResourceList = SetMedicalReportSource(reportSummationList);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return medicalReportResourceList;
        }

        public bool RemoveReportSummationByReportID(string[] reportIDList)
        {
            bool isSucceed = false;
            try
            {
                using (System.Transactions.TransactionScope transactionScope = new System.Transactions.TransactionScope())
                {
                    using (MedicalBaseEntities context = new MedicalBaseEntities())
                    {
                        foreach (var item in reportIDList)
                        {
                            int reportID = 0;
                            try
                            {
                                reportID = Int32.Parse(item);
                            }
                            catch
                            {
                                return false;
                            }

                            Report_Summation reportToDelete = (from p in context.Report_Summation
                                                               where p.ID == reportID
                                                               select p).FirstOrDefault();
                            if (reportToDelete != null)
                            {
                                context.Report_Summation.DeleteObject(reportToDelete);
                                context.SaveChanges();
                            }
                        }
                    }
                    isSucceed = true;
                    transactionScope.Complete();
                }
            }
            catch (Exception)
            {
                isSucceed = false;
            }
            return isSucceed;
        }

        private static List<MedicalReportSource> SetMedicalReportSource(Report_Summation[] reportSummationList)
        {
            List<MedicalReportSource> medicalReportResourceList = new List<MedicalReportSource>();
            foreach (var reportSummation in reportSummationList)
            {
                MedicalReportSource medicalReportSource = new MedicalReportSource();

                medicalReportSource.ID = reportSummation.HospitalID.ToString().PadLeft(4, '0') + reportSummation.ID.ToString().PadLeft(6, '0');
                if (reportSummation.Person == null)
                    continue;

                medicalReportSource.Person = reportSummation.Person;
                medicalReportSource.PersonName = reportSummation.Person.Name;
                medicalReportSource.Creater = reportSummation.User.UserName;
                medicalReportSource.HospitalName = reportSummation.Hospital.HospitalName;
                medicalReportSource.ReportZhuSuAndXianBingShi = reportSummation.Report_ZhuSuAndXianBingShi;
                medicalReportSource.ReportJiWangBingShi = reportSummation.Report_JiWangBingShi;
                medicalReportSource.ReportJingMaiRongShuan = reportSummation.Report_JingMaiRongShuan;
                medicalReportSource.ReportFuZhuYongYao = reportSummation.Report_FuZhuYongYao;
                medicalReportSource.ReportChuBuZhenDuan = reportSummation.Report_ChuBuZhenDuan;
                medicalReportSource.ReportJiBingBanSuiZhuangTai = reportSummation.Report_JiBingBanSuiZhuangTai;
                medicalReportSource.ReportWeiJinXingJiZhenGuanMaiJieRuZhiLiao = reportSummation.Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao;
                medicalReportSource.ReportWeiJinXingJingMaiRongSuanLiYou = reportSummation.Report_WeiJinXingJingMaiRongSuanLiYou;
                medicalReportSource.ReportJieRuZhiLiao = reportSummation.Report_JieRuZhiLiao;
                medicalReportSource.ReportLinChuangZhuanGui = reportSummation.Report_LinChuangZhuanGui;
                medicalReportSource.ReportSummation = reportSummation;
                medicalReportSource.SimplyTreate = string.Empty;
                medicalReportSource.IsLocked = SiteManagement.IsLocked(reportSummation);
                medicalReportResourceList.Add(medicalReportSource);
            }
            return medicalReportResourceList;
        }
    }
}

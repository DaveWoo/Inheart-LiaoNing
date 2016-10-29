using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DreamWork.ObjectModel;

namespace DreamWork.BussinessLogic
{
    public class MedicalReportSource
    {
        public string ID { get; set; }

        public string PersonName { get; set; }

        public string Creater { get; set; }

        public string Occupation { get; set; }

        public string HospitalName { get; set; }

        public Person Person { get; set; }

        //public MedicalReport MedicalReport { get; set; }

        public Report_ChuBuZhenDuan ReportChuBuZhenDuan { get; set; }

        public Report_FuZhuYongYao ReportFuZhuYongYao { get; set; }

        public Report_JingMaiRongShuan ReportJingMaiRongShuan { get; set; }

        public Report_JiWangBingShi ReportJiWangBingShi { get; set; }

        public Report_ZhuSuAndXianBingShi ReportZhuSuAndXianBingShi { get; set; }

        public Report_JieRuZhiLiao ReportJieRuZhiLiao { get; set; }

        public Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao ReportWeiJinXingJiZhenGuanMaiJieRuZhiLiao { get; set; }

        public Report_WeiJinXingJingMaiRongSuanLiYou ReportWeiJinXingJingMaiRongSuanLiYou { get; set; }

        public Report_LinChuangZhuanGui ReportLinChuangZhuanGui { get; set; }

        public Report_JiBingBanSuiZhuangTai ReportJiBingBanSuiZhuangTai { get; set; }

        public Report_Summation ReportSummation { get; set; }

        public string SimplyTreate { get; set; }

        public bool IsLocked { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Drawing;
using DreamWork.BussinessLogic;
using System.Web.UI.DataVisualization.Charting;

namespace DreamWork.Report
{
    public class PatientAgeBarChart : IDreamWorkChart
    {
        private DreamWorkSite m_site;
        public event EventHandler Disposed;
        private Bitmap m_bitmap;
        private int m_width;
        private int m_height;
        private string m_imagePath = null;

        public PatientAgeBarChart(int width, int height)
        {
            this.Width = width;
            this.Height = height;
            this.m_imagePath = Guid.NewGuid().ToString() + ".jpg";
        }

        public ISite Site
        {
            get
            {
                return this.m_site;
            }
            set
            {
                if (value.GetType() != typeof(DreamWorkSite))
                {
                    throw new ArgumentException();
                }
                this.m_site = (DreamWorkSite)value;
            }
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public System.Drawing.Bitmap Image
        {
            get { throw new NotImplementedException(); }
        }

        public void Draw()
        {
            MedicalReportBLO dataSource = this.m_site.DataSource;
            List<MedicalReportSource> allPatientsList = dataSource.GetAllReportSummations();
            System.Diagnostics.Debug.Assert(allPatientsList != null);
            Chart chart = new Chart();
            chart.Width = this.Width;
            chart.Height = this.Height;
            Series series = chart.Series.Add("Default");
            ChartArea chartArea = chart.ChartAreas.Add("Default");
            series.ChartArea = "Default";
            series.ChartType = SeriesChartType.Bar;

            IDictionary<int, int> ageCountDict = this.GetAgeCounts(allPatientsList);

            foreach (int ageKey in ageCountDict.Keys)
            {
                DataPoint dp = series.Points.Add(ageCountDict[ageKey]);
                dp.Label = string.Format("{0}-{1}", ageKey, ageKey + 5);
                if (ageKey == -1)
                {
                    dp.Label = "没有年龄";
                }
            }

            chart.SaveImage(this.m_imagePath);
            this.m_bitmap = new Bitmap(this.m_imagePath);
        }

        private IDictionary<int, int> GetAgeCounts(List<MedicalReportSource> patientList)
        {
            IDictionary<int, int> countDict = new Dictionary<int, int>();
            //for (int i = 0; i < 200; i += 5)
            //{
            //    int count = (
            //        from p in patientList
            //        where p.person.Age.HasValue && p.person.Age.Value >= i && p.person.Age.Value < i + 5
            //        select p).Count<MedicalReportSource>();
            //    countDict.Add(i, count);
            //}

            //int noAgeCount = (
            //        from p in patientList
            //        where p.person.Age.HasValue == false
            //        select p).Count<MedicalReportSource>();

            //countDict.Add(-1, noAgeCount);

            return countDict;
        }

        public int Width
        {
            get
            {
                return this.m_width;
            }
            set
            {
                this.m_width = value;
            }
        }

        public int Height
        {
            get
            {
                return this.m_height;
            }
            set
            {
                this.m_height = value;
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using DreamWork.BussinessLogic;

namespace DreamWork.Report
{
    public class DreamWorkSite : ISite
    {
        private IComponent m_component = null;
        private IContainer m_container = null;
        private bool m_bDesignMode;
        private string m_siteName;
        private MedicalReportBLO m_dataSource = null;

        public DreamWorkSite(IContainer actvCntr, IComponent prntCmpnt, MedicalReportBLO dataSource)
        {
            this.m_component = prntCmpnt;
            this.m_container = actvCntr;
            this.m_bDesignMode = false;
            this.m_siteName = "DreamWorkComponent";
            this.m_dataSource = dataSource;
        }

        public virtual IComponent Component
        {
            get { return this.m_component; }
        }

        public virtual IContainer Container
        {
            get { return this.m_container; }
        }

        public bool DesignMode
        {
            get { return this.m_bDesignMode; }
        }

        public virtual MedicalReportBLO DataSource
        {
            get
            {
                return this.m_dataSource;
            }
        }

        public string Name
        {
            get
            {
                return this.m_siteName;
            }
            set
            {
                this.m_siteName = value;
            }
        }

        public object GetService(Type serviceType)
        {
            throw new NotImplementedException();
        }
    }
}

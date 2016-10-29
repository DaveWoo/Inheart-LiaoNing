using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using DreamWork.BussinessLogic;

namespace DreamWork.Report
{
    public class DreamWorkContainer : IContainer
    {
        private Dictionary<string, IDreamWorkChart> m_componentsDict = null;
        private MedicalReportBLO m_dataSource;

        public DreamWorkContainer(MedicalReportBLO dataSource)
        {
            this.m_componentsDict = new Dictionary<string, IDreamWorkChart>();
            this.m_dataSource = dataSource;
        }

        public void Add(IComponent component, string name)
        {
            if (component == null || component.GetType() != typeof(IDreamWorkChart)
                || string.IsNullOrEmpty(name) || this.m_componentsDict.ContainsKey(name))
            {
                throw new ArgumentException();
            }

            IDreamWorkChart chartComponent = (IDreamWorkChart)component;
            chartComponent.Site=new DreamWorkSite(this, component, this.m_dataSource);
            chartComponent.Site.Name = name;

            this.m_componentsDict.Add(name, chartComponent);
        }

        public void Add(IComponent component)
        {
            this.Add(component, Guid.NewGuid().ToString());
        }

        public ComponentCollection Components
        {
            get { return new ComponentCollection(this.m_componentsDict.Values.ToArray<IDreamWorkChart>()); }
        }

        public void Remove(IComponent component)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}

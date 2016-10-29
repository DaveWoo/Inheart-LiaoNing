using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DreamWork.ObjectModel;

namespace DreamWork.BussinessLogic
{
    public class DeleteBLO
    {
        public bool ClearLogs()
        {
            bool isSuccess = false;
            try
            {
                using (System.Transactions.TransactionScope transactionScope = new System.Transactions.TransactionScope())
                {
                    using (MedicalBaseEntities context = new MedicalBaseEntities())
                    {
                        foreach (var item in context.Log_Login)
                        {
                            context.DeleteObject(item);
                        }
                        context.SaveChanges();
                    }
                    transactionScope.Complete();
                }
                isSuccess = true;
            }
            catch
            {
                isSuccess = false;
            }
            return isSuccess;
        }

        public bool DeleteHospitalByHospitalID(int hospitalID)
        {
            bool isSuccess = false;
            try
            {
                using (System.Transactions.TransactionScope transactionScope = new System.Transactions.TransactionScope())
                {
                    using (MedicalBaseEntities context = new MedicalBaseEntities())
                    {
                        Hospital hospitalForDelete = (from p in context.Hospitals
                                                      where p.ID == hospitalID
                                                      select p).FirstOrDefault();
                        context.CascadingDeleteOnSubmit(hospitalForDelete);
                    }
                    transactionScope.Complete();
                }
                isSuccess = true;
            }
            catch
            {
                isSuccess = false;
            }
            return isSuccess;
        }
    }
}

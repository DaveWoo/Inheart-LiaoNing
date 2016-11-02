using System.Linq;
using DreamWork.ObjectModel;

namespace DreamWork.BussinessLogic
{
	/// <summary>
	/// 数据清除类
	/// </summary>
	public class DeleteBLO
	{
		/// <summary>
		/// 清除所有日志信息
		/// </summary>
		/// <returns>是否清除成功</returns>
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

		/// <summary>
		/// 删除医院
		/// </summary>
		/// <param name="hospitalID">医院ID</param>
		/// <returns>是否删除成功</returns>
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
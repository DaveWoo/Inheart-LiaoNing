namespace DreamWork.BussinessLogic
{
	using System;
	using System.Collections;
	using System.Collections.Generic;
	using System.Data;
	using System.Linq;
	using DreamWork.ObjectModel;

	/// <summary>
	/// 公共类
	/// </summary>
	internal static class CommonMethod
	{
		/// <summary>
		/// 批量修改模板
		/// </summary>
		/// <typeparam name="T">数据类型</typeparam>
		/// <param name="context">元数据</param>
		/// <param name="TEntity">具体类型</param>
		public static void CascadingDeleteOnSubmit<T>(this MedicalBaseEntities context, T TEntity) where T : class
		{
			if (context.Connection.State == ConnectionState.Closed)
			{
				context.Connection.Open();
			}

			var entityType = TEntity.GetType();
			var entityProperties = TEntity.GetType().GetProperties();
			var associationProperties = entityProperties.Where(
				c => c.PropertyType.BaseType.Name == "RelatedEnd");
			if (associationProperties.Count() != 0)
			{
				foreach (var _asso in associationProperties)
				{
					var _items = _asso.GetValue(TEntity, null);
					IEnumerable enumerable = (IEnumerable)_items;
					List<object> list = new List<object>();
					foreach (var o in enumerable)
					{
						list.Add(o);
					}
					for (int i = 0; i < list.Count; i++)
					{
						object o = list[i];
						CascadingDeleteOnSubmit(context, o);
					}
				}
			}
			try
			{
				var entityKeyObject = TEntity.GetType().GetProperty("EntityKey").GetValue(TEntity, null);
				var entityContainerName = entityKeyObject.GetType().GetProperty("EntityContainerName").GetValue(entityKeyObject, null);
				var entityKeyName = entityKeyObject.GetType().GetProperty("EntitySetName").GetValue(entityKeyObject, null);
				System.Data.EntityKeyMember[] KeyMembers = (System.Data.EntityKeyMember[])entityKeyObject.GetType().GetProperty("EntityKeyValues").GetValue(entityKeyObject, null);

				IEnumerable<KeyValuePair<string, object>> entityKeyValues = new KeyValuePair<string, object>[] { new KeyValuePair<string, object>(KeyMembers[0].Key, KeyMembers[0].Value) };
				string EntityKeyName = entityContainerName + "." + entityKeyName;
				EntityKey key = new EntityKey(EntityKeyName, entityKeyValues);
				var forDelete = context.GetObjectByKey(key);
				context.DeleteObject(forDelete);
				context.SaveChanges();
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
	}
}
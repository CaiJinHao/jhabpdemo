using System;
using Volo.Abp.Application.Dtos;
using Volo.Abp.MultiTenancy;
using Volo.Abp.Domain.Entities;
namespace MyDemo
{
	/// <summary>
	/// 
	/// </summary>
	 [Serializable]
	public class CategoryDto: FullAuditedEntityDto<System.Guid>
,IMultiTenant
	{
		/// <summary>
		/// 
		/// </summary>
		public String Name { get; set; }
		/// <summary>
		/// 
		/// </summary>
		public String Description { get; set; }
		 public virtual Guid? TenantId { get; set; }
	}
}

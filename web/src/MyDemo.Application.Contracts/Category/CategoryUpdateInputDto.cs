using Jh.Abp.Application.Contracts;
using System;
using Volo.Abp.Domain.Entities;
using Volo.Abp.ObjectExtending;
namespace MyDemo
{
	/// <summary>
	/// 
	/// </summary>
	 [Serializable]
	public class CategoryUpdateInputDto
	{
		/// <summary>
		/// 
		/// </summary>
		public String Name { get; set; }
		/// <summary>
		/// 
		/// </summary>
		public String Description { get; set; }
	}
}

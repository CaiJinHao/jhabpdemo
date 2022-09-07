using System;
using System.ComponentModel.DataAnnotations;
using Jh.Abp.Application.Contracts;
using Volo.Abp.Domain.Entities;
using Volo.Abp.MultiTenancy;
using Volo.Abp.ObjectExtending;
namespace MyDemo
{
	/// <summary>
	/// 
	/// </summary>
	 [Serializable]
	public class CategoryCreateInputDto
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

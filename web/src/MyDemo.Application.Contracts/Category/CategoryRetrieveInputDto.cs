using System;
using Jh.Abp.Application.Contracts;
using Volo.Abp.Application.Dtos;
namespace MyDemo
{
	/// <summary>
	/// 
	/// </summary>
	public class CategoryRetrieveInputDto: PagedAndSortedResultRequestDto
, IRetrieveDelete
	{
		/// <summary>
		/// 
		/// </summary>
		public String Name { get; set; }
		/// <summary>
		/// 
		/// </summary>
		public String Description { get; set; }
		/// <summary>
		/// 是否删除
		/// </summary>
		public int? Deleted { get; set; }
	}
}

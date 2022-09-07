using System;
using Jh.Abp.Application.Contracts;
using System.Threading.Tasks;
namespace MyDemo
{
	public interface ICategoryAppService
		: ICrudApplicationService<CategoryDto, CategoryDto, System.Guid, CategoryRetrieveInputDto, CategoryCreateInputDto, CategoryUpdateInputDto, CategoryDeleteInputDto>
	{
		 Task RecoverAsync(System.Guid id);
	}
}

using AutoMapper;
using Volo.Abp.AutoMapper;
namespace MyDemo
{
	public class CategoryProfile : Profile
	{
		public CategoryProfile()
		{
		CreateMap<Category,CategoryDto>();
		CreateMap<CategoryCreateInputDto, Category>().IgnoreFullAuditedObjectProperties().Ignore(a => a.Id).Ignore(a => a.TenantId)
;
		CreateMap<CategoryUpdateInputDto, Category>().IgnoreFullAuditedObjectProperties().Ignore(a => a.Id).Ignore(a => a.TenantId)
;
		}
	}
}

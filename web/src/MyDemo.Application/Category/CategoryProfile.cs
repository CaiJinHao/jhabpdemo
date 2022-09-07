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
.Ignore(a => a.Name)
.Ignore(a => a.Description)
;
		CreateMap<CategoryUpdateInputDto, Category>().IgnoreFullAuditedObjectProperties().Ignore(a => a.Id).Ignore(a => a.TenantId)
.Ignore(a => a.Name)
.Ignore(a => a.Description)
;
		}
	}
}

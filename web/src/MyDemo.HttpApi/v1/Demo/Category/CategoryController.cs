using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Data;
namespace MyDemo.v1
{
	/// <summary>
	/// 
	/// </summary>
	[Area(MyDemoRemoteServiceConsts.ModuleName)]
	[RemoteService(Name = MyDemoRemoteServiceConsts.RemoteServiceName)]
	[Route("api/v{apiVersion:apiVersion}/[controller]")]
	public class CategoryController : MyDemoController,ICategoryAppService
	{
		 protected readonly ICategoryAppService CategoryAppService;
		 protected IDataFilter DataFilter => LazyServiceProvider.LazyGetRequiredService<IDataFilter>();
		public CategoryController(ICategoryAppService _CategoryAppService)
		{
			CategoryAppService = _CategoryAppService;
		}

		[Authorize(MyDemoPermissions.Categorys.Create)]
		[HttpPost]
		public virtual async Task<CategoryDto> CreateAsync(CategoryCreateInputDto input)
		{
			 return await CategoryAppService.CreateAsync(input);
		}

		[Authorize(MyDemoPermissions.Categorys.Delete)]
		[Route("{id}")]
		[HttpDelete]
		public virtual async Task DeleteAsync(System.Guid id)
		{
			 await CategoryAppService.DeleteAsync(id);
		}

		[Authorize(MyDemoPermissions.Categorys.BatchDelete)]
		[Route("keys")]
		[HttpDelete]
		public virtual async Task DeleteAsync([FromBody]System.Guid[] keys)
		{
			 await CategoryAppService.DeleteAsync(keys);
		}

		[Authorize(MyDemoPermissions.Categorys.Update)]
		[Route("{id}")]
		[HttpPut]
		public virtual async Task<CategoryDto> UpdateAsync(System.Guid id, CategoryUpdateInputDto input)
		{
			return await CategoryAppService.UpdateAsync(id, input);
		}

		[Authorize(MyDemoPermissions.Categorys.Update)]
		[Route("Patch/{id}")]
		[HttpPut]
		public virtual async Task UpdatePortionAsync(System.Guid id, CategoryUpdateInputDto inputDto)
		{
			 await CategoryAppService.UpdatePortionAsync(id, inputDto);
		}

		[Authorize(MyDemoPermissions.Categorys.Recover)]
		[Route("{id}/Recover")]
		[HttpPut]
		 public async Task RecoverAsync(System.Guid id)
		{
			 await CategoryAppService.RecoverAsync(id);
		}

		[Authorize(MyDemoPermissions.Categorys.Default)]
		[HttpGet]
		public virtual async Task<PagedResultDto<CategoryDto>> GetListAsync([FromQuery] CategoryRetrieveInputDto input)
		{
			 using (DataFilter.Disable<ISoftDelete>())
			{
				return await CategoryAppService.GetListAsync(input);
			}
		}

		[Authorize(MyDemoPermissions.Categorys.Default)]
		[Route("all")]
		[HttpGet]
		public virtual async Task<ListResultDto<CategoryDto>> GetEntitysAsync([FromQuery] CategoryRetrieveInputDto inputDto)
		{
			return await CategoryAppService.GetEntitysAsync(inputDto);
		}

		[Authorize(MyDemoPermissions.Categorys.Detail)]
		[Route("{id}")]
		[HttpGet]
		public virtual async Task<CategoryDto> GetAsync(System.Guid id)
		{
			return await CategoryAppService.GetAsync(id);
		}

/*
		[Authorize(MyDemoPermissions.Categorys.Default)]
		[Route("options")]
		[HttpGet]
		public virtual Task<ListResultDto<OptionDto<System.Guid>>> GetOptionsAsync([FromQuery] CategoryRetrieveInputDto inputDto)
			 return await CategoryAppService.GetOptionsAsync(inputDto);
		}

*/
	}
}

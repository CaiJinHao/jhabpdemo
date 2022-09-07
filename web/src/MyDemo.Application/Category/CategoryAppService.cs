using Jh.Abp.Application;
using System.Threading.Tasks;
using Volo.Abp;
namespace MyDemo
{
	public class CategoryAppService
		: CrudApplicationService<Category, CategoryDto, CategoryDto, System.Guid, CategoryRetrieveInputDto, CategoryCreateInputDto, CategoryUpdateInputDto, CategoryDeleteInputDto>,
		ICategoryAppService
	{
		 protected readonly ICategoryRepository CategoryRepository;
		public CategoryAppService(ICategoryRepository repository) : base(repository)
		{
		CategoryRepository = repository;
		 CreatePolicyName = MyDemoPermissions.Categorys.Create;
		 UpdatePolicyName = MyDemoPermissions.Categorys.Update;
		 DeletePolicyName = MyDemoPermissions.Categorys.Delete;
		 GetPolicyName = MyDemoPermissions.Categorys.Detail;
		 GetListPolicyName = MyDemoPermissions.Categorys.Default;
		 BatchDeletePolicyName= MyDemoPermissions.Categorys.BatchDelete;
		}
		 public virtual async Task RecoverAsync(System.Guid id)
		{
			 await CheckPolicyAsync(MyDemoPermissions.Categorys.Recover);
			 using (DataFilter.Disable<ISoftDelete>())
			 {
				 var entity = await crudRepository.FindAsync(id, false);
				 entity.IsDeleted = false;
				 entity.DeleterId = CurrentUser.Id;
				 entity.DeletionTime = Clock.Now;
			 }
		}

	}
}

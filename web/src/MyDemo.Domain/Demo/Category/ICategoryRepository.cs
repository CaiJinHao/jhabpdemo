using Jh.Abp.Domain;
namespace MyDemo
{
	public interface ICategoryRepository: ICrudRepository<Category, System.Guid>
	{
	}
}

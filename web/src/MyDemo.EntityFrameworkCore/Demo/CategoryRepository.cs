
using MyDemo.EntityFrameworkCore;
using Jh.Abp.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp.EntityFrameworkCore;
namespace MyDemo
{
	public class CategoryRepository : CrudRepository<MyDemoDbContext, Category, System.Guid>, ICategoryRepository
	{
		 public CategoryRepository(IDbContextProvider<MyDemoDbContext> dbContextProvider) : base(dbContextProvider)
		{
		}
	}
}

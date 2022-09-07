using Microsoft.EntityFrameworkCore;
using Volo.Abp.Data;
using Volo.Abp.EntityFrameworkCore;

namespace MyDemo.EntityFrameworkCore;

[ConnectionStringName(MyDemoDbProperties.ConnectionStringName)]
public interface IMyDemoDbContext : IEfCoreDbContext
{
    /* Add DbSet for each Aggregate Root here. Example:
     * DbSet<Question> Questions { get; }
     */
    DbSet<Category> Categorys { get; set; }
}

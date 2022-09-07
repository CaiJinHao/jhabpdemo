using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Conventions.Infrastructure;
using Volo.Abp.Data;
using Volo.Abp.EntityFrameworkCore;

namespace MyDemo.EntityFrameworkCore;

[ConnectionStringName(MyDemoDbProperties.ConnectionStringName)]
public class MyDemoDbContext : AbpDbContext<MyDemoDbContext>, IMyDemoDbContext
{
    /* Add DbSet for each Aggregate Root here. Example:
     * public DbSet<Question> Questions { get; set; }
     */
    public DbSet<Category> Categorys { get; set; }

    public MyDemoDbContext(DbContextOptions<MyDemoDbContext> options)
        : base(options)
    {

    }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.ConfigureMyDemo();
    }
}

using Microsoft.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore;

namespace MyDemo.EntityFrameworkCore;

public class MyDemoHttpApiHostMigrationsDbContext : AbpDbContext<MyDemoHttpApiHostMigrationsDbContext>
{
    public MyDemoHttpApiHostMigrationsDbContext(DbContextOptions<MyDemoHttpApiHostMigrationsDbContext> options)
        : base(options)
    {

    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.ConfigureMyDemo();
    }
}

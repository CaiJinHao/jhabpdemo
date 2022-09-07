using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace MyDemo.EntityFrameworkCore;

public class MyDemoHttpApiHostMigrationsDbContextFactory : IDesignTimeDbContextFactory<MyDemoHttpApiHostMigrationsDbContext>
{
    public MyDemoHttpApiHostMigrationsDbContext CreateDbContext(string[] args)
    {
        var configuration = BuildConfiguration();

        var builder = new DbContextOptionsBuilder<MyDemoHttpApiHostMigrationsDbContext>()
            .UseSqlServer(configuration.GetConnectionString("MyDemo"));

        return new MyDemoHttpApiHostMigrationsDbContext(builder.Options);
    }

    private static IConfigurationRoot BuildConfiguration()
    {
        var builder = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json", optional: false);

        return builder.Build();
    }
}

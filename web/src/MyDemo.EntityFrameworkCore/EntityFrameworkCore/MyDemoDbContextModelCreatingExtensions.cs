using Microsoft.EntityFrameworkCore;
using Volo.Abp;
using Volo.Abp.EntityFrameworkCore.Modeling;

namespace MyDemo.EntityFrameworkCore;

public static class MyDemoDbContextModelCreatingExtensions
{
    public static void ConfigureMyDemo(
        this ModelBuilder builder)
    {
        Check.NotNull(builder, nameof(builder));

        builder.Entity<Category>(b => {
            b.ToTable(MyDemoDbProperties.DbTablePrefix + nameof(Category), MyDemoDbProperties.DbSchema);
            b.ConfigureByConvention();

            b.Property(q=>q.Name).IsRequired().HasMaxLength(48).HasComment("类别名称");
            b.Property(q => q.Description).HasMaxLength(512).HasComment("类别描述");

            b.HasIndex(q=>q.Name);
        });
    }
}

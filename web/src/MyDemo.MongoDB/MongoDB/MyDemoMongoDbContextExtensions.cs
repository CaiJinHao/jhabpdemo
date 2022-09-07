using Volo.Abp;
using Volo.Abp.MongoDB;

namespace MyDemo.MongoDB;

public static class MyDemoMongoDbContextExtensions
{
    public static void ConfigureMyDemo(
        this IMongoModelBuilder builder)
    {
        Check.NotNull(builder, nameof(builder));
    }
}

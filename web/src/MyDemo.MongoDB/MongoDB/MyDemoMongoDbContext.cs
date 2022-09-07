using Volo.Abp.Data;
using Volo.Abp.MongoDB;

namespace MyDemo.MongoDB;

[ConnectionStringName(MyDemoDbProperties.ConnectionStringName)]
public class MyDemoMongoDbContext : AbpMongoDbContext, IMyDemoMongoDbContext
{
    /* Add mongo collections here. Example:
     * public IMongoCollection<Question> Questions => Collection<Question>();
     */

    protected override void CreateModel(IMongoModelBuilder modelBuilder)
    {
        base.CreateModel(modelBuilder);

        modelBuilder.ConfigureMyDemo();
    }
}

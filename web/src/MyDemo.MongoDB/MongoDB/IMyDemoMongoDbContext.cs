using Volo.Abp.Data;
using Volo.Abp.MongoDB;

namespace MyDemo.MongoDB;

[ConnectionStringName(MyDemoDbProperties.ConnectionStringName)]
public interface IMyDemoMongoDbContext : IAbpMongoDbContext
{
    /* Define mongo collections here. Example:
     * IMongoCollection<Question> Questions { get; }
     */
}

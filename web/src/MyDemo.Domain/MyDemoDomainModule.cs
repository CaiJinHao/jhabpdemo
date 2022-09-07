using Volo.Abp.Domain;
using Volo.Abp.Modularity;

namespace MyDemo;

[DependsOn(
    typeof(AbpDddDomainModule),
    typeof(MyDemoDomainSharedModule)
)]
public class MyDemoDomainModule : AbpModule
{

}

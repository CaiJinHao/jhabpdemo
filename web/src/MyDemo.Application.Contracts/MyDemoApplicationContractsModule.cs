using Volo.Abp.Application;
using Volo.Abp.Modularity;
using Volo.Abp.Authorization;

namespace MyDemo;

[DependsOn(
    typeof(MyDemoDomainSharedModule),
    typeof(AbpDddApplicationContractsModule),
    typeof(AbpAuthorizationModule)
    )]
public class MyDemoApplicationContractsModule : AbpModule
{

}

using Volo.Abp.Modularity;

namespace MyDemo;

[DependsOn(
    typeof(MyDemoApplicationModule),
    typeof(MyDemoDomainTestModule)
    )]
public class MyDemoApplicationTestModule : AbpModule
{

}

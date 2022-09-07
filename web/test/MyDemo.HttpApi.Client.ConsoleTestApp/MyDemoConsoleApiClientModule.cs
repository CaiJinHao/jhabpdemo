using Volo.Abp.Autofac;
using Volo.Abp.Http.Client.IdentityModel;
using Volo.Abp.Modularity;

namespace MyDemo;

[DependsOn(
    typeof(AbpAutofacModule),
    typeof(MyDemoHttpApiClientModule),
    typeof(AbpHttpClientIdentityModelModule)
    )]
public class MyDemoConsoleApiClientModule : AbpModule
{

}

using Microsoft.Extensions.DependencyInjection;
using Volo.Abp.Http.Client;
using Volo.Abp.Modularity;
using Volo.Abp.VirtualFileSystem;

namespace MyDemo;

[DependsOn(
    typeof(MyDemoApplicationContractsModule),
    typeof(AbpHttpClientModule))]
public class MyDemoHttpApiClientModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        context.Services.AddHttpClientProxies(
            typeof(MyDemoApplicationContractsModule).Assembly,
            MyDemoRemoteServiceConsts.RemoteServiceName
        );

        Configure<AbpVirtualFileSystemOptions>(options =>
        {
            options.FileSets.AddEmbedded<MyDemoHttpApiClientModule>();
        });

    }
}

using Volo.Abp.AspNetCore.Components.Server.Theming;
using Volo.Abp.Modularity;

namespace MyDemo.Blazor.Server;

[DependsOn(
    typeof(AbpAspNetCoreComponentsServerThemingModule),
    typeof(MyDemoBlazorModule)
    )]
public class MyDemoBlazorServerModule : AbpModule
{

}

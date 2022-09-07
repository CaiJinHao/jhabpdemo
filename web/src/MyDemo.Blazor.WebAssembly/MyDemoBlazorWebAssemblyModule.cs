using Volo.Abp.AspNetCore.Components.WebAssembly.Theming;
using Volo.Abp.Modularity;

namespace MyDemo.Blazor.WebAssembly;

[DependsOn(
    typeof(MyDemoBlazorModule),
    typeof(MyDemoHttpApiClientModule),
    typeof(AbpAspNetCoreComponentsWebAssemblyThemingModule)
    )]
public class MyDemoBlazorWebAssemblyModule : AbpModule
{

}

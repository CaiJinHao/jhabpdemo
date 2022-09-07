using Localization.Resources.AbpUi;
using MyDemo.Localization;
using Volo.Abp.AspNetCore.Mvc;
using Volo.Abp.Localization;
using Volo.Abp.Modularity;
using Microsoft.Extensions.DependencyInjection;

namespace MyDemo;

[DependsOn(
    typeof(MyDemoApplicationContractsModule),
    typeof(AbpAspNetCoreMvcModule))]
public class MyDemoHttpApiModule : AbpModule
{
    public override void PreConfigureServices(ServiceConfigurationContext context)
    {
        PreConfigure<IMvcBuilder>(mvcBuilder =>
        {
            mvcBuilder.AddApplicationPartIfNotExists(typeof(MyDemoHttpApiModule).Assembly);
        });
    }

    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpLocalizationOptions>(options =>
        {
            options.Resources
                .Get<MyDemoResource>()
                .AddBaseTypes(typeof(AbpUiResource));
        });
    }
}

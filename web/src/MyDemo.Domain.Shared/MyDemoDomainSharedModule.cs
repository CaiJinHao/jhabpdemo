using Volo.Abp.Modularity;
using Volo.Abp.Localization;
using MyDemo.Localization;
using Volo.Abp.Localization.ExceptionHandling;
using Volo.Abp.Validation;
using Volo.Abp.Validation.Localization;
using Volo.Abp.VirtualFileSystem;

namespace MyDemo;

[DependsOn(
    typeof(Jh.Abp.Domain.Shared.JhAbpExtensionsDomainSharedModule),
    typeof(AbpValidationModule)
)]
public class MyDemoDomainSharedModule : AbpModule
{
    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        Configure<AbpVirtualFileSystemOptions>(options =>
        {
            options.FileSets.AddEmbedded<MyDemoDomainSharedModule>();
        });

        Configure<AbpLocalizationOptions>(options =>
        {
            options.Resources
                .Add<MyDemoResource>("en")
                .AddBaseTypes(typeof(AbpValidationResource))
                .AddBaseTypes(typeof(Jh.Abp.Domain.Localization.JhAbpExtensionsResource))
                .AddVirtualJson("/Localization/MyDemo");
        });

        Configure<AbpExceptionLocalizationOptions>(options =>
        {
            options.MapCodeNamespace("MyDemo", typeof(MyDemoResource));
        });
    }
}

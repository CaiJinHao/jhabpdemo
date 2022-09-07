using Volo.Abp.Ui.Branding;
using Volo.Abp.DependencyInjection;

namespace MyDemo;

[Dependency(ReplaceServices = true)]
public class MyDemoBrandingProvider : DefaultBrandingProvider
{
    public override string AppName => "MyDemo";
}

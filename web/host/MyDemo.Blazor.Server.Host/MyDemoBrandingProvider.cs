using Volo.Abp.DependencyInjection;
using Volo.Abp.Ui.Branding;

namespace MyDemo.Blazor.Server.Host;

[Dependency(ReplaceServices = true)]
public class MyDemoBrandingProvider : DefaultBrandingProvider
{
    public override string AppName => "MyDemo";
}

using MyDemo.Localization;
using Volo.Abp.AspNetCore.Components;

namespace MyDemo.Blazor.Server.Host;

public abstract class MyDemoComponentBase : AbpComponentBase
{
    protected MyDemoComponentBase()
    {
        LocalizationResource = typeof(MyDemoResource);
    }
}

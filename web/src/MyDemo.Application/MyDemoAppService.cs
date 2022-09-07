using MyDemo.Localization;
using Volo.Abp.Application.Services;

namespace MyDemo;

public abstract class MyDemoAppService : ApplicationService
{
    protected MyDemoAppService()
    {
        LocalizationResource = typeof(MyDemoResource);
        ObjectMapperContext = typeof(MyDemoApplicationModule);
    }
}

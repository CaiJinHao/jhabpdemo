using MyDemo.Localization;
using Volo.Abp.AspNetCore.Mvc;

namespace MyDemo;

public abstract class MyDemoController : AbpControllerBase
{
    protected MyDemoController()
    {
        LocalizationResource = typeof(MyDemoResource);
    }
}

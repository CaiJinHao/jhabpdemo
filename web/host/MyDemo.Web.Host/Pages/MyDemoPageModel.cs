using MyDemo.Localization;
using Volo.Abp.AspNetCore.Mvc.UI.RazorPages;

namespace MyDemo.Pages;

public abstract class MyDemoPageModel : AbpPageModel
{
    protected MyDemoPageModel()
    {
        LocalizationResourceType = typeof(MyDemoResource);
    }
}

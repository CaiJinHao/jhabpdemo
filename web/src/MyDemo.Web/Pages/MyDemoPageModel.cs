using MyDemo.Localization;
using Volo.Abp.AspNetCore.Mvc.UI.RazorPages;

namespace MyDemo.Web.Pages;

/* Inherit your PageModel classes from this class.
 */
public abstract class MyDemoPageModel : AbpPageModel
{
    protected MyDemoPageModel()
    {
        LocalizationResourceType = typeof(MyDemoResource);
        ObjectMapperContext = typeof(MyDemoWebModule);
    }
}

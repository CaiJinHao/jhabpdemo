using System.Threading.Tasks;
using Volo.Abp.UI.Navigation;

namespace MyDemo.Blazor.Menus;

public class MyDemoMenuContributor : IMenuContributor
{
    public async Task ConfigureMenuAsync(MenuConfigurationContext context)
    {
        if (context.Menu.Name == StandardMenus.Main)
        {
            await ConfigureMainMenuAsync(context);
        }
    }

    private Task ConfigureMainMenuAsync(MenuConfigurationContext context)
    {
        //Add main menu items.
        context.Menu.AddItem(new ApplicationMenuItem(MyDemoMenus.Prefix, displayName: "MyDemo", "/MyDemo", icon: "fa fa-globe"));

        return Task.CompletedTask;
    }
}

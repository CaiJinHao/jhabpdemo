using MyDemo.Localization;
using Volo.Abp.Authorization.Permissions;
using Volo.Abp.Localization;

namespace MyDemo.Permissions;

public class MyDemoPermissionDefinitionProvider : PermissionDefinitionProvider
{
    public override void Define(IPermissionDefinitionContext context)
    {
        var myGroup = context.AddGroup(MyDemoPermissions.GroupName, L("Permission:MyDemo"));
    }

    private static LocalizableString L(string name)
    {
        return LocalizableString.Create<MyDemoResource>(name);
    }
}

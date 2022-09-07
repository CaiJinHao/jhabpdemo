using MyDemo.Localization;
using Volo.Abp.Authorization.Permissions;
using Volo.Abp.Localization;

namespace MyDemo;

public class MyDemoPermissionDefinitionProvider : PermissionDefinitionProvider
{
    public override void Define(IPermissionDefinitionContext context)
    {
        var MyDemoGroup = context.AddGroup(MyDemoPermissions.GroupName, L("Permission:MyDemo"));
        var CategorysPermission = MyDemoGroup.AddPermission(MyDemoPermissions.Categorys.Default, L("Permission:Categorys"));
        CategorysPermission.AddChild(MyDemoPermissions.Categorys.Detail, L("Permission:Detail"));
        CategorysPermission.AddChild(MyDemoPermissions.Categorys.Create, L("Permission:Create"));
        CategorysPermission.AddChild(MyDemoPermissions.Categorys.Update, L("Permission:Edit"));
        CategorysPermission.AddChild(MyDemoPermissions.Categorys.Delete, L("Permission:Delete"));
        CategorysPermission.AddChild(MyDemoPermissions.Categorys.BatchDelete, L("Permission:BatchDelete"));
        CategorysPermission.AddChild(MyDemoPermissions.Categorys.Recover, L("Permission:Recover"));
        CategorysPermission.AddChild(MyDemoPermissions.Categorys.ManagePermissions, L("Permission:ManagePermissions"));
    }

    private static LocalizableString L(string name)
    {
        return LocalizableString.Create<MyDemoResource>(name);
    }
}

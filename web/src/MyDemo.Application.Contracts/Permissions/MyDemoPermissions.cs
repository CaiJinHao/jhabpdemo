using Volo.Abp.Reflection;

namespace MyDemo.Permissions;

public class MyDemoPermissions
{
    public const string GroupName = "MyDemo";

    public static string[] GetAll()
    {
        return ReflectionHelper.GetPublicConstantsRecursively(typeof(MyDemoPermissions));
    }
}

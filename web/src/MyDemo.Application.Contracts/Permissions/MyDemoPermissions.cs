using Volo.Abp.Reflection;

namespace MyDemo;

public class MyDemoPermissions
{
    public const string GroupName = "MyDemo";
    public class Categorys
    {
        public const string Default = GroupName + ".Categorys";
        public const string Detail = Default + ".Detail";
        public const string Create = Default + ".Create";
        public const string Update = Default + ".Update";
        public const string Delete = Default + ".Delete";
        public const string BatchDelete = Default + ".BatchDelete";
        public const string Recover = Default + ".Recover";
        public const string ManagePermissions = Default + ".ManagePermissions";
    }
    public static string[] GetAll()
    {
        return ReflectionHelper.GetPublicConstantsRecursively(typeof(MyDemoPermissions));
    }
}

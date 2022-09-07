namespace MyDemo;

public static class MyDemoDbProperties
{
    public static string DbTablePrefix { get; set; } = "MyDemo";

    public static string DbSchema { get; set; } = null;

    public const string ConnectionStringName = "MyDemo";
}

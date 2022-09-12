using Jh.Abp.TenantManagement;
using Jh.SourceGenerator.Common;
using Jh.SourceGenerator.Common.GeneratorDtos;
using MyDemo.v1;
using System;
using Xunit;
namespace MyDemo.Samples;
public class GeneratorService_Test
{
    [Fact]
    public void ReactProxyServiceCodeBuilder_Test()
    {
        var moduleName = "Demo";
        var moduleNamespace = $"API.{moduleName}";
        var generatorPath = @"F:\Temp";
        var service = new GeneratorService(new GeneratorOptions(generatorPath), GneratorType.AllField);
        //service.GeneratorCodeByAppService(moduleNamespace, "API", $"{moduleName}_API", new Type[] { typeof(CategoryController) });
        //service.GeneratorCodeByTsx(moduleNamespace, new Type[] { typeof(Category) }, moduleName);
        service.GeneratorCodeByTsx(moduleNamespace, new Type[] { typeof(CategoryDto) }, moduleName);

    }
}

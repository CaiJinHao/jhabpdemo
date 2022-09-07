using Jh.SourceGenerator.Common;
using Jh.SourceGenerator.Common.GeneratorDtos;
using MyDemo;
using System;
using Xunit;

namespace MyDemo
{
    public class GeneratorServiceTest
    {
        [Fact]
        public void TestGetTableClass()
        {
            //模板路径为空不生成
            var basePathTemp = @"F:\Temp";
            var basePath = @"F:\Temp";
            basePath = basePathTemp;
            var domainAssembly = typeof(MyDemoDomainSharedModule).Assembly;
            var domain = @"\Demo";
            var itemName = "MyDemo";
            var options = new GeneratorOptions()
            {
                DbContext = "MyDemoDbContext",
                Namespace = "MyDemo",
                ControllerBase = "MyDemoController",
                CreateContractsPermissionsPath = @$"{basePath}\src\{itemName}.Application.Contracts\Permissions",
                CreateContractsPath = @$"{basePath}\src\{itemName}.Application.Contracts{domain}",
                CreateApplicationPath = @$"{basePath}\src\{itemName}.Application{domain}",
                CreateDomainPath = @$"{basePath}\src\{itemName}.Domain{domain}",
                CreateRepositoryPath = @$"{basePath}\src\{itemName}.EntityFrameworkCore{domain}",
                CreateHttpApiPath = @$"{basePath}\src\{itemName}.HttpApi\v1{domain}",
            };
            var service = new GeneratorService(domainAssembly, options, GneratorType.AllField);
            Assert.True(service.GeneratorCode(new Type[] { typeof(Category) }));

            //var mapTables = service.GetTableClassByGeneratorClass(typeof(Entity));
            //var service = new GeneratorService(domainAssembly, options, GneratorType.AllField);
            //var mapTables = service.GetLoadableTypes().Where(cla => cla.IsClass && typeof(IAggregateRoot).IsAssignableFrom(cla)).ToArray();
            //Assert.True(service.GeneratorCode(new Type[] { typeof(MenuRoleMap) }));
        }
    }
}

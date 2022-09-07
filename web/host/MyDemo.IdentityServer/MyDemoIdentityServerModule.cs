using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Hosting;
using MyDemo.MultiTenancy;
using StackExchange.Redis;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.Swagger;
using Volo.Abp;
using Volo.Abp.Account;
using Volo.Abp.Account.Web;
using Volo.Abp.AspNetCore.Authentication.JwtBearer;
using Volo.Abp.AspNetCore.Mvc;
using Volo.Abp.AspNetCore.Mvc.UI.MultiTenancy;
using Volo.Abp.AspNetCore.Mvc.UI.Theme.Basic;
using Volo.Abp.AspNetCore.Mvc.UI.Theme.Shared;
using Volo.Abp.AspNetCore.Serilog;
using Volo.Abp.Auditing;
using Volo.Abp.AuditLogging.EntityFrameworkCore;
using Volo.Abp.Autofac;
using Volo.Abp.Caching;
using Volo.Abp.Caching.StackExchangeRedis;
using Volo.Abp.Data;
using Volo.Abp.Emailing;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.EntityFrameworkCore.SqlServer;
using Volo.Abp.FeatureManagement;
using Volo.Abp.FeatureManagement.EntityFrameworkCore;
using Volo.Abp.Identity;
using Volo.Abp.Identity.EntityFrameworkCore;
using Volo.Abp.IdentityServer.EntityFrameworkCore;
using Volo.Abp.Localization;
using Volo.Abp.Modularity;
using Volo.Abp.MultiTenancy;
using Volo.Abp.PermissionManagement;
using Volo.Abp.PermissionManagement.EntityFrameworkCore;
using Volo.Abp.PermissionManagement.HttpApi;
using Volo.Abp.PermissionManagement.Identity;
using Volo.Abp.SettingManagement;
using Volo.Abp.SettingManagement.EntityFrameworkCore;
using Volo.Abp.Swashbuckle;
using Volo.Abp.TenantManagement;
using Volo.Abp.TenantManagement.EntityFrameworkCore;
using Volo.Abp.Threading;
using Volo.Abp.UI.Navigation.Urls;
using Jh.Abp.IdentityServer;
using Jh.Abp.JhIdentity;
using Jh.Abp.JhIdentity.EntityFrameworkCore;
using Jh.Abp.QuickComponents;
using Jh.Abp.JhIdentity.Localization;
using Volo.Abp.TenantManagement.Localization;
using Jh.Abp.QuickComponents.Swagger;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;

namespace MyDemo;
[DependsOn(
typeof(AbpAccountWebIdentityServerModule),
typeof(AbpAccountApplicationModule),
    typeof(AbpAccountHttpApiModule),
    typeof(AbpAspNetCoreMvcUiMultiTenancyModule),
    typeof(AbpAspNetCoreMvcModule),
    typeof(AbpAspNetCoreMvcUiBasicThemeModule),
    typeof(AbpAuditLoggingEntityFrameworkCoreModule),
    typeof(AbpAutofacModule),
    typeof(AbpCachingStackExchangeRedisModule),
    typeof(AbpEntityFrameworkCoreSqlServerModule),
    typeof(AbpIdentityEntityFrameworkCoreModule),
    typeof(AbpIdentityApplicationModule),
    typeof(AbpIdentityHttpApiModule),
    typeof(AbpIdentityServerEntityFrameworkCoreModule),
    typeof(AbpPermissionManagementDomainIdentityModule),
    typeof(AbpPermissionManagementEntityFrameworkCoreModule),
    typeof(AbpPermissionManagementApplicationModule),
    typeof(AbpPermissionManagementHttpApiModule),
    typeof(AbpSettingManagementEntityFrameworkCoreModule),
    typeof(AbpSettingManagementApplicationModule),
    typeof(AbpSettingManagementHttpApiModule),
    typeof(AbpFeatureManagementEntityFrameworkCoreModule),
    typeof(AbpFeatureManagementApplicationModule),
    typeof(AbpFeatureManagementHttpApiModule),
    typeof(AbpTenantManagementEntityFrameworkCoreModule),
    typeof(AbpTenantManagementApplicationModule),
    typeof(AbpTenantManagementHttpApiModule),
    typeof(AbpAspNetCoreAuthenticationJwtBearerModule),
    typeof(MyDemoApplicationContractsModule),
    typeof(AbpAspNetCoreSerilogModule),
    typeof(JhAbpIdentityServerModule),
    typeof(JhIdentityApplicationModule),
    typeof(JhIdentityEntityFrameworkCoreModule),
    typeof(JhIdentityHttpApiModule),
    typeof(AbpQuickComponentsModule),
    typeof(AbpSwashbuckleModule)
    )]
public class MyDemoIdentityServerModule : AbpModule
{
    private Microsoft.Extensions.Configuration.IConfiguration configuration;

    private void ConfigureLocalizationOptions()
    {
        Configure<AbpLocalizationOptions>(options =>
        {
            options.Resources
                .Get<JhIdentityResource>()
                .AddBaseTypes(typeof(Volo.Abp.Identity.Localization.IdentityResource));

            options.Resources
                .Get<AbpTenantManagementResource>()
                .AddVirtualJson("/Localization/JhAbpExtensions")//使用虚拟路径加载，并覆盖资源得键值对
               ;

            options.Resources
                .Get<Volo.Abp.Identity.Localization.IdentityResource>()
                .AddVirtualJson("/Localization/JhIdentity")
                .AddVirtualJson("/Localization/JhAbpExtensions")//使用虚拟路径加载，并覆盖资源得键值对
               ;

            options.Resources
                .Get<Volo.Abp.SettingManagement.Localization.AbpSettingManagementResource>()
                .AddVirtualJson("/Localization/JhIdentity")
                .AddVirtualJson("/Localization/JhAbpExtensions")//使用虚拟路径加载，并覆盖资源得键值对
                ;
        });
    }


    public override void ConfigureServices(ServiceConfigurationContext context)
    {
        var hostingEnvironment = context.Services.GetHostingEnvironment();
        configuration = context.Services.GetConfiguration();
        JhIdentityConsts.InitPassword = configuration["App:InitPassword"];
        ConfigureLocalizationOptions();
        Configure<AbpDbContextOptions>(options =>
        {
            options.UseSqlServer();
        });

        context.Services.AddApiVersion();
        if (Convert.ToBoolean(configuration["App:SwaggerUI"]))
        {
            var Audience = configuration.GetValue<string>("AuthServer:ApiName");
            context.Services.AddJhAbpSwagger(configuration,
               new Dictionary<string, string>{
               {Audience, $"{Audience} API"}
               }, contractsType: typeof(JhIdentityApplicationContractsModule));
        }

        Configure<AbpLocalizationOptions>(options =>
        {
            options.Languages.Add(new LanguageInfo("ar", "ar", "العربية"));
            options.Languages.Add(new LanguageInfo("cs", "cs", "Čeština"));
            options.Languages.Add(new LanguageInfo("en", "en", "English"));
            options.Languages.Add(new LanguageInfo("en-GB", "en-GB", "English (UK)"));
            options.Languages.Add(new LanguageInfo("fi", "fi", "Finnish"));
            options.Languages.Add(new LanguageInfo("fr", "fr", "Français"));
            options.Languages.Add(new LanguageInfo("hi", "hi", "Hindi", "in"));
            options.Languages.Add(new LanguageInfo("is", "is", "Icelandic", "is"));
            options.Languages.Add(new LanguageInfo("it", "it", "Italiano", "it"));
            options.Languages.Add(new LanguageInfo("hu", "hu", "Magyar"));
            options.Languages.Add(new LanguageInfo("pt-BR", "pt-BR", "Português"));
            options.Languages.Add(new LanguageInfo("ro-RO", "ro-RO", "Română"));
            options.Languages.Add(new LanguageInfo("ru", "ru", "Русский"));
            options.Languages.Add(new LanguageInfo("sk", "sk", "Slovak"));
            options.Languages.Add(new LanguageInfo("tr", "tr", "Türkçe"));
            options.Languages.Add(new LanguageInfo("zh-Hans", "zh-Hans", "简体中文"));
            options.Languages.Add(new LanguageInfo("zh-Hant", "zh-Hant", "繁體中文"));
            options.Languages.Add(new LanguageInfo("de-DE", "de-DE", "Deutsch"));
            options.Languages.Add(new LanguageInfo("es", "es", "Español"));
        });

        Configure<AbpAuditingOptions>(options =>
        {
                //options.IsEnabledForGetRequests = true;
                options.ApplicationName = "AuthServer";
            options.IsEnabledForAnonymousUsers = false;
        });

        Configure<AppUrlOptions>(options =>
        {
            options.Applications["MVC"].RootUrl = configuration["App:SelfUrl"];
        });

        context.Services.AddAuthentication()
            .AddJwtBearer(options =>
            {
                options.Authority = configuration["AuthServer:Authority"];
                options.RequireHttpsMetadata = Convert.ToBoolean(configuration["AuthServer:RequireHttpsMetadata"]);
                options.Audience = configuration["AuthServer:ApiName"];
            });

        context.Services.ForwardIdentityAuthenticationForBearer();

        Configure<AbpDistributedCacheOptions>(options =>
        {
            options.KeyPrefix = "MyDemo:";
        });

        Configure<AbpMultiTenancyOptions>(options =>
        {
            options.IsEnabled = MultiTenancyConsts.IsEnabled;
        });

        var dataProtectionBuilder = context.Services.AddDataProtection().SetApplicationName("MyDemo");
        if (!hostingEnvironment.IsDevelopment())
        {
            var redis = ConnectionMultiplexer.Connect(configuration["Redis:Configuration"]);
            dataProtectionBuilder.PersistKeysToStackExchangeRedis(redis, "MyDemo-Protection-Keys");
        }

        context.Services.AddCors(options =>
        {
            options.AddDefaultPolicy(builder =>
            {
                builder
                    .WithOrigins(
                        configuration["App:CorsOrigins"]
                            .Split(",", StringSplitOptions.RemoveEmptyEntries)
                            .Select(o => o.RemovePostFix("/"))
                            .ToArray()
                    )
                    .WithAbpExposedHeaders()
                    .SetIsOriginAllowedToAllowWildcardSubdomains()
                    .AllowAnyHeader()
                    .AllowAnyMethod()
                    .AllowCredentials();
            });
        });

#if DEBUG
        context.Services.Replace(ServiceDescriptor.Singleton<IEmailSender, NullEmailSender>());
#endif
    }

    public async override Task OnApplicationInitializationAsync(ApplicationInitializationContext context)
    {
        var app = context.GetApplicationBuilder();
        var env = context.GetEnvironment();

        if (env.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }
        else
        {
            app.UseErrorPage();
            app.UseHsts();
        }

        app.UseHttpsRedirection();
        app.UseCorrelationId();
        app.UseStaticFiles();
        app.UseRouting();
        app.UseCors();
        app.UseAuthentication();
        app.UseJwtTokenMiddleware();

        if (MultiTenancyConsts.IsEnabled)
        {
            app.UseMultiTenancy();
        }

        app.UseAbpRequestLocalization(options =>
        {
            options.RequestCultureProviders.RemoveAll(provider => provider is Microsoft.AspNetCore.Localization.AcceptLanguageHeaderRequestCultureProvider);
        });
        app.UseIdentityServer();
        app.UseAuthorization();
        if (Convert.ToBoolean(configuration["App:SwaggerUI"]))
        {
            app.UseSwagger();
            app.UseAbpSwaggerUI(options =>
            {
                options.UseJhSwaggerUiConfig(configuration, app.ApplicationServices.GetRequiredService<Microsoft.Extensions.Options.IOptions<SwaggerApiOptions>>().Value);
            });
        }
        app.UseAuditing();
        app.UseAbpSerilogEnrichers();
        app.UseConfiguredEndpoints();

        await SeedData(context);
    }

    private async Task SeedData(ApplicationInitializationContext context)
    {
        using var scope = context.ServiceProvider.CreateScope();
        var data = scope.ServiceProvider
                    .GetRequiredService<IDataSeeder>();
        var dataSeedContext = new DataSeedContext()
            .WithProperty("AdminEmail", "531003539@qq.com")
            .WithProperty("AdminPassword", "JinHao@123");

        await data.SeedAsync(dataSeedContext);
    }
}


using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.DependencyInjection;
using CarDealership.ViewModels;
using Application.Interfaces.Service;
using BLL.Services;
using Application.Interfaces.Repository;
using DAL.Repository;
using CarDealership.ViewModels.Manager;


namespace CarDealership.Util
{
    public static class StaticInjector
    {
        public static IHost Host { get; }
        static StaticInjector()
        {
            IHostBuilder builder = Microsoft.Extensions.Hosting.Host.CreateDefaultBuilder();
            SetVM(builder);
            SetServices(builder);
            SetRepositories(builder);
            Host = builder.Build();
            
        }

        private static void SetVM(IHostBuilder hostBuilder)
        {
            hostBuilder.ConfigureServices(services =>
            {
                services.AddTransient<CarShowcaseViewModel>();
                services.AddTransient<AuthorizationViewModel>();
                services.AddTransient<MenuClientViewModel>();
                services.AddTransient<MenuManagerViewModel>();
                services.AddTransient<DealViewModel>();
                services.AddTransient<CarsListViewModel>();
                services.AddTransient<DealerInfoViewModel>();
                services.AddTransient<ReportViewModel>();
                services.AddTransient<AccessoryViewModel>();

            });
        }

        private static void SetServices(IHostBuilder hostBuilder)
        {
            hostBuilder.ConfigureServices(services =>
            {
                services.AddSingleton<ICarService, CarService>();
                services.AddSingleton<IDealershipService, DealershipService>();
                services.AddSingleton<IModelService, ModelService>();
                services.AddSingleton<IDealService, DealService>();
                services.AddSingleton<IEnumService, EnumService>();
                services.AddSingleton<IAccessoryService, AccessoryService>();
                services.AddSingleton<IDocumentService, DocumentService>();
            });
        }
        private static void SetRepositories(IHostBuilder hostBuilder)
        {
            hostBuilder.ConfigureServices(services =>
            {
                services.AddSingleton<IDbRepository, DbRepository>();
            });
        }
    }
    
    
}

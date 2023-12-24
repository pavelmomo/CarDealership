using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.EF
{
    internal class DbInitializer : CreateDatabaseIfNotExists<DealershipDbContext>
    {
        protected override void Seed(DealershipDbContext context)
        {
            #region Brand

            List<Brand> brands = new List<Brand>
            {
                new Brand() { Name = "BMW"},
                new Brand() { Name = "Mercedes"},
                new Brand() { Name = "Audi" },
                new Brand() { Name = "Skoda"},
                new Brand() { Name = "Hyndai" },
                new Brand() { Name = "Toyota" },
                new Brand() { Name = "Nissan" },
                new Brand() { Name = "Subaru" },
                new Brand() { Name = "Lada" },

            };
            context.Brands.AddRange(brands);

            #endregion

            #region Model

            List<Model> models = new List<Model>
            {
                new Model() { Name = "3 series", Brand = brands[0] },
                new Model() { Name = "5 series", Brand = brands[0] },
                new Model() { Name = "A4", Brand = brands[2] },
                new Model() { Name = "A5", Brand = brands[2] },
                new Model() { Name = "A6", Brand = brands[2] },
                new Model() { Name = "E-class", Brand = brands[1] },
                new Model() { Name = "Octavia", Brand = brands[3] },
                new Model() { Name = "Accent", Brand = brands[4] },
                new Model() { Name = "Mark II", Brand = brands[5] },
                new Model() { Name = "X-Trail", Brand = brands[6] },
                new Model() { Name = "Impreza", Brand = brands[7] },
            };
            for (int i = 1; i < 16; i++)
            {
                models.Add(new Model() { Brand = brands[8], Name = string.Format("21{0:D2}", i) });
            }
            context.Models.AddRange(models);

            #endregion

            #region Agent

            context.Agents.Add(new Agent { Fio = "Иван Петович Крупин", TelephoneNumber = 79208690855 });

            #endregion

            #region Configuration Option

            List<ConfigurationOption> configurationOptions = new List<ConfigurationOption>
            {
                new ConfigurationOption { Name = "Кондиционер"},
                new ConfigurationOption {Name = "Климат-контроль"},
                new ConfigurationOption {Name = "Навигационная система"},
                new ConfigurationOption {Name = "Акустическая подготовка"},
                new ConfigurationOption {Name = "ЭУР"},
                new ConfigurationOption {Name = "ГУР"},
                new ConfigurationOption {Name = "ABS"},
                new ConfigurationOption {Name = "ESP"},
                new ConfigurationOption {Name = "Подогрев сидений"},
                new ConfigurationOption {Name = "Электростеклоподъёмники"},
                new ConfigurationOption {Name = "Подогрев сидений"}
            };
            context.ConfigurationOptions.AddRange(configurationOptions);

            #endregion

            #region Accessory

            List<Accessory> accessories = new List<Accessory>
            { 
                new Accessory { Name = "Освежитель воздуха \"Лесная Свежесть\"", Price = 150, Count = 6 },
                new Accessory { Name = "Набор EVO ковриков", Price = 2500, Count = 4 },
                new Accessory { Name = "Набор начинающего водителя ", Price = 3000, Count = 2 },
                new Accessory { Name = "Набор инструмента \"Inforce\"", Price = 5000, Count = 8 },
                new Accessory { Name = "Набор для детейлинга салона авто", Price = 2385, Count = 0 },
                new Accessory { Name = "Видеорегистратор \"70mai\" ", Price = 6000, Count = 10 }

            };
            context.Accessories.AddRange(accessories);

            #endregion

            #region Cars

            List<Car> cars = new List<Car>
            {
                new Car { Status=true, YearOfRelease=1980, NumberOfOwners=2, Mileage= 60000, EngineSize= 1.3f,EnginePower=69, Color="бежевый",
                        Description="Продаётся автомобиль в отличном состоянии.",Vin="XTA210113459876",DateOfPublish=DateTime.Now,Price=100000,
                        RegistrationNumber="Е024МО33",BodyNumber="3459876", EngineNumber="21011-8946",Pts="5345345333",Sts="22342252", ImagePath="Images\\CarsForSale\\1",
                        DriveType = Domain.Enums.DriveType.rear, TransmissionType = Domain.Enums.TransmissionType.mechanic, BodyType = Domain.Enums.BodyType.sedan,
                        EngineType = Domain.Enums.EngineType.gasoline, Model = models[11]},

                 new Car { Status=true, YearOfRelease=1996, NumberOfOwners=6, Mileage= 248000, EngineSize= 2.8f,EnginePower=197, Color="чёрный",
                        Description="Продаётся автомобиль.",Vin="KRG899113459876",DateOfPublish=DateTime.Now,Price=560000,
                        RegistrationNumber="Е779КН178", BodyNumber="-",EngineNumber="2807-83811",Pts="1387345338",Sts="87362251", ImagePath="Images\\CarsForSale\\2",
                        DriveType = Domain.Enums.DriveType.rear, TransmissionType = Domain.Enums.TransmissionType.automatic, BodyType = Domain.Enums.BodyType.sedan,
                        EngineType = Domain.Enums.EngineType.gasoline, Model = models[0]}
            };
            context.Cars.AddRange(cars);

            #endregion


            base.Seed(context);
        }
    }
}

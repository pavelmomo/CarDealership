using Application.DTO;
using Application.Interfaces.Repository;
using Application.Interfaces.Service;
using Domain.Entity;
using Domain.Enums;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;



namespace BLL.Services
{
    public class CarService : ICarService
    {
        IDbRepository dbRepository;
        public CarService(IDbRepository dbRepository)
        {
            this.dbRepository = dbRepository;
        }
        public bool AddCar(CarDTO car)
        {
            if (!(car.BodyType is int) || !(car.DriveType is int) || !(car.TransmissionType is int)
                || !(car.EngineType is int))
            {
                return false;
            }
            Car carToAdd = new Car
            {
                Status = true,
                YearOfRelease = car.YearOfRelease,
                NumberOfOwners = car.NumberOfOwners,
                Mileage = car.Mileage,
                EngineSize = car.EngineSize,
                EnginePower = car.EnginePower,
                Color = car.Color,
                Description = car.Description,
                Vin = car.Vin,
                DateOfPublish = DateTime.Now,
                Price = car.Price,
                RegistrationNumber = car.RegistrationNumber,
                BodyNumber = car.BodyNumber,
                EngineNumber = car.EngineNumber,
                Pts = car.Pts,
                Sts = car.Sts,
                ModelId = car.ModelId,
                DriveType = (Domain.Enums.DriveType)car.DriveType,
                TransmissionType = (TransmissionType)car.TransmissionType,
                BodyType = (BodyType)car.BodyType,
                EngineType = (EngineType)car.EngineType,
                ImagePath = car.ImagePath
            };
            bool result = dbRepository.Cars.Create(carToAdd, car.ConfigurationOptions);
            if (!result) { dbRepository.Save(); return false; }
            dbRepository.Save();
            carToAdd.ImagePath = (Path.Combine("Images", "CarsForSale", carToAdd.Id.ToString()));
            result = dbRepository.Cars.Update(carToAdd);
            if (!result) { dbRepository.Cars.Delete(carToAdd.Id); dbRepository.Save(); return false; }
            dbRepository.Save();

            if (!Directory.Exists(Path.Combine(Environment.CurrentDirectory, carToAdd.ImagePath)))
            {
                Directory.CreateDirectory(Path.Combine(Environment.CurrentDirectory, carToAdd.ImagePath));
            }
            File.Copy(car.ImagePath, Path.Combine(Environment.CurrentDirectory, carToAdd.ImagePath, "1.jpg"), true);
            return result;

        }


        public List<CarShortDTO> GetAllCarsOnSale()
        {
            return dbRepository.Cars.GetAllOnSale().Select(e => new CarShortDTO(e)
            { 
                ImagePath = Path.Combine(Environment.CurrentDirectory, e.ImagePath, "1.jpg"),
                
            }).ToList();
        }

        public List<CarShortDTO> GetAdvertismentsByFilter(long brandId, long modelId)
        {

            return dbRepository.Cars.GetOnSaleByFilter(brandId, modelId).Select(car => new CarShortDTO(car)
            {
                ImagePath = Path.Combine(Environment.CurrentDirectory, car.ImagePath, "1.jpg"),

            }).ToList();

        }
        public CarDTO GetOneCar(long id)
        {
            Car dbCar = dbRepository.Cars.GetOne(id);
            if (dbCar == null) { return null; }
            CarDTO car = new CarDTO(dbCar)
            {
                ImagePath = Path.Combine(Environment.CurrentDirectory, dbCar.ImagePath, "1.jpg"),
                ConfigurationOptions = dbCar.ConfigurationOptions.Select(e => e.Id).ToList()
            };
            return car;
        }
        public bool UpdateCar(CarDTO car)
        {
            if (!(car.BodyType is int) || !(car.DriveType is int) || !(car.TransmissionType is int)
                || !(car.EngineType is int))
            {
                return false;
            }
            Car carToEdit = new Car
            {
                Id = car.Id,
                Status = car.Status,
                YearOfRelease = car.YearOfRelease,
                NumberOfOwners = car.NumberOfOwners,
                Mileage = car.Mileage,
                EngineSize = car.EngineSize,
                EnginePower = car.EnginePower,
                Color = car.Color,
                Description = car.Description,
                Vin = car.Vin,
                DateOfPublish = car.DateOfPublish,
                Price = car.Price,
                RegistrationNumber = car.RegistrationNumber,
                BodyNumber = car.BodyNumber,
                EngineNumber = car.EngineNumber,
                Pts = car.Pts,
                Sts = car.Sts,
                ModelId = car.ModelId,
                DriveType = (Domain.Enums.DriveType)car.DriveType,
                TransmissionType = (TransmissionType)car.TransmissionType,
                BodyType = (BodyType)car.BodyType,
                EngineType = (EngineType)car.EngineType,
                ImagePath = Path.Combine("Images", "CarsForSale", car.Id.ToString())
            };
            bool res = dbRepository.Cars.Update(carToEdit, car.ConfigurationOptions);
            if (res) 
            { 
                
                string imgPath = Path.Combine(Environment.CurrentDirectory, carToEdit.ImagePath, "1.jpg");
                if (car.ImagePath != imgPath) { File.Copy(car.ImagePath, imgPath, true); }
                
            }
            dbRepository.Save();
            return res;
        }

        public List<ConfigurationOptionDTO> GetConfigurationOptions()
        {
            return dbRepository.ConfigurationOptions.GetAll()
                                                    .Select(e => new ConfigurationOptionDTO
                                                    {
                                                        Name = e.Name,
                                                        Id = e.Id
                                                    }).ToList();
        }

        public bool SellCar(long id)
        {
            Car car = dbRepository.Cars.GetOne(id);
            if (car == null) { return false; }
            car.Status = false;
            bool res = dbRepository.Cars.Update(car);
            dbRepository.Save();
            return res;
        }
    }
}

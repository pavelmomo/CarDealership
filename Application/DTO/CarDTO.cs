using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTO
{
    public class CarDTO : BaseNotifyDTO
    {
        private long _modelId;
        private long _brandId;

        public long Id { get; set; }
        public bool Status { get; set; }
        public string Name { get; set; }
        public int YearOfRelease { get; set; }
        public int NumberOfOwners { get; set; }
        public int Mileage { get; set; }
        public float EngineSize { get; set; }
        public int EnginePower { get; set; }
        public string Color { get; set; }
        public string Description { get; set; }
        public string Vin { get; set; }
        public DateTime DateOfPublish { get; set; }
        public int Price { get; set; }
        public string RegistrationNumber { get; set; }
        public string BodyNumber { get; set; }
        public string EngineNumber { get; set; }
        public string Pts { get; set; }
        public string Sts { get; set; }
        public string ImagePath { get; set; }
        public dynamic DriveType { get; set; }
        public dynamic TransmissionType { get; set; }
        public dynamic BodyType { get; set; }
        public dynamic EngineType { get; set; }
        public long ModelId { get => _modelId; set { _modelId = value; OnPropertyChanged(); } }
        public long BrandId { get => _brandId; set { _brandId = value; OnPropertyChanged(); } }
        public List<long> ConfigurationOptions { get; set; } = new List<long>();
        public List<string> ConfigurationOptionNames { get; set; }
        public CarDTO() 
        {
            DriveType = 0; 
            TransmissionType = 0;
            BodyType = 0; 
            EngineType = 0;
        }
        
        public CarDTO(Car car) 
        { 
            Id = car.Id;
            Status = car.Status;
            YearOfRelease = car.YearOfRelease;
            NumberOfOwners = car.NumberOfOwners;
            Mileage = car.Mileage;
            EngineSize = car.EngineSize;
            EnginePower = car.EnginePower;
            Color = car.Color;
            Description = car.Description;
            Vin = car.Vin;
            DateOfPublish = car.DateOfPublish;
            Price = car.Price;
            RegistrationNumber = car.RegistrationNumber;
            BodyNumber = car.BodyNumber;
            EngineNumber = car.EngineNumber;
            Pts = car.Pts;
            Sts = car.Sts;
            ImagePath = car.ImagePath;
            DriveType = (int)car.DriveType;
            TransmissionType = (int)car.TransmissionType;
            BodyType = (int)car.BodyType;
            EngineType = (int)car.EngineType;
            ModelId = car.ModelId;
            BrandId = car.Model.BrandId;
            Name = car.Model.Brand.Name + " " + car.Model.Name;

        }
    }
}

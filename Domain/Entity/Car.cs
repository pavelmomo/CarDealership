using System;
using System.Collections.Generic;
using Domain.Enums;

namespace Domain.Entity
{
    public class Car
    {
        public long Id { get; set; }
        public bool Status { get; set; }
        public int YearOfRelease { get; set; }
        public int NumberOfOwners { get; set; }
        public int Mileage { get; set; }
        public float EngineSize { get; set; }
        public int EnginePower { get; set; }
        public string Color { get; set; }
        public string Description { get; set; }
        public string Vin {  get; set; }
        public DateTime DateOfPublish { get; set; }
        public int Price { get; set; }
        public string RegistrationNumber { get; set; }
        public string BodyNumber { get; set; }
        public string EngineNumber { get; set; }
        public string Pts { get; set; }
        public string Sts { get; set; }
        public string ImagePath { get; set; }
        public DriveType DriveType { get; set; }
        public TransmissionType TransmissionType { get; set; }
        public BodyType BodyType { get; set; }
        public EngineType EngineType { get; set; }
        public ICollection<ConfigurationOption> ConfigurationOptions { get; set; }
        public long ModelId { get; set; }
        public Model Model { get; set; }
        public ICollection<Deal> Deals { get; set; }
        

    }
    
}

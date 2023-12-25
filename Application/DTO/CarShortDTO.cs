using Domain.Entity;
using Domain.Enums;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTO
{
    public class CarShortDTO
    {
        public CarShortDTO()
        {

        }
        public CarShortDTO(Car car)
        {
            Id = car.Id;
            Name = string.Format("{0} {1}", car.Model.Brand.Name, car.Model.Name);
            ImagePath = car.ImagePath;
            Price = car.Price;
            DateOfPublish = car.DateOfPublish;
            VIN = car.Vin;
            RegNumber = car.RegistrationNumber;
            BodyNumber = car.BodyNumber;
            YearOfRelease = car.YearOfRelease;
            ShortSpecs = string.Format("Год выпуска {7},\nДвигатель {0} {1} л.,{2} л.с, {3} КПП\nКузов {4},\nПробег {5} км.\nОпубликовано {6}",
                            car.EngineType.GetDescription(), car.EngineSize, car.EnginePower, car.TransmissionType.GetDescription(),
                            car.BodyType.GetDescription(),car.Mileage, car.DateOfPublish.ToShortDateString(), car.YearOfRelease);
          
        }
        public string ImagePath { get; set; }
        public long Id { get; set; }
        public string Name { get; set; }
        public long Price { get; set; }
        public string VIN { get; set; }
        public string RegNumber { get; set; }
        public DateTime DateOfPublish { get; set; }
        public string ShortSpecs { get; set; }
        public int YearOfRelease { get; set; }
        public string BodyNumber { get; set; }
    }
}

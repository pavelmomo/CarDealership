using Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Service
{
    public interface ICarService
    {
        bool AddCar(CarDTO car);
        bool UpdateCar(CarDTO car);
        List<CarShortDTO> GetAllCarsOnSale();
        CarDTO GetOneCar(long id);
        List<ConfigurationOptionDTO> GetConfigurationOptions();
        List<CarShortDTO> GetAdvertismentsByFilter(long brandId, long modelId);
        bool SellCar (long id);

        
    }
}

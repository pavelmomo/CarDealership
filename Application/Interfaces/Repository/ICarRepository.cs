using System;
using Domain.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Repository
{
    public interface ICarRepository
    {
        bool Create(Car car, List<long> configurationOptions = null);
        bool Update(Car car, List<long> configurationOptions = null);
        bool Delete(long id);
        List<Car> GetAllOnSale();
        Car GetOne(long id);
        List<Car> GetOnSaleByFilter(long brandId, long modelId);

    }
}

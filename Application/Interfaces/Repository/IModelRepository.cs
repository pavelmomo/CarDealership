using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Repository
{
    public interface IModelRepository
    {
        List<Model> GetModelsByBrand(long brandId);
        List<Brand> GetAllBrands();
    }
}

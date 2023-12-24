using Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Service
{
    public interface IModelService
    {
        List<ModelDTO> GetModelsByBrand(long brandId);
        List<BrandDTO> GetAllBrands();
    }
}

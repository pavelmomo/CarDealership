using Application.DTO;
using Application.Interfaces.Repository;
using Application.Interfaces.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class ModelService : IModelService
    {
        IDbRepository dbRepository;
        public ModelService(IDbRepository dbRepository)
        {
            this.dbRepository = dbRepository;
        }
        public List<ModelDTO> GetModelsByBrand(long brandId)
        {
            return dbRepository.Models
                .GetModelsByBrand(brandId)
                .Select(e => new ModelDTO(e))
                .ToList();
        }
        public List<BrandDTO> GetAllBrands()
        {
            return dbRepository.Models
                .GetAllBrands()
                .Select(e => new BrandDTO
                {
                    Id = e.Id,
                    Name = e.Name

                }).ToList();
        }
    }
}

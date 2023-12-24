using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTO
{
    public class ModelDTO
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public long BrandId { get; set; }
        public ModelDTO(Model model)
        {
            Id = model.Id;
            BrandId = model.BrandId;
            Name = model.Name;
        }
        public ModelDTO()
        {

        }
    }
}

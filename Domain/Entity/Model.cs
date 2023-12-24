using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entity
{
    public class Model
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public long BrandId { get; set; }
        public Brand Brand { get; set; }
        public ICollection<Car> Cars {  get; set; }
    }
}

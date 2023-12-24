using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entity
{
    public class Brand
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Country { get; set; }
        public ICollection<Model> Models { get; set; }
    }
}

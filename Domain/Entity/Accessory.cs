using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entity
{
    public class Accessory
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Price { get; set; }
        public int Count { get; set; }
        public bool Status { get; set; }
        public ICollection<AccessoryCart> AccessoryCart { get; set; }
        public Accessory()
        {
            Status = true;
        }
    }
}

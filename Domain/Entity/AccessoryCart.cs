using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entity
{
    public class AccessoryCart
    {
        public int Id { get; set; }
        public int Price { get; set; }
        public long DealId { get; set; }
        public Deal Deal { get; set; }
        public int AccessoryId { get; set; }
        public Accessory Accessory { get; set; }

    }
}

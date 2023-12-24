using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entity
{
    public class Deal
    {
        public long Id { get; set; }
        public DateTime Date { get; set; }
        public long CarId { get; set; }
        public Car Car { get; set; }
        public int AgentId { get; set; }
        public long TotalPrice { get; set; }
        public Agent Agent { get; set; }
        public string CustomerFIO { get; set; }
        public string CustomerPassport { get; set; }
        public string CustomerDateOfBirth { get; set; }
        public string CustomerPlaceOfLiving { get; set; }
        public long CustomerTelephone { get; set; }
        public ICollection<AccessoryCart> AccessoryCarts { get; set; }

    }
}

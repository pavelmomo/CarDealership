using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entity
{
    public class Agent
    {
        public int Id { get; set; }
        public string Fio { get; set;}
        public long TelephoneNumber { get; set;}
        public ICollection<Deal> Deals { get; set; }
    }
}

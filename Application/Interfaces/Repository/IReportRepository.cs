using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Repository
{
    public interface IReportRepository
    {
        int GetCarsStatisticByPrice(int startPrice, int endPrice, DateTime startDealDate);
    }
}

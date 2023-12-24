using Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Service
{
    public interface IDealService
    {
        bool CreateDeal(DealDTO dealDTO);
        List<DealShortDTO> GetDealsList();
        DealDTO GetOneDeal(long id);

    }
}

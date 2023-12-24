using Application.DTO;
using System;


namespace Application.Interfaces.Service
{
    public interface IDealershipService
    {
        DealershipDTO GetDealershipInfo();
        int GetCarsStatisticByPrice(int startPrice, int endPrice, DateTime startDealDate);
    }
}

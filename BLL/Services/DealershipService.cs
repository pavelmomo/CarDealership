using Application.DTO;
using Application.Interfaces.Repository;
using Application.Interfaces.Service;
using System;


namespace BLL.Services
{
    public class DealershipService : IDealershipService
    {
        IDbRepository dbRepository;
        public DealershipService(IDbRepository dbRepository)
        {
            this.dbRepository = dbRepository;
        }
        public int GetCarsStatisticByPrice(int startPrice, int endPrice, DateTime startDealDate)
        {
            return dbRepository.Reports.GetCarsStatisticByPrice(startPrice, endPrice, startDealDate);
        }

        public DealershipDTO GetDealershipInfo()
        {
            DealershipDTO dealershipInfo = new DealershipDTO();
            dealershipInfo.TelephoneNumber = 79207513538;
            dealershipInfo.Address = "г.Иваново, ул.Куконковых, д.7а";
            dealershipInfo.ContactString = "Для уточнения информации обращайтесь по номеру +"
                                            + dealershipInfo.TelephoneNumber;
            dealershipInfo.Email = "autolux37@mail.ru";
            dealershipInfo.CompanyName = "Автолюкс".ToUpper();
            return dealershipInfo;
        }
    }
}

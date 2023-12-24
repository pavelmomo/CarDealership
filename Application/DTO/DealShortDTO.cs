using Domain.Entity;
using System;


namespace Application.DTO
{
    public class DealShortDTO
    {
        public long Id { get; set; }
        public DateTime Date { get; set; }
        public long CarId { get; set; }
        public string CarName { get; set; }        
        public string AgentFIO { get; set; }
        public string CustomerFIO { get; set; }
        public long TotalPrice { get; set; }
       
        public DealShortDTO(Deal deal)
        {
            Id = deal.Id;
            Date = deal.Date;
            CarId = deal.CarId;
            AgentFIO = deal.Agent.Fio;
            CustomerFIO = deal.CustomerFIO;
            TotalPrice = deal.TotalPrice;
            CarName = deal.Car.Model.Brand.Name + " " + deal.Car.Model.Name;
        }
        public DealShortDTO()
        {

        }
    }
}

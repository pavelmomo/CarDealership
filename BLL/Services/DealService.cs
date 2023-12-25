using Application.DTO;
using Application.Interfaces.Repository;
using Application.Interfaces.Service;
using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;


namespace BLL.Services
{
    public class DealService : IDealService
    {
        IDbRepository dbRepository;
        IDocumentService documentService;
        ICarService carService;

        public DealService(IDbRepository dbRepository, IDocumentService documentService,ICarService carService)
        {
            this.dbRepository = dbRepository;
            this.documentService = documentService;
            this.carService = carService;
        }
        public bool CreateDeal(DealDTO dealDTO)
        {
            Deal newDeal = new Deal
            {
                Date = DateTime.Now,
                CarId = dealDTO.CarId,
                AgentId = 1,
                TotalPrice = dealDTO.TotalPrice,
                CustomerFIO = dealDTO.CustomerFIO,
                CustomerPassport = dealDTO.CustomerPassport,
                CustomerDateOfBirth = dealDTO.CustomerDateOfBirth.ToShortDateString(),
                CustomerPlaceOfLiving = dealDTO.CustomerPlaceOfLiving,
                CustomerTelephone = dealDTO.CustomerTelephone

            };
            bool res = dbRepository.Deals.Create(newDeal, dealDTO.Accessories);
            dbRepository.Save();
            if (!res) { return res; }
            res = carService.SellCar(dealDTO.CarId);
            if (!res) 
            { 
                dbRepository.Deals.Delete(dealDTO.Id); 
               
            }
            dbRepository.Save();
            return res;
        }
        public DealDTO GetOneDeal(long id)
        {
            Deal deal = dbRepository.Deals.GetOne(id);
            if (deal == null) { return null; }
            DealDTO fullDealDTO = new DealDTO(deal);
            if (deal.AccessoryCarts != null)
            {
                fullDealDTO.AccessoriesFromCart = deal.AccessoryCarts.Select(x => new AccessoryDTO()
                {
                    Id = x.AccessoryId, Name = x.Accessory.Name, Price = x.Price, Count = x.Accessory.Count, Status = x.Accessory.Status
                }).ToList();
            }
            
            return fullDealDTO;
        }
        public List<DealShortDTO> GetDealsList()
        {
            List<DealShortDTO> deals = dbRepository.Deals.GetAll().Select(e => new DealShortDTO(e)).ToList();
            return deals;
        }
    }
}

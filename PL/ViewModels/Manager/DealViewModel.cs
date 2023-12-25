using Application.DTO;
using Application.Interfaces.Service;
using CarDealership.Util;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;


namespace CarDealership.ViewModels.Manager
{
    internal class DealViewModel : BaseViewModel
    {
        #region Is Open Property
        public bool IsCreateDialogOpen { get => _isCreateDialogOpen; set { _isCreateDialogOpen = value; OnPropertyChanged(); } }
        public bool IsDocQuestionDialogOpen { get => _isDocQuestionDialogOpen;set { _isDocQuestionDialogOpen = value; OnPropertyChanged(); } }
        public bool IsInfoDialogOpen { get => _isInfoDialogOpen; set { _isInfoDialogOpen = value; OnPropertyChanged(); } }
        public bool IsMessageBoxOpen { get => _isMessageBoxOpen; set { _isMessageBoxOpen = value; OnPropertyChanged(); } }

        #endregion

        #region Services

        IModelService modelService;
        ICarService carService;
        IAccessoryService accessoryService;
        IDealService dealService;
        IDocumentService documentService;

        #endregion

        #region Private property fields

        bool _isCreateDialogOpen;
        bool _isMessageBoxOpen;
        bool _isDocQuestionDialogOpen;
        bool _isInfoDialogOpen;
        long _selectedBrandId;
        long _selectedModelId;
        long _selectedCarId;
        DealDTO _selectedDeal;
        string _messageBoxText;
 



        #endregion

        #region Commands

        public RelayCommand UpdatePriceCommand { get; private set; }
        public RelayCommand OpenCreateDialogCommand { get; private set; }
        public RelayCommand OpenInfoDialogCommand { get; private set; }
        public RelayCommand CreateDealCommand { get; private set; }
        public RelayCommand GenerateDocumentCommand { get; private set; }
        public RelayCommand CloseMessageBoxCommand { get; private set; }

        #endregion

        #region Models and brands working
        public ObservableCollection<BrandDTO> Brands { get; set; }
        public ObservableCollection<ModelDTO > Models { get; set; }
        public ObservableCollection<CarShortDTO> Cars {  get; set; }
        
        public long SelectedBrandId
        { 
            get => _selectedBrandId;
            set
            {
                _selectedBrandId = value;
                OnPropertyChanged();
                SelectedModelId = 0;
                Cars.Clear();
                Models.Clear();
                try
                {
                    if (value != 0) { Models.AddRange(modelService.GetModelsByBrand(value)); }
                }
                catch
                {
                    MessageBoxText = "Возникла ошибка при обращении к БД";
                    IsMessageBoxOpen = true;
                }
                
                
            }
        }
        public long SelectedModelId
        {
            get => _selectedModelId;
            set
            {
                _selectedModelId = value;
                Cars.Clear();
                try
                {
                    if (value != 0) { Cars.AddRange(carService.GetAdvertismentsByFilter(SelectedBrandId, value)); }
                }
                catch
                {
                    MessageBoxText = "Возникла ошибка при обращении к БД";
                    IsMessageBoxOpen = true;
                }
                SelectedCarId = 0;
                OnPropertyChanged();
                
            }
        }
        public long SelectedCarId 
        { 
            get => _selectedCarId; 
            set 
            {
                _selectedCarId = value; 
                OnPropertyChanged();
                if (value != 0)
                {
                    CarShortDTO temp = Cars.Where(e => e.Id == value).FirstOrDefault();
                    if (temp != null)
                    {
                        SelectedDeal.CarPrice = temp.Price;
                        SelectedDeal.CarId = value;
                        SetCurrentPrice();
                        return;
                    }
                    
                }
                SelectedDeal.CarPrice = 0;
                SetCurrentPrice();

            }
        }

        #endregion

        #region Price and accessories working
        
        List<AccessoryDTO> accessories;
        private void SetCurrentPrice(object e = null)
        {
            SelectedDeal.TotalPrice = SelectedDeal.CarPrice;

            foreach (var i in SelectedDeal.AccessoriesFromCart)
            {
                if(i.IsSelected) { SelectedDeal.TotalPrice += i.Price; }
            }
            
        }

        #endregion

        private DateTime buf = new DateTime();
        public ObservableCollection<DealShortDTO> Deals { get; set; }
        public ObservableCollection<AccessoryDTO> Products { get; set; }
        public DealDTO SelectedDeal { get => _selectedDeal; set { _selectedDeal = value; OnPropertyChanged(); } }
        public string MessageBoxText { get => _messageBoxText; set { _messageBoxText = value; OnPropertyChanged(); } }
        

        public DealViewModel(IModelService modelService, ICarService carService, IAccessoryService accessoryService,
            IDealService dealService, IDocumentService documentService)
        {
            this.modelService = modelService;
            this.carService = carService;
            this.accessoryService = accessoryService;
            this.dealService = dealService;
            this.documentService = documentService;
            UpdatePriceCommand = new RelayCommand(SetCurrentPrice);  
            CreateDealCommand = new RelayCommand(CreateDeal, CheckForm);
            OpenInfoDialogCommand = new RelayCommand(OpenInfoDialog);
            GenerateDocumentCommand = new RelayCommand(GenerateDocument);
            CloseMessageBoxCommand = new RelayCommand((object e) => IsMessageBoxOpen = false);
            OpenCreateDialogCommand = new RelayCommand(OpenCreateDialog);
            Products = new ObservableCollection<AccessoryDTO>();
            Models = new ObservableCollection<ModelDTO>();
            Cars = new ObservableCollection<CarShortDTO>();
            Deals = new ObservableCollection<DealShortDTO>();
            Brands = new ObservableCollection<BrandDTO>();
            accessories = new List<AccessoryDTO>();
            try
            {
                Brands.AddRange(modelService.GetAllBrands());
                LoadData();
            }
            catch
            {
                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
                accessories = new List<AccessoryDTO>();
            }
            
        }
        private void LoadData()
        {
            try
            {
                Deals.Clear();
                Deals.AddRange(dealService.GetDealsList());
                accessories = accessoryService.GetAccessories();
                
            }
            catch
            {
                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
            }
            
        }
        private void CreateDeal(object e)
        {
           
            foreach (var i in SelectedDeal.AccessoriesFromCart)
            {
                if (i.IsSelected) { SelectedDeal.Accessories.Add(i.Id); }
            }
            bool res;
            try
            {
                res = dealService.CreateDeal(SelectedDeal);
                if (res)
                {
                    LoadData();
                    SelectedDeal = dealService.GetOneDeal(Deals.OrderBy(f => f.Date).Last().Id);
                    IsDocQuestionDialogOpen = true;
                }
            }
            catch
            {
                res = false;
            }

            if(!res)
            {
                MessageBoxText = "Возникла ошибка при оформлении сделки";
                IsMessageBoxOpen = true;
            }
     
        }
        private bool CheckForm(object e)
        {
            try
            {
                if (SelectedCarId == 0 || SelectedDeal.CustomerTelephone <= 0 || string.IsNullOrWhiteSpace(SelectedDeal.CustomerPlaceOfLiving) 
                || string.IsNullOrWhiteSpace(SelectedDeal.CustomerPassport) || string.IsNullOrWhiteSpace(SelectedDeal.CustomerFIO) || string.IsNullOrWhiteSpace(SelectedDeal.CustomerDateOfBirth) 
                || SelectedDeal.CustomerDateOfBirth.Length != 10 )
                {
                
                    return false;
                }
            
                if (!(SelectedDeal.CustomerDateOfBirth[2] == '.' && SelectedDeal.CustomerDateOfBirth[5] == '.')
                || !DateTime.TryParse(SelectedDeal.CustomerDateOfBirth, out buf))
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }

            

            return true;
        }

        private void OpenCreateDialog(object e)
        {
            SelectedDeal = new DealDTO();
            accessories = accessories.Select(a => { a.IsSelected = false; return a; }).ToList();
            SelectedDeal.AccessoriesFromCart = accessories;
            SelectedDeal.Accessories = new List<int>();
            SelectedBrandId = 0;
            IsCreateDialogOpen = true;
        }

        private void OpenInfoDialog(object e)
        {
            if (e == null || !(e is long id)) { return; }

            try
            {
                SelectedDeal = dealService.GetOneDeal(id);
                Products.Clear();
                Products.Add(new AccessoryDTO { Name = SelectedDeal.CarNameWithRegNumber, Price = (int)SelectedDeal.CarPrice });
                if (SelectedDeal.AccessoriesFromCart != null) { Products.AddRange(SelectedDeal.AccessoriesFromCart); }
                IsInfoDialogOpen = true;
            }
            catch
            {
                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
                SelectedDeal = new DealDTO();
            }
                 
            
        }
        private void GenerateDocument(object e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.Filter = "pdf files (*.pdf)|*.pdf";
    
            if (saveFileDialog.ShowDialog() == true)
            {
                bool res;
                try
                {
                    res = documentService.GenerateAndSavePdf(SelectedDeal.Id, saveFileDialog.FileName);

                }
                catch
                {
                    res = false;
                }

                if (!res)
                {
                    MessageBoxText = "Возникла ошибка при сохранении ДКП";
                    IsMessageBoxOpen = true;
                }
                IsDocQuestionDialogOpen = false;
            }
        }
    }
}

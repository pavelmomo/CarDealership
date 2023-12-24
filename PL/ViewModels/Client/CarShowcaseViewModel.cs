using System.Collections.Generic;
using System.Linq;
using Application.DTO;
using Application.Interfaces.Service;
using CarDealership.Util;

namespace CarDealership.ViewModels
{
    internal class CarShowcaseViewModel : BaseViewModel
    {
        
        #region Private property fields

        bool _isDialogOpen = false;
        CarDTO _selectedCar;
        List<CarShortDTO> _carList;
        int _selectedSortingParameterIndex = 0;
        List<ModelDTO> _modelsList = new List<ModelDTO>();
        BrandDTO _selectedBrand = new BrandDTO { Id = 0, Name = "Любая" };
        ModelDTO _selectedModel = new ModelDTO { Id = 0, Name = "Любая" };
        bool _isMessageBoxOpen;
        string _messageBoxText;

        #endregion

        #region Services

        ICarService carService;
        IDealershipService dealershipService;
        IModelService modelService;
        IEnumService enumService;
        

        #endregion

        #region Commands

        public RelayCommand OpenCarInfoDialogCommand { get; private set; }
        public RelayCommand LoadDataCommand { get; private set; }
        public RelayCommand CloseMessageBoxCommand { get; private set; }

        #endregion

        #region Models and brands working
        public List<BrandDTO> BrandsList { get; set; }
        public List<ModelDTO> ModelsList { get => _modelsList; set { _modelsList = value; OnPropertyChanged(); } }
        public ModelDTO SelectedModel
        {
            get => _selectedModel;
            set
            {
                if (value == null) return;
                _selectedModel = value;
                OnPropertyChanged();
                LoadData();
            }
        }
        public BrandDTO SelectedBrand
        {
            get => _selectedBrand;
            set
            {
                _selectedBrand = value;
                if (value.Id == 0)
                {
                    ModelsList = new List<ModelDTO>
                    {
                        new ModelDTO { Id = 0, Name = "Любая" }
                    };
                }
                else
                {
                    List<ModelDTO> buf = modelService.GetModelsByBrand(value.Id).ToList();
                    buf.Insert(0, new ModelDTO { Id = 0, Name = "Любая" });
                    ModelsList = buf;
                }
                SelectedModel = ModelsList[0];
            }
        }

        #endregion

        #region IsOpen Property
        public bool IsMessageBoxOpen { get => _isMessageBoxOpen; set { _isMessageBoxOpen = value; OnPropertyChanged(); } }
        public string MessageBoxText { get => _messageBoxText; set { _messageBoxText = value; OnPropertyChanged(); } }
        public bool IsDialogOpen { get => _isDialogOpen; set { _isDialogOpen = value; OnPropertyChanged(); } }

        #endregion

        List<ConfigurationOptionDTO> configurationOptions;
        public List<string> SortingParameters { get; private set; }
        public List<CarShortDTO> CarList { get => _carList; set { _carList = value; OnPropertyChanged(); } }
        public DealershipDTO DealershipInfo { get; set; }
        public CarDTO SelectedCar { get => _selectedCar; set { _selectedCar = value; OnPropertyChanged(); } }

        public int SelectedSortingParameterIndex
        {
            get => _selectedSortingParameterIndex;
            set { _selectedSortingParameterIndex = value; EnterSortingParams(); }
        }

        public CarShowcaseViewModel(ICarService carService, IDealershipService dealershipService, IModelService modelService,
                                    IEnumService enumService)
        {
            this.carService = carService;
            this.enumService = enumService;
            this.dealershipService = dealershipService;
            OpenCarInfoDialogCommand = new RelayCommand(OpenCarInfoDialog);
            LoadDataCommand = new RelayCommand(LoadData);
            CloseMessageBoxCommand = new RelayCommand((object e) => IsMessageBoxOpen = false);
            this.modelService = modelService;
            LoadStaticData();
            
        }
        void EnterSortingParams()
        {
            switch(SelectedSortingParameterIndex)
            {
                case 0:
                    CarList = CarList.OrderByDescending(e => e.DateOfPublish).ToList();
                    break;
                case 1:
                    CarList = CarList.OrderBy(e => e.DateOfPublish).ToList();
                    break;
                case 2:
                    CarList = CarList.OrderBy(e => e.Price).ToList();
                    break;
                case 3:
                    CarList = CarList.OrderByDescending(e => e.Price).ToList();
                    break;
            }
        }
        void LoadStaticData()
        {
            try
            {
                DealershipInfo = dealershipService.GetDealershipInfo();
                configurationOptions = carService.GetConfigurationOptions();
                BrandsList = modelService.GetAllBrands();
                BrandsList.Insert(0, new BrandDTO { Id = 0, Name = "Любая" });
                SelectedBrand = BrandsList[0];
                SortingParameters = new List<string>
                {
                "Дата ( сначала более новые )", "Дата ( сначала более старые )",
                "Стоимость ( по возрастанию )", "Стоимость ( по убыванию )"
                };
            }
            catch
            {
                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
            }
            
        }

        void LoadData(object e = null)
        {
            try
            {
                CarList = carService.GetAdvertismentsByFilter(SelectedBrand.Id, SelectedModel.Id)
                                    .ToList();
                EnterSortingParams();
            }
            catch
            {
                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
            }
            
        }
        void OpenCarInfoDialog(object e)
        { 
            if ( e == null || !(e is long id) ) { return; }

            try
            {
                CarDTO temp = carService.GetOneCar(id);
                if (string.IsNullOrWhiteSpace(temp.Description)) { temp.Description = "Описание отсутствует"; }
                temp.ConfigurationOptionNames = new List<string>();
                if (temp.ConfigurationOptions.Count == 0) { temp.ConfigurationOptionNames.Add("Опции отсутствуют"); }
                else
                {
                    foreach (int optionId in temp.ConfigurationOptions)
                    {
                        temp.ConfigurationOptionNames.Add("- " + configurationOptions.FirstOrDefault(f => f.Id == optionId).Name);
                    }
                }
                temp.BodyType = enumService.BodyTypes[temp.BodyType];
                temp.EngineType = enumService.EngineTypes[temp.EngineType];
                temp.DriveType = enumService.DriveTypes[temp.DriveType];
                temp.TransmissionType = enumService.TransmissionTypes[temp.TransmissionType];
                SelectedCar = temp;
                IsDialogOpen = true;
            }
            catch
            {

                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
            }
            
        }



    }
}

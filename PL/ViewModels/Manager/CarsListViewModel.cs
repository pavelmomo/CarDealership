using Application.DTO;
using Application.Interfaces.Service;
using CarDealership.Util;
using Microsoft.Win32;
using System.Collections.Generic;
using System.Linq;


namespace CarDealership.ViewModels
{
    internal class CarsListViewModel : BaseViewModel
    {
        #region Services

        IModelService modelService;
        IEnumService enumService;
        ICarService carService;

        #endregion

        #region Private property fields

        bool _isDialogOpen;
        string _messageBoxText;
        bool _isMessageBoxOpen;
        CarDTO _selectedCar;
        List<CarShortDTO> _cars;
        List<ModelDTO> _models = new List<ModelDTO>();
        List<ConfigurationOptionDTO> _configurationOptions;


        #endregion

        #region Commands

        public RelayCommand OpenAddDialogCommand { get; private set; }
        public RelayCommand OpenEditDialogCommand { get; private set; }
        public RelayCommand UpdateModelsCommand { get; private set; }
        public RelayCommand DeleteCommand { get; private set; }
        public RelayCommand SaveCommand { get; private set; }
        public RelayCommand AddPhotoCommand { get; private set; }
        public RelayCommand CloseMessageBoxCommand { get; private set; }


        #endregion

        #region IsOpen Property

        public bool IsMessageBoxOpen { get => _isMessageBoxOpen; set { _isMessageBoxOpen = value; OnPropertyChanged(); } }
        public string MessageBoxText { get => _messageBoxText; set { _messageBoxText = value; OnPropertyChanged(); } }
        public bool IsDialogOpen { get => _isDialogOpen; set { _isDialogOpen = value; OnPropertyChanged(); } }

        #endregion

        #region Fields Lists
        
        public List<BrandDTO> Brands { get; set; }
        public List<string> BodyTypes { get; set; }
        public List<string> TransmissionTypes { get; set; }
        public List<string> DriveTypes { get; set; }
        public List<string> EngineTypes { get; set; }

        #endregion

        bool CurrentDialogAction;
        bool SaveModelFlag;

        public CarDTO SelectedCar { get => _selectedCar; set { _selectedCar = value; OnPropertyChanged(); } }
        public List<ModelDTO> Models { get => _models; set { _models = value; OnPropertyChanged(); } }
        public List<CarShortDTO> Cars 
        {
            get => _cars;
            set
            {
                _cars = value;
                OnPropertyChanged();
            }
        }
        

        public List<ConfigurationOptionDTO> ConfigurationOptions 
        { 
            get => _configurationOptions; 
            set { _configurationOptions = value; OnPropertyChanged(); }

        }

        public CarsListViewModel(IModelService modelService, IEnumService enumService,
               ICarService carService)
        {
            this.modelService = modelService;
            this.enumService = enumService;
            this.carService = carService;
            OpenAddDialogCommand = new RelayCommand(OpenAddDialog);
            OpenEditDialogCommand = new RelayCommand(OpenEditDialog);
            UpdateModelsCommand = new RelayCommand(UpdateModels);
            SaveCommand = new RelayCommand(Save,CheckDialogForm);
            AddPhotoCommand = new RelayCommand(AddPhoto);
            CloseMessageBoxCommand = new RelayCommand((object e) => IsMessageBoxOpen = false);
            DeleteCommand = new RelayCommand(Delete, (object e) => { if (SelectedCar == null)
                                                                        return false;
                                                                     else 
                                                                        return SelectedCar.Id != 0;
                                                                    });
            try
            {
                LoadStaticData();
                LoadData();
            }
            catch
            {
                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
                Brands = new List<BrandDTO>();
                BodyTypes = new List<string>();
                TransmissionTypes = new List<string>();
                EngineTypes = new List<string>();
                DriveTypes = new List<string>();
                ConfigurationOptions = new List<ConfigurationOptionDTO>();
                Cars = new List<CarShortDTO>();
            }
            
            
        }
        private void LoadData()
        { 
            try
            {
                Cars = carService.GetAllCarsOnSale();
            }
            catch
            {
                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
            }
        }
        private void LoadStaticData ()
        {
            Brands = modelService.GetAllBrands();
            BodyTypes = enumService.BodyTypes;
            TransmissionTypes = enumService.TransmissionTypes;
            EngineTypes = enumService.EngineTypes;
            DriveTypes = enumService.DriveTypes;
            ConfigurationOptions = carService.GetConfigurationOptions();
        }
        void UpdateModels(object e = null)
        {
            try
            {
                if ( SelectedCar.BrandId != 0)
                {
                    Models = modelService.GetModelsByBrand(SelectedCar.BrandId);
                    if (!SaveModelFlag) { SelectedCar.ModelId = 0; }
                    else { SaveModelFlag = false; }
                }
                else
                {
                    Models.Clear();
                    SelectedCar.ModelId = 0;
                }
            }
            catch
            {
                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
            }

        }
        private void OpenAddDialog(object e)
        {
            CurrentDialogAction = false;
            SelectedCar = new CarDTO();
            ConfigurationOptions = ConfigurationOptions?.Select(a => { a.IsSelected = false; return a; }).ToList();
            IsDialogOpen = true;
        }
        void OpenEditDialog(object e)
        {
            if (e == null || !(e is long id)) { return; }
            try
            {
                CurrentDialogAction = true;
                SaveModelFlag = true;
                SelectedCar = carService.GetOneCar(id);
                ConfigurationOptions = ConfigurationOptions.Select(a => { a.IsSelected = false; return a; }).ToList();
                foreach (ConfigurationOptionDTO option in ConfigurationOptions)
                {
                    if (SelectedCar.ConfigurationOptions.Contains(option.Id)) { option.IsSelected = true; }
                }
                IsDialogOpen = true;
            }
            catch
            {
                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
            }
            
        }
        void Delete(object e)
        {
            if (SelectedCar == null) { return ; }
            bool res;
            try
            {
                res = carService.SellCar(SelectedCar.Id);
            }
            catch
            {
                res = false;
            }

            if (!res)
            {
                MessageBoxText = "Возникла ошибка при удалении";
                IsMessageBoxOpen = true;
                return;
            }
            LoadData();
        }
        void Save(object e)
        {
            switch(CurrentDialogAction)
            {
                case false:
                    AddCar();
                    break;
                case true:
                    EditCar();
                    break;
            }
        }
        void EditCar ()
        {
            bool res;
            try
            {
                SelectedCar.ConfigurationOptions.Clear();
                foreach (ConfigurationOptionDTO option in ConfigurationOptions)
                {
                    if (option.IsSelected) { SelectedCar.ConfigurationOptions.Add(option.Id); }
                }
                res = carService.UpdateCar(SelectedCar);
            }
            catch
            {
                res = false;
            }

            if (!res)
            {
                MessageBoxText = "Возникла ошибка при сохранении";
                IsMessageBoxOpen = true;
                return;
            }
            LoadData();
        }

        void AddCar()
        {
            
            bool res;
            try
            {
                foreach (ConfigurationOptionDTO option in ConfigurationOptions)
                {
                    if (option.IsSelected) { SelectedCar.ConfigurationOptions.Add(option.Id); }
                }
                res = carService.AddCar(SelectedCar);
            }
            catch
            {
                res = false;
            }

            if (!res)
            {
                MessageBoxText = "Возникла ошибка при добавлении авто";
                IsMessageBoxOpen = true;
                return;
            }
            LoadData();
        }

        void AddPhoto(object e = null)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "jpg files (*.jpg)|*.jpg";
            if (openFileDialog.ShowDialog() == true)
            {
                SelectedCar.ImagePath = openFileDialog.FileName;
            }
        }
        bool CheckDialogForm(object obj)
        {
            if (SelectedCar == null) { return false; }

            if (string.IsNullOrWhiteSpace(SelectedCar.Pts) || string.IsNullOrWhiteSpace(SelectedCar.Sts) || string.IsNullOrWhiteSpace(SelectedCar.RegistrationNumber) || string.IsNullOrWhiteSpace(SelectedCar.EngineNumber) 
                || string.IsNullOrWhiteSpace(SelectedCar.ImagePath) || string.IsNullOrWhiteSpace(SelectedCar.Vin) 
                || string.IsNullOrWhiteSpace(SelectedCar.Color) || SelectedCar.NumberOfOwners <= 0 || SelectedCar.Price <= 0 || SelectedCar.YearOfRelease < 1800 ||
                   SelectedCar.EnginePower <= 0 || SelectedCar.EngineSize <= 0 || SelectedCar.Mileage <= 0 || SelectedCar.BrandId == 0 || SelectedCar.ModelId == 0
                || string.IsNullOrWhiteSpace(SelectedCar.BodyNumber))
            {
                return false;
            }
            return true;
        }


    }
}

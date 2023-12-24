using Application.DTO;
using Application.Interfaces.Service;
using CarDealership.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealership.ViewModels
{
    internal class AccessoryViewModel : BaseViewModel
    {
        IAccessoryService accessoryService;

        #region Commands
        public RelayCommand CloseMessageBoxCommand { get; private set; }
        public RelayCommand OpenAddDialogCommand { get; private set; }
        public RelayCommand OpenEditDialogCommand { get; private set; }
        public RelayCommand AddAccessoryCommand { get; private set; }
        public RelayCommand UpdateAccessoryCommand { get; private set; }
        public RelayCommand DeleteAccessoryCommand { get; private set; }
        #endregion

        #region Private property fields

        List<AccessoryDTO> _accessories;
        private bool _isMessageBoxOpen;
        private string _messageBoxText;
        private AccessoryDTO _selectedAccessory;
        private bool _isAddDialogOpen;
        private bool _isEditDialogOpen;

        #endregion

        #region IsOpen Property

        public bool IsEditDialogOpen { get => _isEditDialogOpen; set { _isEditDialogOpen = value; OnPropertyChanged(); } }
        public bool IsAddDialogOpen { get => _isAddDialogOpen; set { _isAddDialogOpen = value; OnPropertyChanged(); } }
        public bool IsMessageBoxOpen { get => _isMessageBoxOpen; set { _isMessageBoxOpen = value; OnPropertyChanged(); } }
        public string MessageBoxText { get => _messageBoxText; set { _messageBoxText = value; OnPropertyChanged(); } }

        #endregion

        public List<AccessoryDTO> Accessories { get => _accessories; set { _accessories = value; OnPropertyChanged(); } }
        public AccessoryDTO SelectedAccessory { get => _selectedAccessory; set { _selectedAccessory= value; OnPropertyChanged(); } }

        public AccessoryViewModel( IAccessoryService accessoryService)
        {
            this.accessoryService = accessoryService;
            AddAccessoryCommand = new RelayCommand(AddAccessory, CheckForm);
            DeleteAccessoryCommand = new RelayCommand(DeleteAccessory);
            UpdateAccessoryCommand = new RelayCommand(UpdateAccessory, CheckForm);
            CloseMessageBoxCommand = new RelayCommand((object e) => IsMessageBoxOpen = false);
            OpenEditDialogCommand = new RelayCommand(OpenEditDialog);

            OpenAddDialogCommand = new RelayCommand((object e) => { 
                                                                        SelectedAccessory = new AccessoryDTO();
                                                                        IsAddDialogOpen = true; 
                                                                   });

            LoadData();
        }
        private void OpenEditDialog(object e)
        {
            if (e == null || !(e is int id)) { return; }

            AccessoryDTO temp = Accessories.Where(f => f.Id == id).FirstOrDefault();
            if (temp != null)
            {
                SelectedAccessory = (AccessoryDTO)temp.Clone();
                IsEditDialogOpen = true;
            }
            
            
        }

        private void LoadData()
        {
            try
            {
                Accessories = accessoryService.GetAccessories();
            }
            catch 
            {
                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
                Accessories = new List<AccessoryDTO>();
            }
        }
        private bool CheckForm(object e)
        {
            if (SelectedAccessory == null) { return false; }
            if (SelectedAccessory.Count < 0 || SelectedAccessory.Price < 0 || string.IsNullOrWhiteSpace(SelectedAccessory.Name)  ) 
            { return false; }

            return true;
        }
        private void AddAccessory(object e)
        {
            bool res;
            try
            {
                res = accessoryService.AddAccessory(SelectedAccessory);
            }
            catch
            {
                res = false;
            }
            IsAddDialogOpen = false;
            if (!res)
            {
                MessageBoxText = "Возникла ошибка при добавлении";
                IsMessageBoxOpen = true;
                return;
            }
            LoadData();
        }
        private void UpdateAccessory(object e)
        {
            bool res;
            try
            {
                res = accessoryService.UpdateAccessory(SelectedAccessory);
            }
            catch
            {
                res = false;
            }
            IsEditDialogOpen = false;
            if (!res)
            {
                MessageBoxText = "Возникла ошибка при обновлении";
                IsMessageBoxOpen = true;
                return;
            }
            LoadData();
        }
        private void DeleteAccessory(object e)
        {
            bool res;
            try
            {
                res = accessoryService.DeleteAccessory(SelectedAccessory.Id);
            }
            catch
            {
                res = false;
            }
            IsEditDialogOpen = false;
            if (!res)
            {
                MessageBoxText = "Возникла ошибка при удалении";
                IsMessageBoxOpen = true;
                return;
            }
            LoadData();
        }
    }
}

using Application.Interfaces.Service;
using CarDealership.Util;
using LiveCharts;
using LiveCharts.Defaults;
using LiveCharts.Wpf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealership.ViewModels
{
    internal class ReportViewModel : BaseViewModel
    {
        int _selectedPeriodIndex = 0;

        public RelayCommand CloseMessageBoxCommand { get; private set; }

        IDealershipService dealershipService;
        List<int> valuesBuffer;
        private bool _isMessageBoxOpen;
        private string _messageBoxText;

        public bool IsMessageBoxOpen { get => _isMessageBoxOpen; set { _isMessageBoxOpen = value; OnPropertyChanged(); } }
        public string MessageBoxText { get => _messageBoxText; set { _messageBoxText = value; OnPropertyChanged(); } }

        public SeriesCollection SeriesCollection { get; set; }
        public int SelectedPeriodIndex 
        { 
            get => _selectedPeriodIndex;
            set 
            { 
                _selectedPeriodIndex = value; 
                OnPropertyChanged(); 
                UpdateChart();
            } 
        }
        public ReportViewModel(IDealershipService dealershipService)
        {
            CloseMessageBoxCommand = new RelayCommand((object e) => IsMessageBoxOpen = false);
            this.dealershipService = dealershipService;
            valuesBuffer = new List<int>();
            Func<ChartPoint, string> PointLabel = chartPoint => 
                           string.Format("{0:P}", chartPoint.Participation);
                
            SeriesCollection = new SeriesCollection
            {
                new PieSeries
                {
                    Title = "0 - 300 тыс. ₽",
                    Values = new ChartValues<ObservableValue> { new ObservableValue(0) },
                    DataLabels = true,
                    LabelPoint = PointLabel
                },
                new PieSeries
                {
                    Title = "300 тыс. - 1 млн. ₽",
                    Values = new ChartValues<ObservableValue> { new ObservableValue(0) },
                    DataLabels = true,
                    LabelPoint = PointLabel
                },
                new PieSeries
                {
                    Title = "1 млн. - 2 млн. ₽",
                    Values = new ChartValues<ObservableValue> { new ObservableValue(0) },
                    DataLabels = true,
                    LabelPoint = PointLabel
                },
                new PieSeries
                {
                    Title = "более 2 млн. ₽",
                    Values = new ChartValues<ObservableValue> { new ObservableValue(0) },
                    DataLabels = true,
                    LabelPoint = PointLabel
                }
            };

            UpdateChart();
        }
        
        private void UpdateChart()
        {
            try
            {
                valuesBuffer.Clear();
                DateTime limitDate = DateTime.Now;
                switch (SelectedPeriodIndex)
                {
                    case 0:
                        limitDate = limitDate.AddMonths(-3);
                        break;
                    case 1:
                        limitDate = limitDate.AddMonths(-6);
                        break;
                    case 2:
                        limitDate = limitDate.AddYears(-1);
                        break;
                    case 3:
                        limitDate = limitDate.AddYears(-100);
                        break;
                }

                valuesBuffer.Add(dealershipService.GetCarsStatisticByPrice(0, 300000, limitDate));
                valuesBuffer.Add(dealershipService.GetCarsStatisticByPrice(300001, 1000000, limitDate));
                valuesBuffer.Add(dealershipService.GetCarsStatisticByPrice(1000001, 2000000, limitDate));
                valuesBuffer.Add(dealershipService.GetCarsStatisticByPrice(1000001, -1, limitDate));
                var series = SeriesCollection.AsEnumerable().ToArray();

                for (int i = 0; i < series.Length; i++)
                {
                    ((ObservableValue)series[i].Values[0]).Value = valuesBuffer[i];
                }
            }
            catch
            {
                MessageBoxText = "Возникла ошибка при обращении к БД";
                IsMessageBoxOpen = true;
            }


        }
    }

}


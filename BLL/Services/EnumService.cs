using Application.Interfaces.Service;
using System;
using Domain.Enums;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class EnumService : IEnumService
    {
        public List<string> BodyTypes { get; private set; } = new List<string>();
        public List<string> DriveTypes { get; private set; } = new List<string>();
        public List<string> EngineTypes { get; private set; } = new List<string>();
        public List<string> TransmissionTypes { get; private set; } = new List<string>();     
        public EnumService()
        {
            foreach(BodyType type in Enum.GetValues(typeof(BodyType)))
            {
                BodyTypes.Add(type.GetDescription());
            }

            foreach (DriveType type in Enum.GetValues(typeof(DriveType)))
            {
                DriveTypes.Add(type.GetDescription());
            }

            foreach (EngineType type in Enum.GetValues(typeof(EngineType)))
            {
                EngineTypes.Add(type.GetDescription());
            }

            foreach (TransmissionType type in Enum.GetValues(typeof(TransmissionType)))
            {
                TransmissionTypes.Add(type.GetDescription());
            }
        }
    }
}

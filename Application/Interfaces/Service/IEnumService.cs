using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Service
{
    public interface IEnumService
    {
        List<string> BodyTypes { get; }
        List<string> DriveTypes { get; }
        List<string> EngineTypes { get; }
        List<string> TransmissionTypes { get; }
    }
}

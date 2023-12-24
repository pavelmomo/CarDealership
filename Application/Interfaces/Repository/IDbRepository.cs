using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Repository
{
    public interface IDbRepository
    {
        ICarRepository Cars { get; }
        IModelRepository Models { get; }
        IReportRepository Reports  { get; }
        IConfigurationOptionRepository ConfigurationOptions { get; }
        IAccessoryRepository Accessories { get; }
        IDealRepository Deals { get; }
        
        int Save();
    }
}

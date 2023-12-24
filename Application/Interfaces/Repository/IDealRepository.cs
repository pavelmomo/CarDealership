using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Repository
{
    public interface IDealRepository
    {
        bool Create(Deal deal, List<int> accessoryIds = null);
        List<Deal> GetAll();
        bool Delete(long id);
        Deal GetOne(long id);

    }
}

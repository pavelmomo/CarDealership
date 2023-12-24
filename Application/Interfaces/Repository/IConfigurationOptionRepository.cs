﻿using Domain.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Repository
{
    public interface IConfigurationOptionRepository
    {
        List<ConfigurationOption> GetAll();
    }
}

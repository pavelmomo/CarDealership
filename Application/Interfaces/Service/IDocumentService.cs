﻿using Application.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.Service
{
    public interface IDocumentService
    {
        bool GenerateAndSavePdf(long dealId, string savePath);

    }
}

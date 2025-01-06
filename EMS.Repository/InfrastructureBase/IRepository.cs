﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Repository.InfrastructureBase
{
    public interface IRepository<DbModel> where DbModel : class
    {
        void Add(DbModel entity);
    }
}
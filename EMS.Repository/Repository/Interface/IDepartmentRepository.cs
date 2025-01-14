﻿using EMS.Model;
using EMS.Model.EMS;
using EMS.Repository.InfrastructureBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Repository.Repository.Interface
{
    public interface IDepartmentRepository : IRepository<Department>
    {
        IQueryable<DepartmentViewModel> GetAll();
    }
}

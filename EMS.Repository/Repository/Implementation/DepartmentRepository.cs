using EMS.Model;
using EMS.Model.EMS;
using EMS.Repository.InfrastructureBase;
using EMS.Repository.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Repository.Repository.Implementation
{
    public class DepartmentRepository : Repository<Department> , IDepartmentRepository
    {
        public DepartmentRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

       public IQueryable<DepartmentViewModel> GetAll()
        {
            var getDepartment = (from dept in DataContext.Department
                                 join emp in DataContext.Employee on dept.ManagerId equals emp.EmployeeId
                                 select new DepartmentViewModel
                                 {
                                     DepartmentId = dept.DepartmentId,
                                     DepartmentName = dept.DepartmentName,
                                     ManagerName = emp.Name,
                                     ManagerId = dept.ManagerId,
                                     Budget = dept.Budget
                                 }).AsQueryable();
            return getDepartment;
        }
    }
}

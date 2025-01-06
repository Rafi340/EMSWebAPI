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
    public class EmployeeRepository : Repository<Employee> , IEmployeeRepository
    {
        public EmployeeRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

       public PagedResponse<IQueryable<EmployeeViewModel>> GetAll(PagedFilter filter)
        {
            var getEmployee = (from employee in DataContext.Employee
                               join department in DataContext.Department on employee.DepartmentId equals department.DepartmentId
                               where employee.Status == 1
                               select new EmployeeViewModel
                               {
                                   EmployeeId = employee.EmployeeId,
                                   Name = employee.Name,
                                   Phone = employee.Phone,
                                   Email = employee.Email,
                                   DepartmentId = employee.DepartmentId,
                                   DepartmentName = department.DepartmentName,
                                   Position = employee.Position,
                                   JoiningDate = employee.JoiningDate,
                                   Status = employee.Status,
                                   CreatedAt = employee.CreatedAt,
                                   LastUpdatedAt = employee.LastUpdatedAt,
                               }).AsQueryable();
            int total= getEmployee.Count();
            getEmployee = getEmployee.Skip(filter.page > 0 ? (filter.page - 1) * filter.per_page : 0)
                         .Take(filter.per_page > 0 ? filter.per_page : total);

            var totalPages = ((double)total / (double)filter.per_page);
            if (filter.per_page < 0)
            {
                totalPages = ((double)total / (double)total);
            }
            int roundedTotalPages = Convert.ToInt32(Math.Ceiling(totalPages));
            return new PagedResponse<IQueryable<EmployeeViewModel>>(
                getEmployee,
                filter.page,
                filter.per_page,
                total,
                roundedTotalPages,
                null
                );
        }
    }
}

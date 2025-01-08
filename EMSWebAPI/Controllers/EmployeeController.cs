using EMS.Model;
using EMS.Model.EMS;
using EMS.Repository.Repository.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EMSWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeRepository _employeeRepository;
        private readonly ILogger<EmployeeController> _logger;
        public EmployeeController(ILogger<EmployeeController> logger, [FromKeyedServices("Employee")] IEmployeeRepository employeeRepository) 
        {
            _logger = logger;
            _employeeRepository = employeeRepository;
        }
        [HttpPost("Create")]
        public Employee Create(Employee employee) {
            try
            {
                 _employeeRepository.Add(employee);
                return employee;
            }
            catch (Exception ex) {
                throw ex;
            }
        
        }
        [HttpGet("GetAll")]
        public async Task<PagedResponse<IQueryable<EmployeeViewModel>>> GetAll(int page, int per_page)
        {
            try
            {
                PagedFilter filter = new PagedFilter(1,10);
                filter.page = page;
                filter.per_page = per_page;
                var getEmployee = _employeeRepository.GetAll(filter);
                return getEmployee;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [HttpPost("Update")]
        public Employee Update(Employee employee)
        {
            try
            {
                _employeeRepository.Update(employee);
                return employee;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [HttpPost("Delete")]
        public StatusModel Delete(Guid Id)
        {
            try
            {
                var SoftDelete = _employeeRepository.SoftDelete(Id);
                return SoftDelete;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [HttpGet("Dropdown")]
        public List<Employee> Dropdown(int page, int per_page)
        {
            try
            {
                var dropdown = _employeeRepository.Dropdown();
                return dropdown;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}

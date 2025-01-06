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
        public async Task<PagedResponse<IQueryable<EmployeeViewModel>>> GetAll(PagedFilter filter)
        {
            try
            {
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

    }
}

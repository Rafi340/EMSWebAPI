using EMS.Model;
using EMS.Model.EMS;
using EMS.Repository.Repository.Implementation;
using EMS.Repository.Repository.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EMSWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DepartmentController : ControllerBase
    {
        private readonly IDepartmentRepository _departmentRepository;
        private readonly ILogger<DepartmentController> _logger;
        public DepartmentController(ILogger<DepartmentController> logger, [FromKeyedServices("Department")] IDepartmentRepository departmentRepository) 
        {
            _logger = logger;
            _departmentRepository = departmentRepository;
        }
        [HttpPost("Create")]
        public Department Create(Department department) {
            try
            {
                 _departmentRepository.Add(department);
                return department;
            }
            catch (Exception ex) {
                throw ex;
            }
        
        }
        [HttpGet("GetAll")]
        public IQueryable<DepartmentViewModel>? GetAll()
        {
            try
            {
                return _departmentRepository?.GetAll();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [HttpPost("Update")]
        public Department Update(Department employee)
        {
            try
            {
                _departmentRepository.Update(employee);
                return employee;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


    }
}

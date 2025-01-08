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
    public class PerformanceReviewController : ControllerBase
    {
        private readonly IPerformanceReviewRepository _PerformanceReviewRepository;
        private readonly ILogger<PerformanceReviewController> _logger;
        public PerformanceReviewController(ILogger<PerformanceReviewController> logger, [FromKeyedServices("PerformanceReview")] IPerformanceReviewRepository PerformanceReviewRepository) 
        {
            _logger = logger;
            _PerformanceReviewRepository = PerformanceReviewRepository;
        }
        [HttpPost("Create")]
        public PerformanceReview Create(PerformanceReview PerformanceReview) {
            try
            {
                 _PerformanceReviewRepository.Add(PerformanceReview);
                return PerformanceReview;
            }
            catch (Exception ex) {
                throw ex;
            }
        
        }
      
        [HttpPost("Update")]
        public PerformanceReview Update(PerformanceReview entity)
        {
            try
            {
                _PerformanceReviewRepository.Update(entity);
                return entity;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [HttpGet("GetAll")]
        public async Task<PagedResponse<IQueryable<PerformanceReviewViewModel>>> GetAll(int page, int per_page)
        {
            try
            {
                PagedFilter filter = new PagedFilter(page, per_page);
                var getEmployee = _PerformanceReviewRepository.GetAll(filter);
                return getEmployee;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


    }
}

using EMS.Model.EMS;
using EMS.Repository;
using Microsoft.AspNetCore.Mvc;

namespace EMSWebAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;
        private readonly ApplicationDbContext _context;
        public WeatherForecastController(ILogger<WeatherForecastController> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet(Name = "GetWeatherForecast")]
        public IEnumerable<Employee> Get()
        {
            return _context.Employee.ToList();
        }
    }
}

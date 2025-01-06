using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Model.EMS
{
    public class PerformanceReview : EMSBaseModel
    {
        [Key]
        public Guid PerformanceReviewId { get; set; }
        [ForeignKey("Employee")]
        [Required]
        public Guid EmployeeId { get; set; }
        public DateTime ReviewDate { get; set; }
        public int ReviewScore { get; set; }
        public string? ReviewNote { get; set; }
        public Employee Employee { get; set; }
    }
}

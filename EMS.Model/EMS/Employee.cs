using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Model.EMS
{
    public class Employee : EMSBaseModel
    {
        [Key]
        public Guid EmployeeId { get; set; } = Guid.NewGuid();
        [Required]
        public string Name { get; set; }
        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid email address format")]
        public string Email { get; set; }
        [Required]
        public string Phone { get; set; }
        [ForeignKey("Department")]
        [Required]
        public Guid DepartmentId { get; set; }
        [Required]
        public string Position { get; set; }
        [Required]
        public DateTime JoiningDate { get; set; }

        public int? Status { get; set; }

        public Department? Department { get; set; }
        public List<PerformanceReview>? PerformanceReview { get; set; }

    }


    public class EmployeeViewModel : EMSBaseModel
    {
        [Key]
        public Guid EmployeeId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public Guid DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public string Position { get; set; }
        public DateTime JoiningDate { get; set; }

        public int? Status { get; set; }

    }
}

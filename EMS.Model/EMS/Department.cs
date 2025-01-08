using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Model.EMS
{
    public class Department : EMSBaseModel
    {
        [Key]
        public Guid DepartmentId { get; set; } = Guid.NewGuid();
        [Required]
        public string DepartmentName { get; set; }
        [ForeignKey("Manager")]
        public Guid ManagerId { get; set; }
        public decimal Budget {  get; set; }
        public Employee? Manager { get; set; }
        public List<Employee>? Employee { get; set; }
    }

    public class DepartmentViewModel : EMSBaseModel
    {
        [Key]
        public Guid DepartmentId { get; set; }
   
        public string DepartmentName { get; set; }
       
        public Guid ManagerId { get; set; }
        public string ManagerName { get; set; }
        public decimal Budget { get; set; }
    }
}

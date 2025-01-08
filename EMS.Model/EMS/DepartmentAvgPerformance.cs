using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Model.EMS
{
    public class DepartmentAvgPerformance
    {
        public string DepartmentName { get; set; }
        public decimal? AverageScore { get; set; }
        public int? TotalRecords { get; set; }
    }
}

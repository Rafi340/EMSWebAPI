using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Model
{
    public class PagedResponse<ViewModel> 
    {
        public int page { get; set; }
        public int per_page { get; set; }
        public int Total { get; set; }
        public int TotalPages { get; set; }
        public string Message { get; set; }
        public bool? Succees { get; set; }
        public ViewModel Data { get; set; }
        public string Errors { get; set; }

        public PagedResponse(ViewModel data, int page, int per_page, int total, int totalPages, string errors)
        {
            this.page = page;
            this.per_page = per_page;
            this.Data = data;
            this.Total = total;
            this.TotalPages = totalPages;
            this.Message = null;
            this.Succees = true;
            this.Errors = errors;
        }
    }
}

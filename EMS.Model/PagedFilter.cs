using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Model
{
    public class PagedFilter
    {
        public int page { get; set; }
        public int per_page { get; set; }
        public PagedFilter(int page, int per_page)
        {
            this.page = page < 1 ? 1 : page;
            this.per_page = per_page > 10 ? per_page : 10;
        }
    }
}

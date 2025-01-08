using EMS.Model;
using EMS.Model.EMS;
using EMS.Repository.InfrastructureBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Repository.Repository.Interface
{
    public interface IPerformanceReviewRepository : IRepository<PerformanceReview>
    {
        PagedResponse<IQueryable<PerformanceReviewViewModel>> GetAll(PagedFilter filter);
    }
}

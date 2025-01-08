using EMS.Model;
using EMS.Model.EMS;
using EMS.Repository.InfrastructureBase;
using EMS.Repository.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Repository.Repository.Implementation
{
    public class PerformanceReviewRepository : Repository<PerformanceReview>, IPerformanceReviewRepository
    {
        public PerformanceReviewRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
        public PagedResponse<IQueryable<PerformanceReviewViewModel>> GetAll(PagedFilter filter)
        {
            var getReview = (from PR in DataContext.PerformanceReview
                               join emp in DataContext.Employee on PR.EmployeeId equals emp.EmployeeId
                               where emp.Status == 1
                               select new PerformanceReviewViewModel
                               {
                                   PerformanceReviewId = PR.PerformanceReviewId,
                                   EmployeeId = emp.EmployeeId,
                                   Name = emp.Name,
                                   ReviewDate = PR.ReviewDate,
                                   ReviewScore = PR.ReviewScore,
                                   ReviewNote = PR.ReviewNote,
                                   CreatedAt = PR.CreatedAt,
                                   LastUpdatedAt = PR.LastUpdatedAt,
                               }).OrderByDescending(O => O.LastUpdatedAt).AsQueryable();
            int total = getReview.Count();
            getReview = getReview.Skip(filter.page > 0 ? (filter.page - 1) * filter.per_page : 0)
                         .Take(filter.per_page > 0 ? filter.per_page : total);

            var totalPages = ((double)total / (double)filter.per_page);
            if (filter.per_page < 0)
            {
                totalPages = ((double)total / (double)total);
            }
            int roundedTotalPages = Convert.ToInt32(Math.Ceiling(totalPages));
            return new PagedResponse<IQueryable<PerformanceReviewViewModel>>(
                getReview,
                filter.page,
                filter.per_page,
                total,
                roundedTotalPages,
                null
                );
        }
    }
}

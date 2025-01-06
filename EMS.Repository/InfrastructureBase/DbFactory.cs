using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Repository.InfrastructureBase
{
    public class DbFactory : IDbFactory
    {
        private ApplicationDbContext dataContext;

        public DbFactory(ApplicationDbContext dataContext)
        {
            this.dataContext = dataContext;
        }

       

        public ApplicationDbContext Get()
        {
            return dataContext;
        }

    }
}

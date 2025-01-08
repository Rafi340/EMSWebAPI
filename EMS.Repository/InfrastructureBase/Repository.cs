using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS.Repository.InfrastructureBase
{
    public class Repository<DbModel> : IRepository<DbModel> where DbModel : class
    {
        private ApplicationDbContext _dataContext;
        private readonly DbSet<DbModel> _dbset;
        private IDbContextTransaction dbTransaction = null;
        private readonly IDbFactory _dbFactory;
        protected ApplicationDbContext DataContext
        {
            get { return _dataContext ?? (_dataContext = _dbFactory.Get()); }

        }
        public Repository(IDbFactory dbFactory)
        {
            _dbFactory = dbFactory;
            _dbset = DataContext.Set<DbModel>();
        }
        public void BeginTransaction()
        {
            if (dbTransaction == null)
                dbTransaction = DataContext.Database.BeginTransaction(System.Data.IsolationLevel.ReadCommitted);

        }
        public void CommitTransaction()
        {
            if (dbTransaction != null)
            {
                dbTransaction.Commit();
                DataContext.SaveChanges();
                dbTransaction.Dispose();
                dbTransaction = null;
            }
        }
        public void RollbackTransaction()
        {
            if (dbTransaction != null)
            {
                dbTransaction.Rollback();
                dbTransaction.Dispose();
                dbTransaction = null;
            }
        }
        public void EndTransaction()
        {
            if (dbTransaction != null)
            {
                _dataContext.SaveChanges();
                dbTransaction.Dispose();
                dbTransaction = null;
            }
        }

        public virtual void Add(DbModel entity)
        {
            try
            {
                BeginTransaction();
                _dbset.Add(entity);
                CommitTransaction();
            }
            catch (Exception ex)
            {
                RollbackTransaction();
                throw ex;
            }
            finally
            {
                EndTransaction();
            }

        }
        public virtual void Update(DbModel entity)
        {
            try
            {
                BeginTransaction();
                _dbset.Attach(entity);
                _dataContext.Entry(entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                CommitTransaction();
            }
            catch (Exception ex)
            {
                RollbackTransaction();
                throw ex;
            }
            finally
            {
                EndTransaction();
            }
           
        }

        public virtual void Delete(DbModel entity)
        {
            try
            {
                BeginTransaction();
                _dbset.Remove(entity);
                CommitTransaction();
            }
            catch (Exception ex)
            {
                RollbackTransaction();
                throw ex;
            }
            finally
            {
                EndTransaction();
            }
        }
        
        public virtual IEnumerable<DbModel> GetAll()
        {
            return _dbset;
        }
        public DataTable GetDataTable(string sql)
        {
            DataTable dataTable = new DataTable();

            using (var connection = DataContext.Database.GetDbConnection() as SqlConnection)
            {
                if (connection != null)
                {
                    connection.Open();

                    using (var command = new SqlCommand(sql, connection))
                    {
                        using (var reader = command.ExecuteReader())
                        {
                            dataTable.Load(reader);
                        }
                    }
                }
            }

            return dataTable;
        }

        public DbModel? GetById(Guid Id)
        {
            return _dbset?.Find(Id);
        }
    }
}

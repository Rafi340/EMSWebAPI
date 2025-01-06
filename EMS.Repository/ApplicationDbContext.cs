using EMS.Model.EMS;
using Microsoft.EntityFrameworkCore;

namespace EMS.Repository
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) 
        {

        }
        public DbSet<Employee> Employee { get; set; }
        public DbSet<Department> Department { get; set; }
        public DbSet<PerformanceReview> PerformanceReview { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Employee>()
           .HasOne(e => e.Department)
           .WithMany(d => d.Employee)
           .HasForeignKey(e => e.DepartmentId)
           .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Department>()
            .HasOne(d => d.Manager)
            .WithMany()
            .HasForeignKey(d => d.ManagerId)
            .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<PerformanceReview>()
            .HasOne(pr => pr.Employee)
            .WithMany(e => e.PerformanceReview)
            .HasForeignKey(pr => pr.EmployeeId)
            .OnDelete(DeleteBehavior.Cascade);
            base.OnModelCreating(modelBuilder);
        }
    }
}

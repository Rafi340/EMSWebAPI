using EMS.Repository;
using EMS.Repository.InfrastructureBase;
using EMS.Repository.Repository.Implementation;
using EMS.Repository.Repository.Interface;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi;
using System;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"))
);
// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi


builder.Services.AddOpenApi();
builder.Services.AddOpenApi(options =>
{
    options.OpenApiVersion = OpenApiSpecVersion.OpenApi2_0;
});

builder.Services.AddScoped<IDbFactory, DbFactory>();
builder.Services.AddKeyedScoped<IEmployeeRepository, EmployeeRepository>("Employee");
builder.Services.AddKeyedScoped<IDepartmentRepository, DepartmentRepository>("Department");
builder.Services.AddScoped<IPerformanceReviewRepository, PerformanceReviewRepository>();

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowSpecificOrigins", policy =>
    {
        policy.WithOrigins("http://localhost:3000", "https://localhost:3000")
              .AllowAnyHeader()
              .AllowAnyMethod();
    });

    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});
var app = builder.Build();

// Configure the HTTP request pipeline.
app.UseCors("AllowAll");
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

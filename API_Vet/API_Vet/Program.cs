using APIControllersData.Data;
using APIControllersData.Models;
using APIControllersData.Repositories;
using APIControllersData.Validations;
using FluentValidation;

var builder = WebApplication.CreateBuilder(args);

//INYECCION DE DEPENDENCIAS CONEXION A LA BASE DE DATOS
builder.Services.AddSingleton<IDbDataAccess, DbDataAccess>();


//INYECCION DE DEPENDENCIAS REPOSITORIOS
builder.Services.AddScoped<ITipoAnalisisRepository, TipoAnalisisRepository>();
builder.Services.AddScoped<IParametroAnalisisRepository, ParametroAnalisisRepository>();
builder.Services.AddScoped<IParametroExamenRepository, ParametroExamenRepository>();
builder.Services.AddScoped<IExamenClinicoRepository, ExamenClinicoRepository>();
builder.Services.AddScoped<IVeterinario_Repository, Veterinario_Repository>();
builder.Services.AddScoped<IAnimal_Repository, Animal_Repository>();
builder.Services.AddScoped<IAnomalia_Repository, Anomalia_Repository>();
builder.Services.AddScoped<IAnomaliasExamen_Repository, AnomaliasExamen_Repository>();

//INYECCION DE DEPENDENCIAS PARA LAS VALIDACIONES
builder.Services.AddScoped<IValidator<Model_TipoAnalisis>, TipoAnalisisValidator>();
builder.Services.AddScoped<IValidator<Model_ParametroAnalisis>, ParametroAnalisisValidator>();
builder.Services.AddScoped<IValidator<Model_ParametroExamen>, ParametroExamenValidator>();
builder.Services.AddScoped<IValidator<Model_ExamenClinico>, ExamenClinicoValidator>();
builder.Services.AddScoped<IValidator<Model_Veterinario>, VeterinarioValidator>();
builder.Services.AddScoped<IValidator<Model_Animal>,  AnimalValidator>();
builder.Services.AddScoped<IValidator<Model_Anomalia>, AnomaliaValidator>();
builder.Services.AddScoped<IValidator<Model_AnomaliasExamen>, AnomaliasExamenValidator>();


//Inyeccion de dependencias
builder.Services.AddSingleton<IDbDataAccess, DbDataAccess>();

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

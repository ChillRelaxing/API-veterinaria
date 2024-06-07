using APIControllersData.Data;
using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public class ExamenClinicoRepository : IExamenClinicoRepository
    {
        private readonly IDbDataAccess _dataAccess;

        public ExamenClinicoRepository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Model_ExamenClinico>> GetExamenClinicoAsync()
        {
            return await _dataAccess.GetDataAsync<Model_ExamenClinico, dynamic>(
                "dbo.spExamenClinico_GetAll",
                new { }
                );
        }

        public async Task<Model_ExamenClinico?> GetExamenClinicoByIdAsync(int id)
        {
            var model_ExamenClinico = await _dataAccess.GetDataAsync<Model_ExamenClinico, dynamic>(
                "dbo.spExamenClinico_GetById",
                new { Id_Examen = id }
                );

            return model_ExamenClinico.FirstOrDefault();
        }

        public async Task AddExamenClinicoAsync(Model_ExamenClinico model_ExamenClinico)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spExamenClinico_Insert",
                new { model_ExamenClinico.TipoAnalisis, model_ExamenClinico.Resultados, model_ExamenClinico.Id_Animal, model_ExamenClinico.Id_Veterinario }
                );
        }

        public async Task EditExamenClinicoAsync(Model_ExamenClinico model_ExamenClinico)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spExamenClinico_Update",
            new { model_ExamenClinico.Id_Examen, model_ExamenClinico.TipoAnalisis, model_ExamenClinico.Resultados, model_ExamenClinico.Id_Animal, model_ExamenClinico.Id_Veterinario }
            );
        }
        public async Task DeleteExamenClinicoAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
            "dbo.spExamenClinico_Delete",
            new { Id_Examen = id }
                );
        }
    }
}

using APIControllersData.Data;
using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public class TipoAnalisisRepository : ITipoAnalisisRepository
    {
        private readonly IDbDataAccess _dataAccess;

        public TipoAnalisisRepository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Model_TipoAnalisis>> GetTipoAnalisisAsync()
        {
            return await _dataAccess.GetDataAsync<Model_TipoAnalisis, dynamic>(
                "dbo.spTipoAnalisis_GetAll",
                new { }
                );
        }

        public async Task<Model_TipoAnalisis?> GetTipoAnalisisByIdAsync(int id)
        {
            var model_TipoAnalisis = await _dataAccess.GetDataAsync<Model_TipoAnalisis, dynamic>(
                "dbo.spTipoAnalisis_GetById",
                new { Id_TipoAnalisis = id }
                );

            return model_TipoAnalisis.FirstOrDefault();
        }

        public async Task AddTipoAnalisisAsync(Model_TipoAnalisis model_TipoAnalisis)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spTipoAnalisis_Insert",
                new { model_TipoAnalisis.Nombre, model_TipoAnalisis.Descripcion }
                );
        }

        public async Task EditTipoAnalisisAsync(Model_TipoAnalisis model_TipoAnalisis)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spTipoAnalisis_Update",
                model_TipoAnalisis
                );
        }

        public async Task DeleteTipoAnalisisAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spTipoAnalisis_Delete",
                new { Id_TipoAnalisis = id }
                );
        }
    }
}


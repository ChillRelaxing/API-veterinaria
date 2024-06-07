using APIControllersData.Data;
using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public class ParametroAnalisisRepository : IParametroAnalisisRepository
    {
        private readonly IDbDataAccess _dataAccess;

        public ParametroAnalisisRepository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Model_ParametroAnalisis>> GetParametroAnalisisAsync()
        {
            return await _dataAccess.GetDataAsync<Model_ParametroAnalisis, dynamic>(
                "dbo.spParametroAnalisis_GetAll",
                new { }
                );
        }

        public async Task<Model_ParametroAnalisis?> GetParametroAnalisisByIdAsync(int id)
        {
            var model_ParametroAnalisis = await _dataAccess.GetDataAsync<Model_ParametroAnalisis, dynamic>(
                "dbo.spParametroAnalisis_GetById",
                new { Id_ParametroAnalisis = id }
                );

            return model_ParametroAnalisis.FirstOrDefault();
        }

        public async Task AddParametroAnalisisAsync(Model_ParametroAnalisis model_ParametroAnalisis)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spParametroAnalisis_Insert",
                new { model_ParametroAnalisis.Nombre, model_ParametroAnalisis.ValorReferencia, model_ParametroAnalisis.Id_TipoAnalisis }
                );
        }

        public async Task EditParametroAnalisisAsync(Model_ParametroAnalisis model_ParametroAnalisis)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spParametroAnalisis_Update",
            new { model_ParametroAnalisis.Id_ParametroAnalisis, model_ParametroAnalisis.Nombre, model_ParametroAnalisis.ValorReferencia, model_ParametroAnalisis.Id_TipoAnalisis }
            );
        }
        public async Task DeleteParametroAnalisisAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
            "dbo.spParametroAnalisis_Delete",
            new { Id_ParametroAnalisis = id }
                );
        }
    }
}

using APIControllersData.Data;
using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public class ParametroExamenRepository : IParametroExamenRepository
    {
        private readonly IDbDataAccess _dataAccess;

        public ParametroExamenRepository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Model_ParametroExamen>> GetParametroExamenAsync()
        {
            return await _dataAccess.GetDataAsync<Model_ParametroExamen, dynamic>(
                "dbo.spParametroExamen_GetAll",
                new { }
                );
        }

        public async Task<Model_ParametroExamen?> GetParametroExamenByIdAsync(int id)
        {
            var model_ParametroExamen = await _dataAccess.GetDataAsync<Model_ParametroExamen, dynamic>(
                "dbo.spParametroExamen_GetById",
                new { Id_ParametroExamen = id }
                );

            return model_ParametroExamen.FirstOrDefault();
        }

        public async Task AddParametroExamenAsync(Model_ParametroExamen model_ParametroExamen)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spParametroExamen_Insert",
                new { model_ParametroExamen.Valor, model_ParametroExamen.Id_Examen, model_ParametroExamen.Id_ParametroAnalisis }
                );
        }

        public async Task EditParametroExamenAsync(Model_ParametroExamen model_ParametroExamen)
        {
            await _dataAccess.SaveDataAsync(
                "dbo.spParametroExamen_Update",
            new { model_ParametroExamen.Id_ParametroExamen, model_ParametroExamen.Valor, model_ParametroExamen.Id_Examen, model_ParametroExamen.Id_ParametroAnalisis }
            );
        }
        public async Task DeleteParametroExamenAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
            "dbo.spParametroExamen_Delete",
            new { Id_ParametroExamen = id }
                );
        }
    }
}

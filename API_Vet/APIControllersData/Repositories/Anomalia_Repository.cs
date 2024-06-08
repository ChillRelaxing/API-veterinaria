using APIControllersData.Data;
using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public class Anomalia_Repository : IAnomalia_Repository
    {
        private readonly IDbDataAccess _dataAccess;

        public Anomalia_Repository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Model_Anomalia>> GetAnomaliaAsync()
        {
            return await _dataAccess.GetDataAsync<Model_Anomalia, dynamic>(
                "spAnomalia_GetAll",
                new { }
                );
        }

        public async Task<Model_Anomalia?> GetAnomaliaByIdAsync(int id)
        {
            var anomalia = await _dataAccess.GetDataAsync<Model_Anomalia, dynamic>(
                "spAnomalia_GetById",
                new { Id_Anomalia = id }
                );

            return anomalia.FirstOrDefault();
        }

        public async Task AddAnomaliaAsync(Model_Anomalia m_Anomalia)
        {
            await _dataAccess.SaveDataAsync(
                "spAnomalia_Insert",
                new { m_Anomalia.Nombre, m_Anomalia.Descripcion }
                );
        }

        public async Task EditAnomaliaAsync(Model_Anomalia m_Anomalia)
        {
            await _dataAccess.SaveDataAsync(
                "spAnomalia_Update",
                new { m_Anomalia.Id_Anomalia ,m_Anomalia.Nombre, m_Anomalia.Descripcion }
                );
        }

        public async Task DeleteAnomaliaAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "spAnomalia_Delete",
                new { Id_Anomalia = id }
                );

        }

    }
}

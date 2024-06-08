using APIControllersData.Data;
using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public class AnomaliasExamen_Repository : IAnomaliasExamen_Repository
    {
        private readonly IDbDataAccess _dataAccess;

        public AnomaliasExamen_Repository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Model_AnomaliasExamen>> GetAnomaliasExamenAsync()
        {
            return await _dataAccess.GetDataAsync<Model_AnomaliasExamen, dynamic>(
                "spAnomaliasExamen_GetAll",
                new { }
                );
        }

        public async Task<Model_AnomaliasExamen?> GetAnomaliasExamenByIdAsync(int id)
        {
            var anomaliasExamen = await _dataAccess.GetDataAsync<Model_AnomaliasExamen, dynamic>(
                "spAnomaliasExamen_GetById",
                new { Id_AnomaliaExamen = id }
                );

            return anomaliasExamen.FirstOrDefault();
        }

        public async Task AddAnomaliasExamenAsync(Model_AnomaliasExamen m_AnomaliasExamen)
        {
            await _dataAccess.SaveDataAsync(
                "spAnomaliasExamen_Insert",
                new { m_AnomaliasExamen.Id_Anomalia, m_AnomaliasExamen.Id_Examen}
                );

        }

        public async Task EditAnomaliasExamenAsync(Model_AnomaliasExamen m_AnomaliasExamen)
        {
            await _dataAccess.SaveDataAsync(
                "spAnomaliasExamen_Update",
                new { m_AnomaliasExamen.Id_AnomaliaExamen ,m_AnomaliasExamen.Id_Anomalia, m_AnomaliasExamen.Id_Examen }
                );
        }

        public async Task DeleteAnomaliasExamenAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "spAnomaliasExamen_Delete",
                new { Id_AnomaliaExamen = id }
                );
        }
    }
}

using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public interface IAnomalia_Repository
    {
        Task<IEnumerable<Model_Anomalia>> GetAnomaliaAsync();

        Task<Model_Anomalia?> GetAnomaliaByIdAsync(int id);
        Task AddAnomaliaAsync(Model_Anomalia m_Anomalia);

        Task DeleteAnomaliaAsync(int id);

        Task EditAnomaliaAsync(Model_Anomalia m_Anomalia);

    }
}

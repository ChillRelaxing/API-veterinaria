using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public interface IAnomaliasExamen_Repository
    {
        Task AddAnomaliasExamenAsync(Model_AnomaliasExamen m_AnomaliasExamen);

        Task DeleteAnomaliasExamenAsync(int id);

        Task EditAnomaliasExamenAsync(Model_AnomaliasExamen m_AnomaliasExamen);

        Task<IEnumerable<Model_AnomaliasExamen>> GetAnomaliasExamenAsync();

        Task<Model_AnomaliasExamen?> GetAnomaliasExamenByIdAsync(int id);
    }
}

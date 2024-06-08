using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public interface IVeterinario_Repository
    {
        Task AddVeterinarioAsync(Model_Veterinario m_veterinario);

        Task DeleteVeterinarioAsync(int id);

        Task EditVeterinarioAsync(Model_Veterinario m_veterinario);

        Task<IEnumerable<Model_Veterinario>> GetVeterinarioAsync();

        Task<Model_Veterinario?> GetVeterinarioByIdAsync(int id);
    }
}

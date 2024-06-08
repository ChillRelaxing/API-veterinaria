using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public interface IAnimal_Repository
    {
        Task<IEnumerable<Model_Animal>> GetAnimalAsync();
        Task<Model_Animal?> GetAnimalByIdAsync(int id);
        Task AddAnimalAsync(Model_Animal m_Animal);
        Task EditAnimalAsync(Model_Animal m_Animal);
        Task DeleteAnimalAsync(int id);

    }
}

using APIControllersData.Models;

namespace APIControllersData.Repositories
{
    public interface IExamenClinicoRepository
    {
        Task AddExamenClinicoAsync(Model_ExamenClinico model_ExamenClinico);

        Task DeleteExamenClinicoAsync(int id);

        Task EditExamenClinicoAsync(Model_ExamenClinico model_ExamenClinico);

        Task<IEnumerable<Model_ExamenClinico>> GetExamenClinicoAsync();

        Task<Model_ExamenClinico?> GetExamenClinicoByIdAsync(int id);
    }
}
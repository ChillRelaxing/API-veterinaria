using APIControllersData.Models;

namespace APIControllersData.Repositories
{
    public interface ITipoAnalisisRepository
    {
        Task AddTipoAnalisisAsync(Model_TipoAnalisis model_TipoAnalisis);

        Task DeleteTipoAnalisisAsync(int id);

        Task EditTipoAnalisisAsync(Model_TipoAnalisis model_TipoAnalisis);

        Task<IEnumerable<Model_TipoAnalisis>> GetTipoAnalisisAsync();

        Task<Model_TipoAnalisis?> GetTipoAnalisisByIdAsync(int id);

    }
}
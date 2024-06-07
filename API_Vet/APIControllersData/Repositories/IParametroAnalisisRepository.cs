using APIControllersData.Models;

namespace APIControllersData.Repositories
{
    public interface IParametroAnalisisRepository
    {
        Task AddParametroAnalisisAsync(Model_ParametroAnalisis model_ParametroAnalisis);

        Task DeleteParametroAnalisisAsync(int id);

        Task EditParametroAnalisisAsync(Model_ParametroAnalisis model_ParametroAnalisis);

        Task<IEnumerable<Model_ParametroAnalisis>> GetParametroAnalisisAsync();

        Task<Model_ParametroAnalisis?> GetParametroAnalisisByIdAsync(int id);
    }
}
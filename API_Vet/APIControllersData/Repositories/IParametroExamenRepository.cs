using APIControllersData.Models;

namespace APIControllersData.Repositories
{
    public interface IParametroExamenRepository
    {
        Task AddParametroExamenAsync(Model_ParametroExamen model_ParametroExamen);

        Task DeleteParametroExamenAsync(int id);

        Task EditParametroExamenAsync(Model_ParametroExamen model_ParametroExamen);

        Task<IEnumerable<Model_ParametroExamen>> GetParametroExamenAsync();

        Task<Model_ParametroExamen?> GetParametroExamenByIdAsync(int id);
    }
}
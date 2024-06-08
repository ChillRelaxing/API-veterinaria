using APIControllersData.Data;
using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public class Veterinario_Repository : IVeterinario_Repository
    {
        private readonly IDbDataAccess _dataAccess;

        public Veterinario_Repository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }
        public async Task<IEnumerable<Model_Veterinario>> GetVeterinarioAsync()
        {
            return await _dataAccess.GetDataAsync<Model_Veterinario, dynamic>(
                "spVeterinario_GetAll",
                new { }
                );
        }

        public async Task<Model_Veterinario?> GetVeterinarioByIdAsync(int id)
        {
            var veterinario = await _dataAccess.GetDataAsync<Model_Veterinario, dynamic>(
                "spVeterinario_GetById",
                new { Id_Veterinario = id }
                );

            return veterinario.FirstOrDefault();
        }

        public async Task AddVeterinarioAsync(Model_Veterinario m_veterinario)
        {
            await _dataAccess.SaveDataAsync(
                "spVeterinario_Insert",
                new { m_veterinario.Nombre, m_veterinario.Apellido, m_veterinario.Especialidad }
                );
        }
        public async Task EditVeterinarioAsync(Model_Veterinario m_veterinario)
        {
            await _dataAccess.SaveDataAsync(
                "spVeterinario_Update",
                new { m_veterinario.Id_Veterinario ,m_veterinario.Nombre, m_veterinario.Apellido, m_veterinario.Especialidad }
                );
        }

        public async Task DeleteVeterinarioAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "spVeterinario_Delete",
                new { Id_Veterinario = id }
                );
        }


    }
}

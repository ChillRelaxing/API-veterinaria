using APIControllersData.Data;
using APIControllersData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Repositories
{
    public class Animal_Repository : IAnimal_Repository
    {
        private readonly IDbDataAccess _dataAccess;

        public Animal_Repository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<Model_Animal>> GetAnimalAsync()
        {
            return await _dataAccess.GetDataAsync<Model_Animal, dynamic>(
                "spAnimal_GetAll",
                new { }
                );
        }

        public async Task<Model_Animal?> GetAnimalByIdAsync(int id)
        {
            var animal = await _dataAccess.GetDataAsync<Model_Animal, dynamic>(
                "spAnimal_GetById",
                new { Id_Animal = id }
                );

            return animal.FirstOrDefault();
        }

        public async Task AddAnimalAsync(Model_Animal m_Animal)
        {
            await _dataAccess.SaveDataAsync(
                "spAnimal_Insert",
                new { m_Animal.Especie, m_Animal.Edad, m_Animal.Genero }
                );
        }

        public async Task EditAnimalAsync(Model_Animal m_Animal)
        {
            await _dataAccess.SaveDataAsync(
                "spAnimal_Update",
                new { m_Animal.Id_Animal ,m_Animal.Especie, m_Animal.Edad, m_Animal.Genero }
                );
        }
        public async Task DeleteAnimalAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "spAnimal_Delete",
                new { Id_Animal = id }
                );
        }

    }
}

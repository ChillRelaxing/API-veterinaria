using APIControllersData.Models;
using APIControllersData.Repositories;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;

namespace API_Vet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AnimalController : ControllerBase
    {
        private readonly IAnimal_Repository _animal_repository;
        private readonly IValidator<Model_Animal> _validator;

        public AnimalController(IAnimal_Repository animal_repository, IValidator<Model_Animal> validator)
        {
            _animal_repository = animal_repository;
            _validator = validator;
        }

        // GET: api/<AnimalController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var animal = await _animal_repository.GetAnimalAsync();

            return Ok(animal);
        }

        // GET api/<AnimalController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var animal_ById = await _animal_repository.GetAnimalByIdAsync(id); 

                if (animal_ById == null)
                    return NotFound(); // Devolver 404 Not Found si el usuario no existe

                return Ok(animal_ById); // Devolver el usuario si se encuentra
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Se produjo un error al obtener el usuario: {ex.Message}");
            }
        }
        // POST api/<AnimalController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Model_Animal m_Animal)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(m_Animal);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _animal_repository.AddAnimalAsync(m_Animal);

            return Created();
        }

        // PUT api/<AnimalController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Model_Animal m_Animal)
        {
            var AnimalEditable = await _animal_repository.GetAnimalByIdAsync(id); 

            if (AnimalEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(m_Animal);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _animal_repository.EditAnimalAsync(m_Animal);

            return Accepted();
        }

        // DELETE api/<AnimalController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            // Obtener el usuario por ID
            var animal = await _animal_repository.GetAnimalByIdAsync(id);

            // Verificar si el usuario existe
            if (animal == null)
                return NotFound(); // Devolver 404 Not Found si el usuario no existe

            try
            {
                // Eliminar el usuario
                await _animal_repository.DeleteAnimalAsync(id);

                // Devolver respuesta 204 No Content si la eliminación fue exitosa
                return NoContent();
            }
            catch (Exception ex)
            {
                // Manejar cualquier excepción y devolver un error 500 Internal Server Error
                return StatusCode(500, $"Se produjo un error al eliminar el usuario: {ex.Message}");
            }

        }
    }
}

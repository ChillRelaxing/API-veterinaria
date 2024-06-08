using APIControllersData.Models;
using APIControllersData.Repositories;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Vet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VeterinarioController : ControllerBase
    {
        private readonly IVeterinario_Repository _veterinario_Repository;
        private readonly IValidator<Model_Veterinario> _validator;

        public VeterinarioController(IVeterinario_Repository veterinario_Repository, IValidator<Model_Veterinario> validator)
        {
            _veterinario_Repository = veterinario_Repository;
            _validator = validator;
        }

        // GET: api/<VeterinarioController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var veterinario = await _veterinario_Repository.GetVeterinarioAsync();

            return Ok(veterinario);
        }

        // GET api/<VeterinarioController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var veterinario_ById = await _veterinario_Repository.GetVeterinarioByIdAsync(id);

                if (veterinario_ById == null)
                    return NotFound(); // Devolver 404 Not Found si el usuario no existe

                return Ok(veterinario_ById); // Devolver el usuario si se encuentra
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Se produjo un error al obtener el usuario: {ex.Message}");
            }
        }

        // POST api/<VeterinarioController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Model_Veterinario m_Veterinario)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(m_Veterinario);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _veterinario_Repository.AddVeterinarioAsync(m_Veterinario);

            return Created();
        }

        // PUT api/<VeterinarioController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Model_Veterinario m_Veterinario)
        {
            var veterinarioEditable = await _veterinario_Repository.GetVeterinarioByIdAsync(id);

            if (veterinarioEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(m_Veterinario);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _veterinario_Repository.EditVeterinarioAsync(m_Veterinario);

            return Accepted();
        }

        // DELETE api/<VeterinarioController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            // Obtener el usuario por ID
            var veterinario = await _veterinario_Repository.GetVeterinarioByIdAsync(id);

            // Verificar si el usuario existe
            if (veterinario == null)
                return NotFound(); // Devolver 404 Not Found si el usuario no existe

            try
            {
                // Eliminar el usuario
                await _veterinario_Repository.DeleteVeterinarioAsync(id);

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

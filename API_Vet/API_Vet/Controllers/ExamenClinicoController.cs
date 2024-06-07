using APIControllersData.Models;
using APIControllersData.Repositories;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;

namespace API_Vet.Controllers
{
    [Route("api/ExamenClinico")]
    [ApiController]
    public class ExamenClinicoController : ControllerBase
    {
        private readonly IExamenClinicoRepository _examenClinicoRepository;
        private readonly IValidator<Model_ExamenClinico> _validator;

        public ExamenClinicoController(

            IExamenClinicoRepository examenClinicoRepository,
            IValidator<Model_ExamenClinico> validator
            )
        {
            _examenClinicoRepository = examenClinicoRepository;
            _validator = validator;
        }

        // GET: api/<UsuarioController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var model_ExamenClinico = await _examenClinicoRepository.GetExamenClinicoAsync();

            return Ok(model_ExamenClinico);
        }

        // GET api/<UsuarioController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var model_ExamenClinico = await _examenClinicoRepository.GetExamenClinicoByIdAsync(id);
                if (model_ExamenClinico == null)
                    return NotFound(); // Devolver 404 Not Found si el usuario no existe
                return Ok(model_ExamenClinico); // Devolver el usuario si se encuentra
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Se produjo un error al obtener el usuario: {ex.Message}");
            }
        }

        // POST api/<UsuarioController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Model_ExamenClinico model_ExamenClinico)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(model_ExamenClinico);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _examenClinicoRepository.AddExamenClinicoAsync(model_ExamenClinico);

            return Created();
        }

        // PUT api/<UsuarioController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Model_ExamenClinico model_ExamenClinico)
        {
            var ExamenClinicoEditable = await _examenClinicoRepository.GetExamenClinicoByIdAsync(id);

            if (ExamenClinicoEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(model_ExamenClinico);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _examenClinicoRepository.EditExamenClinicoAsync(model_ExamenClinico);

            return Accepted();
        }

        // DELETE api/<UsuarioController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            // Obtener el usuario por ID
            var model_ExamenClinico = await _examenClinicoRepository.GetExamenClinicoByIdAsync(id);

            // Verificar si el usuario existe
            if (model_ExamenClinico == null)
                return NotFound(); // Devolver 404 Not Found si el usuario no existe

            try
            {
                // Eliminar el usuario
                await _examenClinicoRepository.DeleteExamenClinicoAsync(id);

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

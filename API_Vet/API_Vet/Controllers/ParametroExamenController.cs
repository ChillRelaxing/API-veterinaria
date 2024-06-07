using APIControllersData.Models;
using APIControllersData.Repositories;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;

namespace API_Vet.Controllers
{
    [Route("api/ParametroExamen")]
    [ApiController]
    public class ParametroExamenController : ControllerBase
    {
        private readonly IParametroExamenRepository _parametroExamenRepository;
        private readonly IValidator<Model_ParametroExamen> _validator;

        public ParametroExamenController(

            IParametroExamenRepository parametroExamenRepository,
            IValidator<Model_ParametroExamen> validator
            )
        {
            _parametroExamenRepository = parametroExamenRepository;
            _validator = validator;
        }

        // GET: api/<UsuarioController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var model_ParametroExamen = await _parametroExamenRepository.GetParametroExamenAsync();

            return Ok(model_ParametroExamen);
        }

        // GET api/<UsuarioController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var model_ParametroExamen = await _parametroExamenRepository.GetParametroExamenByIdAsync(id);
                if (model_ParametroExamen == null)
                    return NotFound(); // Devolver 404 Not Found si el usuario no existe
                return Ok(model_ParametroExamen); // Devolver el usuario si se encuentra
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Se produjo un error al obtener el usuario: {ex.Message}");
            }
        }

        // POST api/<UsuarioController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Model_ParametroExamen model_ParametroExamen)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(model_ParametroExamen);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _parametroExamenRepository.AddParametroExamenAsync(model_ParametroExamen);

            return Created();
        }

        // PUT api/<UsuarioController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Model_ParametroExamen model_ParametroExamen)
        {
            var ParametroExamenEditable = await _parametroExamenRepository.GetParametroExamenByIdAsync(id);

            if (ParametroExamenEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(model_ParametroExamen);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _parametroExamenRepository.EditParametroExamenAsync(model_ParametroExamen);

            return Accepted();
        }

        // DELETE api/<UsuarioController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            // Obtener el usuario por ID
            var model_ParametroExamen = await _parametroExamenRepository.GetParametroExamenByIdAsync(id);

            // Verificar si el usuario existe
            if (model_ParametroExamen == null)
                return NotFound(); // Devolver 404 Not Found si el usuario no existe

            try
            {
                // Eliminar el usuario
                await _parametroExamenRepository.DeleteParametroExamenAsync(id);

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

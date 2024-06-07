using APIControllersData.Models;
using APIControllersData.Repositories;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;


namespace API_Vet.Controllers
{
    [Route("api/ParametroAnalisis")]
    [ApiController]
    public class ParametroAnalisisController : ControllerBase
    {
        private readonly IParametroAnalisisRepository _parametroAnalisisRepository;
        private readonly IValidator<Model_ParametroAnalisis> _validator;

        public ParametroAnalisisController(

            IParametroAnalisisRepository parametroAnalisisRepository,
            IValidator<Model_ParametroAnalisis> validator
            )
        {
            _parametroAnalisisRepository = parametroAnalisisRepository;
            _validator = validator;
        }

        // GET: api/<UsuarioController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var model_ParametroAnalisis = await _parametroAnalisisRepository.GetParametroAnalisisAsync();

            return Ok(model_ParametroAnalisis);
        }

        // GET api/<UsuarioController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var model_ParametroAnalisis = await _parametroAnalisisRepository.GetParametroAnalisisByIdAsync(id);
                if (model_ParametroAnalisis == null)
                    return NotFound(); // Devolver 404 Not Found si el usuario no existe
                return Ok(model_ParametroAnalisis); // Devolver el usuario si se encuentra
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Se produjo un error al obtener el usuario: {ex.Message}");
            }
        }

        // POST api/<UsuarioController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Model_ParametroAnalisis model_ParametroAnalisis)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(model_ParametroAnalisis);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _parametroAnalisisRepository.AddParametroAnalisisAsync(model_ParametroAnalisis);

            return Created();
        }

        // PUT api/<UsuarioController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Model_ParametroAnalisis model_ParametroAnalisis)
        {
            var ParametroAnalisisEditable = await _parametroAnalisisRepository.GetParametroAnalisisByIdAsync(id);

            if (ParametroAnalisisEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(model_ParametroAnalisis);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _parametroAnalisisRepository.EditParametroAnalisisAsync(model_ParametroAnalisis);

            return Accepted();
        }

        // DELETE api/<UsuarioController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            // Obtener el usuario por ID
            var model_ParametroAnalisis = await _parametroAnalisisRepository.GetParametroAnalisisByIdAsync(id);

            // Verificar si el usuario existe
            if (model_ParametroAnalisis == null)
                return NotFound(); // Devolver 404 Not Found si el usuario no existe

            try
            {
                // Eliminar el usuario
                await _parametroAnalisisRepository.DeleteParametroAnalisisAsync(id);

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

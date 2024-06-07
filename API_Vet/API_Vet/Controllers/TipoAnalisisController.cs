using APIControllersData.Models;
using APIControllersData.Repositories;
using FluentValidation;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;

namespace API_Vet.Controllers
{
    [Route("api/TipoAnalisis")]
    [ApiController]
    public class TipoAnalisisController : ControllerBase
    {
        private readonly ITipoAnalisisRepository _tipoAnalisisRepository;
        private readonly IValidator<Model_TipoAnalisis> _validator;

        public TipoAnalisisController(

            ITipoAnalisisRepository tipoAnalisisRepository,
            IValidator<Model_TipoAnalisis> validator
            )
        {
            _tipoAnalisisRepository = tipoAnalisisRepository;
            _validator = validator;
        }

        // GET: api/<UsuarioController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var model_TipoAnalisis = await _tipoAnalisisRepository.GetTipoAnalisisAsync();

            return Ok(model_TipoAnalisis);
        }

        // GET api/<UsuarioController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var model_TipoAnalisis = await _tipoAnalisisRepository.GetTipoAnalisisByIdAsync(id);
                if (model_TipoAnalisis == null)
                    return NotFound(); // Devolver 404 Not Found si el usuario no existe
                return Ok(model_TipoAnalisis); // Devolver el usuario si se encuentra
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Se produjo un error al obtener el usuario: {ex.Message}");
            }
        }

        // POST api/<UsuarioController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Model_TipoAnalisis model_TipoAnalisis)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(model_TipoAnalisis);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _tipoAnalisisRepository.AddTipoAnalisisAsync(model_TipoAnalisis);

            return Created();
        }

        // PUT api/<UsuarioController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Model_TipoAnalisis model_TipoAnalisis)
        {
            var usuarioEditable = await _tipoAnalisisRepository.GetTipoAnalisisByIdAsync(id);

            if (usuarioEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(model_TipoAnalisis);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _tipoAnalisisRepository.EditTipoAnalisisAsync(model_TipoAnalisis);

            return Accepted();
        }



        // DELETE api/<UsuarioController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            // Obtener el usuario por ID
            var model_TipoAnalisis = await _tipoAnalisisRepository.GetTipoAnalisisByIdAsync(id);

            // Verificar si el usuario existe
            if (model_TipoAnalisis == null)
                return NotFound(); // Devolver 404 Not Found si el usuario no existe

            try
            {
                // Eliminar el usuario
                await _tipoAnalisisRepository.DeleteTipoAnalisisAsync(id);

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

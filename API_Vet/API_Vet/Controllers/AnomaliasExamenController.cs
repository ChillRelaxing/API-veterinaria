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
    public class AnomaliasExamenController : ControllerBase
    {
        private readonly IAnomaliasExamen_Repository _anomaliasExamenRepository;
        private readonly IValidator<Model_AnomaliasExamen> _validator;

        public AnomaliasExamenController(IAnomaliasExamen_Repository anomaliasExamenRepository, IValidator<Model_AnomaliasExamen> validator)
        {
            _anomaliasExamenRepository = anomaliasExamenRepository;
            _validator = validator;
        }


        // GET: api/<AnomaliasExamenController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var anomaliasExamen = await _anomaliasExamenRepository.GetAnomaliasExamenAsync();

            return Ok(anomaliasExamen);
        }

        // GET api/<AnomaliasExamenController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var anomaliasExamen_ById = await _anomaliasExamenRepository.GetAnomaliasExamenByIdAsync(id);

                if (anomaliasExamen_ById == null)
                    return NotFound(); // Devolver 404 Not Found si el usuario no existe

                return Ok(anomaliasExamen_ById); // Devolver el usuario si se encuentra
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Se produjo un error al obtener el usuario: {ex.Message}");
            }
        }


        // POST api/<AnomaliasExamenController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Model_AnomaliasExamen m_AnomaliasExamen)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(m_AnomaliasExamen);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _anomaliasExamenRepository.AddAnomaliasExamenAsync(m_AnomaliasExamen);

            return Created();
        }

        // PUT api/<AnomaliasExamenController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Model_AnomaliasExamen m_AnomaliasExamen)
        {
            var anomaliasExamenEditable = await _anomaliasExamenRepository.GetAnomaliasExamenByIdAsync(id);

            if (anomaliasExamenEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(m_AnomaliasExamen);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _anomaliasExamenRepository.EditAnomaliasExamenAsync(m_AnomaliasExamen);

            return Accepted();
        }

        // DELETE api/<AnomaliasExamenController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            // Obtener el usuario por ID
            var anomaliasExamen = await _anomaliasExamenRepository.GetAnomaliasExamenByIdAsync(id);

            // Verificar si el usuario existe
            if (anomaliasExamen == null)
                return NotFound(); // Devolver 404 Not Found si el usuario no existe

            try
            {
                // Eliminar el usuario
                await _anomaliasExamenRepository.DeleteAnomaliasExamenAsync(id);

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

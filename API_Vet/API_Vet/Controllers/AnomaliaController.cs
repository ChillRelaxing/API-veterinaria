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
    public class AnomaliaController : ControllerBase
    {
        private readonly IAnomalia_Repository _anomalia_repository;
        private readonly IValidator<Model_Anomalia> _validator;

        public AnomaliaController(IAnomalia_Repository anomalia_repository, IValidator<Model_Anomalia> validator)
        {
            _anomalia_repository = anomalia_repository;
            _validator = validator;
        }


        // GET: api/<AnomaliaController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var anomalia = await _anomalia_repository.GetAnomaliaAsync();

            return Ok(anomalia);
        }


        // GET api/<AnomaliaController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var anomalia_ById = await _anomalia_repository.GetAnomaliaByIdAsync(id);

                if (anomalia_ById == null)
                    return NotFound(); // Devolver 404 Not Found si el usuario no existe

                return Ok(anomalia_ById); // Devolver el usuario si se encuentra
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Se produjo un error al obtener el usuario: {ex.Message}");
            }
        }

        // POST api/<AnomaliaController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Model_Anomalia m_Anomalia)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(m_Anomalia);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _anomalia_repository.AddAnomaliaAsync(m_Anomalia);

            return Created();
        }

        // PUT api/<AnomaliaController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Model_Anomalia m_Anomalia)
        {
            var anomaliaEditable = await _anomalia_repository.GetAnomaliaByIdAsync(id);  

            if (anomaliaEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(m_Anomalia);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _anomalia_repository.EditAnomaliaAsync(m_Anomalia);

            return Accepted();
        }

        // DELETE api/<AnomaliaController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            // Obtener el usuario por ID
            var anomalia = await _anomalia_repository.GetAnomaliaByIdAsync(id);

            // Verificar si el usuario existe
            if (anomalia == null)
                return NotFound(); // Devolver 404 Not Found si el usuario no existe

            try
            {
                // Eliminar el usuario
                await _anomalia_repository.DeleteAnomaliaAsync(id); 

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

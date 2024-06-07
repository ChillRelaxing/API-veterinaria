using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Models
{
    public class Model_ExamenClinico
    {
        public int Id_Examen { get; set; }

        public string TipoAnalisis { get; set; }

        public string Resultados { get; set; } 

        public int Id_Animal { get; set; }

        public int Id_Veterinario { get; set; }

        public string EspecieAnimal { get; set; } //Nuevo campo para incluir el nombre de la especie animal

        public string NombreVeterinario { get; set; } //Nuevo campo para incluir el nombre del veterinairo

    }
}

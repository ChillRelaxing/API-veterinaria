using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Models
{
    public class Model_ParametroExamen
    {
        public int Id_ParametroExamen { get; set; }

        public string Valor { get; set; }

        public int Id_Examen { get; set; }

        public int Id_ParametroAnalisis { get; set; }

        public string TipoAnalisis { get; set; } // Nuevo campo para incluir el nombre del Examen clinico

        public string NombreParametroAnalisis { get; set; } // Nuevo campo para incluir el nombre del parametro analisis


    }
}

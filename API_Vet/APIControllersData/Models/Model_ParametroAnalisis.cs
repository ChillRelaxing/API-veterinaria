using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Models
{
    public class Model_ParametroAnalisis
    {
        public int Id_ParametroAnalisis { get; set; }

        public string Nombre { get; set; }

        public string ValorReferencia { get; set; }

        public int Id_TipoAnalisis { get; set; }

        public string NombreTipoAnalisis { get; set; } // Nuevo campo para incluir el nombre del Tipo de Análisis

    }
}

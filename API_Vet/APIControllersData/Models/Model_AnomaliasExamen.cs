using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Models
{
    public class Model_AnomaliasExamen
    {
        public int Id_AnomaliaExamen { get; set; }
        public int Id_Anomalia { get; set; }
        public string ?Nombre { get; set; } //para mostrar el nombre de la Anomalia
        public int Id_Examen { get; set; }
        public string ?TipoAnalisis  { get; set; }  //para el Examen
    }
}

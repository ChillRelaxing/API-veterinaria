using APIControllersData.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Validations
{
    public class AnomaliasExamenValidator : AbstractValidator<Model_AnomaliasExamen>
    {
        public AnomaliasExamenValidator()
        {
            RuleFor(x => x.Id_Anomalia)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("La Anomalia es obligatorio")
                .GreaterThan(0).WithMessage("La Anomalia debe ser un número positivo.");

            RuleFor(x => x.Id_Examen)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El Examen es obligatorio")
                .GreaterThan(0).WithMessage("El Examen debe ser un número positivo.");
        }
    }
}

using APIControllersData.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Validations
{
    public class ParametroExamenValidator : AbstractValidator<Model_ParametroExamen>
    {
        public ParametroExamenValidator()
        {
            RuleFor(x => x.Valor)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El valor es obligatorio")
                .MinimumLength(1).WithMessage("Debe contener mínimo 1 carácter")
                .Matches(@"^[\s\S]+$").WithMessage("El valor puede contener letras, números y cualquier otro símbolo");

            RuleFor(x => x.Id_Examen)
                .GreaterThan(0).WithMessage("El Id_Examen debe ser mayor que 0");

            RuleFor(x => x.Id_ParametroAnalisis)
                .GreaterThan(0).WithMessage("El Id_ParametroAnalisis debe ser mayor que 0");

        }
    }
}

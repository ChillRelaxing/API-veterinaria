using APIControllersData.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Validations
{
    public class ParametroAnalisisValidator : AbstractValidator<Model_ParametroAnalisis>
    {
        public ParametroAnalisisValidator()
        {
            RuleFor(x => x.Nombre)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El nombre es obligatorio")
                .MinimumLength(3).WithMessage("Debe contener mínimo 3 letras")
                .Matches("^[a-zA-Z ]+$").WithMessage("El nombre solo puede contener letras");

            RuleFor(x => x.ValorReferencia)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El valor de referencia es obligatorio")
                .MinimumLength(2).WithMessage("Debe contener mínimo 2 caracteres");

            RuleFor(x => x.Id_TipoAnalisis)
                .GreaterThan(0).WithMessage("El Id_TipoAnalisis debe ser mayor que 0");

        }
    }
}

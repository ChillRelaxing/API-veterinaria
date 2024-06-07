using APIControllersData.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Validations
{
    public class ExamenClinicoValidator : AbstractValidator<Model_ExamenClinico>
    {
        public ExamenClinicoValidator()
        {
            RuleFor(x => x.TipoAnalisis)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El tipo de análisis es obligatorio")
                .MinimumLength(3).WithMessage("Debe contener mínimo 3 caracteres")
                .Matches(@"^[\s\S]+$").WithMessage("El tipo de análisis puede contener letras, números y cualquier otro símbolo");

            RuleFor(x => x.Resultados)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("Los resultados son obligatorios")
                .MinimumLength(1).WithMessage("Debe contener mínimo 1 carácter")
                .Matches(@"^[\s\S]+$").WithMessage("Los resultados pueden contener letras, números y cualquier otro símbolo");

            RuleFor(x => x.Id_Animal)
                .GreaterThan(0).WithMessage("El Id_Animal debe ser mayor que 0");

            RuleFor(x => x.Id_Veterinario)
                .GreaterThan(0).WithMessage("El Id_Veterinario debe ser mayor que 0");
        }
    }
}

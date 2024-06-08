using APIControllersData.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Validations
{
    public class AnomaliaValidator : AbstractValidator<Model_Anomalia>
    {
        public AnomaliaValidator()
        {
            RuleFor(x => x.Nombre)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El nombre es obligatorio")
                .MinimumLength(5).WithMessage("Debe contener mínimo 8 letras")
                .Matches("^[a-zA-Z ]+$").WithMessage("El nombre solo puede contener letras");

            RuleFor(x => x.Descripcion)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("La descripción es obligatoria")
                .MinimumLength(10).WithMessage("Debe contener mínimo 10 letras");
        }
    }
}

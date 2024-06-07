using APIControllersData.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Validations
{
    public class TipoAnalisisValidator : AbstractValidator<Model_TipoAnalisis>
    {
        public TipoAnalisisValidator()
        {
            RuleFor(x => x.Nombre)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El nombre es obligatorio")
                .MinimumLength(3).WithMessage("Debe contener mínimo 3 letras")
                .Matches("^[a-zA-Z ]+$").WithMessage("El nombre solo puede contener letras");

            RuleFor(x => x.Descripcion)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("La descripción es obligatoria")
                .MinimumLength(5).WithMessage("Debe contener mínimo 5 letras")
                .Matches("^[a-zA-Z ]+$").WithMessage("La descripción solo puede contener letras");

        }
    }
}

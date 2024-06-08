using APIControllersData.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Validations
{
    public class AnimalValidator : AbstractValidator<Model_Animal>
    {
        public AnimalValidator()
        {
            RuleFor(x => x.Especie)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("La Especie es obligatorio")
                .MinimumLength(4).WithMessage("Debe contener mínimo 4 letras")
                .MaximumLength(50).WithMessage("Solo se permite un maximo de 50 caracteres")
                .Matches("^[a-zA-Z ]+$").WithMessage("La Especie solo puede contener letras");

            RuleFor(x => x.Edad)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("La Edad es Obligatorio")
                .MinimumLength(4).WithMessage("Debe contener mínimo 4 letras")
                .MaximumLength(15).WithMessage("Solo se permite un maximo de 15 caracteres");

            RuleFor(x => x.Genero)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El Genero es Obligatorio")
                .MinimumLength(5).WithMessage("Debe contener minimo 5 letras")
                .MaximumLength(50).WithMessage("Solo se permite un maximo de 15 caracteres")
                .Matches("^[a-zA-Z ]+$").WithMessage("El Genero solo puede contener letras");

        }
    }
}

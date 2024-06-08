using APIControllersData.Models;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIControllersData.Validations
{
    public class VeterinarioValidator : AbstractValidator<Model_Veterinario>
    {
        public VeterinarioValidator()
        {
            RuleFor(x => x.Nombre)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El nombre es obligatorio")
                .MinimumLength(3).WithMessage("Debe contener mínimo 3 letras")
                .MaximumLength(30).WithMessage("Solo se permite un maximo de 30 caracteres")
                .Matches("^[a-zA-Z ]+$").WithMessage("El nombre solo puede contener letras");

            RuleFor(x => x.Apellido)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El Apellido es Obligatorio")
                .MinimumLength(3).WithMessage("Debe contener minimo 3 letras")
                .MaximumLength(30).WithMessage("Solo se permite un maximo de 30 caracteres")
                .Matches("^[a-zA-Z ]+$").WithMessage("El apellido solo puede contener letras");

            RuleFor(x => x.Especialidad)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("La Especialidad es Obligatorio")
                .MinimumLength(7).WithMessage("Debe contener minimo 7 letras")
                .MaximumLength(50).WithMessage("Solo se permite un maximo de 50 caracteres")
                .Matches("^[a-zA-Z ]+$").WithMessage("La Especialidad solo puede contener letras");


        }
    }
}

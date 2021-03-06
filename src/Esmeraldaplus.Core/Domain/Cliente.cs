﻿using System;
using System.Collections.Generic;

namespace Esmeraldaplus.Core.Domain
{
    public partial class Cliente
    {
        public Cliente()
        {
            ComprovantePedido = new HashSet<ComprovantePedido>();
        }

        public int IdCliente { get; set; }
        public string PrimerNombre { get; set; }
        public string SegundoNombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string Direccion { get; set; }
        public string CorreoElectronico { get; set; }
        public int CodTelefon { get; set; }
        public int IdRoles { get; set; }
        public string Telefon { get; set; }

        public virtual TipoDeNumero CodTelefonNavigation { get; set; }
        public virtual Roles IdRolesNavigation { get; set; }
        public virtual ICollection<ComprovantePedido> ComprovantePedido { get; set; }
    }
}

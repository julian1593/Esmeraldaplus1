using System;
using System.Collections.Generic;

namespace Esmeraldaplus.Core.Domain
{
    public partial class Insumos
    {
        public Insumos()
        {
            Inventario = new HashSet<Inventario>();
            Produccion = new HashSet<Produccion>();
        }

        public int Id { get; set; }
        public int IdTipoDeInsumo { get; set; }
        public int IdProvedor { get; set; }
        public int? ValorInsumo { get; set; }

        public virtual Provedor IdProvedorNavigation { get; set; }
        public virtual TipoDeInsumo IdTipoDeInsumoNavigation { get; set; }
        public virtual ICollection<Inventario> Inventario { get; set; }
        public virtual ICollection<Produccion> Produccion { get; set; }
    }
}

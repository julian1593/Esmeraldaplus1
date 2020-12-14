using System;
using System.Collections.Generic;

namespace Esmeraldaplus.Core.Domain
{
    public partial class TipoDeProductos
    {
        public TipoDeProductos()
        {
            Produccion = new HashSet<Produccion>();
            Productos = new HashSet<Productos>();
        }

        public int IdTipoDeProductos { get; set; }
        public string Producto { get; set; }

        public virtual ICollection<Produccion> Produccion { get; set; }
        public virtual ICollection<Productos> Productos { get; set; }
    }
}

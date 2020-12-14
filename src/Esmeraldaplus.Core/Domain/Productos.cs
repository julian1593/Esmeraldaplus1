using System;
using System.Collections.Generic;

namespace Esmeraldaplus.Core.Domain
{
    public partial class Productos
    {
        public Productos()
        {
            Inventario = new HashSet<Inventario>();
            Pedido = new HashSet<Pedido>();
        }

        public int IdProducto { get; set; }
        public int IdTipo { get; set; }
        public int? ValorProducto { get; set; }

        public virtual TipoDeProductos IdTipoNavigation { get; set; }
        public virtual ICollection<Inventario> Inventario { get; set; }
        public virtual ICollection<Pedido> Pedido { get; set; }
    }
}

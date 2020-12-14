using System;
using System.Collections.Generic;

namespace Esmeraldaplus.Core.Domain
{
    public partial class Produccion
    {
        public int IdProduccion { get; set; }
        public int EstadoProducto { get; set; }
        public int IdEmpleado { get; set; }
        public int IdInsumos { get; set; }
        public int? CantidadInsumos { get; set; }
        public string UnidadDeMedida { get; set; }
        public int TipoDeProductos { get; set; }

        public virtual Estado EstadoProductoNavigation { get; set; }
        public virtual Empleado IdEmpleadoNavigation { get; set; }
        public virtual Insumos IdInsumosNavigation { get; set; }
        public virtual TipoDeProductos TipoDeProductosNavigation { get; set; }
    }
}

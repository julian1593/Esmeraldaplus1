using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Esmeraldaplus.Infrastructure;
using Esmeraldaplus.Core.Domain;

namespace Esmeraldaplus.Infrastructure.Data
{
    public partial class EsmeraldaplusDbContext : DbContext
    {
        public EsmeraldaplusDbContext()
        {
        }

        public EsmeraldaplusDbContext(DbContextOptions<EsmeraldaplusDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Cliente> Cliente { get; set; }
        public virtual DbSet<ComprovantePedido> ComprovantePedido { get; set; }
        public virtual DbSet<Empleado> Empleado { get; set; }
        public virtual DbSet<EmpleadoHasProductos> EmpleadoHasProductos { get; set; }
        public virtual DbSet<Estado> Estado { get; set; }
        public virtual DbSet<Insumos> Insumos { get; set; }
        public virtual DbSet<Inventario> Inventario { get; set; }
        public virtual DbSet<Pedido> Pedido { get; set; }
        public virtual DbSet<PedidoHasComprovantePedido> PedidoHasComprovantePedido { get; set; }
        public virtual DbSet<Produccion> Produccion { get; set; }
        public virtual DbSet<Productos> Productos { get; set; }
        public virtual DbSet<Provedor> Provedor { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<TipoDeInsumo> TipoDeInsumo { get; set; }
        public virtual DbSet<TipoDeNumero> TipoDeNumero { get; set; }
        public virtual DbSet<TipoDeProductos> TipoDeProductos { get; set; }
        public virtual DbSet<Usuarios> Usuarios { get; set; }
        public virtual DbSet<Vendedor> Vendedor { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
//            if (!optionsBuilder.IsConfigured)
//            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
//                optionsBuilder.UseMySQL("database=esmeraldaplus;server=localhost;port=3306;user id=root;password=1234");
//            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cliente>(entity =>
            {
                entity.HasKey(e => e.IdCliente)
                    .HasName("PRIMARY");

                entity.ToTable("cliente");

                entity.HasIndex(e => e.CodTelefon)
                    .HasName("Cod_telefon");

                entity.HasIndex(e => e.IdRoles)
                    .HasName("Id_Roles");

                entity.Property(e => e.IdCliente).HasColumnName("Id_Cliente");

                entity.Property(e => e.CodTelefon).HasColumnName("Cod_telefon");

                entity.Property(e => e.CorreoElectronico)
                    .HasColumnName("Correo_electronico")
                    .HasMaxLength(40);

                entity.Property(e => e.Direccion).HasMaxLength(30);

                entity.Property(e => e.IdRoles).HasColumnName("Id_Roles");

                entity.Property(e => e.PrimerApellido)
                    .HasColumnName("Primer_Apellido")
                    .HasMaxLength(15);

                entity.Property(e => e.PrimerNombre)
                    .HasColumnName("Primer_Nombre")
                    .HasMaxLength(15);

                entity.Property(e => e.SegundoApellido)
                    .HasColumnName("Segundo_Apellido")
                    .HasMaxLength(15);

                entity.Property(e => e.SegundoNombre)
                    .HasColumnName("Segundo_Nombre")
                    .HasMaxLength(15);

                entity.Property(e => e.Telefon).HasMaxLength(10);

                entity.HasOne(d => d.CodTelefonNavigation)
                    .WithMany(p => p.Cliente)
                    .HasForeignKey(d => d.CodTelefon)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("cliente_ibfk_1");

                entity.HasOne(d => d.IdRolesNavigation)
                    .WithMany(p => p.Cliente)
                    .HasForeignKey(d => d.IdRoles)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("cliente_ibfk_2");
            });

            modelBuilder.Entity<ComprovantePedido>(entity =>
            {
                entity.HasKey(e => e.IdComprovante)
                    .HasName("PRIMARY");

                entity.ToTable("comprovante_pedido");

                entity.HasIndex(e => e.IdCliente)
                    .HasName("Id_Cliente");

                entity.Property(e => e.IdComprovante).HasColumnName("Id_Comprovante");

                entity.Property(e => e.CostoUnitario).HasColumnName("Costo_unitario");

                entity.Property(e => e.IdCliente).HasColumnName("Id_Cliente");

                entity.HasOne(d => d.IdClienteNavigation)
                    .WithMany(p => p.ComprovantePedido)
                    .HasForeignKey(d => d.IdCliente)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("comprovante_pedido_ibfk_1");
            });

            modelBuilder.Entity<Empleado>(entity =>
            {
                entity.ToTable("empleado");

                entity.HasIndex(e => e.CodTelefon)
                    .HasName("Cod_telefon");

                entity.HasIndex(e => e.IdRoles)
                    .HasName("Id_Roles");

                entity.Property(e => e.CodTelefon).HasColumnName("Cod_telefon");

                entity.Property(e => e.CorreoElectronico)
                    .HasColumnName("Correo_electronico")
                    .HasMaxLength(40);

                entity.Property(e => e.Direccion).HasMaxLength(30);

                entity.Property(e => e.IdRoles).HasColumnName("Id_Roles");

                entity.Property(e => e.PrimerApellido)
                    .HasColumnName("Primer_Apellido")
                    .HasMaxLength(15);

                entity.Property(e => e.PrimerNombre)
                    .HasColumnName("Primer_Nombre")
                    .HasMaxLength(15);

                entity.Property(e => e.SegundoApellido)
                    .HasColumnName("Segundo_Apellido")
                    .HasMaxLength(15);

                entity.Property(e => e.SegundoNombre)
                    .HasColumnName("Segundo_Nombre")
                    .HasMaxLength(15);

                entity.Property(e => e.Telefon).HasMaxLength(10);

                entity.HasOne(d => d.CodTelefonNavigation)
                    .WithMany(p => p.Empleado)
                    .HasForeignKey(d => d.CodTelefon)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("empleado_ibfk_1");

                entity.HasOne(d => d.IdRolesNavigation)
                    .WithMany(p => p.Empleado)
                    .HasForeignKey(d => d.IdRoles)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("empleado_ibfk_2");
            });

            modelBuilder.Entity<EmpleadoHasProductos>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("empleado_has_productos");

                entity.HasIndex(e => e.IdEmpleado)
                    .HasName("Id_Empleado");

                entity.HasIndex(e => e.IdProducto)
                    .HasName("Id_producto");

                entity.Property(e => e.IdEmpleado).HasColumnName("Id_Empleado");

                entity.Property(e => e.IdProducto).HasColumnName("Id_producto");

                entity.HasOne(d => d.IdEmpleadoNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.IdEmpleado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("empleado_has_productos_ibfk_1");

                entity.HasOne(d => d.IdProductoNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.IdProducto)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("empleado_has_productos_ibfk_2");
            });

            modelBuilder.Entity<Estado>(entity =>
            {
                entity.ToTable("estado");

                entity.Property(e => e.EstadoProducto)
                    .IsRequired()
                    .HasColumnName("Estado_producto")
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<Insumos>(entity =>
            {
                entity.ToTable("insumos");

                entity.HasIndex(e => e.IdProvedor)
                    .HasName("Id_Provedor");

                entity.HasIndex(e => e.IdTipoDeInsumo)
                    .HasName("Id_Tipo_de_Insumo");

                entity.Property(e => e.IdProvedor).HasColumnName("Id_Provedor");

                entity.Property(e => e.IdTipoDeInsumo).HasColumnName("Id_Tipo_de_Insumo");

                entity.Property(e => e.ValorInsumo).HasColumnName("Valor_insumo");

                entity.HasOne(d => d.IdProvedorNavigation)
                    .WithMany(p => p.Insumos)
                    .HasForeignKey(d => d.IdProvedor)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("insumos_ibfk_2");

                entity.HasOne(d => d.IdTipoDeInsumoNavigation)
                    .WithMany(p => p.Insumos)
                    .HasForeignKey(d => d.IdTipoDeInsumo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("insumos_ibfk_1");
            });

            modelBuilder.Entity<Inventario>(entity =>
            {
                entity.HasKey(e => e.IdInventario)
                    .HasName("PRIMARY");

                entity.ToTable("inventario");

                entity.HasIndex(e => e.IdDelProducto)
                    .HasName("Id_producto");

                entity.HasIndex(e => e.IdInsumos)
                    .HasName("Id_insumos");

                entity.Property(e => e.IdInventario).HasColumnName("Id_Inventario");

                entity.Property(e => e.CantidadInsumo).HasColumnName("Cantidad_insumo");

                entity.Property(e => e.CantidadProducto).HasColumnName("Cantidad_producto");

                entity.Property(e => e.FechaIngresoInsumos)
                    .HasColumnName("Fecha_ingreso_insumos")
                    .HasColumnType("date");

                entity.Property(e => e.FechaIngresoProducto)
                    .HasColumnName("Fecha_ingreso_producto")
                    .HasColumnType("date");

                entity.Property(e => e.IdDelProducto).HasColumnName("Id_del_producto");

                entity.Property(e => e.IdInsumos).HasColumnName("Id_insumos");

                entity.HasOne(d => d.IdDelProductoNavigation)
                    .WithMany(p => p.Inventario)
                    .HasForeignKey(d => d.IdDelProducto)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("inventario_ibfk_1");

                entity.HasOne(d => d.IdInsumosNavigation)
                    .WithMany(p => p.Inventario)
                    .HasForeignKey(d => d.IdInsumos)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("inventario_ibfk_2");
            });

            modelBuilder.Entity<Pedido>(entity =>
            {
                entity.HasKey(e => e.IdPedido)
                    .HasName("PRIMARY");

                entity.ToTable("pedido");

                entity.HasIndex(e => e.IdProducto)
                    .HasName("Id_producto");

                entity.HasIndex(e => e.IdVendedor)
                    .HasName("Id_Vendedor");

                entity.Property(e => e.IdPedido).HasColumnName("Id_Pedido");

                entity.Property(e => e.FechaEntrega)
                    .HasColumnName("Fecha_entrega")
                    .HasColumnType("date");

                entity.Property(e => e.FechaPedido)
                    .HasColumnName("Fecha_pedido")
                    .HasColumnType("date");

                entity.Property(e => e.IdProducto).HasColumnName("Id_producto");

                entity.Property(e => e.IdVendedor).HasColumnName("Id_Vendedor");

                entity.HasOne(d => d.IdProductoNavigation)
                    .WithMany(p => p.Pedido)
                    .HasForeignKey(d => d.IdProducto)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("pedido_ibfk_1");

                entity.HasOne(d => d.IdVendedorNavigation)
                    .WithMany(p => p.Pedido)
                    .HasForeignKey(d => d.IdVendedor)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("pedido_ibfk_2");
            });

            modelBuilder.Entity<PedidoHasComprovantePedido>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("pedido_has_comprovante_pedido");

                entity.HasIndex(e => e.IdComprovante)
                    .HasName("Id_Comprovante");

                entity.HasIndex(e => e.IdPedido)
                    .HasName("Id_Pedido");

                entity.Property(e => e.IdComprovante).HasColumnName("Id_Comprovante");

                entity.Property(e => e.IdPedido).HasColumnName("Id_Pedido");

                entity.HasOne(d => d.IdComprovanteNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.IdComprovante)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("pedido_has_comprovante_pedido_ibfk_2");

                entity.HasOne(d => d.IdPedidoNavigation)
                    .WithMany()
                    .HasForeignKey(d => d.IdPedido)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("pedido_has_comprovante_pedido_ibfk_1");
            });

            modelBuilder.Entity<Produccion>(entity =>
            {
                entity.HasKey(e => e.IdProduccion)
                    .HasName("PRIMARY");

                entity.ToTable("produccion");

                entity.HasIndex(e => e.EstadoProducto)
                    .HasName("Id");

                entity.HasIndex(e => e.IdEmpleado)
                    .HasName("Id_Empleado");

                entity.HasIndex(e => e.IdInsumos)
                    .HasName("Id_insumos");

                entity.HasIndex(e => e.TipoDeProductos)
                    .HasName("Id_Tipo_de_productos");

                entity.Property(e => e.IdProduccion).HasColumnName("Id_Produccion");

                entity.Property(e => e.CantidadInsumos).HasColumnName("Cantidad_insumos");

                entity.Property(e => e.EstadoProducto).HasColumnName("Estado_producto");

                entity.Property(e => e.IdEmpleado).HasColumnName("Id_Empleado");

                entity.Property(e => e.IdInsumos).HasColumnName("Id_insumos");

                entity.Property(e => e.TipoDeProductos).HasColumnName("Tipo_de_productos");

                entity.Property(e => e.UnidadDeMedida)
                    .HasColumnName("Unidad_de_medida")
                    .HasMaxLength(4);

                entity.HasOne(d => d.EstadoProductoNavigation)
                    .WithMany(p => p.Produccion)
                    .HasForeignKey(d => d.EstadoProducto)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("produccion_ibfk_1");

                entity.HasOne(d => d.IdEmpleadoNavigation)
                    .WithMany(p => p.Produccion)
                    .HasForeignKey(d => d.IdEmpleado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("produccion_ibfk_2");

                entity.HasOne(d => d.IdInsumosNavigation)
                    .WithMany(p => p.Produccion)
                    .HasForeignKey(d => d.IdInsumos)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("produccion_ibfk_3");

                entity.HasOne(d => d.TipoDeProductosNavigation)
                    .WithMany(p => p.Produccion)
                    .HasForeignKey(d => d.TipoDeProductos)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("produccion_ibfk_4");
            });

            modelBuilder.Entity<Productos>(entity =>
            {
                entity.HasKey(e => e.IdProducto)
                    .HasName("PRIMARY");

                entity.ToTable("productos");

                entity.HasIndex(e => e.IdTipo)
                    .HasName("Id_Tipo_de_productos");

                entity.Property(e => e.IdProducto).HasColumnName("Id_producto");

                entity.Property(e => e.IdTipo).HasColumnName("Id_Tipo");

                entity.Property(e => e.ValorProducto).HasColumnName("Valor_producto");

                entity.HasOne(d => d.IdTipoNavigation)
                    .WithMany(p => p.Productos)
                    .HasForeignKey(d => d.IdTipo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("productos_ibfk_1");
            });

            modelBuilder.Entity<Provedor>(entity =>
            {
                entity.HasKey(e => e.IdProvedor)
                    .HasName("PRIMARY");

                entity.ToTable("provedor");

                entity.HasIndex(e => e.CodTelefon)
                    .HasName("Cod_telefon");

                entity.Property(e => e.IdProvedor).HasColumnName("Id_Provedor");

                entity.Property(e => e.CodTelefon).HasColumnName("Cod_telefon");

                entity.Property(e => e.CorreoElectronico)
                    .HasColumnName("Correo_electronico")
                    .HasMaxLength(40);

                entity.Property(e => e.Direccion).HasMaxLength(30);

                entity.Property(e => e.PrimerApellido)
                    .HasColumnName("Primer_Apellido")
                    .HasMaxLength(15);

                entity.Property(e => e.PrimerNombre)
                    .HasColumnName("Primer_Nombre")
                    .HasMaxLength(15);

                entity.Property(e => e.SegundoApellido)
                    .HasColumnName("Segundo_Apellido")
                    .HasMaxLength(15);

                entity.Property(e => e.SegundoNombre)
                    .HasColumnName("Segundo_Nombre")
                    .HasMaxLength(15);

                entity.Property(e => e.Telefon).HasMaxLength(10);

                entity.HasOne(d => d.CodTelefonNavigation)
                    .WithMany(p => p.Provedor)
                    .HasForeignKey(d => d.CodTelefon)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("provedor_ibfk_1");
            });

            modelBuilder.Entity<Roles>(entity =>
            {
                entity.HasKey(e => e.IdRoles)
                    .HasName("PRIMARY");

                entity.ToTable("roles");

                entity.Property(e => e.IdRoles).HasColumnName("Id_Roles");

                entity.Property(e => e.Rol).HasMaxLength(15);
            });

            modelBuilder.Entity<TipoDeInsumo>(entity =>
            {
                entity.ToTable("tipo_de_insumo");

                entity.Property(e => e.Insumo).HasMaxLength(25);
            });

            modelBuilder.Entity<TipoDeNumero>(entity =>
            {
                entity.HasKey(e => e.CodTelefon)
                    .HasName("PRIMARY");

                entity.ToTable("tipo_de_numero");

                entity.Property(e => e.CodTelefon).HasColumnName("Cod_telefon");

                entity.Property(e => e.TipoDeNumero1)
                    .HasColumnName("Tipo_de_numero")
                    .HasMaxLength(15);
            });

            modelBuilder.Entity<TipoDeProductos>(entity =>
            {
                entity.HasKey(e => e.IdTipoDeProductos)
                    .HasName("PRIMARY");

                entity.ToTable("tipo_de_productos");

                entity.Property(e => e.IdTipoDeProductos).HasColumnName("Id_Tipo_de_productos");

                entity.Property(e => e.Producto).HasMaxLength(35);
            });

            modelBuilder.Entity<Usuarios>(entity =>
            {
                entity.HasKey(e => e.IdUsuarios)
                    .HasName("PRIMARY");

                entity.ToTable("usuarios");

                entity.HasIndex(e => e.IdRoles)
                    .HasName("Id_Roles");

                entity.Property(e => e.IdUsuarios).HasColumnName("Id_usuarios");

                entity.Property(e => e.IdRoles).HasColumnName("Id_Roles");

                entity.HasOne(d => d.IdRolesNavigation)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.IdRoles)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("usuarios_ibfk_1");
            });

            modelBuilder.Entity<Vendedor>(entity =>
            {
                entity.HasKey(e => e.IdVendedor)
                    .HasName("PRIMARY");

                entity.ToTable("vendedor");

                entity.HasIndex(e => e.CodTelefon)
                    .HasName("Cod_telefon");

                entity.HasIndex(e => e.IdRoles)
                    .HasName("Id_Roles");

                entity.Property(e => e.IdVendedor).HasColumnName("Id_Vendedor");

                entity.Property(e => e.CodTelefon).HasColumnName("Cod_telefon");

                entity.Property(e => e.Direccion).HasMaxLength(30);

                entity.Property(e => e.IdRoles).HasColumnName("Id_Roles");

                entity.Property(e => e.PrimerApellido)
                    .HasColumnName("Primer_Apellido")
                    .HasMaxLength(15);

                entity.Property(e => e.PrimerNombre)
                    .HasColumnName("Primer_Nombre")
                    .HasMaxLength(15);

                entity.Property(e => e.SegundoApellido)
                    .HasColumnName("Segundo_Apellido")
                    .HasMaxLength(15);

                entity.Property(e => e.SegundoNombre)
                    .HasColumnName("Segundo_Nombre")
                    .HasMaxLength(15);

                entity.Property(e => e.Telefon).HasMaxLength(10);

                entity.HasOne(d => d.CodTelefonNavigation)
                    .WithMany(p => p.Vendedor)
                    .HasForeignKey(d => d.CodTelefon)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("vendedor_ibfk_1");

                entity.HasOne(d => d.IdRolesNavigation)
                    .WithMany(p => p.Vendedor)
                    .HasForeignKey(d => d.IdRoles)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("vendedor_ibfk_2");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

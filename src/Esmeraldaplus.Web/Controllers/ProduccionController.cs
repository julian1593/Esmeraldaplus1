using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Esmeraldaplus.Core.Domain;
using Esmeraldaplus.Infrastructure.Data;

namespace Esmeraldaplus.Web.Controllers
{
    public class ProduccionController : Controller
    {
        private readonly EsmeraldaplusDbContext _context;

        public ProduccionController(EsmeraldaplusDbContext context)
        {
            _context = context;
        }

        // GET: Produccions
        public async Task<IActionResult> Index()
        {
            var esmeraldaplusDbContext = _context.Produccion.Include(p => p.EstadoProductoNavigation).Include(p => p.IdEmpleadoNavigation).Include(p => p.IdInsumosNavigation).Include(p => p.TipoDeProductosNavigation);
            return View(await esmeraldaplusDbContext.ToListAsync());
        }

        // GET: Produccions/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var produccion = await _context.Produccion
                .Include(p => p.EstadoProductoNavigation)
                .Include(p => p.IdEmpleadoNavigation)
                .Include(p => p.IdInsumosNavigation)
                .Include(p => p.TipoDeProductosNavigation)
                .FirstOrDefaultAsync(m => m.IdProduccion == id);
            if (produccion == null)
            {
                return NotFound();
            }

            return View(produccion);
        }

        // GET: Produccions/Create
        public IActionResult Create()
        {
            ViewData["EstadoProducto"] = new SelectList(_context.Estado, "Id", "EstadoProducto");
            ViewData["IdEmpleado"] = new SelectList(_context.Empleado, "Id", "Id");
            ViewData["IdInsumos"] = new SelectList(_context.Insumos, "Id", "Id");
            ViewData["TipoDeProductos"] = new SelectList(_context.TipoDeProductos, "IdTipoDeProductos", "IdTipoDeProductos");
            return View();
        }

        // POST: Produccions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdProduccion,EstadoProducto,IdEmpleado,IdInsumos,CantidadInsumos,UnidadDeMedida,TipoDeProductos")] Produccion produccion)
        {
            if (ModelState.IsValid)
            {
                _context.Add(produccion);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["EstadoProducto"] = new SelectList(_context.Estado, "Id", "EstadoProducto", produccion.EstadoProducto);
            ViewData["IdEmpleado"] = new SelectList(_context.Empleado, "Id", "Id", produccion.IdEmpleado);
            ViewData["IdInsumos"] = new SelectList(_context.Insumos, "Id", "Id", produccion.IdInsumos);
            ViewData["TipoDeProductos"] = new SelectList(_context.TipoDeProductos, "IdTipoDeProductos", "IdTipoDeProductos", produccion.TipoDeProductos);
            return View(produccion);
        }

        // GET: Produccions/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var produccion = await _context.Produccion.FindAsync(id);
            if (produccion == null)
            {
                return NotFound();
            }
            ViewData["EstadoProducto"] = new SelectList(_context.Estado, "Id", "EstadoProducto", produccion.EstadoProducto);
            ViewData["IdEmpleado"] = new SelectList(_context.Empleado, "Id", "Id", produccion.IdEmpleado);
            ViewData["IdInsumos"] = new SelectList(_context.Insumos, "Id", "Id", produccion.IdInsumos);
            ViewData["TipoDeProductos"] = new SelectList(_context.TipoDeProductos, "IdTipoDeProductos", "IdTipoDeProductos", produccion.TipoDeProductos);
            return View(produccion);
        }

        // POST: Produccions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdProduccion,EstadoProducto,IdEmpleado,IdInsumos,CantidadInsumos,UnidadDeMedida,TipoDeProductos")] Produccion produccion)
        {
            if (id != produccion.IdProduccion)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(produccion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProduccionExists(produccion.IdProduccion))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["EstadoProducto"] = new SelectList(_context.Estado, "Id", "EstadoProducto", produccion.EstadoProducto);
            ViewData["IdEmpleado"] = new SelectList(_context.Empleado, "Id", "Id", produccion.IdEmpleado);
            ViewData["IdInsumos"] = new SelectList(_context.Insumos, "Id", "Id", produccion.IdInsumos);
            ViewData["TipoDeProductos"] = new SelectList(_context.TipoDeProductos, "IdTipoDeProductos", "IdTipoDeProductos", produccion.TipoDeProductos);
            return View(produccion);
        }

        // GET: Produccions/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var produccion = await _context.Produccion
                .Include(p => p.EstadoProductoNavigation)
                .Include(p => p.IdEmpleadoNavigation)
                .Include(p => p.IdInsumosNavigation)
                .Include(p => p.TipoDeProductosNavigation)
                .FirstOrDefaultAsync(m => m.IdProduccion == id);
            if (produccion == null)
            {
                return NotFound();
            }

            return View(produccion);
        }

        // POST: Produccions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var produccion = await _context.Produccion.FindAsync(id);
            _context.Produccion.Remove(produccion);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProduccionExists(int id)
        {
            return _context.Produccion.Any(e => e.IdProduccion == id);
        }
    }
}

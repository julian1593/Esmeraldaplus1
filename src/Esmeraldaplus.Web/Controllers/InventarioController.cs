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
    public class InventarioController : Controller
    {
        private readonly EsmeraldaplusDbContext _context;

        public InventarioController(EsmeraldaplusDbContext context)
        {
            _context = context;
        }

        // GET: Inventarios
        public async Task<IActionResult> Index()
        {
            var esmeraldaplusDbContext = _context.Inventario.Include(i => i.IdDelProductoNavigation).Include(i => i.IdInsumosNavigation);
            return View(await esmeraldaplusDbContext.ToListAsync());
        }

        // GET: Inventarios/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var inventario = await _context.Inventario
                .Include(i => i.IdDelProductoNavigation)
                .Include(i => i.IdInsumosNavigation)
                .FirstOrDefaultAsync(m => m.IdInventario == id);
            if (inventario == null)
            {
                return NotFound();
            }

            return View(inventario);
        }

        // GET: Inventarios/Create
        public IActionResult Create()
        {
            ViewData["IdDelProducto"] = new SelectList(_context.Productos, "IdProducto", "IdProducto");
            ViewData["IdInsumos"] = new SelectList(_context.Insumos, "Id", "Id");
            return View();
        }

        // POST: Inventarios/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdInventario,FechaIngresoProducto,CantidadProducto,IdDelProducto,CantidadInsumo,IdInsumos,FechaIngresoInsumos")] Inventario inventario)
        {
            if (ModelState.IsValid)
            {
                _context.Add(inventario);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdDelProducto"] = new SelectList(_context.Productos, "IdProducto", "IdProducto", inventario.IdDelProducto);
            ViewData["IdInsumos"] = new SelectList(_context.Insumos, "Id", "Id", inventario.IdInsumos);
            return View(inventario);
        }

        // GET: Inventarios/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var inventario = await _context.Inventario.FindAsync(id);
            if (inventario == null)
            {
                return NotFound();
            }
            ViewData["IdDelProducto"] = new SelectList(_context.Productos, "IdProducto", "IdProducto", inventario.IdDelProducto);
            ViewData["IdInsumos"] = new SelectList(_context.Insumos, "Id", "Id", inventario.IdInsumos);
            return View(inventario);
        }

        // POST: Inventarios/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdInventario,FechaIngresoProducto,CantidadProducto,IdDelProducto,CantidadInsumo,IdInsumos,FechaIngresoInsumos")] Inventario inventario)
        {
            if (id != inventario.IdInventario)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(inventario);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!InventarioExists(inventario.IdInventario))
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
            ViewData["IdDelProducto"] = new SelectList(_context.Productos, "IdProducto", "IdProducto", inventario.IdDelProducto);
            ViewData["IdInsumos"] = new SelectList(_context.Insumos, "Id", "Id", inventario.IdInsumos);
            return View(inventario);
        }

        // GET: Inventarios/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var inventario = await _context.Inventario
                .Include(i => i.IdDelProductoNavigation)
                .Include(i => i.IdInsumosNavigation)
                .FirstOrDefaultAsync(m => m.IdInventario == id);
            if (inventario == null)
            {
                return NotFound();
            }

            return View(inventario);
        }

        // POST: Inventarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var inventario = await _context.Inventario.FindAsync(id);
            _context.Inventario.Remove(inventario);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool InventarioExists(int id)
        {
            return _context.Inventario.Any(e => e.IdInventario == id);
        }
    }
}

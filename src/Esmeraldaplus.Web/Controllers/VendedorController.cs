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
    public class VendedorController : Controller
    {
        private readonly EsmeraldaplusDbContext _context;

        public VendedorController(EsmeraldaplusDbContext context)
        {
            _context = context;
        }

        // GET: Vendedors
        public async Task<IActionResult> Index()
        {
            var esmeraldaplusDbContext = _context.Vendedor.Include(v => v.CodTelefonNavigation).Include(v => v.IdRolesNavigation);
            return View(await esmeraldaplusDbContext.ToListAsync());
        }

        // GET: Vendedors/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var vendedor = await _context.Vendedor
                .Include(v => v.CodTelefonNavigation)
                .Include(v => v.IdRolesNavigation)
                .FirstOrDefaultAsync(m => m.IdVendedor == id);
            if (vendedor == null)
            {
                return NotFound();
            }

            return View(vendedor);
        }

        // GET: Vendedors/Create
        public IActionResult Create()
        {
            ViewData["CodTelefon"] = new SelectList(_context.TipoDeNumero, "CodTelefon", "CodTelefon");
            ViewData["IdRoles"] = new SelectList(_context.Roles, "IdRoles", "IdRoles");
            return View();
        }

        // POST: Vendedors/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdVendedor,PrimerNombre,SegundoNombre,PrimerApellido,SegundoApellido,Direccion,CodTelefon,Telefon,IdRoles")] Vendedor vendedor)
        {
            if (ModelState.IsValid)
            {
                _context.Add(vendedor);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CodTelefon"] = new SelectList(_context.TipoDeNumero, "CodTelefon", "CodTelefon", vendedor.CodTelefon);
            ViewData["IdRoles"] = new SelectList(_context.Roles, "IdRoles", "IdRoles", vendedor.IdRoles);
            return View(vendedor);
        }

        // GET: Vendedors/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var vendedor = await _context.Vendedor.FindAsync(id);
            if (vendedor == null)
            {
                return NotFound();
            }
            ViewData["CodTelefon"] = new SelectList(_context.TipoDeNumero, "CodTelefon", "CodTelefon", vendedor.CodTelefon);
            ViewData["IdRoles"] = new SelectList(_context.Roles, "IdRoles", "IdRoles", vendedor.IdRoles);
            return View(vendedor);
        }

        // POST: Vendedors/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdVendedor,PrimerNombre,SegundoNombre,PrimerApellido,SegundoApellido,Direccion,CodTelefon,Telefon,IdRoles")] Vendedor vendedor)
        {
            if (id != vendedor.IdVendedor)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(vendedor);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!VendedorExists(vendedor.IdVendedor))
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
            ViewData["CodTelefon"] = new SelectList(_context.TipoDeNumero, "CodTelefon", "CodTelefon", vendedor.CodTelefon);
            ViewData["IdRoles"] = new SelectList(_context.Roles, "IdRoles", "IdRoles", vendedor.IdRoles);
            return View(vendedor);
        }

        // GET: Vendedors/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var vendedor = await _context.Vendedor
                .Include(v => v.CodTelefonNavigation)
                .Include(v => v.IdRolesNavigation)
                .FirstOrDefaultAsync(m => m.IdVendedor == id);
            if (vendedor == null)
            {
                return NotFound();
            }

            return View(vendedor);
        }

        // POST: Vendedors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var vendedor = await _context.Vendedor.FindAsync(id);
            _context.Vendedor.Remove(vendedor);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool VendedorExists(int id)
        {
            return _context.Vendedor.Any(e => e.IdVendedor == id);
        }
    }
}

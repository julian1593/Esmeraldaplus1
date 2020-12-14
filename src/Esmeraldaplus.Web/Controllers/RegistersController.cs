using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Esmeraldaplus.Web.Controllers
{
    public class RegistersController : Controller
    {
        // GET: RegitersController
        public ActionResult Index()
        {
            return View();
        }

        // GET: RegitersController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: RegitersController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RegitersController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: RegitersController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: RegitersController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: RegitersController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: RegitersController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}

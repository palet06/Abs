using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Abs.Models;

namespace Abs.Controllers
{
    public class DashesController : Controller
    {
        private AbsEntities db = new AbsEntities();

        // GET: Dashes
        public ActionResult Index()
        {
            var dash = db.Dash.Include(d => d.Car).Include(d => d.Driver).Include(d => d.Manager);
            return View(dash.ToList());
        }

        // GET: Dashes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dash dash = db.Dash.Find(id);
            if (dash == null)
            {
                return HttpNotFound();
            }
            return View(dash);
        }

        // GET: Dashes/Create
        public ActionResult Create()
        {
            ViewBag.CarId = new SelectList(db.Car, "CarId", "FullName");
            ViewBag.DriverId = new SelectList(db.Driver, "DriverId", "FullName");
            ViewBag.ManagerId = new SelectList(db.Manager, "ManagerId", "FullName");
            return View();
        }

        // POST: Dashes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DashId,DriverId,ManagerId,CarId,Date")] Dash dash)
        {
            if (ModelState.IsValid)
            {
                db.Dash.Add(dash);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CarId = new SelectList(db.Car, "CarId", "Brand", dash.CarId);
            ViewBag.DriverId = new SelectList(db.Driver, "DriverId", "Name", dash.DriverId);
            ViewBag.ManagerId = new SelectList(db.Manager, "ManagerId", "Name", dash.ManagerId);
            return View(dash);
        }

        // GET: Dashes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dash dash = db.Dash.Find(id);
            if (dash == null)
            {
                return HttpNotFound();
            }
            
            ViewBag.CarId = new SelectList(db.Car, "CarId", "FullName", dash.CarId);
            ViewBag.DriverId = new SelectList(db.Driver, "DriverId", "FullName", dash.DriverId);
            ViewBag.ManagerId = new SelectList(db.Manager, "ManagerId", "FullName", dash.ManagerId);
            return View(dash);
        }

        // POST: Dashes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DashId,DriverId,ManagerId,CarId,Date")] Dash dash)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dash).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CarId = new SelectList(db.Car, "CarId", "Model", dash.CarId);
            ViewBag.DriverId = new SelectList(db.Driver, "DriverId", "Name", dash.DriverId);
            ViewBag.ManagerId = new SelectList(db.Manager, "ManagerId", "Name", dash.ManagerId);
            return View(dash);
        }

        // GET: Dashes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dash dash = db.Dash.Find(id);
            if (dash == null)
            {
                return HttpNotFound();
            }
            return View(dash);
        }

        // POST: Dashes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Dash dash = db.Dash.Find(id);
            db.Dash.Remove(dash);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

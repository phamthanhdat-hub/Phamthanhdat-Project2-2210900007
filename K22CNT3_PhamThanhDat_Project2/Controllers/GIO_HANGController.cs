using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using K22CNT3_PhamThanhDat_Project2.Models;

namespace K22CNT3_PhamThanhDat_Project2.Controllers
{
    public class GIO_HANGController : Controller
    {
        private K22CNT3_PhamThanhDat_Project2Entities db = new K22CNT3_PhamThanhDat_Project2Entities();

        // GET: GIO_HANG
        public ActionResult Index()
        {
            var gIO_HANG = db.GIO_HANG.Include(g => g.KHACH_HANG);
            return View(gIO_HANG.ToList());
        }

        // GET: GIO_HANG/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GIO_HANG gIO_HANG = db.GIO_HANG.Find(id);
            if (gIO_HANG == null)
            {
                return HttpNotFound();
            }
            return View(gIO_HANG);
        }

        // GET: GIO_HANG/Create
        public ActionResult Create()
        {
            ViewBag.MaKH = new SelectList(db.KHACH_HANG, "MaKH", "Ho_ten");
            return View();
        }

        // POST: GIO_HANG/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaGioHang,MaKH,MaSP,So_luong,Tong_tien,Ngay_tao,Trang_thai")] GIO_HANG gIO_HANG)
        {
            if (ModelState.IsValid)
            {
                db.GIO_HANG.Add(gIO_HANG);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaKH = new SelectList(db.KHACH_HANG, "MaKH", "Ho_ten", gIO_HANG.MaKH);
            return View(gIO_HANG);
        }

        // GET: GIO_HANG/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GIO_HANG gIO_HANG = db.GIO_HANG.Find(id);
            if (gIO_HANG == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaKH = new SelectList(db.KHACH_HANG, "MaKH", "Ho_ten", gIO_HANG.MaKH);
            return View(gIO_HANG);
        }

        // POST: GIO_HANG/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaGioHang,MaKH,MaSP,So_luong,Tong_tien,Ngay_tao,Trang_thai")] GIO_HANG gIO_HANG)
        {
            if (ModelState.IsValid)
            {
                db.Entry(gIO_HANG).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaKH = new SelectList(db.KHACH_HANG, "MaKH", "Ho_ten", gIO_HANG.MaKH);
            return View(gIO_HANG);
        }

        // GET: GIO_HANG/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GIO_HANG gIO_HANG = db.GIO_HANG.Find(id);
            if (gIO_HANG == null)
            {
                return HttpNotFound();
            }
            return View(gIO_HANG);
        }

        // POST: GIO_HANG/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GIO_HANG gIO_HANG = db.GIO_HANG.Find(id);
            db.GIO_HANG.Remove(gIO_HANG);
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

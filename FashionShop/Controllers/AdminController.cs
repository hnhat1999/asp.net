using FashionShop.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using System.IO;


namespace FashionShop.Controllers
{
    public class AdminController : Controller
    {
        dbQLBansachDataContext data = new dbQLBansachDataContext();
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult laySach(int ?page)
        {
            int pageNumber = (page ?? 1);
            int pageZise = 5;
            return View(data.SACHes.ToList().OrderBy(n => n.Masach).ToPagedList(pageNumber, pageZise));
        }
        //[HttpGet]
        //public ActionResult ThemmoiSach()
        //{
        //    // đưa dữ liệu vào dropdownlist
        //    //lấy dữ liệu từ table chủ đề , sắp xếp tăng dần theo tên chủ đề
        //    ViewBag.MaCD = new SelectList(data.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChuDe");
        //    ViewBag.MaNXB = new SelectList(data.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB");

        //    return View();
        //}
      [HttpGet]
       [ValidateInput(false)]
        public ActionResult ThemmoiSach()
        {
            ViewBag.MaCD = new SelectList(data.CHUDEs.ToList().OrderBy(n => n.TenChuDe), "MaCD", "TenChuDe");
            ViewBag.MaNXB = new SelectList(data.NHAXUATBANs.ToList().OrderBy(n => n.TenNXB), "MaNXB", "TenNXB");
            if (Request.Form.Count > 0)
            {
                SACH s = new SACH();
                s.Tensach = Request.Form["Tensach"];
                s.Giaban = int.Parse(Request.Form["Giaban"]);
                s.Mota = Request.Form["Mota"];
                
                HttpPostedFileBase file = Request.Files["fileupload"];
                s.Ngaycapnhat = DateTime.Parse(Request.Form["Ngaycapnhat"]);
                s.Soluongton = int.Parse(Request.Form["Soluongton"]);
                if(file != null)
                {
                    string serverPath = HttpContext.Server.MapPath("~/Hinh");
                    string filePath = serverPath + "/" + file.FileName;
                    file.SaveAs(filePath);
                    s.Anhbia = file.FileName;
                }
                data.SACHes.InsertOnSubmit(s);
                data.SubmitChanges();
                return RedirectToAction("Index", "BookStore");
            }
            return View();

        }
    }
}
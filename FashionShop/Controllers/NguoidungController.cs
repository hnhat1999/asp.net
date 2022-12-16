using FashionShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace FashionShop.Controllers
{
    public class NguoidungController : Controller
    {
        dbQLBansachDataContext db = new dbQLBansachDataContext();
        // GET: Nguoidung
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(FormCollection collection, KHACHHANG kh)
        {
            // gan cac gia tri nguoi dung nhap lieu cho cac bien
            var hoten = collection["HotenKH"];
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            var matkhaunhaplai = collection["Matkhaunhaplai"];
            var diachi = collection["Diachi"];
            var email = collection["Email"];
            var dienthoai = collection["Dienthoai"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["Ngaysinh"]);
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi01"] = "ho ten khach hang khong duoc de trong";
            }
            else if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi02"] = "phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi03"] = "mật khẩu không được trống";
            }
            else if (String.IsNullOrEmpty(matkhaunhaplai))
            {
                ViewData["Loi04"] = "nhập lại mật khẩu";
            }
            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi05"] = "email không được bỏ trống";
            }
            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi06"] = "phải nhập điện thoại";
            }
            else
            {
                // gan gia trị cho đối tượng được tạo mới (kh)
                kh.HoTen = hoten;
                kh.Taikhoan = tendn;
                kh.Matkhau = matkhau;
                kh.Email = email;
                kh.DiachiKH = diachi;
                db.KHACHHANGs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return RedirectToAction("Dangnhap");
            }
            return this.DangKy();
        }
        [HttpGet]
        public ActionResult Dangnhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangnhap(FormCollection collection)
        {
            //  gán các giá trị người dùng nhập vào cho các biến
            var tenDN = collection["TenDN"];
            var matKhau = collection["Matkhau"];
            if (String.IsNullOrEmpty(tenDN))
            {
                ViewData["Loi1"] = "Chưa nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matKhau))
            {
                ViewData["Loi2"] = "Chưa nhập mật khẩu";
            }
            else
            {
                Admin ad = db.Admins.SingleOrDefault(n => n.UserAdmin == tenDN && n.PassAdmin == matKhau);
                KHACHHANG kh = db.KHACHHANGs.SingleOrDefault(n => n.Taikhoan == tenDN && n.Matkhau == matKhau);
                if (kh != null)
                {
                    ViewBag.Thongbao = "đăng nhập thành công";
                    Session["Taikhoan"] = kh;

                }
                else if (ad != null)
                {
                    ViewBag.Thongbao = "Đăng nhập admin thành công";
                    Session["Taikhoanadmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }

                else
                {
                    ViewBag.Thongbao = "tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }

        public ActionResult DangnhapPartial()
        {

            return PartialView();
        }
        public ActionResult Thongtindangnhap()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session.Remove("Taikhoan");
            ViewBag.Thongtin = "logout thanh cong";
            return RedirectToAction("Index", "BookStore");
            
        }
    }
}
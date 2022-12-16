using FashionShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FashionShop.Controllers
{
    public class GioHangController : Controller
    {
        // tạo đối tượng data chứa dữ liệu từ model Fashion Shop đã tạo
        dbQLBansachDataContext db = new dbQLBansachDataContext();
        public List<Giohang> LayGioHang()
        {
            List<Giohang> lstGioHang = Session["Giohang"] as List<Giohang>;
            if (lstGioHang ==null)
            {
                //  nếu giỏ hàng chưa tồn tại thì  khởi tạo listGioHang
                lstGioHang= new List<Giohang>();
                Session["Giohang"] = lstGioHang;
            }
            return lstGioHang;
        }
        public ActionResult ThemGioHang(int iMasach, string strUrl)
        {
            // lấy ra session giỏ hàng
            List<Giohang> lstGioHang = LayGioHang();
            // kiểm tra danh sách này tồn tại trong  Session["Giohang] chưa ?
            Giohang sanpham = lstGioHang.Find(n => n.iMasach == iMasach);
            if (sanpham == null)
            {
                sanpham = new Giohang(iMasach);
                lstGioHang.Add(sanpham);
                return Redirect(strUrl);
            }
            else
            {
                sanpham.iSoluong++;
                return Redirect(strUrl);
            }
        }
        private  int TongSoLuong()
        {
            int TongSoLuong = 0;
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                TongSoLuong = lstGiohang.Sum(n => n.iSoluong);
            }
            return TongSoLuong;
        }
        private double tongTien()
        {
            double tongTien = 0;
            List<Giohang> lstGiohang = Session["Giohang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                tongTien = lstGiohang.Sum(n => n.dThanhtien);
            }
            return tongTien;
        }
        public ActionResult GioHang()
        {
            List<Giohang> lstGioHang = LayGioHang();
            if (lstGioHang.Count == 0)
            {
                return RedirectToAction("Index", "BookStore");
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = tongTien();
            return View(lstGioHang);
        }
        public ActionResult GiohangPartial()
        {
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = tongTien();
            return PartialView();
        }
        public ActionResult xoaGioHang(int iMaSP)
        {
            // lấy giỏ hàng từ session
            List<Giohang> lstGioHang = LayGioHang();
            // Kiểm tra sách đã có trong Session["Giohang"]
            Giohang sanpham = lstGioHang.SingleOrDefault(n => n.iMasach == iMaSP);
            // nếu tồn tại thì  cho sữa số lượng
            if (sanpham != null)
            {
                lstGioHang.RemoveAll(n => n.iMasach == iMaSP);
                return RedirectToAction("Giohang");
            }
            if(lstGioHang.Count==0)
            {
                return RedirectToAction("Index", "BookStore");
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult CapnhatGiohang(int iMaSP, FormCollection f)
        {
            SACH sach = db.SACHes.SingleOrDefault(n => n.Masach == iMaSP);
                if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            // lấy giỏ hàng từ session
            List<Giohang> lstGioHang = LayGioHang();
            // Kiểm tra sách đã có trong Session ["Giohang"]
            Giohang sanpham = lstGioHang.SingleOrDefault(n => n.iMasach == iMaSP);
            // nếu tồn tại thì cho sữa số lượng
            if (sanpham != null)
            {
                sanpham.iSoluong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("Giohang");
        }
        public ActionResult Suagiohang()
        {
            if (Session["Giohang"] == null)
            {
                return RedirectToAction("Index", "BookStore");
            }
            List<Giohang> lstGioHang = LayGioHang();
            return View(lstGioHang);
        }
        public ActionResult xoaTatCaGioHang()
        {
            // lấy giỏ hàng từ session
            List<Giohang> lstGioHang = LayGioHang();
            lstGioHang.Clear();
            return RedirectToAction("Index", "BookStore");

        }
        [HttpGet]
        public ActionResult DatHang()
        {
            // kiểm tra đăng nhập
            if (Session["Taikhoan"] == null || Session["Taikhoan"].ToString() =="")
            {
                return RedirectToAction("Dangnhap", "Nguoidung");
            }
            if (Session["Giohang"] == null)
            {
                return RedirectToAction("Index", "BookStore");
            }

            // lấy giỏ hàng từ session
            List<Giohang> lstGioHang = LayGioHang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = tongTien();
            return View(lstGioHang);
        }
        [HttpPost]
        public ActionResult DatHang(FormCollection collection)
        {
            // Thêm Đơn Hàng
            DONDATHANG ddh = new DONDATHANG();
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
            List<Giohang> gh = LayGioHang();
            ddh.MaKH = kh.MaKH;
            ddh.Ngaydat = DateTime.Now;
            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["Ngaygiao"]);
            ddh.Ngaygiao = DateTime.Parse(ngaygiao);
            ddh.Tinhtranggiaohang = false;
            ddh.Dathanhtoan = false;
            db.DONDATHANGs.InsertOnSubmit(ddh);
            db.SubmitChanges();
            // thêm chi tiết đơn hàng
            foreach (var item in gh)
            {
                CHITIETDONTHANG ctdh = new CHITIETDONTHANG();
                ctdh.MaDonHang = ddh.MaDonHang;
                ctdh.Masach = item.iMasach;
                ctdh.Soluong = item.iSoluong;
                ctdh.Dongia = (decimal)item.dDongia;
                db.CHITIETDONTHANGs.InsertOnSubmit(ctdh);
            }
            db.SubmitChanges();
            Session["Giohang"] = null;
            return RedirectToAction("Xacnhandonhang", "Giohang");
        }
        public ActionResult xacNhanDonHang()
        {
            return View();
        }
    }
}
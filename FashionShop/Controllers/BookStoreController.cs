using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FashionShop.Models;
using PagedList;
using PagedList.Mvc;
namespace FashionShop.Controllers

{
    public class BookStoreController : Controller
    {
        // tạo đối tượng data chứa dữ liệu từ model dbBanSach đã tạo
        dbQLBansachDataContext data = new dbQLBansachDataContext ();
        // lấy n quyển sách mới        
        private List<SACH> laySachMoi(int count)
        {
            // sắp xếp sách theo ngày cập nhật , sau đó lấy top@count
            return data.SACHes.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }
        public ActionResult Index(int ? page)
        {
            // tạo biến, quy định số sản phẩm mỗi trang
            int pageSize = 5;
            // tạo bi ến số trang
            int pageNum = (page ?? 1);

            // lấy top 5 album bán chạy nhất
            var sachMoi = laySachMoi(5);
            return View(sachMoi.ToPagedList(pageNum, pageSize));
        }
       
        public ActionResult chuDe()
        {
           
            var chude = from cd in data.CHUDEs select cd;
            return PartialView(chude);
        }
        public ActionResult nhaXuatBan()
        {

            var nhaxuatban = from nxb in data.NHAXUATBANs select nxb;
            return PartialView(nhaxuatban);
        }
        public  ActionResult SPTheoChuDe(int id)
        {
            var sach = from s in data.SACHes where s.MaCD == id select s;
            return View(sach);
        }
        public ActionResult SPTheoNXB(int id)
        {
            var sach = from s in data.SACHes where s.MaNXB == id select s;
            return View(sach);
        }
        public ActionResult Details(int id)
        {
            var sach = from s in data.SACHes 
                       where s.Masach == id 
                       select s;
            return View(sach.Single());
        }
    }
}
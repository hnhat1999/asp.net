USE [master]
GO
/****** Object:  Database [QLBANSACH]    Script Date: 9/21/2022 7:31:51 PM ******/
CREATE DATABASE [QLBANSACH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBANSACH', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLBANSACH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBANSACH_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLBANSACH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLBANSACH] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBANSACH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBANSACH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBANSACH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBANSACH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBANSACH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBANSACH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBANSACH] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLBANSACH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBANSACH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBANSACH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBANSACH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBANSACH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBANSACH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBANSACH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBANSACH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBANSACH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLBANSACH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBANSACH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBANSACH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBANSACH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBANSACH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBANSACH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBANSACH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBANSACH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBANSACH] SET  MULTI_USER 
GO
ALTER DATABASE [QLBANSACH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBANSACH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBANSACH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBANSACH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBANSACH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBANSACH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLBANSACH] SET QUERY_STORE = OFF
GO
USE [QLBANSACH]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 9/21/2022 7:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[UserAdmin] [varchar](30) NOT NULL,
	[PassAdmin] [varchar](30) NULL,
	[Hoten] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[UserAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDONTHANG]    Script Date: 9/21/2022 7:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONTHANG](
	[MaDonHang] [int] NOT NULL,
	[Masach] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietDonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[Masach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHUDE]    Script Date: 9/21/2022 7:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUDE](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 9/21/2022 7:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[Dathanhtoan] [bit] NULL,
	[Tinhtranggiaohang] [bit] NULL,
	[Ngaydat] [datetime] NULL,
	[Ngaygiao] [datetime] NULL,
	[MaKH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 9/21/2022 7:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Taikhoan] [varchar](50) NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[DiachiKH] [nvarchar](200) NULL,
	[DienthoaiKH] [varchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAXUATBAN]    Script Date: 9/21/2022 7:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAXUATBAN](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SACH]    Script Date: 9/21/2022 7:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SACH](
	[Masach] [int] IDENTITY(1,1) NOT NULL,
	[Tensach] [nvarchar](100) NOT NULL,
	[Giaban] [decimal](18, 0) NULL,
	[Mota] [nvarchar](max) NULL,
	[Anhbia] [varchar](50) NULL,
	[Ngaycapnhat] [datetime] NULL,
	[Soluongton] [int] NULL,
	[MaCD] [int] NULL,
	[MaNXB] [int] NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[Masach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TACGIA]    Script Date: 9/21/2022 7:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TACGIA](
	[MaTG] [int] IDENTITY(1,1) NOT NULL,
	[TenTG] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](100) NULL,
	[Tieusu] [nvarchar](max) NULL,
	[Dienthoai] [varchar](50) NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIETSACH]    Script Date: 9/21/2022 7:31:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIETSACH](
	[MaTG] [int] NOT NULL,
	[Masach] [int] NOT NULL,
	[Vaitro] [nvarchar](50) NULL,
	[Vitri] [nvarchar](50) NULL,
 CONSTRAINT [PK_CTDatHang] PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC,
	[Masach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [Hoten]) VALUES (N'admin', N'123456', N'Phạm Hồng Nhật')
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [Hoten]) VALUES (N'user', N'123456', N'Nhật User')
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [Masach], [Soluong], [Dongia]) VALUES (1, 8, 1, CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [Masach], [Soluong], [Dongia]) VALUES (2, 9, 1, CAST(6000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [Masach], [Soluong], [Dongia]) VALUES (3, 8, 1, CAST(1650000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[CHUDE] ON 

INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (1, N'Mắt Kính')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (2, N'Túi Xách')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (3, N'Váy')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (4, N'Guốc')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (5, N'Áo')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (6, N'Thắt Lưng')
INSERT [dbo].[CHUDE] ([MaCD], [TenChuDe]) VALUES (8, N'')
SET IDENTITY_INSERT [dbo].[CHUDE] OFF
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (1, 0, 0, CAST(N'2022-09-07T21:39:33.377' AS DateTime), CAST(N'2022-09-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (2, 0, 0, CAST(N'2022-09-18T10:46:15.243' AS DateTime), CAST(N'2022-09-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH]) VALUES (3, 0, 0, CAST(N'2022-09-19T00:36:51.903' AS DateTime), CAST(N'2022-09-19T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (1, N'Phạm Hồng Nhật', N'hnhat9802', N'Money9802', NULL, NULL, NULL, CAST(N'1999-11-07T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[NHAXUATBAN] ON 

INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (1, N'NhaXuatBan1', N'Duong 123', N'098445688')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (2, N'NhaXuatBan2', N'Duong 123', N'0707405029')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (3, N'NhaXuatBan3', N'Duong 123', N'013345789')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (4, N'NhaXuatBan4', N'Duong 123', N'0984134148')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (5, N'NhaXuatBan5', N'Duong 123', N'0987566666')
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [Diachi], [DienThoai]) VALUES (6, N'NhaXuatBan6', N'Duong 123', N'0199999999')
SET IDENTITY_INSERT [dbo].[NHAXUATBAN] OFF
GO
SET IDENTITY_INSERT [dbo].[SACH] ON 

INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (3, N'Mắt Kính YOON
', CAST(1650000 AS Decimal(18, 0)), N'Lấy cảm hứng từ dáng kính panto cổ điển kết hợp với nét mềm mại, Yoon là phiên bản cải tiến từ những thiết kế all-time favorite tại SEESON.', N'matkinh01.jpg', CAST(N'1999-01-01T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (5, N'Mắt Kính OSCAR', CAST(1650000 AS Decimal(18, 0)), N'Được phát triển với định hướng thiết kế mỏng hơn và giảm trọng lượng, Oscar là phiên bản cải tiến, nhẹ hơn so với các tiền sản phẩm.', N'matkinh02.jpg', CAST(N'1999-01-01T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (6, N'Mắt Kính TROYE', CAST(1650000 AS Decimal(18, 0)), N'Được phát triển từ những dáng mắt cơ bản được yêu thích nhất tại SEESON nhưng được cải tiến với thiết kế mỏng hơn và giảm trọng lượng, gia tăng độ thoải mái cho người dùng.', N'matkinh03.jpg', CAST(N'1999-01-01T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (7, N'Mắt Kính RAFAEL', CAST(1650000 AS Decimal(18, 0)), N'Thiết kế gọng chữ nhật là đặc trưng trong design của Rafael, được cải tiến từ các mẫu kính bestseller của SEESON.', N'matkinh04.jpg', CAST(N'1999-01-01T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (8, N'Mắt Kính ATSUKI', CAST(1650000 AS Decimal(18, 0)), N'Atsuki được phát triển từ những thiết kế best-selling items nhưng được cải tiến với phần tròng kính mỏng hơn cùng trọng lượng giảm tối đa.', N'matkinh05.jpg', CAST(N'1999-01-01T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (9, N'Túi Xách 1', CAST(1300000 AS Decimal(18, 0)), N'Túi sách hàng hiệu đẹp', N'tuixach01.jpg', CAST(N'1999-01-01T00:00:00.000' AS DateTime), 1, 2, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (13, N'Túi Xách 2', CAST(1300000 AS Decimal(18, 0)), N'Túi sách hàng hiệu đẹp', N'tuixach02.jpg', NULL, 1, 2, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (14, N'Túi Xách 3', CAST(1300000 AS Decimal(18, 0)), N'Túi sách hàng hiệu đẹp', N'tuixach03.jpg', NULL, 1, 2, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (15, N'Túi Xách 4', CAST(1300000 AS Decimal(18, 0)), N'Túi sách hàng hiệu đẹp', N'tuixach04.jpg', NULL, 1, 2, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (16, N'Túi Xách 5', CAST(1300000 AS Decimal(18, 0)), N'Túi sách hàng hiệu đẹp', N'tuixach05.jpg', NULL, 1, 2, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (17, N'Túi Xách 6', CAST(1300000 AS Decimal(18, 0)), N'Túi sách hàng hiệu đẹp', N'tuixach06.jpg', NULL, 1, 2, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (18, N'Túi Xách 7', CAST(1300000 AS Decimal(18, 0)), N'Túi sách hàng hiệu đẹp', N'tuixach07.jpg', NULL, 1, 2, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (27, N'Váy 1', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay01.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (28, N'Váy 2', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay02.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (29, N'Váy 3', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay03.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (30, N'Váy 4', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay04.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (31, N'Váy 5', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay05.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (32, N'Váy 6', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay06.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (33, N'Váy 7', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay07.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (34, N'Váy 8', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay08.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (35, N'Váy 9', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay09.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (36, N'Váy 10', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay10.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (37, N'Váy 11', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay11.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (38, N'Váy 12', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay12.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (39, N'Váy 13', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay13.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (40, N'Váy 14', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay14.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (41, N'Váy 15', CAST(1000000 AS Decimal(18, 0)), N'Váy nhập khẩu', N'vay15.jpg', NULL, 1, 3, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (42, N'Giày 1', CAST(1500000 AS Decimal(18, 0)), N'Giày nhập khẩu', N'giay01.jpg', NULL, 1, 4, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (49, N'Giày 2', CAST(1500000 AS Decimal(18, 0)), N'Giày nhập khẩu', N'giay02.jpg', NULL, 1, 4, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (50, N'Giày 3', CAST(1500000 AS Decimal(18, 0)), N'Giày nhập khẩu', N'giay03.jpg', NULL, 1, 4, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (51, N'Giày 4', CAST(1500000 AS Decimal(18, 0)), N'Giày nhập khẩu', N'giay04.jpg', NULL, 1, 4, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (52, N'Giày 5', CAST(1500000 AS Decimal(18, 0)), N'Giày nhập khẩu', N'giay05.jpg', NULL, 1, 4, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (53, N'Giày 6', CAST(1500000 AS Decimal(18, 0)), N'Giày nhập khẩu', N'giay06.jpg', NULL, 1, 4, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (54, N'Giày 7', CAST(1500000 AS Decimal(18, 0)), N'Giày nhập khẩu', N'giay07.jpg', NULL, 1, 4, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (55, N'Giày 8', CAST(1500000 AS Decimal(18, 0)), N'Giày nhập khẩu', N'giay08.jpg', NULL, 1, 4, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (56, N'Áo 1', CAST(1500000 AS Decimal(18, 0)), N'ÁO KIỂU SƠMI CỔ V', N'ao01.jpg', NULL, 1, 5, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (57, N'Áo 2', CAST(1500000 AS Decimal(18, 0)), N'
ÁO REN CỔ TRỤ TAY BÍ', N'ao02.jpg', NULL, 1, 5, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (58, N'Áo 3', CAST(1500000 AS Decimal(18, 0)), N'Trắng
Đen
Xám
ÁO PEPLUM KIỂU TAY RỜI', N'ao03.jpg', NULL, 1, 5, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (59, N'Áo 4', CAST(1500000 AS Decimal(18, 0)), N'ÁO THUN FORM RỘNG IN “LOFI MIX”', N'ao04.jpg', NULL, 1, 5, 1)
INSERT [dbo].[SACH] ([Masach], [Tensach], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaCD], [MaNXB]) VALUES (60, N'Áo 5', CAST(1500000 AS Decimal(18, 0)), N'ÁO KIỂU CROP 2 DÂY', N'ao05', NULL, 1, 5, 1)
SET IDENTITY_INSERT [dbo].[SACH] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__7FB3F64F2B907047]    Script Date: 9/21/2022 7:31:52 PM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__7FB3F64FDF63E0CB]    Script Date: 9/21/2022 7:31:52 PM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__A9D105348405F00A]    Script Date: 9/21/2022 7:31:52 PM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__A9D10534A54E1DCA]    Script Date: 9/21/2022 7:31:52 PM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONDATHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONDATHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD FOREIGN KEY([Masach])
REFERENCES [dbo].[SACH] ([Masach])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD FOREIGN KEY([Masach])
REFERENCES [dbo].[SACH] ([Masach])
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_Chude] FOREIGN KEY([MaCD])
REFERENCES [dbo].[CHUDE] ([MaCD])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_Chude]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_NhaXB] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NHAXUATBAN] ([MaNXB])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_NhaXB]
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD FOREIGN KEY([Masach])
REFERENCES [dbo].[SACH] ([Masach])
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD FOREIGN KEY([Masach])
REFERENCES [dbo].[SACH] ([Masach])
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD FOREIGN KEY([MaTG])
REFERENCES [dbo].[TACGIA] ([MaTG])
GO
ALTER TABLE [dbo].[VIETSACH]  WITH CHECK ADD FOREIGN KEY([MaTG])
REFERENCES [dbo].[TACGIA] ([MaTG])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Dongia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Dongia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Soluong]>(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Soluong]>(0)))
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD CHECK  (([Giaban]>=(0)))
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD CHECK  (([Giaban]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [QLBANSACH] SET  READ_WRITE 
GO

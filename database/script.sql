USE [master]
GO
/****** Object:  Database [QuanLyNhaKho]    Script Date: 4/12/2017 2:15:34 PM ******/
CREATE DATABASE [QuanLyNhaKho]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyNhaKho', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyNhaKho.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyNhaKho_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyNhaKho_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyNhaKho] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyNhaKho].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyNhaKho] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyNhaKho] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyNhaKho] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyNhaKho] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyNhaKho] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyNhaKho] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyNhaKho] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyNhaKho] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyNhaKho] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyNhaKho] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyNhaKho] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyNhaKho] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyNhaKho]
GO
/****** Object:  UserDefinedFunction [dbo].[func_ma_next]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_ma_next](@last_ma varchar(10),@char1 varchar(6),@size int) returns varchar(10)
		as
		begin
			if(@last_ma='')
				set @last_ma=@char1+REPLICATE(0,@size-LEN(@char1))
			declare @num_next_ma int,@next_ma varchar(10)
			set @last_ma=LTRIM(RTRIM(@last_ma))
			set @num_next_ma=REPLACE(@last_ma,@char1,'')+1
			set @size=@size-len(@char1)
			set @next_ma=@char1 + REPLICATE(0,@size-LEN(@char1))
			set @next_ma=@char1+RIGHT(REPLICATE(0,@size)+CONVERT(varchar(MAX),@num_next_ma),@size)
			return @next_ma
		end
GO
/****** Object:  Table [dbo].[CHITIETPHIEUNHAP]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETPHIEUNHAP](
	[MaPN] [char](10) NOT NULL,
	[MaHH] [char](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[ThanhTien] [float] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETPHIEUNHAP] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHITIETPHIEUXUAT]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETPHIEUXUAT](
	[MaPX] [char](10) NOT NULL,
	[MaHH] [char](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[ThanhTien] [float] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHITIETPHIEUXUAT] PRIMARY KEY CLUSTERED 
(
	[MaPX] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUAHANG]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUAHANG](
	[MaCH] [char](10) NOT NULL,
	[TenCH] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[SDT] [decimal](12, 0) NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_CUAHANG] PRIMARY KEY CLUSTERED 
(
	[MaCH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DANGNHAP]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANGNHAP](
	[UserName] [nchar](50) NOT NULL,
	[Password] [nchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HANGHOA]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HANGHOA](
	[MaHH] [char](10) NOT NULL,
	[MaNhom] [char](10) NOT NULL,
	[TenHang] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[DonViTinh] [nchar](10) NULL,
	[GiaNhap] [float] NULL,
	[GiaXuat] [float] NULL,
	[NSX] [date] NULL,
	[HSD] [date] NULL,
	[ThongTin] [nvarchar](50) NULL,
 CONSTRAINT [PK_HANGHOA] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MaNCC] [char](10) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[SDT] [decimal](12, 0) NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [char](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nchar](10) NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[SDT] [decimal](11, 0) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHOMHANG]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHOMHANG](
	[MaNhom] [char](10) NOT NULL,
	[TenNhom] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHOMHANG] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHIEUNHAP]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHIEUNHAP](
	[MaPN] [char](10) NOT NULL,
	[MaNCC] [char](10) NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[TongTien] [float] NOT NULL,
	[ChietKhau] [int] NULL,
	[ThanhTien] [float] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_PHIEUNHAP_1] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHIEUXUAT]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHIEUXUAT](
	[MaPX] [char](10) NOT NULL,
	[MaCH] [char](10) NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[NgayXuat] [date] NOT NULL,
	[TongTien] [float] NOT NULL,
	[ChietKhau] [int] NULL,
	[ThanhTien] [float] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_PHIEUXUAT_1] PRIMARY KEY CLUSTERED 
(
	[MaPX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CHITIETPHIEUNHAP] ([MaPN], [MaHH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (N'PN001     ', N'HH001     ', 10, 1200, 12000, NULL)
INSERT [dbo].[CHITIETPHIEUNHAP] ([MaPN], [MaHH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (N'PN001     ', N'HH002     ', 4, 1400, 5600, NULL)
INSERT [dbo].[CHITIETPHIEUNHAP] ([MaPN], [MaHH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (N'PN002     ', N'HH002     ', 12, 1300, 13000, NULL)
INSERT [dbo].[CHITIETPHIEUXUAT] ([MaPX], [MaHH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (N'PX001     ', N'HH001     ', 3, 1200, 3600, NULL)
INSERT [dbo].[CHITIETPHIEUXUAT] ([MaPX], [MaHH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (N'PX001     ', N'HH003     ', 4, 3000, 12000, NULL)
INSERT [dbo].[CHITIETPHIEUXUAT] ([MaPX], [MaHH], [SoLuong], [DonGia], [ThanhTien], [GhiChu]) VALUES (N'PX002     ', N'HH002     ', 4, 5000, 20000, NULL)
INSERT [dbo].[CUAHANG] ([MaCH], [TenCH], [DiaChi], [SDT], [GhiChu]) VALUES (N'CH001     ', N'Thuan Envity', N'Nam Dinh', CAST(12321 AS Decimal(12, 0)), NULL)
INSERT [dbo].[CUAHANG] ([MaCH], [TenCH], [DiaChi], [SDT], [GhiChu]) VALUES (N'CH002     ', N'Du Tran May Tinh', N'Nam Dinh', CAST(32423 AS Decimal(12, 0)), NULL)
INSERT [dbo].[CUAHANG] ([MaCH], [TenCH], [DiaChi], [SDT], [GhiChu]) VALUES (N'CH003     ', N'Quan Ao Envity', N'Ha Noi', CAST(43212 AS Decimal(12, 0)), NULL)
INSERT [dbo].[DANGNHAP] ([UserName], [Password]) VALUES (N'admin                                             ', N'admin                                             ')
INSERT [dbo].[DANGNHAP] ([UserName], [Password]) VALUES (N'                                                  ', N'                                                  ')
INSERT [dbo].[HANGHOA] ([MaHH], [MaNhom], [TenHang], [SoLuong], [DonViTinh], [GiaNhap], [GiaXuat], [NSX], [HSD], [ThongTin]) VALUES (N'HH001     ', N'NH01      ', N'HP', 100, N'chiec     ', 10000, 12000, CAST(N'2017-04-03' AS Date), CAST(N'2022-03-03' AS Date), N'May tinh tam trung')
INSERT [dbo].[HANGHOA] ([MaHH], [MaNhom], [TenHang], [SoLuong], [DonViTinh], [GiaNhap], [GiaXuat], [NSX], [HSD], [ThongTin]) VALUES (N'HH002     ', N'NH01      ', N'DELL', 100, N'chiec     ', 10000, 12000, CAST(N'2017-04-03' AS Date), CAST(N'2022-03-03' AS Date), NULL)
INSERT [dbo].[HANGHOA] ([MaHH], [MaNhom], [TenHang], [SoLuong], [DonViTinh], [GiaNhap], [GiaXuat], [NSX], [HSD], [ThongTin]) VALUES (N'HH003     ', N'NH02      ', N'SUIT', 100, N'cai       ', 1000, 1200, CAST(N'2017-05-04' AS Date), CAST(N'2018-04-04' AS Date), NULL)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [SDT], [GhiChu]) VALUES (N'NCC001    ', N'Tran Anh', N'Ha Noi', CAST(32323 AS Decimal(12, 0)), N'')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [SDT], [GhiChu]) VALUES (N'NCC002    ', N'The Gioi Di Dong', N'Ha Nam', CAST(232423 AS Decimal(12, 0)), NULL)
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [SDT], [GhiChu]) VALUES (N'NCC003    ', N'Tiki', N'Ha Tay', CAST(2345234 AS Decimal(12, 0)), NULL)
INSERT [dbo].[NHANVIEN] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV001     ', N'Nguyen Van Thuan', CAST(N'1996-08-26' AS Date), N'Nam       ', N'Ha Noi', CAST(23423 AS Decimal(11, 0)))
INSERT [dbo].[NHANVIEN] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV002     ', N'Tran Van Du', CAST(N'1995-03-03' AS Date), N'Nu        ', N'Ha Noi', CAST(345234524 AS Decimal(11, 0)))
INSERT [dbo].[NHANVIEN] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV003     ', N'Tran Van Du1', CAST(N'1995-03-03' AS Date), N'Nam       ', N'Ha Nam', CAST(9345234 AS Decimal(11, 0)))
INSERT [dbo].[NHOMHANG] ([MaNhom], [TenNhom], [SoLuong], [GhiChu]) VALUES (N'NH01      ', N'May Tinh', 0, NULL)
INSERT [dbo].[NHOMHANG] ([MaNhom], [TenNhom], [SoLuong], [GhiChu]) VALUES (N'NH02      ', N'Quan Ao', 0, NULL)
INSERT [dbo].[NHOMHANG] ([MaNhom], [TenNhom], [SoLuong], [GhiChu]) VALUES (N'NH03      ', N'Do Uong', 0, NULL)
INSERT [dbo].[PHIEUNHAP] ([MaPN], [MaNCC], [MaNV], [NgayNhap], [TongTien], [ChietKhau], [ThanhTien], [GhiChu]) VALUES (N'PN001     ', N'NCC001    ', N'NV001     ', CAST(N'2017-05-05' AS Date), 100000, NULL, NULL, NULL)
INSERT [dbo].[PHIEUNHAP] ([MaPN], [MaNCC], [MaNV], [NgayNhap], [TongTien], [ChietKhau], [ThanhTien], [GhiChu]) VALUES (N'PN002     ', N'NCC002    ', N'NV001     ', CAST(N'2017-05-05' AS Date), 10200, NULL, NULL, NULL)
INSERT [dbo].[PHIEUNHAP] ([MaPN], [MaNCC], [MaNV], [NgayNhap], [TongTien], [ChietKhau], [ThanhTien], [GhiChu]) VALUES (N'PN003     ', N'NCC003    ', N'NV002     ', CAST(N'2017-04-04' AS Date), 102000, NULL, NULL, NULL)
INSERT [dbo].[PHIEUXUAT] ([MaPX], [MaCH], [MaNV], [NgayXuat], [TongTien], [ChietKhau], [ThanhTien], [GhiChu]) VALUES (N'PX001     ', N'CH001     ', N'NV001     ', CAST(N'2017-05-05' AS Date), 102200, NULL, NULL, NULL)
INSERT [dbo].[PHIEUXUAT] ([MaPX], [MaCH], [MaNV], [NgayXuat], [TongTien], [ChietKhau], [ThanhTien], [GhiChu]) VALUES (N'PX002     ', N'CH002     ', N'NV003     ', CAST(N'2017-04-03' AS Date), 102000, NULL, NULL, NULL)
INSERT [dbo].[PHIEUXUAT] ([MaPX], [MaCH], [MaNV], [NgayXuat], [TongTien], [ChietKhau], [ThanhTien], [GhiChu]) VALUES (N'PX003     ', N'CH003     ', N'NV002     ', CAST(N'2017-04-03' AS Date), 103000, NULL, NULL, NULL)
ALTER TABLE [dbo].[CHITIETPHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEUNHAP_HANGHOA] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HANGHOA] ([MaHH])
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAP] CHECK CONSTRAINT [FK_CHITIETPHIEUNHAP_HANGHOA]
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEUNHAP_PHIEUNHAP] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PHIEUNHAP] ([MaPN])
GO
ALTER TABLE [dbo].[CHITIETPHIEUNHAP] CHECK CONSTRAINT [FK_CHITIETPHIEUNHAP_PHIEUNHAP]
GO
ALTER TABLE [dbo].[CHITIETPHIEUXUAT]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEUXUAT_HANGHOA] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HANGHOA] ([MaHH])
GO
ALTER TABLE [dbo].[CHITIETPHIEUXUAT] CHECK CONSTRAINT [FK_CHITIETPHIEUXUAT_HANGHOA]
GO
ALTER TABLE [dbo].[CHITIETPHIEUXUAT]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEUXUAT_PHIEUXUAT] FOREIGN KEY([MaPX])
REFERENCES [dbo].[PHIEUXUAT] ([MaPX])
GO
ALTER TABLE [dbo].[CHITIETPHIEUXUAT] CHECK CONSTRAINT [FK_CHITIETPHIEUXUAT_PHIEUXUAT]
GO
ALTER TABLE [dbo].[HANGHOA]  WITH CHECK ADD  CONSTRAINT [FK_HANGHOA_NHOMHANG] FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NHOMHANG] ([MaNhom])
GO
ALTER TABLE [dbo].[HANGHOA] CHECK CONSTRAINT [FK_HANGHOA_NHOMHANG]
GO
ALTER TABLE [dbo].[PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUNHAP_NHACUNGCAP] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNCC])
GO
ALTER TABLE [dbo].[PHIEUNHAP] CHECK CONSTRAINT [FK_PHIEUNHAP_NHACUNGCAP]
GO
ALTER TABLE [dbo].[PHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUNHAP_NHANVIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[PHIEUNHAP] CHECK CONSTRAINT [FK_PHIEUNHAP_NHANVIEN]
GO
ALTER TABLE [dbo].[PHIEUXUAT]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUXUAT_CUAHANG] FOREIGN KEY([MaCH])
REFERENCES [dbo].[CUAHANG] ([MaCH])
GO
ALTER TABLE [dbo].[PHIEUXUAT] CHECK CONSTRAINT [FK_PHIEUXUAT_CUAHANG]
GO
ALTER TABLE [dbo].[PHIEUXUAT]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUXUAT_NHANVIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[PHIEUXUAT] CHECK CONSTRAINT [FK_PHIEUXUAT_NHANVIEN]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCH]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------ DeleteCH
create proc [dbo].[DeleteCH] (@MaCH char(10))
as
begin 
	Delete CUAHANG
	where MaCH=@MaCH
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteHangHoa]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- Delete Hang Hoa 
create proc [dbo].[DeleteHangHoa](@MaHH char(10))
as 
begin
	Delete HANGHOA
	where MaHH=@MaHH
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteNCC]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteNCC](@MaNCC char(10))
as
begin 
	Delete NHACUNGCAP
	where MaNCC=@MaNCC
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteNhanVien]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteNhanVien](@MaNV char(10))
as
begin 
	Delete NHANVIEN
	where MaNV = @MaNV
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteNhomHang]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[DeleteNhomHang](@MaNhom char(10))
as
begin 
	Delete NHOMHANG
	where MaNhom=@MaNhom
end
GO
/****** Object:  StoredProcedure [dbo].[DeletePhieuNhap]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------- Delete PhieuNhap
create proc [dbo].[DeletePhieuNhap] (@MaPN char(10))
as 
begin 
	Delete PHIEUNHAP
	where MaPN=@MaPN
end
GO
/****** Object:  StoredProcedure [dbo].[DeletePX]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------ DeletePX
create proc [dbo].[DeletePX](@MaPX char(10))
as
begin 
	Delete PHIEUXUAT
	where MaPX=@MaPX
end
GO
/****** Object:  StoredProcedure [dbo].[GetListCH]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetListCH]
as
begin 
	select *from CUAHANG
end
GO
/****** Object:  StoredProcedure [dbo].[GetListCTPNByMaPN]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetListCTPNByMaPN] (@MaPN char (10))
as
begin
	select NHOMHANG.TenNhom, HANGHOA.MaHH,HANGHOA.TenHang,CHITIETPHIEUNHAP.SoLuong,CHITIETPHIEUNHAP.DonGia,CHITIETPHIEUNHAP.ThanhTien,CHITIETPHIEUNHAP.GhiChu
	from HANGHOA,CHITIETPHIEUNHAP,NHOMHANG
	where MaPN=@MaPN and HANGHOA.MaHH = CHITIETPHIEUNHAP.MaHH and HANGHOA.MaNhom = NHOMHANG.MaNhom
end
GO
/****** Object:  StoredProcedure [dbo].[GetListCTPXByMaPX]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetListCTPXByMaPX] (@MaPX char (10))
as
begin
	select NHOMHANG.TenNhom, HANGHOA.MaHH,HANGHOA.TenHang,CHITIETPHIEUXUAT.SoLuong,CHITIETPHIEUXUAT.DonGia,CHITIETPHIEUXUAT.ThanhTien,CHITIETPHIEUXUAT.GhiChu
	from HANGHOA,CHITIETPHIEUXUAT,NHOMHANG
	where MaPX=@MaPX and HANGHOA.MaHH = CHITIETPHIEUXUAT.MaHH and HANGHOA.MaNhom = NHOMHANG.MaNhom
end
GO
/****** Object:  StoredProcedure [dbo].[GetListHangHoa]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetListHangHoa]
as 
 begin 
	select *from HANGHOA
end

GO
/****** Object:  StoredProcedure [dbo].[GetListNCC]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------- GetListNCC
create proc [dbo].[GetListNCC]
as
begin 
	select *from NHACUNGCAP
end
GO
/****** Object:  StoredProcedure [dbo].[GetListNhanVien]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetListNhanVien]
as
begin
	select *from NHANVIEN
	
end 
GO
/****** Object:  StoredProcedure [dbo].[GetListNhomHang]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetListNhomHang] 
as
begin 
	select *from NHOMHANG
end
GO
/****** Object:  StoredProcedure [dbo].[GetMaCHNext]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMaCHNext]
as
begin 
	select dbo.func_ma_next((select top 1 MaCH from CUAHANG order by  MaCH desc),'CH','5') as MaCH
end
GO
/****** Object:  StoredProcedure [dbo].[GetMaHHNext]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMaHHNext]
as 
begin 
	select  dbo.func_ma_next ((select top 1 MaHH from HANGHOA order by MaHH desc),'HH','5') as MaHH
end

GO
/****** Object:  StoredProcedure [dbo].[GetMaNCCNext]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetMaNCCNext]
as
begin	
	select dbo.func_ma_next ((select top 1 MaNCC from NHACUNGCAP order by MaNCC desc),'NCC','6') as MaNCC
end
GO
/****** Object:  StoredProcedure [dbo].[GetMaNhomHangNext]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMaNhomHangNext]
as
begin 
	select dbo.func_ma_next((select top 1 MaNhom from NHOMHANG order by MaNhom desc),'NH','4')as MaNhom
end
GO
/****** Object:  StoredProcedure [dbo].[GetMaNVNext]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMaNVNext]
as 
	begin 

	select dbo.func_ma_next((select top 1 MaNV from NHANVIEN order by MaNV desc),'NV','5')as MaNV

end
GO
/****** Object:  StoredProcedure [dbo].[InsertCH]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------ InsertCH
create proc [dbo].[InsertCH](@MaCH char(10),@TenCH nvarchar(10),@DiaChi nvarchar(50),@SDT decimal(12,0),@GhiChu nvarchar(50))
as
begin 
	Insert into CUAHANG(MaCH,TenCH,DiaChi,SDT,GhiChu) values (@MaCH,@TenCH,@DiaChi,@SDT,@GhiChu)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertCTPN]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- InsertCTPN
create proc [dbo].[InsertCTPN](@MaPN char(10),@MaHH char(10),@SoLuong int,@GhiChu nvarchar(50))
as
begin 
	declare @DonGia int 
	set @DonGia=(select GiaNhap from HANGHOA where MaHH = @MaHH)
	if not exists ( select *from CHITIETPHIEUNHAP
					where MaHH=@MaHH and MaPN=@MaPN)
		begin 
			declare @ThanhTien float 
			set @ThanhTien = @DonGia *@SoLuong
			insert into CHITIETPHIEUNHAP(MaPN,MaHH,SoLuong,DonGia,ThanhTien,GhiChu) values (@MaPN,@MaHH,@SoLuong,@DonGia,@ThanhTien,@GhiChu)
		end
	else
		begin 
			declare @SoLuongHangHienTai int 
			set @SoLuongHangHienTai= (select SoLuong from CHITIETPHIEUNHAP where MaPN=@MaPN and MaHH=@MaHH)

			Update CHITIETPHIEUNHAP
			set SoLuong=@SoLuong+@SoLuongHangHienTai, DonGia=@DonGia,ThanhTien=(@SoLuong+@SoLuongHangHienTai)*@DonGia,GhiChu=@GhiChu
			where MaHH=@MaHH and MaPN=@MaPN
		end
end
GO
/****** Object:  StoredProcedure [dbo].[InsertCTPX]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertCTPX](@MaPX char(10),@MaHH char(10),@SoLuong int,@GhiChu nvarchar(50))
as
begin 
	declare @DonGia int 
	set @DonGia=(select GiaNhap from HANGHOA where MaHH = @MaHH)
	if not exists ( select *from CHITIETPHIEUXUAT
					where MaHH=@MaHH and MaPX=@MaPX)
		begin 
			declare @ThanhTien float 
			set @ThanhTien = @DonGia *@SoLuong
			insert into CHITIETPHIEUXUAT(MaPX,MaHH,SoLuong,DonGia,ThanhTien,GhiChu) values (@MaPX,@MaHH,@SoLuong,@DonGia,@ThanhTien,@GhiChu)
		end
	else
		begin 
			declare @SoLuongHangHienTai int 
			set @SoLuongHangHienTai= (select SoLuong from CHITIETPHIEUXUAT where MaPX=@MaPX and MaHH=@MaHH)

			Update CHITIETPHIEUXUAT
			set SoLuong=@SoLuong+@SoLuongHangHienTai, DonGia=@DonGia,ThanhTien=(@SoLuong+@SoLuongHangHienTai)*@DonGia,GhiChu=@GhiChu
			where MaHH=@MaHH and MaPX=@MaPX
		end
end
GO
/****** Object:  StoredProcedure [dbo].[InsertHangHoa]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsertHangHoa](@MaHH char(10),@MaNhom char(10),@TenHang nvarchar(50)
		,@SoLuong int,@DonViTinh nchar(10)
		,@GiaNhap float,@GiaXuat float, @NSX date,@HSD date,@ThongTin nvarchar(50))
as 
begin 
	Insert into HANGHOA (MaHH,MaNhom,TenHang,SoLuong,DonViTinh,GiaNhap,GiaXuat,NSX,HSD,ThongTin)
			values(@MaHH,@MaNhom,@TenHang,@SoLuong,@DonViTinh,@GiaNhap,@GiaXuat,@NSX,@HSD,@ThongTin)
end




GO
/****** Object:  StoredProcedure [dbo].[InsertNCC]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsertNCC](@MaNCC char(10), @TenNCC nvarchar(50),@DiaChi nvarchar(50),@SDT decimal(12,0),@GhiChu nvarchar(50))
as
begin 
	insert into NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT,GhiChu) values (@MaNCC,@TenNCC,@DiaChi,@SDT,@GhiChu)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertNhanVien]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[InsertNhanVien](@MaNV char(10),@HoTen nvarchar(50), @NgaySinh date,@GioiTinh nchar(10), @DiaChi nvarchar(50), @SDT decimal(12,0))
as
begin 
	insert into NHANVIEN(MaNV,HoTen,NgaySinh,GioiTinh,DiaChi,SDT) values(@MaNV,@HoTen,@NgaySinh,@GioiTinh,@DiaChi,@SDT)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertNhomHang]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsertNhomHang](@MaNhom char(10),@TenNhom nvarchar(50),@SoLuong int, @GhiChu nvarchar(50))
as
begin
	insert into NHOMHANG(MaNhom,TenNhom,SoLuong,GhiChu) values(@MaNhom,@TenNhom,@SoLuong,@GhiChu)
end


GO
/****** Object:  StoredProcedure [dbo].[InsertPhieuNhap]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertPhieuNhap](@MaPN char(10),@MaNCC char(10),@MaNV char(10),@NgayNhap date,@TongTien float,@ChietKhau int,@ThanhTien float,@GhiChu nvarchar(50))
as
begin 
	insert into PHIEUNHAP(MaPN,MaNCC,MaNV,NgayNhap,TongTien,ChietKhau,ThanhTien,GhiChu) values(@MaPN,@MaNCC,@MaNV,@NgayNhap,@TongTien,@ChietKhau,@ThanhTien,@GhiChu)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPX]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsertPX](@MaPX char(10),@MaCH char(10),@MaNV char(10),@NgayXuat date, @TongTien float,@ChietKhau int,@ThanhTien float,@GhiChu nvarchar(50))
as
begin 
	Insert into PHIEUXUAT(MaPX,MaCH,MaNV,NgayXuat,TongTien,ChieuKhau,ThanhTien,GhiChu) values(@MaPX,@MaCH,@MaNV,@NgayXuat,@TongTien,@ChietKhau,@ThanhTien,@GhiChu)
end
GO
/****** Object:  StoredProcedure [dbo].[ListHangHoaByNhomHang]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ListHangHoaByNhomHang](@MaNhom char(10))
as
begin 
	select HANGHOA.MaHH,HANGHOA.TenHang,HANGHOA.SoLuong
	from NHOMHANG, HANGHOA
	where NHOMHANG.MaNhom = HANGHOA.MaNhom and NHOMHANG.MaNhom=@MaNhom
end

GO
/****** Object:  StoredProcedure [dbo].[UpdateCH]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateCH](@MaCH char(10),@TenCH nvarchar(10),@DiaChi nvarchar(50),@SDT decimal(12,0),@GhiChu nvarchar(50))
as 
begin 
	Update CUAHANG
	set TenCH=@TenCH,DiaChi=@DiaChi,SDT=@SDT,GhiChu=@GhiChu
	where MaCH=@MaCH
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateHangHoa]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateHangHoa](@MaHH char(10),@MaNhom char(10),@TenHang nvarchar(50)
						,@SoLuong int,@DonViTinh nchar(10)
						,@GiaNhap float,@GiaXuat float, @NSX date,@HSD date,@ThongTin nvarchar(50))
as 
begin 
	Update HANGHOA
	set MaNhom = @MaNhom,TenHang = @TenHang,SoLuong=@SoLuong,DonViTinh=@DonViTinh
		,GiaNhap=@GiaNhap,GiaXuat=@GiaXuat,NSX=@NSX,HSD=@HSD,ThongTin=@ThongTin
	where MaHH=@MaHH
end

GO
/****** Object:  StoredProcedure [dbo].[UpdateNCC]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateNCC] (@MaNCC char(10), @TenNCC nvarchar(50),@DiaChi nvarchar(50),@SDT decimal(12,0),@GhiChu nvarchar(50))
as
begin 
	Update NHACUNGCAP
	set TenNCC=@TenNCC,DiaChi=@DiaChi,SDT=@SDT,GhiChu=@GhiChu
	where MaNCC=@MaNCC
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateNhanVien]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateNhanVien](@MaNV char(10),@HoTen nvarchar(50), @NgaySinh date,@GioiTinh nchar(10), @DiaChi nvarchar(50), @SDT decimal(12,0))
as
begin 
	update NHANVIEN
	set HoTen=@HoTen,NgaySinh=@NgaySinh,GioiTinh = @GioiTinh,DiaChi=@DiaChi,SDT=@SDT
	where MaNV=@MaNV
end

GO
/****** Object:  StoredProcedure [dbo].[UpdateNhomHang]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateNhomHang](@MaNhom char(10),@TenNhom nvarchar(50),@SoLuong int, @GhiChu nvarchar(50))
as
begin 
	Update NHOMHANG
	set TenNhom=@TenNhom,SoLuong=@SoLuong,GhiChu=@GhiChu
	where MaNhom=@MaNhom
end 
GO
/****** Object:  StoredProcedure [dbo].[UpdatePhieuNhap]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- UpdatePhieuNhap
create proc [dbo].[UpdatePhieuNhap](@MaPN char(10),@MaNCC char(10),@MaNV char(10),@NgayNhap date,@TongTien float,@ChietKhau int,@ThanhTien float,@GhiChu nvarchar(50))
as
begin
	Update PHIEUNHAP
	set MaNCC=@MaNCC,MaNV=@MaNV,NgayNhap=@NgayNhap,TongTien=@TongTien,ChietKhau=@ChietKhau,ThanhTien=@ThanhTien,GhiChu=@GhiChu
	where MaPN=@MaPN
end
GO
/****** Object:  StoredProcedure [dbo].[UpdatePX]    Script Date: 4/12/2017 2:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdatePX](@MaPX char(10),@MaCH char(10),@MaNV char(10),@NgayXuat date, @TongTien float,@ChietKhau int,@ThanhTien float,@GhiChu nvarchar(50))
as
begin 
	Update PHIEUXUAT
	set MaCH=@MaCH, MaNV=@MaNV,NgayXuat=@NgayXuat,TongTien=@TongTien,ChieuKhau=@ChietKhau,ThanhTien=@ThanhTien,GhiChu=@GhiChu
	where MaPX=@MaPX
end
GO
USE [master]
GO
ALTER DATABASE [QuanLyNhaKho] SET  READ_WRITE 
GO

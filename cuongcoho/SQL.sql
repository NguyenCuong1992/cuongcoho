USE [BangLienKet]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 10/12/2015 22:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLSP] [nvarchar](50) NOT NULL,
	[TenLSP] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLSP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LoaiSanPham] ([MaLSP], [TenLSP]) VALUES (N'LSP1', N'Iphone')
INSERT [dbo].[LoaiSanPham] ([MaLSP], [TenLSP]) VALUES (N'LSP2', N'Bphone')
INSERT [dbo].[LoaiSanPham] ([MaLSP], [TenLSP]) VALUES (N'LSP3', N'HTC')
INSERT [dbo].[LoaiSanPham] ([MaLSP], [TenLSP]) VALUES (N'LSP4', N'SamSung')
INSERT [dbo].[LoaiSanPham] ([MaLSP], [TenLSP]) VALUES (N'LSP5', N'Nokia')
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/12/2015 22:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](50) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[SDT] [int] NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'01', N'Cuong', N'ND', 1648257143)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'02', N'Hop', N'HY', 982456365)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'03', N'Son', N'HB', 965214532)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'04', N'Hiep', N'PT', 1645789654)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'05', N'Viet', N'HP', 1266458745)
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/12/2015 22:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](50) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[MaLSP] [nvarchar](50) NOT NULL,
	[DonGia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLSP], [DonGia]) VALUES (N'SP1', N'Iphone5', N'LSP1', N'20.000.000')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLSP], [DonGia]) VALUES (N'SP2', N'Bphone1', N'LSP2', N'16.000.000')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLSP], [DonGia]) VALUES (N'SP3', N'HTCone', N'LSP3', N'10.000.000')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLSP], [DonGia]) VALUES (N'SP4', N'GaLaXy', N'LSP4', N'20.000.000')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLSP], [DonGia]) VALUES (N'SP5', N'Nokia1280', N'LSP5', N'600.000')
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/12/2015 22:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaKH] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[HoaDon] ([MaHD], [MaKH]) VALUES (N'HD1', N'01')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH]) VALUES (N'HD2', N'02')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH]) VALUES (N'HD3', N'03')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH]) VALUES (N'HD4', N'04')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH]) VALUES (N'HD5', N'05')
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 10/12/2015 22:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaKH] [nvarchar](50) NOT NULL,
	[MaSP] [nvarchar](50) NOT NULL,
	[SoLuong] [nvarchar](50) NOT NULL,
	[ThanhTien] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaKH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'HD1', N'01', N'SP1', N'01', N'20.000.000')
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaKH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'HD2', N'02', N'SP2', N'01', N'16.000.000')
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaKH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'HD3', N'03', N'SP3', N'01', N'10.000.000')
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaKH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'HD4', N'04', N'SP4', N'01', N'20.000.000')
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaKH], [MaSP], [SoLuong], [ThanhTien]) VALUES (N'HD5', N'05', N'SP5', N'01', N'600.000')
/****** Object:  ForeignKey [FK_HoaDon_KhachHang]    Script Date: 10/12/2015 22:45:43 ******/
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
/****** Object:  ForeignKey [FK_ChiTietHoaDon_HoaDon]    Script Date: 10/12/2015 22:45:43 ******/
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
/****** Object:  ForeignKey [FK_ChiTietHoaDon_SanPham]    Script Date: 10/12/2015 22:45:43 ******/
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
/****** Object:  ForeignKey [FK_SanPham_LoaiSanPham1]    Script Date: 10/12/2015 22:45:43 ******/
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham1] FOREIGN KEY([MaLSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham1]
GO

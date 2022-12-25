CREATE DATABASE THICK

USE THICK
--Cau 1
CREATE TABLE CuaHang
(
	MaCH int PRIMARY KEY,
	Ten varchar(50),
	DiaChi varchar(50),
	MaQL int

)
GO
CREATE TABLE NhanVien
(
	MaNV int PRIMARY KEY,
	HoTen varchar(50),
	Email varchar(50),
	SDT varchar(20),
	DChi varchar(50),
	NgayVL smalldatetime,
	Luong money,
	MaCH int

)
GO
CREATE TABLE DanhMuc
(
	MaDM int primary key,
	Ten varchar(50),
	MoTa varchar(100)
	

)
GO
CREATE TABLE SanPham
(
	MaSP int PRIMARY KEY,
	Ten varchar(50),
	DVT varchar(50),
	DonGia money,
	XuatXu varchar(50),
	ThuongHieu varchar(50),
	MaDM int
)
GO
CREATE TABLE HangTon
(
	MaCH int,
	MaSP int,
	SL int,
	CONSTRAINT PK_HANGTON PRIMARY KEY (MaCH,MaSP)
)
GO
CREATE TABLE KhachHang
(
	MaKH int PRIMARY KEY,
	HoTen varchar(50),
	Email varchar(50),
	SDT varchar(20),
	Dchi varchar(50),
	DiemTL int,
	NGDK smalldatetime
)
GO
CREATE TABLE HoaDon
(
	MaHD int PRIMARY KEY,
	MaKH int,
	MaNV int,
	MaCH int,
	NgayHD smalldatetime,
	TongTien money
)
GO
CREATE TABLE CTHD
(
	MaHD int,
	MaSP int,
	DonGia money,
	SL int,
	ThanhTien money,
	CONSTRAINT PK_CTHD PRIMARY KEY (MaHD,MaSP)
)

ALTER TABLE NhanVien ADD CONSTRAINT FK_MACH_NHANVIEN FOREIGN KEY (MaCH) REFERENCES CuaHang(MaCH)
ALTER TABLE SanPham ADD CONSTRAINT FK_MADM_SANPHAM FOREIGN KEY (MaDM) REFERENCES DanhMuc(MaDM)
ALTER TABLE HangTon ADD CONSTRAINT FK_MACH_HANGTON FOREIGN KEY (MaCH) REFERENCES CuaHang(MaCH)
ALTER TABLE HangTon ADD CONSTRAINT FK_MASP_HANGTON FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
ALTER TABLE HoaDon ADD CONSTRAINT FK_MAKH_HOADON FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
ALTER TABLE HoaDon ADD CONSTRAINT FK_MANV_HOADON FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
ALTER TABLE HoaDon ADD CONSTRAINT FK_MACH_HOADON FOREIGN KEY (MaCH) REFERENCES CuaHang(MaCH)
ALTER TABLE CTHD ADD CONSTRAINT FK_MAHD_CTHD FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD)
ALTER TABLE CTHD ADD CONSTRAINT FK_MASP_CTHD FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)

--Cau 2
--2.1
ALTER TABLE NhanVien add constraint checkSDT_NV check (SDT like '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') 
--2.2
create trigger insert_HoaDon on HoaDon
for insert
as
declare @NgVl smalldatetime,@NgHD smalldatetime, @NgDK smalldatetime
select @NgVL =NgayVL, @NgHD=NgayHD, @NgDK=NGDK 
from KhachHang,NhanVien, inserted
where KhachHang.MaKH=inserted.MaKH and NhanVien.MaNV=inserted.MaNV 
if ((@NgHD < @NgDK ) or (@NgHD <= @NgVL))
begin
	rollback transaction
	print 'Insert Error!'
end;

--Cau 3
--3.1
select MaKH from KhachHang where exists (select * from HoaDon where HoaDon.MaKH=KhachHang.MaKH)

--3.2
select KhachHang.MaKH from KhachHang join HoaDon on KhachHang.MaKH=HoaDon.MaKH group by KhachHang.MaKH having KhachHang.MaKH='1'
--3.3

select * from SanPham where MaSP not in (select MaSp from CTHD where CTHD.MaHD='1')





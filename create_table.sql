CREATE DATABASE hotel_management;
USE hotel_management;

-- Table KhachHang
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'KhachHang')
BEGIN
    CREATE TABLE KhachHang (
        MaKH NVARCHAR(9) PRIMARY KEY,
        TenKH NVARCHAR(50) NOT NULL,
        DiachiKH VARCHAR(100),
        DienThoaiKH NUMERIC(9),
        QuocTich NVARCHAR(50),
        SoCMND NUMERIC(9),
        SoHC NUMERIC(9)
    );
END

-- Table PhieuThue
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PhieuThue')
begin
    CREATE TABLE PhieuThue (
        MaPT NVARCHAR(10) PRIMARY KEY,
        MaKH NVARCHAR(9) foreign key references KhachHang(MaKH),
        NgaylapP smalldatetime,
        NgaythueP smalldatetime,
        NgayHentr smalldatetime,
        Trangthai nvarchar(10),
        Tiendatcoc money,
	Yeucau nvarchar (50)
    );
end

--Table NhanVien
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'NhanVien')
begin
    CREATE TABLE NhanVien (
        MaNV nvarchar(10) primary key,
	tenNV varchar (35) not null,
	dienthoaiNV numeric(9),
	motakhac nvarchar(25)
	
    );
end

-- Table HoadonTT
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'HoadonTT')
begin
    CREATE TABLE HoadonTT (
        MaHDTT NVARCHAR(10) PRIMARY KEY,
        MaPT NVARCHAR(10) FOREIGN KEY REFERENCES Phieuthue(MaPT),
	MaNV NVARCHAR(10) FOREIGN KEY REFERENCES Nhanvien(MaNV),
        Ngaylap smalldatetime NOT NULL,
        Tongtien money,
	Ghichu text
    );
end

-- Table LoaiPhong
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LoaiPhong')
begin
    CREATE TABLE LoaiPhong (
        LoaiPhong NVARCHAR(1) PRIMARY KEY,
        Dongia Decimal(9),
	dientich int,
        kieuphong nvarchar(20)
    );
end

-- Table PhongKS
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PhongKS')
begin
    CREATE TABLE PhongKS (
        MaPhong NVARCHAR(10) PRIMARY KEY,
        LoaiPhong nvarchar(1) foreign key references LoaiPhong(LoaiPhong),
	TinhtrangP nvarchar(20)
    );
end

-- Table PhongTT
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'PhongTT')
begin
    CREATE TABLE PhongTT (
        MaPT NVARCHAR(10)FOREIGN KEY REFERENCES Phieuthue(MaPT),
        MaPhong NVARCHAR(10) FOREIGN KEY REFERENCES PhongKS(MaPhong),
	NgaytraP smalldatetime,
	thanhtien money,
	constraint PK_PhongTT primary key (MaPT, MaPhong)
    );
end

alter table PhongTT ADD CONSTRAINT fk_phongTT_PT FOREIGN KEY  (MaPT) references PhieuThue (MaPT) ON DELETE CASCADE;
alter table Phieuthue ADD CONSTRAINT fk_pt foreign key (MaKH) references KhachHang (MaKH) ON DELETE CASCADE;
alter table HoadonTT ADD CONSTRAINT fk_hoadon_PT foreign key (MaPT) references Phieuthue (MaPT) ON DELETE CASCADE;
alter table HoadonTT ADD CONSTRAINT fk_hoadon_NV foreign key (MaNV) references NhanVien (MaNV) ON DELETE CASCADE;
alter table PhongTT ADD CONSTRAINT fk_phongTT_pks foreign key (MaPhong) references PhongKS (MaPhong) ON DELETE CASCADE;
alter table PhongKS ADD CONSTRAINT fk_phongks_loaiphong foreign key (LoaiPhong) references LoaiPhong (LoaiPhong) ON DELETE CASCADE;



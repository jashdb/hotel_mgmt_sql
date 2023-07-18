DELETE FROM PhongTT;
DELETE FROM PhongKS;
DELETE FROM LoaiPhong;
DELETE FROM HoadonTT;
DELETE FROM NhanVien;
DELETE FROM PhieuThue;
DELETE FROM KhachHang;

INSERT INTO KhachHang (MaKH, TenKH, DiachiKH, DienThoaiKH, QuocTich, SoCMND, SoHC)
VALUES 
	('KH001', 'Bob Johnson', NULL, NULL, NULL, NULL, NULL),
    ('KH002', 'John Doe', '123 Main Street', 123456789, 'USA', 123456789, 987654321),
    ('KH003', 'Jane Smith', '456 Oak Avenue', 987654321, 'Canada', NULL, NULL),
    ('KH004', 'Nguyen Van A', 'Dong Da, Ha Noi', 121345678, 'Viet Nam', NULL, NULL),
    ('KH005', 'Pham Thi B', 'Cau Giay, Ha Noi',124312980, 'Viet Nam', NULL, NULL),
	('KH006', 'Dave Bautista', '789 Overthere Str', 155512345, 'USA', NULL, NULL),
	('KH007', 'Maria Garcia', '123 Elm Avenue', 155598765, 'UK', 567432891, NULL),
	('KH008', 'Li Wei', '789 Willow Lane', 867451203, 'China', NULL, 567890123),
	('KH009', 'Alessandro Rossi', '321 Via Roma', 393331234, 'Italy', NULL, NULL),
	('KH010', 'Sarah Johnson', '567 Park Avenue', 124567890, 'Australia', '135782469', '135792468');

INSERT INTO LoaiPhong (LoaiPhong, Dongia, dientich, kieuphong)
VALUES
	('1',300000,20,'1_giuong_don'),
	('2',500000,30,'2_giuong_don'),
	('3',450000,20,'1_giuong_doi');

INSERT INTO NhanVien (MaNV,tenNV, dienthoaiNV, motakhac)
VALUES
	('NV001', 'Ana', 013132323,'A woman'),
	('NV002', 'Bobby', 024243434, 'A man'),
	('NV003', 'Cecilia', NULL, NULL),
	('NV004', 'Dylan', 034315978, NULL),
	('NV005', 'Emily', 091245612, 'Hard-working'),
	('NV006', 'Frederick', 016308945, NULL);

INSERT INTO PhongKS (MaPhong, LoaiPhong, TinhtrangP)
VALUES
	('101','1','Trong'),
	('102','1','Trong'),
	('103','2','Da thue'),
	('104','2','Trong'),
	('105','3','Trong'),
	('106','3','Trong'),
	('201','1','Da thue'),
	('202','1','Trong'),
	('203','2','Trong'),
	('204','3','Trong'),
	('205','3','Da thue'),
	('206','2','Da thue'),
	('301','1','Da thue'),
	('302','2','Da thue'),
	('303','2','Trong'),
	('304','2','Trong'),
	('305','2','Trong'),
	('306','3','Trong'),
	('401','3','Trong'),
	('402','2','Da thue'),
	('403','2','Da thue'),
	('404','1','Trong'),
	('405','1','Trong'),
	('406','2','Da thue');

INSERT INTO PhieuThue (MaPT, MaKH, NgaylapP, NgaythueP, NgayHentr, Trangthai, Tiendatcoc, Yeucau)
VALUES
	('PT001','KH001','2022-12-25 22:15:00','2022-12-25 22:30:00','2022-12-26 09:30:00','Thanh toan',500000, 'Phong yen tinh em nhe!'),
	('PT002','KH002','2022-12-25 22:30:00','2022-12-25 22:30:00','2022-12-26 10:00:00','Thanh toan',100000, NULL),
	('PT003','KH003','2022-12-25 22:30:00','2022-12-25 22:30:00','2022-12-26 10:00:00','Thanh toan',100000, NULL),
	('PT004','KH004','2023-02-01 14:30:00','2023-02-01 14:30:00','2023-02-05 18:30:00','Thanh toan',500000, NULL),
	('PT005','KH005','2023-03-14 22:30:00','2023-03-14 22:30:00','2023-03-15 09:30:00','Thanh toan',100000, NULL),
	('PT006','KH006','2023-04-27 09:30:00','2023-04-27 09:30:00','2023-05-03 09:30:00','Thanh toan',800000, NULL),
	('PT007','KH007','2023-04-29 10:30:00','2023-04-29 10:30:00','2023-05-01 13:30:00','Thanh toan',200000, NULL),
	('PT008','KH007','2023-04-29 10:30:00','2023-04-29 10:30:00','2022-05-02 09:30:00','Thanh toan',200000, NULL),
	('PT009','KH008','2023-06-11 11:30:00','2023-06-11 11:30:00','2023-06-12 09:30:00','Thanh toan',100000, NULL),
	('PT010','KH008','2023-06-11 11:30:00','2023-06-11 11:30:00','2023-06-12 10:30:00','Thanh toan',100000, NULL),
	('PT011','KH008','2023-06-11 11:30:00','2023-06-11 11:30:00','2023-08-12 09:30:00','Thue',10000000, NULL),
	('PT012','KH009','2023-07-05 11:15:00','2023-07-10 11:15:00','2023-07-15 09:30:00','Thanh toan',1500000, NULL),
	('PT013','KH010','2023-07-05 20:15:00','2023-07-05 20:15:00','2023-07-20 09:30:00','Thue',500000, NULL),
	('PT014','KH010','2023-07-17 11:30:00','2023-07-17 11:30:00','2023-07-25 09:30:00','Thue',500000, NULL),
	('PT015','KH001','2023-07-17 23:30:00','2023-07-17 23:30:00','2023-07-18 09:30:00','Huy',500000,NULL);

INSERT into PhongTT (MaPT, MaPhong, NgaytraP, thanhtien)
VALUES 
	('PT001','101','2022-12-26 09:00:00', 3150000),
	('PT001','102','2022-12-26 10:00:00', 1150000),
	('PT002','203','2022-12-26 10:00:00', 450000),
	('PT003','404','2022-12-26 10:00:00', 750000),
	('PT004','202','2023-02-05 18:30:00', 1350000),
	('PT005','105','2023-03-15 08:30:00', 750000),
	('PT005','104','2023-03-15 09:30:00', 850000),
	('PT006','205','2023-05-03 09:30:00', 950000),
	('PT007','304','2023-05-01 13:30:00', 150000),
	('PT008','303','2022-05-02 09:30:00', 125000),
	('PT009','401','2023-06-12 09:30:00', 750000),
	('PT010','101','2023-06-12 10:30:00', 750000),
	('PT011','406', NULL, NULL),
	('PT012','304','2023-07-15 09:30:00', 750000),
	('PT013','103', NULL, NULL),
	('PT013','201', NULL, NULL),
	('PT013','205', NULL, NULL),
	('PT013','206', NULL, NULL),
	('PT014','302', NULL, NULL),
	('PT014','402', NULL, NULL),
	('PT014','403', NULL, NULL),
	('PT015','301', NULL, NULL);

INSERT INTO HoadonTT (MaHDTT, MaPT, MaNV, Ngaylap, Tongtien, Ghichu)
VALUES
	('HD001','PT001','NV002','2022-12-26 09:00:00', 3150000,'khach tra phong muon'),
	('HD002','PT001','NV002','2022-12-26 10:00:00', 1150000, NULL),
	('HD003','PT002','NV001','2022-12-26 10:00:00', 450000, NULL),
	('HD004','PT003','NV003','2022-12-26 10:00:00', 750000, NULL),
	('HD005','PT004','NV003','2023-02-05 18:30:00', 1350000, NULL),
	('HD006','PT005','NV003','2023-03-15 08:30:00', 750000, NULL),
	('HD007','PT005','NV004','2023-03-15 09:30:00', 850000, NULL),
	('HD008','PT006','NV005','2023-05-03 09:30:00', 950000, NULL),
	('HD009','PT007','NV006','2023-05-01 13:30:00', 150000, NULL),
	('HD010','PT008','NV004','2022-05-02 09:30:00', 125000, NULL),
	('HD011','PT009','NV006','2023-06-12 09:30:00', 750000, NULL),
	('HD012','PT010','NV005','2023-06-12 10:30:00', 750000, NULL),
	('HD013','PT012','NV005','2023-07-15 09:30:00', 750000, NULL);

SELECT * FROM HoadonTT;
SELECT * FROM KhachHang;
SELECT * FROM LoaiPhong;
SELECT * FROM NhanVien;
SELECT * FROM PhieuThue;
SELECT * FROM PhongKS;
SELECT * FROM PhongTT;

delete from KhachHang where MaKH = 'KH011';

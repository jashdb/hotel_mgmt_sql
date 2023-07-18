CREATE FUNCTION TinhTongDoanhThu()
RETURNS MONEY
AS
BEGIN
  DECLARE @TongDoanhThu MONEY;
  
  SELECT @TongDoanhThu = SUM(Tongtien)
  FROM HoaDonTT;

  RETURN @TongDoanhThu;
END;

SELECT dbo.TinhTongDoanhThu() AS TongDoanhThu;

CREATE FUNCTION TongSoLanThuePhong()
RETURNS INT
AS
BEGIN
  DECLARE @TongSoLanThue INT;
  
  SELECT @TongSoLanThue = COUNT(*)
  FROM PhieuThue;

  RETURN @TongSoLanThue;
END;

SELECT dbo.TongSoLanThuePhong() AS TongSoLanThue;

-- Hiển thị số phiếu đã xử lý của nhân viên
CREATE FUNCTION ThongKeNhanVien()
RETURNS TABLE
AS
RETURN
    SELECT NV.tenNV, NV.MaNV, COUNT(PT.MaPT) AS SoPhieuThue
    FROM NhanVien NV
    LEFT JOIN HoadonTT HD ON NV.MaNV = HD.MaNV
    LEFT JOIN PhieuThue PT ON HD.MaPT = PT.MaPT
    GROUP BY NV.tenNV, NV.MaNV;
SELECT * FROM ThongKeNhanVien();

-- Lay danh sach theo quoc tich

CREATE FUNCTION GetCustomersByNationality(@nationality NVARCHAR(50))
RETURNS TABLE
AS
RETURN
    SELECT *
    FROM KhachHang
    WHERE QuocTich = @nationality;

SELECT *
FROM dbo.GetCustomersByNationality('USA');

-- Tính tổng số lượnng phòng theo từng loại
CREATE FUNCTION GetRoomCountByLoaiPhong()
RETURNS TABLE
AS
RETURN
    SELECT LP.LoaiPhong, COUNT(PK.MaPhong) AS SoLuongPhong
    FROM LoaiPhong LP
    LEFT JOIN PhongKS PK ON LP.LoaiPhong = PK.LoaiPhong
    GROUP BY LP.LoaiPhong;

SELECT * 
FROM dbo.GetRoomCountByLoaiPhong()


-- Tổng số phòng còn trống theo từng loại
CREATE FUNCTION GetAvailableRoomCountByLoaiPhong()
RETURNS TABLE
AS
RETURN
    SELECT LP.LoaiPhong, COUNT(PK.MaPhong) AS SoLuongPhongConTrong
    FROM LoaiPhong LP
    LEFT JOIN PhongKS PK ON LP.LoaiPhong = PK.LoaiPhong AND PK.TinhtrangP = 'Trong'
    GROUP BY LP.LoaiPhong;

SELECT * FROM GetAvailableRoomCountByLoaiPhong();




SELECT P.MaPhong, LP.kieuphong, LP.dientich, LP.Dongia
FROM PhongKS P
JOIN LoaiPhong LP ON P.LoaiPhong = LP.LoaiPhong
LEFT JOIN PhongTT PT ON P.MaPhong = PT.MaPhong
WHERE PT.MaPhong IS NULL

-- Thông tin về các phòng còn trống
CREATE FUNCTION dbo.GetAvailableRooms2()
RETURNS TABLE
AS
RETURN
    SELECT PKS.MaPhong, PKS.TinhTrangP, LP.*
	FROM PhongKS PKS
	INNER JOIN LoaiPhong LP on PKS.LoaiPhong = LP.LoaiPhong
	WHERE PKS.TinhTrangP = 'Trong'


	SELECT * FROM dbo.GetAvailableRooms2();


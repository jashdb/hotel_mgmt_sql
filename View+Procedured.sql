-- Hiển thị thông tin của khách hàng cùng phiếu thuê của họ

CREATE VIEW View_KhachHang_PhieuThue AS
SELECT 
    KhachHang.MaKH, KhachHang.TenKH, KhachHang.DiachiKH, KhachHang.DienThoaiKH, KhachHang.QuocTich,
    PhieuThue.MaPT, PhieuThue.NgaylapP, PhieuThue.NgaythueP, PhieuThue.NgayHentr, PhieuThue.Trangthai, PhieuThue.Tiendatcoc, PhieuThue.Yeucau
FROM 
    KhachHang
    INNER JOIN PhieuThue ON KhachHang.MaKH = PhieuThue.MaKH;

	SELECT * FROM View_KhachHang_PhieuThue

	CREATE VIEW DanhSachHoaDon AS
SELECT HD.MaHDTT, PT.MaPT, KH.TenKH, NV.tenNV, HD.Ngaylap, HD.Tongtien
FROM HoadonTT HD
INNER JOIN PhieuThue PT ON HD.MaPT = PT.MaPT
INNER JOIN KhachHang KH ON PT.MaKH = KH.MaKH
INNER JOIN NhanVien NV ON HD.MaNV = NV.MaNV;

SELECT * FROM DanhSachHoaDon

-- Hiển thị tên Khách hàng cùng những yêu cầu của họ
CREATE VIEW DanhSachKhachHangCoYeuCau AS
SELECT KH.MaKH, KH.TenKH, PT.Yeucau
FROM KhachHang KH
INNER JOIN PhieuThue PT ON KH.MaKH = PT.MaKH
WHERE PT.Yeucau IS NOT NULL;

SELECT * FROM DanhSachKhachHangCoYeuCau


-- Lấy ra danh sách các phòng dựa trên loại phòng được truyền vào.
CREATE PROCEDURE sp_GetPhongKSByLoaiPhong
    @LoaiPhong NVARCHAR(1)
AS
BEGIN
    SELECT *
    FROM PhongKS
    WHERE LoaiPhong = @LoaiPhong;
END

EXECUTE sp_GetPhongKSByLoaiPhong '1'

-- Trigger cho vi?c thêm phi?u thuê
CREATE TRIGGER Trg_UpdatePhieuThue
ON PhieuThue
AFTER UPDATE
AS
BEGIN
    -- C?p nh?t tr?ng thái phòng thành "?ã thuê" cho các mã phòng trong phi?u thuê v?a ???c thêm
    UPDATE PhongKS
    SET TinhtrangP = 'Trong'
    FROM PhongKS, inserted, PhongTT
    WHERE (inserted.Trangthai = 'Thanh toan' OR inserted.Trangthai = 'Huy') AND PhongKS.MaPhong = PhongTT.MaPhong AND inserted.MaPT = PhongTT.MaPT
END;

UPDATE PhieuThue
SET Trangthai = 'Thanh toan' WHERE MaPT = 'PT099'

UPDATE PhieuThue
SET Trangthai = 'Huy' WHERE MaPT = 'PT001'

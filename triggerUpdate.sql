-- Trigger cho vi?c th�m phi?u thu�
CREATE TRIGGER Trg_UpdatePhieuThue
ON PhieuThue
AFTER UPDATE
AS
BEGIN
    -- C?p nh?t tr?ng th�i ph�ng th�nh "?� thu�" cho c�c m� ph�ng trong phi?u thu� v?a ???c th�m
    UPDATE PhongKS
    SET TinhtrangP = 'Trong'
    FROM PhongKS, inserted, PhongTT
    WHERE (inserted.Trangthai = 'Thanh toan' OR inserted.Trangthai = 'Huy') AND PhongKS.MaPhong = PhongTT.MaPhong AND inserted.MaPT = PhongTT.MaPT
END;

UPDATE PhieuThue
SET Trangthai = 'Thanh toan' WHERE MaPT = 'PT099'

UPDATE PhieuThue
SET Trangthai = 'Huy' WHERE MaPT = 'PT001'
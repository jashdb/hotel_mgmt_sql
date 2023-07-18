
-- Trigger cho vi?c thêm phi?u thuê
CREATE TRIGGER Trg_InsertPhieuThue
ON PhongTT
AFTER INSERT
AS
BEGIN
    -- C?p nh?t tr?ng thái phòng thành "?ã thuê" cho các mã phòng trong phi?u thuê v?a ???c thêm
    UPDATE PhongKS
    SET TinhtrangP = 'Da thue'
    FROM PhongKS, inserted, PhieuThue
    WHERE PhieuThue.Trangthai = 'Thue' AND PhongKS.MaPhong =inserted.MaPhong AND inserted.MaPT = PhieuThue.MaPT
END;









INSERT INTO PhieuThue (MaPT, MaKH, NgaylapP, NgaythueP, NgayHentr, Trangthai, Tiendatcoc, Yeucau)
VALUES ('PT097', 'KH001', '2023-07-17 23:30:00', '2023-07-17 23:30:00', '2023-07-18 09:30:00', 'Thue', 500000, NULL);

DELETE FROM PhieuThue WHERE MaPT = 'PT013';

INSERT INTO PhieuThue (MaPT, MaKH, NgaylapP, NgaythueP, NgayHentr, Trangthai, Tiendatcoc, Yeucau)
VALUES ('PT099', 'KH001', '2023-07-17 23:30:00', '2023-07-17 23:30:00', '2023-07-18 09:30:00', 'Thue', 500000, NULL);
INSERT into PhongTT (MaPT, MaPhong, NgaytraP, thanhtien)
VALUES ('PT099','902','2022-12-26 09:00:00', 3150000)

SELECT * FROM PhieuThue
select * from PhongKS

INSERT INTO PhongKS (MaPhong, LoaiPhong, TinhtrangP)
VALUES
	('902','1','Trong')

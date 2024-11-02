CREATE DATABASE K22CNT3_PhamThanhDat_Project2;
GO
USE K22CNT3_PhamThanhDat_Project2;
GO
CREATE TABLE QUAN_TRI (
    Tai_khoan VARCHAR(50) NOT NULL PRIMARY KEY, 
    Trang_thai TINYINT DEFAULT 1                 
);

-- Bảng KHACH_HANG
CREATE TABLE KHACH_HANG (
    MaKH INT NOT NULL  IDENTITY(1,1)PRIMARY KEY,       
    Ho_ten VARCHAR(100),                                
    Tai_khoan VARCHAR(50) NOT NULL UNIQUE,             
    Mat_khau VARCHAR(32),                               
    Dia_chi VARCHAR(200),                               
    Dien_thoai VARCHAR(30),                           
    Email VARCHAR(50) NOT NULL,                         
    Ngay_sinh DATETIME,                                 
    Ngay_cap_nhat DATETIME DEFAULT CURRENT_TIMESTAMP,   
    Gioi_tinh TINYINT,                                  
    Tich_diem INT NOT NULL DEFAULT 0,                  
    Trang_thai TINYINT                                  
);

-- Bảng DanhMuc (cần thiết cho bảng SANPHAM)
CREATE TABLE DanhMuc (
    MaDanhMuc INT NOT NULL PRIMARY KEY , 
    TenDanhMuc VARCHAR(100) NOT NULL                  
);

-- Bảng SANPHAM
CREATE TABLE SANPHAM (
    MaSP INT NOT NULL PRIMARY KEY  IDENTITY,      
    TenSP VARCHAR(100) NOT NULL,                       
    Gia DECIMAL(10, 2) NOT NULL,                       
    So_luong INT NOT NULL DEFAULT 0,                    
    Mo_ta TEXT,                                       
    Kich_thuoc VARCHAR(10),                             
    Mau_sac VARCHAR(20),                              
    MaDanhMuc INT,                                     
    Ngay_tao DATETIME DEFAULT CURRENT_TIMESTAMP,       
    Trang_thai TINYINT DEFAULT 1,                     
    FOREIGN KEY (MaDanhMuc) REFERENCES DanhMuc(MaDanhMuc)
);

-- Bảng GIO_HANG
CREATE TABLE GIO_HANG (
    MaGioHang INT NOT NULL PRIMARY KEY  IDENTITY,
    MaKH INT NOT NULL,                                  
    MaSP INT NOT NULL,                                  
    So_luong INT NOT NULL DEFAULT 1,                  
    Tong_tien DECIMAL(10, 2) NOT NULL,                 
    Ngay_tao DATETIME DEFAULT CURRENT_TIMESTAMP,        
    Trang_thai TINYINT DEFAULT 1,                      
    FOREIGN KEY (MaKH) REFERENCES KHACH_HANG(MaKH),    
);
CREATE TABLE CHI_TIET_DON_HANG (
    MaChiTiet INT NOT NULL PRIMARY KEY  IDENTITY, 
    MaGioHang INT NOT NULL,                            
    MaSP INT NOT NULL,
    So_luong INT NOT NULL DEFAULT 1,                
    Gia DECIMAL(10, 2) NOT NULL,                        
    FOREIGN KEY (MaGioHang) REFERENCES GIO_HANG(MaGioHang),
    FOREIGN KEY (MaSP) REFERENCES SANPHAM(MaSP)       
);
INSERT INTO QUAN_TRI (Tai_khoan, Trang_thai)
VALUES 
('admin', 1),  
('manager', 1), 
('supervisor', 0); 
INSERT INTO KHACH_HANG (Ho_ten, Tai_khoan, Mat_khau, Dia_chi, Dien_thoai, Email, Ngay_sinh, Gioi_tinh, Tich_diem, Trang_thai)
VALUES 
(' Pham Thanh Dat', 'thanhdat', 'password160924', 'Giao-An Giao-Thuy Nam Dinh', '0984868340', 'thanhdat160924@gmail.com', '2004-09-16', 1, 0, 1),
(N'Trần Thị B', 'tranthib', 'password456', '456 Đường 2, Quận 2', '0987654321', 'tranthib@example.com', '1992-02-02', 0, 0, 1),
('Lê Văn C', 'levanc', 'password789', '789 Đường 3, Quận 3', '0112233445', 'levanc@example.com', '1988-03-03', 1, 0, 0); 
INSERT INTO DanhMuc (MaDanhMuc, TenDanhMuc)
VALUES 
(1, 'Áo Thun'), 
(2, 'Quần Jeans'), 
(3, 'Giày Thể Thao'); 
INSERT INTO SANPHAM (TenSP, Gia, So_luong, Mo_ta, Kich_thuoc, Mau_sac, MaDanhMuc)
VALUES 
('Áo Thun Trắng', 150000, 100, 'Áo thun cotton, thoáng mát', 'M', 'Trắng', 1),
('Quần Jeans Xanh', 300000, 50, 'Quần jeans co giãn, thoải mái', 'L', 'Xanh', 2),
('Giày Thể Thao Đen', 450000, 30, 'Giày thể thao phù hợp cho chạy bộ', '42', 'Đen', 3);

INSERT INTO GIO_HANG (MaKH, MaSP, So_luong, Tong_tien)
VALUES 
(1, 1, 2, 300000),  
(1, 2, 1, 300000), 
(2, 3, 1, 450000); 
INSERT INTO CHI_TIET_DON_HANG (MaGioHang, MaSP, So_luong, Gia)
VALUES 
(1, 1, 2, 150000),  
(1, 2, 1, 300000), 
(2, 3, 1, 450000);  



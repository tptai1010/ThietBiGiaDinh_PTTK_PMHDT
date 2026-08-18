-- ===============================
-- SCRIPT TẠO CSDL SQL SERVER
-- DỰA TRÊN SƠ ĐỒ LỚP (CÓ KẾ THỪA NHÂN VIÊN)
-- ===============================

CREATE DATABASE QL_BanHangDaiLy;
GO

USE QL_BanHangDaiLy;
GO

-- BẢNG ĐẠI LÝ
CREATE TABLE DaiLy (
    SoHieuDaiLy VARCHAR(20) PRIMARY KEY,
    TenDaiLy NVARCHAR(100),
    DienThoai VARCHAR(20),
    DiaChi NVARCHAR(200)
);

-- BẢNG SẢN PHẨM
CREATE TABLE SanPham (
    MaSanPham VARCHAR(20) PRIMARY KEY,
    TenSanPham NVARCHAR(100),
    MoTa NVARCHAR(200),
	TGBaoHanh VARCHAR(20),
    SoLuongHienCo INT
);

-- BẢNG NHÂN VIÊN
CREATE TABLE NhanVien (
    MaNV VARCHAR(20) PRIMARY KEY,
    TenNV NVARCHAR(100),
    DiaChi NVARCHAR(200),
    SoDienThoai VARCHAR(20),
    MoTa NVARCHAR(200)
);

-- CÁC BẢNG KẾ THỪA NHÂN VIÊN (Table-per-Type)
CREATE TABLE NhanVienBanHang (
    MaNV VARCHAR(20) PRIMARY KEY FOREIGN KEY REFERENCES NhanVien(MaNV)
);

CREATE TABLE NhanVienKho (
    MaNV VARCHAR(20) PRIMARY KEY FOREIGN KEY REFERENCES NhanVien(MaNV)
);

CREATE TABLE NhanVienVanChuyen (
    MaNV VARCHAR(20) PRIMARY KEY FOREIGN KEY REFERENCES NhanVien(MaNV)
);

CREATE TABLE NhanVienXuatSP (
    MaNV VARCHAR(20) PRIMARY KEY FOREIGN KEY REFERENCES NhanVien(MaNV)
);

-- TÀI KHOẢN
CREATE TABLE TaiKhoan (
    Username VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(100),
    MaNV VARCHAR(20) FOREIGN KEY REFERENCES NhanVien(MaNV)
);

-- PHIẾU ĐẶT MUA
CREATE TABLE PhieuDatMua (
    SoPhieu VARCHAR(20) PRIMARY KEY,
    NgayLap DATETIME,
    SoHieuDaiLy VARCHAR(20) FOREIGN KEY REFERENCES DaiLy(SoHieuDaiLy)
);

-- CHI TIẾT ĐẶT HÀNG
CREATE TABLE ChiTietDatHang (
    SoPhieu VARCHAR(20),
    MaSanPham VARCHAR(20),
    TenSanPham NVARCHAR(100),
    SoLuong INT,
    DonGia FLOAT,
    MoTa NVARCHAR(200),
    PRIMARY KEY (SoPhieu, MaSanPham),
    FOREIGN KEY (SoPhieu) REFERENCES PhieuDatMua(SoPhieu),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

-- HÓA ĐƠN
CREATE TABLE HoaDon (
    SoHoaDon VARCHAR(20) PRIMARY KEY,
    NgayLap DATETIME,
    SoHieuDaiLy VARCHAR(20) FOREIGN KEY REFERENCES DaiLy(SoHieuDaiLy),
    MaNV VARCHAR(20) FOREIGN KEY REFERENCES NhanVien(MaNV),
    TongTien FLOAT,
    TrangThai NVARCHAR(50),
    GhiChu NVARCHAR(200)
);

-- CHI TIẾT HÓA ĐƠN
CREATE TABLE ChiTietHoaDon (
    SoHoaDon VARCHAR(20),
    MaSanPham VARCHAR(20),
    TenSanPham NVARCHAR(100),
    SoLuong INT,
    DonGia FLOAT,
    MoTa NVARCHAR(200),
    PRIMARY KEY (SoHoaDon, MaSanPham),
    FOREIGN KEY (SoHoaDon) REFERENCES HoaDon(SoHoaDon),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

CREATE TABLE PhieuChuyenSanPham (
    SoPhieuChuyen VARCHAR(20) PRIMARY KEY,
    MaNV VARCHAR(20) FOREIGN KEY REFERENCES NhanVienVanChuyen(MaNV),
    NgayChuyenHang DATETIME,
    TrangThai NVARCHAR(50)
);

-- BÁO CÁO TỔNG HỢP
CREATE TABLE BaoCao (
    MaBaoCao VARCHAR(20) PRIMARY KEY,
    Thang INT,
    Nam INT,
    MaNV VARCHAR(20) FOREIGN KEY REFERENCES NhanVien(MaNV)
);

-- BÁO CÁO SẢN PHẨM BÁN
CREATE TABLE BaoCaoSanPhamBan (
    MaBaoCao VARCHAR(20),
    MaSanPham VARCHAR(20),
    PRIMARY KEY (MaBaoCao, MaSanPham),
    FOREIGN KEY (MaBaoCao) REFERENCES BaoCao(MaBaoCao),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

-- BÁO CÁO DOANH THU
CREATE TABLE BaoCaoDoanhThu (
    MaBaoCao VARCHAR(20),
    SoHoaDon VARCHAR(20),
    PRIMARY KEY (MaBaoCao, SoHoaDon),
    FOREIGN KEY (MaBaoCao) REFERENCES BaoCao(MaBaoCao),
    FOREIGN KEY (SoHoaDon) REFERENCES HoaDon(SoHoaDon)
);

-- BÁO CÁO TỒN KHO
CREATE TABLE BaoCaoTonKho (
    MaBaoCao VARCHAR(20),
    MaSanPham VARCHAR(20),
    PRIMARY KEY (MaBaoCao, MaSanPham),
    FOREIGN KEY (MaBaoCao) REFERENCES BaoCao(MaBaoCao),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);

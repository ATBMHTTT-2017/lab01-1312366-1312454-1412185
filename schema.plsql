alter session set "_ORACLE_SCRIPT"=true;
/* Tạo User BT1N28 và trao quyền DBA */
CREATE USER BT1N28 IDENTIFIED BY BT1N28;

GRANT CONNECT,RESOURCE,DBA TO BT1N28;

GRANT UNLIMITED TABLESPACE TO BT1N28;
GRANT CREATE SESSION  TO BT1N28;
GRANT CREATE ANY TABLE TO BT1N28;

/* Tạo bảng */
create table BT1N28.ChiTieu_1312366_1312454_1412185(
    maChiTieu char(20) primary key,
    tenChiTieu char(100),
    soTien long,
    duAn char(20) not null
);

create table BT1N28.DuAn_1312366_1312454_1412185(
    maDA char(20) primary key,
    tenDA char(100),
    kinhPhi long,
    phongChuTri char(20) not null,
    truongDA char(20) not null
);

create table BT1N28.PhongBan_1312366_1312454_1412185(
    maPhong char(20) primary key,
    tenPhong char(100),
    truongPhong char(100),
    ngayNhanChuc date,
    soNhanVien int,
    chiNhanh char(20)
);

create table BT1N28.PhanCong_1312366_1312454_1412185(
    maNV char(20) not null,
    duAn char(20) not null,
    vaiTro char(100),
    phuCap long,
    primary key(maNV,duAn)
);

create table BT1N28.NhanVien_1312366_1312454_1412185(
    maNV char(20) primary key,
    hoTen char(100),
    diaChi char(100),
    dienThoai char(15),
    email char(100),
    maPhong char(20) not null,
    chiNhanh char(20) not null,
    luong long
    
);

create table BT1N28.ChiNhanh_1312366_1312454_1412185(
    maCN char(20) primary key,
    tenCN char(100),
    truongChiNhanh char(20) not null
);

/* Trao quyền thực thi trên các schema của BT1N28 */
GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.ChiTieu_1312366_1312454_1412185 TO BT1N28;
GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.DuAn_1312366_1312454_1412185 TO BT1N28;
GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.PhanCong_1312366_1312454_1412185 TO BT1N28;
GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.PhongBan_1312366_1312454_1412185 TO BT1N28;
GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.ChiNhanh_1312366_1312454_1412185 TO BT1N28;
GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.NhanVien_1312366_1312454_1412185 TO BT1N28;

/* Tạo các constraint khoá ngoại */
alter table BT1N28.ChiTieu_1312366_1312454_1412185 add constraint FK_ChiTieu_DuAn foreign key (duAn) references BT1N28.DuAn_1312366_1312454_1412185(maDA);

alter table BT1N28.DuAn_1312366_1312454_1412185 add constraint FK_DuAn_PhongBan foreign key (phongChuTri) references BT1N28.PhongBan_1312366_1312454_1412185(maPhong);
alter table BT1N28.DuAn_1312366_1312454_1412185 add constraint FK_DuAn_NhanVien foreign key (truongDA) references BT1N28.NhanVien_1312366_1312454_1412185(maNV);

alter table BT1N28.PhanCong_1312366_1312454_1412185 add constraint FK_PhanCong_DuAn foreign key (duAn) references BT1N28.DuAn_1312366_1312454_1412185(maDA);
alter table BT1N28.PhanCong_1312366_1312454_1412185 add constraint FK_PhanCong_NhanVien foreign key (maNV) references BT1N28.NhanVien_1312366_1312454_1412185(maNV);

alter table BT1N28.PhongBan_1312366_1312454_1412185 add constraint FK_PhongBan_ChiNhanh foreign key (chiNhanh) references BT1N28.ChiNhanh_1312366_1312454_1412185(maCN);

alter table BT1N28.ChiNhanh_1312366_1312454_1412185 add constraint FK_ChiNhanh_NhanVien foreign key (truongChiNhanh) references BT1N28.NhanVien_1312366_1312454_1412185(maNV);

alter table BT1N28.NhanVien_1312366_1312454_1412185 add constraint FK_NhanVien_ChiNhanh foreign key (chiNhanh) references BT1N28.ChiNhanh_1312366_1312454_1412185(maCN);
alter table BT1N28.NhanVien_1312366_1312454_1412185 add constraint FK_NhanVien_PhongBan foreign key (maPhong) references BT1N28.PhongBan_1312366_1312454_1412185(maPhong);

/*Tạm thời vô hiệu hoá các constraint để thêm dữ liệu vào*/
alter table BT1N28.ChiTieu_1312366_1312454_1412185 disable constraint FK_ChiTieu_DuAn;

alter table BT1N28.DuAn_1312366_1312454_1412185 disable constraint FK_DuAn_PhongBan;
alter table BT1N28.DuAn_1312366_1312454_1412185 disable constraint FK_DuAn_NhanVien;

alter table BT1N28.PhanCong_1312366_1312454_1412185 disable constraint FK_PhanCong_DuAn;
alter table BT1N28.PhanCong_1312366_1312454_1412185 disable constraint FK_PhanCong_NhanVien;

alter table BT1N28.PhongBan_1312366_1312454_1412185 disable constraint FK_PhongBan_ChiNhanh;

alter table BT1N28.ChiNhanh_1312366_1312454_1412185 disable constraint FK_ChiNhanh_NhanVien;

alter table BT1N28.NhanVien_1312366_1312454_1412185 disable constraint FK_NhanVien_ChiNhanh;
alter table BT1N28.NhanVien_1312366_1312454_1412185 disable constraint FK_NhanVien_PhongBan;


/*Thêm dữ liệu*/



INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P10','KeToan','NV56', NULL, 18,'CN1');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P11','NhanSu','NV24', NULL, 6,'CN3');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P12','NhanSu','NV50', NULL, 8,'CN2');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P13','NhanSu','NV22', NULL, 7,'CN1');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P14','NhanSu','NV30', NULL, 12,'CN2');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P15','NhanSu','NV07', NULL, 18,'CN1');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P16','NhanSu','NV46', NULL, 8,'CN3');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P17','NhanSu','NV06', NULL, 1,'CN1');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P18','KeToan','NV33', NULL, 17,'CN2');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P19','KeToan','NV54', NULL, 16,'CN2');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P20','KeToan','NV50', NULL, 5,'CN2');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P21','KeToan','NV42', NULL, 15,'CN2');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P22','KeToan','NV18', NULL, 1,'CN1');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P23','KeToan','NV15', NULL, 15,'CN2');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P24','KeHoach','NV42', NULL, 8,'CN1');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P25','KeToan','NV11', NULL, 13,'CN1');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P26','KeToan','NV58', NULL, 6,'CN3');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P27','NhanSu','NV37', NULL, 13,'CN3');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P28','KeHoach','NV33', NULL, 5,'CN1');
INSERT INTO BT1N28.PhongBan_1312366_1312454_1412185 (maPhong, tenPhong, truongPhong, ngayNhanChuc, soNhaNVien, chiNhanh) VALUES ('P29','NhanSu','NV49', NULL, 2,'CN2');


INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV00','DA04','Web', 8000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV00','DA05','Service', 27000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV01','DA04','Corporate Care', 26000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV01','DA05','Accounting', 5000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV02','DA01','Marketing', 4000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV02','DA03','ConsumerSales', 23000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV03','DA01','Sales', 22000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV03','DA02','Technical', 3000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV04','DA01','Cutomer', 13000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV04','DA03','Prepaid Customer', 32000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV05','DA06','Cutomer', 28000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV05','DA08','Prepaid Customer', 7000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV06','DA01','Service', 22000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV06','DA03','Prepaid Customer', 1000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV07','DA02','Web', 39000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV07','DA08','Marketing', 20000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV08','DA02', NULL, 17000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV08','DA08','Cutomer', 38000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV09','DA06','NationalSales', 19000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV09','DA08','AccessorySales', 38000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV10','DA03','Service', 32000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV10','DA09','Accounting', 11000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV11','DA05','Service', NULL);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV12','DA01','Cutomer', 9000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV12','DA02','Technical', 30000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV13','DA04','Prepaid Customer', 13000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV14','DA01','Corporate Care', 9000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV15','DA07','Accounting', 34000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV15','DA09','Marketing', 15000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV16','DA02','CorporateSales', 8000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV16','DA08','Sales', 29000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV17','DA08','Cutomer', 7000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV18','DA07','Service', 3000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV19','DA01','Corporate Care', 17000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV20','DA02','Service', 21000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV20','DA08','Marketing', 2000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV21','DA01','Prepaid Customer', 31000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV21','DA03','Prepaid Customer', 10000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV22','DA01','Prepaid Customer', 40000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV22','DA03','Technical', 19000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV23','DA06','Corporate Care', 6000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV24','DA06','Service', 1000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV24','DA08','Cutomer', 20000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV25','DA07','Technical', 12000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV25','DA09','Accounting', 33000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV26','DA03','Cutomer', 18000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV27','DA06','Corporate Care', 37000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV27','DA08','Service', 16000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV28','DA04','Marketing', 4000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV28','DA07','Marketing', 25000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV29','DA04','Prepaid Customer', 17000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV29','DA05','Web', 36000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV30','DA01','Web', 18000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV30','DA02','Marketing', 39000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV31','DA09','Accounting', 19000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV32','DA08','BusinessSales', 15000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV33','DA03','Accounting', 5000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV33','DA09','Marketing', 24000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV34','DA07','Accounting', 12000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV35','DA04','Service', 35000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV35','DA07','Cutomer', 16000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV36','DA07','Service', 25000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV36','DA09','Corporate Care', 6000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV37','DA05','Technical', 36000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV37','DA06','Corporate Care', 15000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV38','DA01','Prepaid Customer', 31000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV38','DA02','Corporate Care', 12000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV39','DA03','Cutomer', 14000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV39','DA09','Service', 33000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV40','DA03','BusinessSales', 1000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV41','DA09','Service', 2000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV42','DA09','Prepaid Customer', 11000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV43','DA03','Marketing', 23000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV43','DA09','TechnicalSales', 2000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV44','DA06','Web', 14000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV45','DA05','Service', 18000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV45','DA06','Accounting', 37000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV46','DA02','Technical', 30000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV46','DA08','Corporate Care', 11000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV47','DA06','Accounting', 10000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV47','DA08','Cutomer', 29000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV48','DA05','Cutomer', 5000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV49','DA04','Service', 4000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV50','DA04','Corporate Care', 26000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV50','DA07','NationalSales', 7000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV51','DA04','Technical', 35000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV51','DA05','CorporateSales', 14000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV52','DA02','Prepaid Customer', 8000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV53','DA01','Technical', 40000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV53','DA02','Service', 21000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV54','DA04','Technical', 13000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV54','DA07','Service', 34000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV55','DA07','NationalSales', 3000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV55','DA09','Marketing', 24000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV56','DA05','Cutomer', 27000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV56','DA06','Marketing', 6000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV57','DA05','Accounting', 9000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV57','DA06','InternationalSales', 28000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV58','DA03','Accounting', 10000000);
INSERT INTO BT1N28.PhanCong_1312366_1312454_1412185 (maNV, duAn, vaiTro, phuCap) VALUES ('NV59','DA02','Technical', 16000000);

INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV00','Carolina Key','Quan 9','09152483218','myuwj.kdcat@bjlsjl.com','P13','CN1', 19500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV01','Janice Rojas','Quan 4','09652412861','rppt14@lgeuab.com','P15','CN3', 22000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV02','Rene Ortega','Quan 6','09552956657','irxbf.urpuzht@jdqlpk.com','P28','CN1', 24000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV03','Jamie Novak','Quan 7','09234334115','gvdq.xbwnowpp@hxfdjqt.efsc-a.org','P13','CN1', 28000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV04','Juliet Landry','Quan 4','09993445487','hxzqjwj7@cjduck.org','P17','CN1', 31000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV05','Tammy Davis','Quan 2','09596177487','wpgexinh.zggfikpl@vsajca.ocylca.org','P26','CN2', 25000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV06','Rosalind Glover','Quan 8','09272534455','jnnw.yopejusfc@-rcnyh.org','P20','CN3', 2500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV07','Marta Evans','Quan 4','09243328646','ooog.oodmfrpv@u-asdl.com','P19','CN1', 20000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV08','Daniele Payne','Quan 6','09873458435','zuzsest2@hthedyl.pppifl.com','P25','CN1', 5500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV09','Annemarie Johnston','Quan 2','09591735311','jnxrl.hamhmkzcw@qfrtrt.net','P12','CN1', 17500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV10','Rosalinda Horn','Quan 6','09264949418','wjnlem2@ejmhvgeu.dowbwo.net','P15','CN3', 25500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV11','Carol Dunn','Quan 6','09868942672','vfluik.jvklm@qgdbmu.org','P13','CN2', 16000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV12','Anitra Whitehead','Quan 7','09717355877','prsjzb.faomwbq@jlkvm.ddcgfp.org','P24','CN1', 14500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV13','Lynnette Chavez','Quan 5','09773525349','yxwezrma@ncugvvkc.ceygzh.org','P10','CN1', 26000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV14','Tania Robinson','Quan 1','09991848539','tltchn8@ppzrzk.com','P14','CN3', 12500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV15','Rena Tucker','Quan 1','09941494119','vaovd.zxciufcymu@eps-vh.org','P20','CN1', 18500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV16','Marina Flores','Quan 1','09843655428','roesw54@zrr-pn.com','P28','CN2', 19000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV17','Corey David','Quan 6','09123377621','trxsrld.rzmvepvzac@tfdmgrse.ilegis.net','P27','CN1', 11500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV18','Christy Powers','Quan 2','09349783133','qjkmzt.dpjyx@fnwenl.net','P19','CN1', 27000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV19','Kathy Ingram','Quan 1','09299921532','usckkw.xytpqt@rswt-h.com','P20','CN1', 4000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV20','Trudy Chavez','Quan 7','09996448141','sdbaa@flmyncy.josob-.com','P21','CN1', 3500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV21','Layla Farmer','Quan 7','09897173749','wpje86@oalri.mjkrsl.net','P12','CN3', 27500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV22','Tracy Young','Quan 1','09365638287','blsirf796@gtatmb.com','P10','CN3', 10000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV23','Melonie Potts','Quan 6','09131391881','ebfrdgd.fwNVltf@aqgddu.org','P16','CN2', 29000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV24','Marian Solomon','Quan 3','09337582672','qsnbdmh.kugt@ytksbf.org','P10','CN1', 29500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV25','Suzette Cordova','Quan 8','09743877676','ddhglajj.gqwfxsblor@kuetzsqbo.qjcvao.net','P18','CN1', 9500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV26','Janet Lloyd','Quan 6','09212958724','jwczr5@yftbaw.org','P12','CN1', 2000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV27','Glenda Fleming','Quan 7','09822426322','yjkys329@zfibs-.com','P25','CN3', 21000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV28','Shelley Aguilar','Quan 3','09994882172','dunmheg.hnrhp@nbessnedg.NVfjnk.com','P17','CN2', 5000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV29','Angelita Baldwin','Quan 4','09878671365','xifrsb43@sanqyk.aticlv.com','P21','CN1', 18000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV30','Lynette Duke','Quan 7','09381362938','xkqmh.vimluriy@fqpsik.net','P24','CN2', 9000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV31','Holly Ramirez','Quan 1','09914542498','yptptj.oocglldvv@dysyyxzn.hgikmj.org','P26','CN2', 17000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV32','Ann Johnson','Quan 5','09736196227','dfmclz.beigzdzk@eleamk.net','P14','CN3', 13000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV33','Lara Larsen','Quan 4','09841724214','fqnc.yypslze@lbyidv.net','P23','CN3', 7500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV34','Geneva Garrett','Quan 3','09598484238','pltcia.euxlyoywu@unbgpz.org','P19','CN1', 6000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV35','Tabitha Dickerson','Quan 9','09756566649','epbo615@mxaajpxa.iihq-q.net','P11','CN1', 4500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV36','Lee Barber','Quan 9','09528322422','sbitqsdp@bucogc.zvcybn.net','P23','CN2', 14000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV37','Sofia Walker','Quan 8','09252975413','xkaw.dvjdks@jgqdftn.pcladv.net','P27','CN3', 8000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV38','June Hobbs','Quan 3','09719672557','axphpwdd.kgidxl@zmNVlg.com','P11','CN1', 20500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV39','Tomeka Bowen','Quan 4','09437819913','mofvutxc.upmtxhcv@prmodj.twnbeq.com','P19','CN3', 15500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV40','Dianna Gilmore','Quan 5','09411577791','gxnze843@kikbke.org','P21','CN3', 30000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV41','Julissa Summers','Quan 8','09637484898','fsgoxjk0@orpa.evfscm.com','P12','CN3', 15000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV42','Emma Huang','Quan 5','09457566848','qgaev@x-idnp.com','P25','CN2', NULL);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV43','Myrna Melendez','Quan 7','09999353579','hbgtpsxr48@uacc.ssaqfj.org','P22','CN2', 8500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV44','Carolina Floyd','Quan 3','09475327557','kdiihts267@ddb-lt.org','P15','CN1', 12000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV45','Latosha Rollins','Quan 9','09772791737','gdklqb74@bwucxn.zl-pwq.net','P29','CN3', 23000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV46','Nakia Mc Intyre','Quan 5','09186932619','lopoer01@ftfapu.org','P29','CN2', 26500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV47','Louise Haas','Quan 8','09569735583','qswmhzlb4@pwibby.net','P21','CN1', 10500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV48','Kari Mc Lean','Quan 1','09632785865','fbrspiyv.eeceigc@eipyvi.com','P21','CN1', 7000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV49','Sunny Grimes','Quan 9','09489915676','zskq60@mgkksv.jfozqf.org','P18','CN1', 11000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV50','Aisha Moyer','Quan 4','09465838697','irdqw.xrelhuu@sawgby.net','P12','CN2', 21500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV51','Rosemary Frey','Quan 7','09857983539','tbllmfh.rddnktey@tsfbzlwiq.xzuqwe.net','P13','CN3', 22500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV52','Jeana Baldwin','Quan 8','09447339992','uidonkk6@zpmpcn.ourjrl.com','P20','CN1', 24500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV53','Destiny Phelps','Quan 9', NULL,'jaemc.ibfh@coffjmqc.ppujf-.org','P21','CN2', 13500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV54','James Phillips','Quan 5','09994373137','rqwqquu112@y-bnld.net','P24','CN2', 3000000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV55','Danelle Donovan','Quan 7','09223947471','iknmhk70@magdpmdmx.jxxcvp.org','P19','CN2', 30500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV56','Kathrine Hoffman','Quan 8','09143981824','jepms51@-hc-zh.org','P25','CN2', 6500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV57','Georgina Jefferson','Quan 7','09248133969','slsdf590@cqaaduwdt.xouywv.org','P19','CN2', 16500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV58','Bessie Leon','Quan 2','09188218589','rimqfw.dqhcep@lgcnae.net','P12','CN3', 23500000);
INSERT INTO BT1N28.NhaNVien_1312366_1312454_1412185 (maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, luong) VALUES ('NV59','Demetra Clements','Quan 7','09121678719','vkxjeea.mdyc@xxzkvgqpp.ollrt-.net','P22','CN1', 28500000);

INSERT INTO BT1N28.DuAn_1312366_1312454_1412185 (maDA, tenDA, kinhPhi, phongChuTri, truongDA) VALUES ('DA01','Creative , Media', 50000000,'P23','NV06');
INSERT INTO BT1N28.DuAn_1312366_1312454_1412185 (maDA, tenDA, kinhPhi, phongChuTri, truongDA) VALUES ('DA02','Business (, Consumer); Services', 60000000,'P22','NV30');
INSERT INTO BT1N28.DuAn_1312366_1312454_1412185 (maDA, tenDA, kinhPhi, phongChuTri, truongDA) VALUES ('DA03','Software , Computer Services Business to Business (B2B);', 40000000,'P24','NV19');
INSERT INTO BT1N28.DuAn_1312366_1312454_1412185 (maDA, tenDA, kinhPhi, phongChuTri, truongDA) VALUES ('DA04','Business (, Consumer); Services', 10000000,'P12','NV44');
INSERT INTO BT1N28.DuAn_1312366_1312454_1412185 (maDA, tenDA, kinhPhi, phongChuTri, truongDA) VALUES ('DA05','Food , Drink', 90000000,'P28','NV14');
INSERT INTO BT1N28.DuAn_1312366_1312454_1412185 (maDA, tenDA, kinhPhi, phongChuTri, truongDA) VALUES ('DA06','ENVironment', 80000000,'P11','NV47');
INSERT INTO BT1N28.DuAn_1312366_1312454_1412185 (maDA, tenDA, kinhPhi, phongChuTri, truongDA) VALUES ('DA07','Agriculture, Horticulture , Fisheries', 20000000,'P27','NV29');
INSERT INTO BT1N28.DuAn_1312366_1312454_1412185 (maDA, tenDA, kinhPhi, phongChuTri, truongDA) VALUES ('DA08','Water', 70000000,'P25','NV30');
INSERT INTO BT1N28.DuAn_1312366_1312454_1412185 (maDA, tenDA, kinhPhi, phongChuTri, truongDA) VALUES ('DA09','Water', 30000000,'P16','NV35');

INSERT INTO BT1N28.ChiNhanh_1312366_1312454_1412185 (maCN, tenCN, truongChiNhanh) VALUES ('CN1','HaNoi','NV16');
INSERT INTO BT1N28.ChiNhanh_1312366_1312454_1412185 (maCN, tenCN, truongChiNhanh) VALUES ('CN2','DaNang','NV31');
INSERT INTO BT1N28.ChiNhanh_1312366_1312454_1412185 (maCN, tenCN, truongChiNhanh) VALUES ('CN3','HoChiMinh','NV51');


INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT00','Chemicals', 6800000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT01','Airports', 9300000,'DA02');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT02','Ports , Logistics', 8300000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT03','Aerospace (Civil)', 7100000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT04','Textiles, Interior Textiles , Carpets', 4800000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT05','Metallurgical Process Plant', 9000000,'DA02');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT06','Communications', 1800000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT07','Mechanical Electrical , Process Engineering', 9800000,'DA08');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT08','Textiles, Interior Textiles , Carpets', 10000000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT09','Metallurgical Process Plant', 5800000,'DA01');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT10','Business (, Consumer) Services', 1600000,'DA05');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT11','Food , Drink', 2600000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT12','Food , Drink', 4100000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT13','Financial Services', 2700000,'DA05');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT14','Oil , Gas', 3600000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT15','Railways', 4700000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT16','Chemicals', 7700000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT17','Textiles, Interior Textiles , Carpets', 8600000,'DA02');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT18','Clothing, Footwear , Fashion', 3100000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT19','Giftware, Jewellery , Tableware', 8400000,'DA01');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT20','Business (, Consumer) Services', 3300000,'DA05');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT21','Business (, Consumer) Services', 2400000,'DA01');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT22','Power', 9900000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT23','Oil , Gas', 8700000,'DA03');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT24','Ports , Logistics', 8000000,'DA01');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT25','Software , Computer Services Business to Business (B2B)', 9500000,'DA05');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT26','Airports', 7900000,'DA05');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT27','Biotechnology , Pharmaceuticals', 6600000,'DA02');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT28','Clothing, Footwear , Fashion', 1000000,'DA08');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT29','Food , Drink', 5000000,'DA03');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT30','Household Goods, Furniture , Furnishings', 1100000,'DA05');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT31','Chemicals', 3500000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT32','Metallurgical Process Plant', 6000000,'DA01');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT33','Creative , Media', 6200000,'DA09');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT34','Education , Training', 5300000,'DA09');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT35','Metals , Minerals', 8900000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT36','Construction', 2100000,'DA03');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT37','Giftware, Jewellery , Tableware', 9100000,'DA01');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT38','Education , Training', 1300000,'DA09');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT39','Marine', 8100000,'DA09');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT40','Leisure , Tourism', 1600000,'DA09');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT41','Water', 1400000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT42','Oil , Gas', 1700000,'DA02');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT43','Household Goods, Furniture , Furnishings', 5100000,'DA03');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT44','Electronics , IT Hardware', 1500000,'DA02');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT45','Creative , Media', 1500000,'DA09');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT46','Software , Computer Services Business to Business (B2B)', 9400000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT47','Mechanical Electrical , Process Engineering', 3700000,'DA05');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT48','Oil , Gas', 3400000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT49','Education , Training', 1700000,'DA05');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT50','Household Goods, Furniture , Furnishings', 7600000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT51','Aerospace (Civil)', 2900000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT52','Clothing, Footwear , Fashion', 7500000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT53','Leisure , Tourism', 3900000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT54','Communications', 9700000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT55','Automotive', 4500000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT56','Software , Computer Services Business to Business (B2B)', 6400000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT57','Construction', 7800000,'DA03');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT58','Metals , Minerals', 2200000,'DA03');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT59','Chemicals', 2800000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT60','Sports , leisure Infrastructure', 4600000,'DA09');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT61','Fire, Police , Security', 4000000,'DA03');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT62','Airports', 5500000,'DA01');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT63','Mechanical Electrical , Process Engineering', NULL,'DA02');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT64','Electronics , IT Hardware', 7000000,'DA08');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT65','Education , Training', 6500000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT66','Metallurgical Process Plant', 4200000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT67','Healthcare , Medical', 6100000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT68','Clothing, Footwear , Fashion', 7200000,'DA02');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT69','Creative , Media', 3000000,'DA01');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT70','Metallurgical Process Plant', 1100000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT71','Power', 1200000,'DA05');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT72','Financial Services', 1900000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT73','Construction', 5700000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT74','Fire, Police , Security', 5400000,'DA01');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT75','Mining', 1000000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT76','Food , Drink', 5900000,'DA08');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT77','Chemicals', 6700000,'DA05');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT78','Household Goods, Furniture , Furnishings', 3800000,'DA09');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT79','Metallurgical Process Plant', 2000000,'DA01');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT80','Healthcare , Medical', 4300000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT81','Mechanical Electrical , Process Engineering', 7300000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT82','Food , Drink', 1400000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT83','Textiles, Interior Textiles , Carpets', 9200000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT84','ENVironment', 4900000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT85','Aerospace (Civil)', 1300000,'DA08');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT86','Metallurgical Process Plant', 8800000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT87','Construction', 5200000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT88','Automotive', 3200000,'DA02');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT89','Giftware, Jewellery , Tableware', 5600000,'DA06');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT90','Clothing, Footwear , Fashion', 1200000,'DA03');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT91','Water', 7400000,'DA04');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT92','Metals , Minerals', 2500000,'DA09');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT93','Automotive', 6900000,'DA02');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT94','Financial Services', 6300000,'DA01');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT95','Mining', 8500000,'DA07');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT96','Fire, Police , Security', 8200000,'DA08');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT97','Chemicals', 4400000,'DA03');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT98','Fire, Police , Security', 2300000,'DA05');
INSERT into BT1N28.ChiTieu_1312366_1312454_1412185 (maChiTieu, tenChiTieu, soTien, duAn) VALUES ('CT99','Business (, Consumer) Services', 9600000,'DA07');

/* Enable lại các constraint */
alter table BT1N28.ChiTieu_1312366_1312454_1412185 enable constraint FK_ChiTieu_DuAn;

alter table BT1N28.DuAn_1312366_1312454_1412185 enable constraint FK_DuAn_PhongBan;
alter table BT1N28.DuAn_1312366_1312454_1412185 enable constraint FK_DuAn_NhanVien;

alter table BT1N28.PhanCong_1312366_1312454_1412185 enable constraint FK_PhanCong_DuAn;
alter table BT1N28.PhanCong_1312366_1312454_1412185 enable constraint FK_PhanCong_NhanVien;

alter table BT1N28.PhongBan_1312366_1312454_1412185 enable constraint FK_PhongBan_ChiNhanh;

alter table BT1N28.ChiNhanh_1312366_1312454_1412185 enable constraint FK_ChiNhanh_NhanVien;

alter table BT1N28.NhanVien_1312366_1312454_1412185 enable constraint FK_NhanVien_ChiNhanh;
alter table BT1N28.NhanVien_1312366_1312454_1412185 enable constraint FK_NhanVien_PhongBan;

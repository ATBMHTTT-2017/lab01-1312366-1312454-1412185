alter session set "_ORACLE_SCRIPT"=true;

CREATE USER BT1N28 IDENTIFIED BY BT1N28;

GRANT CONNECT,RESOURCE,DBA TO BT1N28;

GRANT UNLIMITED TABLESPACE TO BT1N28;
GRANT CREATE SESSION  TO BT1N28;
GRANT CREATE ANY TABLE TO BT1N28;


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

GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.ChiTieu_1312366_1312454_1412185 TO BT1N28;
GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.DuAn_1312366_1312454_1412185 TO BT1N28;
GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.PhanCong_1312366_1312454_1412185 TO BT1N28;
GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.PhongBan_1312366_1312454_1412185 TO BT1N28;
GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.ChiNhanh_1312366_1312454_1412185 TO BT1N28;
GRANT SELECT , INSERT, UPDATE , DELETE on BT1N28.NhanVien_1312366_1312454_1412185 TO BT1N28;

alter table BT1N28.ChiTieu_1312366_1312454_1412185 add constraint FK_ChiTieu_DuAn foreign key (duAn) references BT1N28.DuAn_1312366_1312454_1412185(maDA);

alter table BT1N28.DuAn_1312366_1312454_1412185 add constraint FK_DuAn_PhongBan foreign key (phongChuTri) references BT1N28.PhongBan_1312366_1312454_1412185(maPhong);
alter table BT1N28.DuAn_1312366_1312454_1412185 add constraint FK_DuAn_NhanVien foreign key (truongDA) references BT1N28.NhanVien_1312366_1312454_1412185(maNV);

alter table BT1N28.PhanCong_1312366_1312454_1412185 add constraint FK_PhanCong_DuAn foreign key (duAn) references BT1N28.DuAn_1312366_1312454_1412185(maDA);
alter table BT1N28.PhanCong_1312366_1312454_1412185 add constraint FK_PhanCong_NhanVien foreign key (maNV) references BT1N28.NhanVien_1312366_1312454_1412185(maNV);

alter table BT1N28.PhongBan_1312366_1312454_1412185 add constraint FK_PhongBan_ChiNhanh foreign key (chiNhanh) references BT1N28.ChiNhanh_1312366_1312454_1412185(maCN);

alter table BT1N28.ChiNhanh_1312366_1312454_1412185 add constraint FK_ChiNhanh_NhanVien foreign key (truongChiNhanh) references BT1N28.NhanVien_1312366_1312454_1412185(maNV);

alter table BT1N28.NhanVien_1312366_1312454_1412185 add constraint FK_NhanVien_ChiNhanh foreign key (chiNhanh) references BT1N28.ChiNhanh_1312366_1312454_1412185(maCN);
alter table BT1N28.NhanVien_1312366_1312454_1412185 add constraint FK_NhanVien_PhongBan foreign key (maPhong) references BT1N28.PhongBan_1312366_1312454_1412185(maPhong);

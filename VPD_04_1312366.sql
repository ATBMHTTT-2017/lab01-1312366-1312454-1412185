create or replace context NhanVien_context using Nhanvien_context_pak;
create or replace package Nhanvien_context_pak
as
  procedure KiemTraNhanVienKhongGiuChucVu;
  procedure ThongTinPhongBan;
end;/

create or replace package body Nhanvien_context_pak
as
  procedure KiemTraNhanVienKhongGiuChucVu
  as
    flag number;
  begin
    flag:=0;
    select  count(N.MANV)
    into flag
    from BT1N28.NHANVIEN_366_454_185 N, BT1N28.PHONGBAN_366_454_185 P, BT1N28.DUAN_366_454_185 D,BT1N28.CHINHANH_366_454_185 CN
    where (N.MANV=P.TRUONGPHONG or N.MANV=D.TRUONGDA or N.MANV=CN.TRUONGCHINHANH) and N.MANV=sys_context('userenv','SESSION_USER');
    if (flag=0) then
      dbms_session.set_context('NhanVien_context','KiemTraNhanVienKhongGiuChucVu',1);
    else
      dbms_session.set_context('NhanVien_context','KiemTraNhanVienKhongGiuChucVu',0);
    end if;
    
  end;
  procedure ThongTinPhongBan
  as
    MP varchar(20);
  begin
    select maPhong
    into MP
    from BT1N28.NHANVIEN_366_454_185
    where BT1N28.NHANVIEN_366_454_185.MANV=sys_context('userenv','SESSION_USER');

    dbms_session.set_context('NhanVien_context','MaPhong',MP);
  end;
end;

create or replace trigger KTNhanVienKhongGiuChucVu_trg after logon on database
  begin
  BT1N28.Nhanvien_context_pak.KiemTraNhanVienKhongGiuChucVu;
  end;
 / 
 create or replace trigger KTMaPhong_trg after logon on database
  begin
  BT1N28.Nhanvien_context_pak.ThongTinPhongBan;
  end; 
--drop trigger KTMaPhong_trg
--DROP TRIGGER KTNhanVienKhongGiuChucVu_trg
  
create or replace Package ThongTinNhanVien_Policy_pak
as
  function ThongTinCaNhan_Policy(D1 varchar2,d2 varchar2 ) return varchar2;
  function ThongTinLuong_Policy(D1 varchar2,d2 varchar2 ) return varchar2;
end;
/
create or replace Package body ThongTinNhanVien_Policy_pak
as
  function ThongTinCaNhan_Policy(D1 varchar2,d2 varchar2 ) return varchar2
  as
  predicate varchar(2000);
  begin
    if(sys_context('NhanVien_context','KiemTraNhanVienKhongGiuChucVu')=1) then
      predicate:='NHANVIEN_366_454_185.maphong=sys_context(''NhanVien_context'',''MaPhong'')';
      return predicate;
    else return '1=1';
    end if;
  end;
  
  function ThongTinLuong_Policy(D1 varchar2,d2 varchar2 ) return varchar2
  as
  predicate varchar(2000);
  begin
    if(sys_context('NhanVien_context','KiemTraNhanVienKhongGiuChucVu')=1) then
      predicate:='NHANVIEN_366_454_185.MaNV=sys_context(''userenv'',''SESSION_USER'')';
      return predicate;
    else return '1=1';
    end if; 
  end;
end;
  
execute DBMS_RLS.ADD_POLICY(OBJECT_SCHEMA => 'BT1N28',OBJECT_NAME => 'NHANVIEN_366_454_185',POLICY_NAME => 'ThongTinNhanVien_Policy_pak' ,FUNCTION_SCHEMA => 'BT1N28' ,POLICY_FUNCTION => 'ThongTinNhanVien_Policy_pak.ThongTinCaNhan_Policy',STATEMENT_TYPES => 'select', POLICY_TYPE =>DBMS_RLS.DYNAMIC);
execute DBMS_RLS.ADD_POLICY(OBJECT_SCHEMA => 'BT1N28',OBJECT_NAME => 'NHANVIEN_366_454_185',POLICY_NAME => 'ThongTinLuong_Policy' ,FUNCTION_SCHEMA => 'BT1N28' ,POLICY_FUNCTION => 'ThongTinNhanVien_Policy_pak.ThongTinLuong_Policy',STATEMENT_TYPES => 'select' ,sec_relevant_cols=>'Luong',sec_relevant_cols_opt=>dbms_rls.ALL_ROWS);
--execute dbms_rls.drop_policy(OBJECT_SCHEMA => 'BT1N28',OBJECT_NAME => 'NHANVIEN_366_454_185',POLICY_NAME => 'ThongTinNhanVien_Policy_pak' )


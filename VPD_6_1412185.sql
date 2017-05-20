GRANT EXECUTE ON DBMS_RLS TO SYSTEM;
GRANT EXECUTE ON DBMS_RLS TO BT1N28;

CREATE OR REPLACE CONTEXT ThongTinNhanVien USING NhanVien_pkg;
CREATE OR REPLACE PACKAGE NhanVien_pkg IS
PROCEDURE GetThongTinNhanVien;
END;

CREATE OR REPLACE PACKAGE BODY NhanVien_pkg IS
PROCEDURE GetThongTinNhanVien
AS
tenusername char(100);
tenphong char(100);
tenduan char(100);
BEGIN
tenusername := LOWER(SYS_CONTEXT('USERENV','SESSION_USER'));
DBMS_SESSION.set_context('ThongTinNhanVien','GetUsername',tenusername); 

SELECT distinct MAPHONG into tenphong FROM BT1N28.PHONGBAN_1312366_1312454_1412185 WHERE TRUONGPHONG = 
tenusername;
DBMS_SESSION.set_context('ThongTinNhanVien','GetPhong',tenphong); 

SELECT distinct MADA into tenduan FROM BT1N28.DUAN_1312366_1312454_1412185 
WHERE upper(PHONGCHUTRI) = upper(tenphong);
DBMS_SESSION.set_context('ThongTinNhanVien','GetDuAn',tenduan); 

EXCEPTION
WHEN NO_DATA_FOUND THEN NULL;
END GetThongTinNhanVien;
END;

CREATE OR REPLACE TRIGGER Set_ThongTinNhanVien AFTER LOGON ON database 
BEGIN NhanVien_pkg.GetThongTinNhanVien; 
EXCEPTION 
WHEN NO_DATA_FOUND 
THEN 
NULL;
END;

grant execute on NhanVien_pkg to public;
grant execute on GetThongTinNhanVien to public;


create or replace function TP_DOC_CT(
  p_schema in varchar2,
  p_object in varchar2
)
return varchar2
as
  user varchar2(100);
  MA_PHONG varchar2(100);
  MA_DA varchar(100);
begin 
  user:= lower(SYS_CONTEXT('ThongTinNhanVien', 'GetUsername'));
  MA_PHONG:= SYS_CONTEXT('ThongTinNhanVien', 'GetPhong');
  MA_DA:=SYS_CONTEXT('ThongTinNhanVien','GetDuAn');
  if (MA_PHONG is null) then
    return'0=1';
  else
    begin
      return 'DUAN = '|| q'[']'|| MA_DA|| q'[']' ;
    end;
  end if;
end;




begin
 DBMS_RLS.ADD_POLICY
( OBJECT_SCHEMA => 'BT1N28',
  OBJECT_NAME =>'CHITIEU_1312366_1312454_1412185',
  POLICY_NAME =>'DOCCHITIEU',
  FUNCTION_SCHEMA =>'SYS',
  POLICY_FUNCTION =>'TP_DOC_CT',
  STATEMENT_TYPES =>'SELECT',
  sec_relevant_cols => 'SOTIEN',
  sec_relevant_cols_opt=>dbms_rls.ALL_ROWS,
  UPDATE_CHECK =>true);
end;




begin
 DBMS_RLS.ENABLE_POLICY
( 'BT1N28',
  'CHITIEU_1312366_1312454_1412185',
  'DOCCHITIEU',
  true);
end;

begin
  DBMS_RLS.DROP_POLICY
  (
  'BT1N28',
  'CHITIEU_1312366_1312454_1412185',
  'DOCCHITIEU'
  );
end;



drop function TP_DOC_CT;
drop function TRUONGPHONGDOCCHITIEU;
drop trigger Set_ThongTinNhanVien;
drop package NhanVien_pkg;



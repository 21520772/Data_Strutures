use QLBH
--Cau 1 QLBH
CREATE TABLE KHACHHANG
(
	MAKH char(4) primary key,
	HOTEN varchar(40),
	DCHI varchar(50),
	SODT varchar(20),
	NGSINH smalldatetime,
	NGDK smalldatetime,
	DOANHSO money
)

CREATE TABLE NHANVIEN
(
	MANV char(4)primary key,
	HOTEN varchar(40),
	SODT varchar(20),
	NGVL smalldatetime
)

create table SANPHAM
(
	MASP char(4) primary key,
	TENSP varchar(40),
	DVT varchar(20),
	NUOCSX varchar(40),
	GIA money
)

create table HOADON
(
	SOHD int primary key,
	NGHD smalldatetime,
	

	MAKH char(4) foreign key references KHACHHANG(MAKH),
	MANV char(4) foreign key references NHANVIEN(MANV)
	TRIGIA money,
)


create table CTHD
(
	SOHD int foreign key references HOADON(SOHD),
	MASP char(4) foreign key references SANPHAM(MASP),
	SL int,
	constraint PK_CTHD primary key (SOHD,MASP)

)

--Phan I
--Cau 2 QLBH

alter table SANPHAM add GHICHU varchar(20);

--Cau 3 QLBH

alter table KHACHHANG add LOAIKH tinyint;

--Cau 4 QLBH

alter table SANPHAM alter column GHICHU varchar(100);

--Cau 5

alter table SANPHAM drop column GHICHU;

--Cau 6

alter table KHACHHANG alter column LOAIKH varchar(20);

--Cau 7

alter table SANPHAM add constraint SP_RANGBUOC check(DVT = 'cay' or DVT= 'hop' or DVT='cai' or DVT='quyen' or DVT ='chuc');

--Cau 8

alter table SANPHAM add constraint SP_GIA check(GIA>=500);

--Cau 9

alter table CTHD add constraint SL_KT check(SL>=1);


--Cau 10

alter table KHACHHANG add constraint KH_NGAYDK check(NGDK >NGSINH);


--Phan II
--Cau 1

SET DATEFORMAT DMY 

-- KHACHHANG
insert into KHACHHANG values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into KHACHHANG values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into KHACHHANG values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into KHACHHANG values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into KHACHHANG values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into KHACHHANG values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into KHACHHANG values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into KHACHHANG values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into KHACHHANG values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into KHACHHANG values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

-------------------------------
-- NHANVIEN
insert into NHANVIEN values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into NHANVIEN values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into NHANVIEN values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into NHANVIEN values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into NHANVIEN values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')



-------------------------------
-- SANPHAM
insert into SANPHAM values('BC01','But chi','cay','Singapore',3000)
insert into SANPHAM values('BC02','But chi','cay','Singapore',5000)
insert into SANPHAM values('BC03','But chi','cay','Viet Nam',3500)
insert into SANPHAM values('BC04','But chi','hop','Viet Nam',30000)
insert into SANPHAM values('BB01','But bi','cay','Viet Nam',5000)
insert into SANPHAM values('BB02','But bi','cay','Trung Quoc',7000)
insert into SANPHAM values('BB03','But bi','hop','Thai Lan',100000)
insert into SANPHAM values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into SANPHAM values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into SANPHAM values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into SANPHAM values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into SANPHAM values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into SANPHAM values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into SANPHAM values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into SANPHAM values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into SANPHAM values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into SANPHAM values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into SANPHAM values('ST04','So tay','quyen','Thai Lan',55000)
insert into SANPHAM values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into SANPHAM values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into SANPHAM values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into SANPHAM values('ST08','Bong bang','cai','Viet Nam',1000)
insert into SANPHAM values('ST09','But long','cay','Viet Nam',5000)
insert into SANPHAM values('ST10','But long','cay','Trung Quoc',7000)

-------------------------------
-- HOADON
insert into HOADON values(1001,'23/07/2006','KH01','NV01',320000)
insert into HOADON values(1002,'12/08/2006','KH01','NV02',840000)
insert into HOADON values(1003,'23/08/2006','KH02','NV01',100000)
insert into HOADON values(1004,'01/09/2006','KH02','NV01',180000)
insert into HOADON values(1005,'20/10/2006','KH01','NV02',3800000)
insert into HOADON values(1006,'16/10/2006','KH01','NV03',2430000)
insert into HOADON values(1007,'28/10/2006','KH03','NV03',510000)
insert into HOADON values(1008,'28/10/2006','KH01','NV03',440000)
insert into HOADON values(1009,'28/10/2006','KH03','NV04',200000)
insert into HOADON values(1010,'01/11/2006','KH01','NV01',5200000)
insert into HOADON values(1011,'04/11/2006','KH04','NV03',250000)
insert into HOADON values(1012,'30/11/2006','KH05','NV03',21000)
insert into HOADON values(1013,'12/12/2006','KH06','NV01',5000)
insert into HOADON values(1014,'31/12/2006','KH03','NV02',3150000)
insert into HOADON values(1015,'01/01/2007','KH06','NV01',910000)
insert into HOADON values(1016,'01/01/2007','KH07','NV02',12500)
insert into HOADON values(1017,'02/01/2007','KH08','NV03',35000)
insert into HOADON values(1018,'13/01/2007','KH08','NV03',330000)
insert into HOADON values(1019,'13/01/2007','KH01','NV03',30000)
insert into HOADON values(1020,'14/01/2007','KH09','NV04',70000)
insert into HOADON values(1021,'16/01/2007','KH10','NV03',67500)
insert into HOADON values(1022,'16/01/2007',Null,'NV03',7000)
insert into HOADON values(1023,'17/01/2007',Null,'NV01',330000)

-------------------------------
-- CTHD
insert into CTHD values(1001,'TV02',10)
insert into CTHD values(1001,'ST01',5)
insert into CTHD values(1001,'BC01',5)
insert into CTHD values(1001,'BC02',10)
insert into CTHD values(1001,'ST08',10)
insert into CTHD values(1002,'BC04',20)
insert into CTHD values(1002,'BB01',20)
insert into CTHD values(1002,'BB02',20)
insert into CTHD values(1003,'BB03',10)
insert into CTHD values(1004,'TV01',20)
insert into CTHD values(1004,'TV02',10)
insert into CTHD values(1004,'TV03',10)
insert into CTHD values(1004,'TV04',10)
insert into CTHD values(1005,'TV05',50)
insert into CTHD values(1005,'TV06',50)
insert into CTHD values(1006,'TV07',20)
insert into CTHD values(1006,'ST01',30)
insert into CTHD values(1006,'ST02',10)
insert into CTHD values(1007,'ST03',10)
insert into CTHD values(1008,'ST04',8)
insert into CTHD values(1009,'ST05',10)
insert into CTHD values(1010,'TV07',50)
insert into CTHD values(1010,'ST07',50)
insert into CTHD values(1010,'ST08',100)
insert into CTHD values(1010,'ST04',50)
insert into CTHD values(1010,'TV03',100)
insert into CTHD values(1011,'ST06',50)
insert into CTHD values(1012,'ST07',3)
insert into CTHD values(1013,'ST08',5)
insert into CTHD values(1014,'BC02',80)
insert into CTHD values(1014,'BB02',100)
insert into CTHD values(1014,'BC04',60)
insert into CTHD values(1014,'BB01',50)
insert into CTHD values(1015,'BB02',30)
insert into CTHD values(1015,'BB03',7)
insert into CTHD values(1016,'TV01',5)
insert into CTHD values(1017,'TV02',1)
insert into CTHD values(1017,'TV03',1)
insert into CTHD values(1017,'TV04',5)
insert into CTHD values(1018,'ST04',6)
insert into CTHD values(1019,'ST05',1)
insert into CTHD values(1019,'ST06',2)
insert into CTHD values(1020,'ST07',10)
insert into CTHD values(1021,'ST08',5)
insert into CTHD values(1021,'TV01',7)
insert into CTHD values(1021,'TV02',10)
insert into CTHD values(1022,'ST07',1)
insert into CTHD values(1023,'ST04',6)

--Phan II QuanLyBanHang 

--Cau 2

SELECT * into SANPHAM1 from SANPHAM 
SELECT * into KHACHHANG1 from KHACHHANG

--Cau 3

update SANPHAM1 set GIA=GIA*1.05 where NUOCSX='Thai Lan'

--Cau 4

update SANPHAM1 set GIA=GIA*0.95 where NUOCSX='Trung Quoc' and GIA <=10000

--Cau 5

update KHACHHANG1 set LOAIKH='Vip' where (NGDK < '1/1/2007' and DOANHSO >=10000000) or (NGDK > '1/1/2007' and DOANHSO >=2000000)

--Phan III
--Cau 1

select MASP, TENSP from SANPHAM where NUOCSX='Trung Quoc'

--Cau 2

select MASP, TENSP from SANPHAM where DVT='cay'or DVT='quyen'

--Cau 3

select MASP, TENSP from SANPHAM where MASP like 'B_01'

--Cau 4

select MASP, TENSP from SANPHAM where NUOCSX='Trung Quoc' and GIA between 30000 and 40000

--Cau 5

select MASP, TENSP from SANPHAM where NUOCSX='Trung Quoc' or NUOCSX='Thai Lan' and GIA between 30000 and 40000

--Cau 6

select SOHD,TRIGIA from HOADON where NGHD = '1/1/2007' or NGHD ='2/1/2007'

--Cau 7

select SOHD, TRIGIA from HOADON where year(NGHD)=2007 and month(NGHD)=1
order by NGHD ASC, TRIGIA DESC

--Cau 8

select KHACHHANG.MAKH ,HOTEN from KHACHHANG,HOADON where KHACHHANG.MAKH=HOADON.MAKH and HOADON.NGHD ='1/1/2007'

--Cau 9

select SOHD, TRIGIA from HOADON, NHANVIEN where NHANVIEN.HOTEN='Nguyen Van B' and HOADON.NGHD='28/10/2006' and NHANVIEN.MANV=HOADON.MANV

--Cau 10

select SANPHAM.MASP, TENSP from HOADON, CTHD, KHACHHANG, SANPHAM where  KHACHHANG.HOTEN='Nguyen Van A' and CTHD.SOHD=HOADON.SOHD and SANPHAM.MASP=CTHD.MASP

and year(NGHD)=2006 and month(NGHD)=10 and KHACHHANG.MAKH=HOADON.MAKH

--Cau 11

select SOHD from CTHD where MASP in ('BB01','BB02')

--Phan III
--Cau 12

select SOHD from CTHD where (MASP in ('BB01','BB02')) and (SL between 10 and 20 )

---Cau 13

select SOHD from CTHD where (MASP = 'BB01' and (SL between 10 and 20 )) and SOHD in (select SOHD from CTHD where (MASP = 'BB02' and (SL between 10 and 20 )))

--Cau 14

select distinct SANPHAM.MASP, TENSP from SANPHAM,  CTHD, HOADON where NUOCSX='Trung Quoc' or ( NGHD='1/1/2007' and SANPHAM.MASP=CTHD.MASP and CTHD.SOHD=HOADON.SOHD)

--Cau 15

select SANPHAM.MASP, TENSP from SANPHAM, CTHD except select SANPHAM.MASP, TENSP from SANPHAM, CTHD where CTHD.MASP=SANPHAM.MASP

--Cau 16 

select SANPHAM.MASP, TENSP from SANPHAM, CTHD, HOADON except select SANPHAM.MASP, TENSP from SANPHAM, CTHD, HOADON where CTHD.MASP=SANPHAM.MASP and year(NGHD)='2006'

--Cau 17

select SANPHAM.MASP, TENSP from SANPHAM, CTHD, HOADON where NUOCSX='Trung Quoc' and year(NGHD)='2006' except select SANPHAM.MASP, TENSP from SANPHAM, CTHD, HOADON where CTHD.MASP=SANPHAM.MASP and year(NGHD)='2006' and NUOCSX='Trung Quoc'

--Cau 18

select SOHD from HOADON where not exists (select * from SANPHAM where NUOCSX='Singapore' and not exists (select * from CTHD where HOADON.SOHD=CTHD.SOHD and CTHD.MASP=SANPHAM.MASP))

--Cau 19

select SOHD from HOADON where year(NGHD)='2006' and not exists (select * from SANPHAM where NUOCSX='Singapore' and not exists (select * from CTHD where HOADON.SOHD=CTHD.SOHD and CTHD.MASP=SANPHAM.MASP))

--Cau 20

select count(*) from HOADON where MAKH not in (select MAKH from KHACHHANG where HOADON.MAKH=KHACHHANG.MAKH)

--Cau 21

select count(MASP) from HOADON inner join CTHD on HOADON.SOHD=CTHD.SOHD where (year(NGHD)=2006)

--Cau 22

select max(TRIGIA),min(TRIGIA) from HOADON 

--Cau 23

select avg(TRIGIA) from HOADON, CTHD where HOADON.SOHD=CTHD.SOHD and year(NGHD)=2006

--Cau 24

select sum(TRIGIA) from HOADON, CTHD where HOADON.SOHD=CTHD.SOHD and year(NGHD)=2006

--Cau 25

select distinct HOADON.SOHD from HOADON, CTHD where TRIGIA=(select max(TRIGIA) from HOADON)

--Cau 26

select HOTEN from KHACHHANG, HOADON where TRIGIA=(select max(TRIGIA) from HOADON) and KHACHHANG.MAKH=HOADON.MAKH

--Cau 27

select top 3 MAKH,HOTEN from KHACHHANG order by DOANHSO desc

--Cau 28

select MASP, TENSP from SANPHAM where GIA in (select distinct top 3 GIA from SANPHAM order by GIA desc)

--Cau 29

select MASP, TENSP from SANPHAM where GIA in (select distinct top 3 GIA from SANPHAM order by GIA desc) and NUOCSX='Thai Lan'

--Cau 30

select MASP, TENSP from SANPHAM where GIA in (select distinct top 3 GIA from SANPHAM where NUOCSX='Trung Quoc' order by GIA desc) and NUOCSX='Trung Quoc'


--Cau 31

select top 3 rank() over (order by DOANHSO desc ),* from KHACHHANG order by DOANHSO desc

--Cau 32

select count(*) from SANPHAM where NUOCSX='Trung Quoc'

--Cau 33

select NUOCSX ,count(*) from SANPHAM group by NUOCSX

--Cau 34

select NUOCSX ,min(GIA) as Min, max(GIA) as Max, AVG(GIA) as TrungBinh from SANPHAM group by NUOCSX

--Cau 35 

select NGHD, sum(TRIGIA) as DoanhThu from HOADON group by NGHD

--Cau 36

select MASP, sum(SL) as SoLuong from HOADON, CTHD where HOADON.SOHD=CTHD.SOHD and month(NGHD)=10 and year(NGHD) =2006 group by MASP

--Cau 37

select month(NGHD) as Thang, sum(TRIGIA) as DoanhThu from HOADON group by month(NGHD)

--Cau 38

select SOHD ,count(MASP) SoSP from CTHD group by SOHD having count(MASP)>=4

--Cau 39

select SOHD, count(CTHD.MASP) from CTHD, SANPHAM where CTHD.MASP=SANPHAM.MASP and NUOCSX='Viet Nam' group by SOHD having count(CTHD.MASP) >=3

--Cau 40

select top 1 HOADON.MAKH, HOTEN from HOADON, KHACHHANG where HOADON.MAKH is not null and HOADON.MAKH =KHACHHANG.MAKH group by HOADON.MAKH, KHACHHANG.HOTEN order by count(HOADON.MAKH) desc

--Cau 41

select top 1 month(NGHD) as Thang from HOADON group by month(NGHD) order by sum(TRIGIA) desc

--Cau 42

select MASP, TENSP from SANPHAM where MASP=(select top 1 MASP from CTHD group by MASP order by sum(SL) desc)

--Cau 43

SELECT sp1.NUOCSX, sp1.MASP, sp1.TENSP
FROM SANPHAM sp1
WHERE sp1.GIA in
(
    SELECT max(sp.GIA)
    FROM SANPHAM sp
    WHERE sp1.NUOCSX = sp.NUOCSX
)

--Cau 44

select NUOCSX, GIA from SANPHAM group by NUOCSX, GIA having count(distinct MASP)>=3

--Cau 45

select MAKH, HOTEN from KHACHHANG where MAKH = (select top 1 B.MAKH from (select top 10 MAKH, DOANHSO from KHACHHANG order by DOANHSO desc)as B join KHACHHANG on KHACHHANG.DOANHSO=B.DOANHSO)

--Lab5
--Cau 11

create trigger nghd_ngdk_insert
on HOADON
for insert
as
	declare @ngmh smalldatetime
	declare @ngdk smalldatetime
	select @ngmh=NGHD, @ngdk=NGDK
	from KHACHHANG, inserted
	where KHACHHANG.MAKH=inserted.MAKH
	if @ngmh <= @ngdk
	begin
		rollback transaction
		print 'Ngay mua hang phai lon hon ngay dang ky'
	end


create trigger nghd_ngdk_update_hoadon
on HOADON
for update
as if(update(MAKH) or update(NGHD))
begin
	declare @ngmh smalldatetime
	declare @ngdk smalldatetime
	select @ngmh=NGHD, @ngdk=NGDK
	from KHACHHANG, inserted
	where KHACHHANG.MAKH=inserted.MAKH
	if @ngmh <= @ngdk
	begin
		rollback transaction
		print 'Ngay mua hang phai lon hon ngay dang ky'
	end
end


create trigger nghd_ngdk_update_khachhang
on KHACHHANG
for update
as 
	declare @ngdk smalldatetime
	declare @makh char(4)
	select @ngdk=NGDK, @makh=MAKH
	from inserted
	if (update(NGDK))
	begin
		if(exists(select * from HOADON where MAKH=@makh and @ngdk >= NGHD))
		begin
			rollback transaction
			print 'Ngay dang ki phai nho hon ngay hoa don'
		end
	end

--Cau 12

create trigger nghd_ngvl_insert
on HOADON
after insert
as
	declare @ngbh smalldatetime
	declare @ngvl smalldatetime
	select @ngbh=NGHD, @ngvl=NGVL
	from NHANVIEN, inserted
	where NHANVIEN.MANV=inserted.MANV
	if @ngbh <= @ngvl
	begin
		rollback transaction
		print 'Ngay ban hang phai lon hon ngay vao lam'
	end;
	
create trigger nghd_ngvl_update_hoadon
on HOADON
after update
as if(update(MANV) or update(NGHD))
begin
	declare @ngbh smalldatetime
	declare @ngvl smalldatetime
	select @ngbh=NGHD, @ngvl=NGVL
	from NHANVIEN, inserted
	where NHANVIEN.MANV=inserted.MAKH
	if @ngbh <= @ngvl
	begin
		rollback transaction
		print 'Ngay ban hang phai lon hon ngay vao lam'
	end
end;

create trigger nghd_ngvl_update_nhanvien
on NHANVIEN
after update
as 
	declare @ngvl smalldatetime
	declare @manv char(4)
	select @ngvl=NGVL, @manv=MANV
	from inserted
	if (update(NGVL))
	begin
		if(exists(select * from HOADON where MANV=@manv and @ngvl >= NGHD))
		begin
			rollback transaction
			print 'Ngay vao lam phai nho hon ngay hoa don'
		end
	end;


--Cau 13

create trigger trg_hd_cthd 
on HOADON
for insert
as
begin
	declare @sohd int, @count_sohd int
	select @sohd = SOHD from inserted
	select @count_sohd = count(SOHD) from CTHD where SOHD = @sohd

	if(@count_sohd <1)
	
		begin
			print('Error')
			rollback transaction
			end
end 
--Cau 14

CREATE TRIGGER TRG_14_INS_HD ON HOADON
FOR INSERT
AS
 UPDATE HOADON SET  TRIGIA=0 WHERE SOHD=(SELECT  SOHD  FROM  INSERTED)
 PRINT'DA INSERT 1 HOADON VOI TRIGIA BAN DAU LA 0 VND' 



CREATE TRIGGER TRG_14_UPD_HD ON HOADON
FOR INSERT
AS 
UPDATE HOADON SET  TRIGIA=(SELECT TRIGIA FROM DELETED)
 WHERE SOHD=(SELECT  SOHD FROM  INSERTED)
 PRINT'DA UPDATE 1 HOADON VOI TRIGIA KHONG THAY DOI'



CREATE TRIGGER TRG_14_INS_CTHD ON CTHD
FOR INSERT
AS
 DECLARE  @SL  INT, @GIA  MONEY, @SOHD INT
 SELECT @GIA=GIA,@SL=SL,@SOHD=SOHD
 FROM  INSERTED A, SANPHAM B
 WHERE A.MASP=B.MASP
 UPDATE HOADON
 SET  TRIGIA=TRIGIA+@SL*@GIA
  PRINT'DA INSERT 1 CTHD VA UPDATE LAI TRIGIA CUA HOADON TUONG UNG'



CREATE TRIGGER TRG_14_DEL_CTHD ON CTHD
FOR DELETE
AS
 DECLARE  @SL  INT, @GIA  MONEY, @SOHD INT
 SELECT @GIA=GIA,@SL=SL,@SOHD=SOHD
 FROM  DELETED A, SANPHAM B
 WHERE A.MASP=B.MASP
 UPDATE HOADON SET  TRIGIA=TRIGIA-@SL*@GIA
  PRINT'DA DELETE 1 CTHD VA UPDATE LAI TRIGIA CUA HOADON TUONG UNG'



CREATE TRIGGER TRG_14_CTHD_UPD ON CTHD
FOR UPDATE
AS
 DECLARE  @SL_CU INT, @SL_MOI INT, @GIA_CU MONEY,@GIA_MOI MONEY,@SOHD_CU INT,@SOHD_MOI INT
 SELECT @GIA_CU=GIA,@SL_CU=SL,@SOHD_CU=SOHD FROM  DELETED A, SANPHAM B WHERE A.MASP=B.MASP
 SELECT @GIA_MOI=GIA,@SL_MOI=SL,@SOHD_MOI=SOHD FROM  INSERTED A, SANPHAM B WHERE A.MASP=B.MASP
 IF(@SOHD_CU=@SOHD_MOI)
  BEGIN
   UPDATE HOADON  SET  TRIGIA=TRIGIA+@SL_MOI*@GIA_MOI-@SL_CU*@GIA_CU WHERE SOHD=@SOHD_CU
  END;
 ELSE
  BEGIN
   UPDATE HOADON  SET  TRIGIA=TRIGIA-@SL_CU*@GIA_CU WHERE SOHD=@SOHD_CU
   UPDATE HOADON SET  TRIGIA=TRIGIA+@SL_MOI*@GIA_MOI  WHERE SOHD=@SOHD_MOI
  END;
 PRINT'DA UPDATE 1 CTHD VA UPDATE LAI TRIGIA CUA HOADON TUONG UNG'

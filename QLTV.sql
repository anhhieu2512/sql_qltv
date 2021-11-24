create database QLTV;
use QLTV;
create table tblNhaXuatBan
(
	sMaNXB char(10) primary key NOT NULL,
	sTenNXB nvarchar(30) NULL,
	sDiaChiNXB nvarchar(30) NULL,
)
create table tblTacGia
(
	sMaTG char(10) primary key NOT NULL,
	sTenTG nvarchar(30) NULL,
	sDiaChiTG nvarchar(30) NULL,
)	
create table tblLoaiSach
(
	sMaLoaiSach char(10) primary key NOT NULL,
	sTenLoaiSach nvarchar(30) NULL,
)
create table tblSinhVien
(
	sMaSinhVien char(10) primary key NOT NULL,
	sTenSV nvarchar(30) NULL,
	sLop nvarchar(30) NULL,
)
create table tblKho
(
	sMaKho char(10) primary key NOT NULL,
	sTenKho nvarchar(30) NULL,
)
create table tblSach
(
	sMaSach char(10) primary key NOT NULL,
	sTenSach nvarchar(30) NULL,
	iNamXB int NULL,
	iSoLuong int NULL,
	sMaNXB char(10) NOT NULL,
	sMaLoaiSach char(10) NOT NULL,
	sMaKho char(10) NOT NULL,
)
create table tblSach_TacGia
(
	sMaSach char(10) NOT NULL,
	sMaTG char(10) NOT NULL,
)
-- Dat sMaSach va sMaTG lam khoa chinh cho bang tblSach_TacGia
alter table tblSach_TacGia
add constraint PK_SachTacGia primary key (sMaSach,sMaTG)
create table tblThuThu
(
	sMaThuThu char(10) primary key NOT NULL,
	sTenThuThu nvarchar(30) NULL,
	sSoDienThoai char(12) NULL,
)
create table tblPhieuMuon
(
	sMaPhieuMuon char(10) primary key NOT NULL,
	sMaThuThu char(10) NOT NULL,
	sMaSinhVien char(10) NOT NULL,
	dNgayMuon datetime NULL,
)
alter table tblPhieuMuon
add dNgayTra datetime NULL
create table tblChiTietPhieuMuon
(
	sMaPhieuMuon char(10) NOT NULL,
	sMaSach char(10) NOT NULL,
	iSoLuongMuon int NULL,
	sTinhTrangSach nvarchar(30) NULL,
)
create table tblPhieuTra
(
	sMaPhieuTra char(10) primary key NOT NULL,
	sMaThuThu char(10) NOT NULL,
	sMaSinhVien char(10) NOT NULL,
	dNgayTra datetime NULL,
)
alter table tblPhieuTra
add iSoNgayTraMuon int Check(iSoNgayTraMuon>=0) NULL
create table tblChiTietPhieuTra
(
	sMaPhieuTra char(10) NOT NULL,
	sMaSach char(10) NOT NULL,
	iSoLuongTra int NULL,
	sTinhTrangSach nvarchar(30) NULL,
)
alter table tblChiTietPhieuTra
add constraint PKKKK primary key (sMaPhieuTra,sMaSach)
alter table tblChiTietPhieuMuon
add constraint PK_ChiTietPhieuMuon primary key (sMaPhieuMuon,sMaSach)
-- sMaSach trong bang tblChiTietPhieuTra tham chiếu sang bảng tblSach lam khoa ngoai
alter table tblChiTietPhieuTra
add constraint FK_MaSachh foreign key (sMaSach)
references tblSach(sMaSach)
-- sMaPhieuMuon trong bang tblChiTietPhieuTra tham chiếu sang bảng tblPhieuTra lam khoa ngoai
alter table tblChiTietPhieuTra
add constraint FK_MaPhieuTra foreign key (sMaPhieuTra)
references tblPhieuTra(sMaPhieuTra)
-- sMaPhieuMuon trong bang tblChiTietPhieuMuon tham chiếu sang bảng tblPhieuMuon lam khoa ngoai
alter table tblChiTietPhieuMuon
add constraint FK_MaPhieuMuon foreign key (sMaPhieuMuon)
references tblPhieuMuon(sMaPhieuMuon)
-- sMaSach trong bang tblChiTietPhieuMuon tham chiếu sang bảng tblSach lam khoa ngoai
alter table tblChiTietPhieuMuon
add constraint FK_MaSach foreign key (sMaSach)
references tblSach(sMaSach)
--sMaLoaiSach trong b?ng tblSach tham chiếu sang bảng tblLoaiSach làm khóa ngo?i
alter table tblSach
add constraint FK_MaLoaiSach foreign key(sMaLoaiSach)
references tblLoaiSach(sMaLoaiSach)
--sMaThuThu trong b?ng tblPhieuMuon tham chiếu sang bảng tblThuThu làm khóa ngo?i
alter table tblPhieuMuon
add constraint FK_ThuThu foreign key(sMaThuThu)
references tblThuThu(sMaThuThu)
--sMaThuThu trong b?ng tblPhieuTra tham chiếu sang bảng tblThuThu làm khóa ngo?i
alter table tblPhieuTra
add constraint FK_ThuThuu foreign key(sMaThuThu)
references tblThuThu(sMaThuThu)
--sMaNXB trong b?ng tlbSach tham chiếu sang bảng tblNhaXB làm khóa ngo?i
alter table tblSach 
add constraint FK_NhaXB foreign key (sMaNXB)
references tblNhaXuatBan(sMaNXB)
--sMaKho trong b?ng tblSach tham chiếu sang bảng tblKho làm khóa ngo?i
alter table tblSach
add constraint FK_Kho foreign key (sMaKho)
references tblKho(sMaKho)
--sMaSach trong b?ng tblSach_TacGia tham chiếu sang bảng tblSach làm khóa ngo?i
alter table tblSach_TacGia
add constraint FK_SachTacGia foreign key (sMaSach)
references tblSach(sMaSach)
--sMaSach trong b?ng tblSach_TacGia tham chiếu sang bảng tblTacGia làm khóa ngo?i
alter table tblSach_TacGia
add constraint FK_TacGiaSach foreign key (sMaTG)
references tblTacGia(sMaTG)
--sMaSinhVen trong bảng tblPhieuMuon tham chiếu sang bảng tblSinhVien làm khóa ngoại
alter table tblPhieuMuon
add constraint FK_SinhVien foreign key(sMaSinhVien)
references tblSinhVien(sMaSinhVien)
--sMaSinhVen trong bảng tblPhieutra tham chiếu sang bảng tblSinhVien làm khóa ngoại
alter table tblPhieuTra
add constraint FK_SinhVienTra foreign key(sMaSinhVien)
references tblSinhVien(sMaSinhVien)
/*===========================NHẬP DỮ LIỆU CHO CÁC BẢNG============================*/
--Thêm dữ liệu vào bảng tblLoaiSach
insert into tblLoaiSach
values('LS1',N'Tiểu Thuyết'),
	  ('LS2',N'Công Nghệ'),
	  ('LS3',N'Giáo Trình'),
      ('LS4',N'Tâm Lý'),
      ('LS5',N'Tôn Giáo'),
      ('LS6',N'Y Tế'),
      ('LS7',N'Khoa Học'),
      ('LS8',N'Âm Nhạc'),
      ('LS9',N'Mỹ Thuật'),
      ('LS10',N'Truyện Tranh'),
      ('LS11',N'Nông Nghiệp'),
      ('LS12',N'Triết Học'),
      ('LS13',N'Truyện Cười'),
      ('LS14',N'Sử Học'),
      ('LS15',N'Văn Học'),
      ('LS16',N'Thiếu Nhi');
--Thêm dữ liệu vào bảng tblNhaXuatBan
insert into tblNhaXuatBan
values('NXB1',N'Kim Đồng',N'Nam Định'),
('NXB2',N'Tinh Hoa',N'Nam Định'),
('NXB3',N'Trí Việt',N'Thái Nguyên'),
('NXB4',N'Thuận Hóa',N'Kiên Giang'),
('NXB5',N'Văn Nghệ Thành Phố',N'TP HCM'),
('NXB6',N'Trẻ',N'Khánh Hòa'),
('NXB7',N'Khoa Học Kỹ Thuật',N'Thái Bình'),
('NXB8',N'Sự Thật',N'Bình Định'),
('NXB9',N'Chính Trị Quộc Gia',N'Hà Nội'),
('NXB10',N'Nam Đồng',N'Cao Bằng'),
('NXB11',N'Văn Bảo',N'Bắc Giang'),
('NXB12',N'Bá Phúc',N'Lâm Đồng'),
('NXB13',N'Giao Thông Vận Tải',N'Thanh Hóa'),
('NXB14',N'Hội Văn Hóa',N'Hà Nam'),
('NXB15',N'Lao Động',N'Phú Thọ'),
('NXB16',N'Mạnh Hùng',N'Quảng Ninh');
--Thêm dữ liệu vào bảng tblSinhVien
insert into tblSinhVien
values ('SV1',N'Trần Mạnh Hùng','17A5'),
('SV2',N'Nguyễn Bá Thái','15A2'),
('SV3',N'Nguyễn Văn Bảo','17A5'),
('SV4',N'Bùi Thị Lan','16A2'),
('SV5',N'Đặng Hương Lan','17A3'),
('SV6',N'Trần Tiến Dũng','18A2'),
('SV7',N'Nguyễn Thị Yên','16A1'),
('SV8',N'Nguyễn Văn Thành','16A4'),
('SV9',N'Trần Xuân Bá','15A3'),
('SV10',N'Ngô Trọng Hiếu','17A5'),
('SV11',N'Phạm Văn Đức Mạnh','17A2'),
('SV12',N'Nguyễn Đình Thi','17A2'),
('SV13',N'Ngô Bá Khá','15A5'),
('SV14',N'Nguyễn Văn Huấn','18A3'),
('SV15',N'Đỗ Văn Cương','16A3'),
('SV16',N'Nguyễn Văn Đạt','17A4');
--Thêm dữ liệu vào bảng tblTacGia
insert into tblTacGia
values('TG1',N'Mạnh Hùng',N'Quảng Ninh'),
('TG2',N'Trần Thị An',N'Nam Hà'),
('TG3',N'Nguyễn Thị Bình',N'Bắc Ninh'),
('TG4',N'Nguyễn Văn Bằng',N'Nam Định'),
('TG5',N'Cao Cầu',N'Bắc Giang'),
('TG6',N'Ngô Xuân Long',N'Kiên Giang'),
('TG7',N'Võ Hoài Thu',N'Khánh Hòa'),
('TG8',N'Nam Cao',N'Hà Nội'),
('TG9',N'Nguyễn Khuyến',N'Thái Bình'),
('TG10',N'Nguyễn Bỉnh Khiêm',N'Bình Định'),
('TG11',N'Nguyễn Văn Sơn',N'Thái Nguyên'),
('TG12',N'Nguyễn Như Sen',N'Tây Nguyên'),
('TG13',N'Trần Thị Hoài Thu',N'Huế'),
('TG14',N'Tống Ngọc Hải',N'Hà Nam'),
('TG15',N'Nguyễn Thị Thương',N'Thái Bình'),
('TG16',N'Phan Văn Mạnh',N'Kiên Giang');
--Thêm dữ liệu vào ảng tblThuThu
select * from tblThuThu
insert into tblThuThu values
('TT1',N'Trần Mạnh Hùng','0868128053'),
('TT2',N'Nguyễn Văn Tý','0913578913'),
('TT3',N'Trần Tiến Dũng','0868686053'),
('TT4',N'Nguyễn Văn Lâm','0868686035'),
('TT5',N'Nguyễn Tiến Dũng','0868686045'),
('TT6',N'Lê Thị Yên','0868686247'),
('TT7',N'Lê Thị Máy','0868686259'),
('TT8',N'Vũ Thị Phương','0868686604'),
('TT9',N'Nguyễn Thị Thủy','0969398904'),
('TT10',N'Nguyễn Văn Sê','0985132409'),
('TT11',N'Trần Thu Huyền','0968023414'),
('TT12',N'Lê Văn Thái','0869136879'),
('TT13',N'Phạm Văn Bằng','0968199083'),
('TT14',N'Ngô Trọng Hiếu','0988311392'),
('TT15',N'Phạm Văn Đức Mạnh','0961135692'),
('TT16',N'Nguyễn Văn Hiếu','0989145793');
--Thêm dữ liệu vào bảng tblKho
insert into tblKho
values('K1','Kho 1'),
('K2','Kho 2'),
('K3','Kho 3'),
('K4','Kho 4'),
('K5','Kho 5'),
('K6','Kho 6'),
('K7','Kho 7'),
('K8','Kho 8'),
('K9','Kho 9'),
('K10','Kho 10'),
('K11','Kho 11'),
('K12','Kho 12'),
('K13','Kho 13'),
('K14','Kho 14'),
('K15','Kho 15'),
('K16','Kho 16');
--Thêm dữ liệu vào bảng tblSach
insert into tblSach
values('MS1','Doremon',1969,40,'NXB1','LS1','K1'),
('MS2','Bông Hoa Nhỏ',2001,52,'NXB2','LS2','K2'),
('MS3','Tôi Đi Code Dạo',1959,20,'NXB3','LS2','K2'),
('MS4','Đắc Nhân Tâm',1919,50,'NXB3','LS2','K2'),
('MS5','Cuộc Sống Không Giới Hạn',1961,10,'NXB3','LS3','K3'),
('MS6','Quảng Gánh Lo Nghĩ Đi',1999,20,'NXB4','LS4','K4'),
('MS7','Làm Chủ Tư Duy',1869,30,'NXB5','LS5','K5'),
('MS8','Nhà Giả Kim',1909,60,'NXB6','LS6','K6'),
('MS9','Thói Quen Thứ 8',1979,71,'NXB7','LS7','K7'),
('MS10','Cha Cõng Con',1919,80,'NXB8','LS8','K8'),
('MS11','Đánh Thức Con Người',1960,60,'NXB9','LS9','K9'),
('MS12','Sự Tích Hồ Hoàn Kiếm',1959,20,'NXB10','LS10','K10'),
('MS13','Mai Ăn Tiêm',1869,40,'NXB11','LS11','K11'),
('MS14','Bánh Xe',1999,50,'NXB12','LS12','K12'),
('MS15','Mạng và Truyền Thông',1899,66,'NXB13','LS13','K13'),
('MS16','Làm Giàu Không Khó',2009,100,'NXB14','LS14','K14');
--Thêm dữ liệu vào bảng tblSach_TacGia
insert into tblSach_TacGia
values('MS1','TG1'),
('MS2','TG2'),
('MS3','TG3'),
('MS4','TG4'),
('MS5','TG5'),
('MS6','TG6'),
('MS7','TG7'),
('MS8','TG8'),
('MS9','TG9'),
('MS10','TG10'),
('MS11','TG11'),
('MS12','TG12'),
('MS13','TG13'),
('MS14','TG14'),
('MS15','TG15'),
('MS16','TG16');
--Thêm dữ liệu vào bảng tblPhieuMuon
insert into tblPhieuMuon
values
('PM1','TT1','SV1','02/04/2016','02/06/2016'),
('PM2','TT2','SV2','03/05/2017','03/09/2017'),
('PM3','TT3','SV3','02/06/2015','02/10/2015'),
('PM4','TT4','SV4','02/07/2011','02/16/2011'),
('PM5','TT5','SV5','02/08/2017','02/26/2017'),
('PM6','TT6','SV5','02/09/2013','02/14/2013'),
('PM7','TT7','SV5','02/10/2015','02/24/2015'),
('PM8','TT8','SV6','02/11/2017','02/24/2017'),
('PM9','TT9','SV7','02/12/2016','02/17/2016'),
('PM10','TT10','SV8','03/01/2016','03/06/2016'),
('PM11','TT11','SV9','04/04/2012','04/06/2012'),
('PM12','TT12','SV10','05/04/2016','05/06/2016'),
('PM13','TT13','SV11','06/04/2014','06/06/2014'),
('PM14','TT14','SV12','07/04/2016','07/09/2016'),
('PM15','TT15','SV13','08/04/2014','08/16/2014'),
('PM16','TT16','SV14','09/04/2016','09/26/2016');
--Thêm dữ liệu vào bảng tblChiTietPhieuMuon
insert into tblChiTietPhieuMuon
values
('PM1','MS1','2',N'Bình Thường'),
('PM2','MS1','1',N'Bình Thường'),
('PM3','MS2','2',N'Bình Thường'),
('PM4','MS4','4',N'Bình Thường'),
('PM5','MS4','1',N'Bình Thường'),
('PM6','MS5','5',N'Bình Thường'),
('PM7','MS6','2',N'Bình Thường'),
('PM8','MS7','1',N'Bình Thường'),
('PM9','MS8','1',N'Bình Thường'),
('PM10','MS9','1',N'Bình Thường'),
('PM11','MS10','6',N'Rách Trang Bìa'),
('PM12','MS11','3',N'Rách Trang 20'),
('PM13','MS12','1',N'Bình Thường'),
('PM14','MS13','3',N'Bình Thường'),
('PM15','MS11','5',N'Bình Thường'),
('PM16','MS12','1',N'Bình Thường');
--Thêm dữ liệu vào bảng tblPhieuTra
insert into tblPhieuTra
values
('PT1','TT1','SV1','02/06/2016',''),
('PT2','TT2','SV2','03/09/2017',''),
('PT3','TT3','SV3','02/10/2015',''),
('PT4','TT4','SV4','02/16/2011',''),
('PT5','TT5','SV5','02/26/2017',''),
('PT6','TT6','SV5','02/14/2013',''),
('PT7','TT7','SV5','02/24/2015',''),
('PT8','TT8','SV6','02/24/2017',''),
('PT9','TT9','SV7','02/17/2016',''),
('PT10','TT10','SV8','03/06/2016',''),
('PT11','TT11','SV9','04/06/2012',''),
('PT12','TT12','SV10','05/06/2016',''),
('PT13','TT13','SV11','06/06/2014',''),
('PT14','TT14','SV12','07/09/2016',''),
('PT15','TT15','SV13','08/16/2014',''),
('PM16','TT16','SV14','09/26/2016','');
--Thêm dữ liệu vào bảng tblChiTietPhieuMuon
insert into tblChiTietPhieuTra
values
('PT1','MS1',2,N'Bình Thường'),
('PT2','MS2',1,N'Bình Thường'),
('PT3','MS3',2,N'Rách Trang 2'),
('PT4','MS4',4,N'Bình Thường'),
('PT5','MS5',1,N'Bình Thường'),
('PT6','MS6',5,N'Bình Thường'),
('PT7','MS7',2,N'Bình Thường'),
('PT8','MS8',1,N'Bình Thường'),
('PT9','MS9',1,N'Bình Thường'),
('PT10','MS10',1,N'Rách Trang Bìa');
/*========================VIEW=======================*/
-- 1 Tạo View số lượng sách của từng sách	
create view SoLuongSach
as 
select sTenSach, iSoluong
from tblSach
--2 Tạo View tên sách theo từng mã sách
create view TenSachTheoMa
as 
select  sMaSach,sTenSach
from tblSach
--3 Tạo View số điện thoại của từng thủ thư
create view SDTThuThu
as 
select sTenThuThu,sSoDienThoai
from tblThuThu
--4 Tạo View cho biết số sách có số lượng lớn hơn 20
create view SoSach20
as
select sMaSach,sTenSach,iSoLuong
from tblSach
where iSoLuong>20
--5 Cho biết tên sinh viên theo mã sinh viên
create view Ma_TenSV
as 
select sMaSinhVien,sTenSV
from tblSinhVien
--6 Tạo View cho biết năm xuất bản của từng cuốn sách
create view NamXuatBan_Sach
as
select sMaSach, sTenSach, iNamXB
from tblSach
--7 Cho biết những cuốn sách chưa được mượn
create view Sach_ChuaDuocMuon
as
select tblSach.sMaSach,sTenSach
from tblSach
where tblSach.sMaSach not in (select sMaSach from tblChiTietPhieuMuon)
--8 Cho biết những cuốn sách đã được mượn
create view Sach_DaDuocMuon
as
select tblSach.sMaSach,sTenSach
from tblSach
where tblSach.sMaSach in (select sMaSach from tblChiTietPhieuMuon)
--9 Cho biết địa chỉ tác giả theo mã tác giả
create view DiaChi_TacGia
as
select sTenTG,sDiaChiTG
from tblTacGia
--10 Cho biết tên lớp của sinh viên theo mã
create view Lop_SV
as
select sMaSinhVien,sLop
from tblSinhVien
--11 Cho biết tên thủ thư đã cho mượn một cuốn sách nào đó
create view TenThuThu_TenSachMuon
as
select sTenThuThu,sTenSach
from tblThuThu,tblSach,tblChiTietPhieuMuon,tblPhieuMuon
where tblThuThu.sMaThuThu=tblPhieuMuon.sMaThuThu
and tblPhieuMuon.sMaPhieuMuon=tblChiTietPhieuMuon.sMaPhieuMuon
and tblChiTietPhieuMuon.sMaSach=tblSach.sMaSach

--12 Cho biết ngày mượn của sinh viên
create view NgayMuon_Sach
as
select tblSinhVien.sMaSinhVien,sTenSV,dNgayMuon
from tblPhieuMuon,tblSinhVien
where tblPhieuMuon.sMaSinhVien=tblSinhVien.sMaSinhVien
--13 Tạo View cho biết tên nhà xuất bản của từng sách
create view TenNXBSach
as 
select sTenSach,tblNhaXuatBan.sTenNXB
from tblSach,tblNhaXuatBan
where tblSach.sMaNXB=tblNhaXuatBan.sMaNXB
--14 Cho biết loại sách của từng sách
create view Sach_LoaiSach
as
select sMaSach, sTenSach, sTenLoaiSach
from tblSach,tblLoaiSach
where tblSach.sMaLoaiSach=tblLoaiSach.sMaLoaiSach
--15 Cho biết địa chỉ của nhà xuất bản theo tên sách
create view DiaChiNXB_Sach
as 
select sTenSach,sDiaChiNXB
from tblSach,tblNhaXuatBan
where tblSach.sMaNXB=tblNhaXuatBan.sMaNXB
--16 Cho biết địa chỉ của tác giả viết sách
create view DiaChiTG_Sach
as
select sTenSach,sDiaChiTG
from tblSach,tblTacGia,tblSach_TacGia
where tblSach.sMaSach = tblSach_TacGia.sMaSach
and tblSach_TacGia.sMaTG = tblTacGia.sMaTG
--17 Cho biết tên sách đã mượn của sinh viên theo tên sinh viên
create view TenSV_TenSach
as
select sTenSV,sTenSach
from tblSinhVien,tblChiTietPhieuMuon,tblSach,tblPhieuMuon
where tblSinhVien.sMaSinhVien = tblPhieuMuon.sMaSinhVien
and tblPhieuMuon.sMaPhieuMuon=tblChiTietPhieuMuon.sMaPhieuMuon
and tblChiTietPhieuMuon.sMaSach=tblSach.sMaSach
--18 Cho biết tên thủ thư lập phiếu cho sinh viên
create view ThuThu_SinhVien
as
select sTenThuThu,sTenSV
from tblThuThu,tblSinhVien,tblPhieuMuon
where tblSinhVien.sMaSinhVien = tblPhieuMuon.sMaSinhVien
and tblPhieuMuon.sMaThuThu = tblThuThu.sMaThuThu
--19 Cho biết tình trạng của sách khi đã được mượn
create view TinhTrang_Sach
as
select tblSach.sMaSach,sTenSach,sTinhTrangSach
from tblSach,tblChiTietPhieuMuon
where tblChiTietPhieuMuon.sMaSach = tblSach.sMaSach
--20 Cho biết số lượng sách của từng Nhà xuất bản
create view SoluongSach_NXB
as 
select tblSach.sMaNXB,sTenNXB,iSoLuong
from tblSach,tblNhaXuatBan
where tblSach.sMaNXB=tblNhaXuatBan.sMaNXB
/*==========================ProC============================*/
--ProC
-- 1 Cho biết thông tin thủ thư nào đó theo mã
create proc ThuThu_Ma (@maTT char(10))
as begin
select sMaThuThu,sTenThuThu
from tblThuThu
where @maTT=tblThuThu.sMaThuThu
end
exec ThuThu_Ma @maTT='TT2'
--2	Cho biết tên nhà xuất bản theo mã sách
create proc TenNXB_MaSach(@masach char(10))
as begin 
select sMaSach,sTenNXB
from tblSach,tblNhaXuatBan
where tblSach.sMaNXB=tblNhaXuatBan.sMaNXB
and @masach = tblSach.sMaSach
end
exec TenNXB_MaSach @masach='MS1'
--3 Cho biết tên thủ thư đã lập phiếu mượn theo mã phiếu mượn
create proc TenTT_PhieuMuon(@mapm char(10))
as begin
select sMaPhieuMuon, sTenThuThu
from tblPhieuMuon,tblThuThu
where tblPhieuMuon.sMaThuThu=tblThuThu.sMaThuThu
and @mapm = tblPhieuMuon.sMaPhieuMuon
end
exec TenTT_PhieuMuon @mapm = 'PM3'
--4. Cho biết kho đã chứa sách của một nhà xuất bản nào đó
create proc SachTG_Kho(@manxb char(10))
as begin
select tblNhaXuatBan.sMaNXB,sTenKho
from tblKho,tblSach,tblNhaXuatBan
where tblNhaXuatBan.sMaNXB = tblSach.sMaNXB and
		tblSach.sMaKho=tblKho.sMaKho and
		@manxb= tblNhaXuatBan.sMaNXB
end
exec SachTG_Kho @manxb = 'NXB2'
-- 5. Cho biết sinh viên đã mượn một cuốn sách nào đó
create proc Sach_SVMuon (@masach char(10))
as begin
select sMaSach,tblSinhVien.sMaSinhVien,sTenSV
from tblChiTietPhieuMuon,tblPhieuMuon,tblSinhVien
where tblChiTietPhieuMuon.sMaPhieuMuon=tblPhieuMuon.sMaPhieuMuon and
		tblPhieuMuon.sMaSinhVien = tblSinhVien.sMaSinhVien and
		@masach = tblChiTietPhieuMuon.sMaSach
end
exec Sach_SVMuon @masach ='MS5'
--6 Cho biết tên loại sách theo một mã sách nào đó
create proc MaSach_LoaiSach(@masach char(10))
as begin
select tblSach.sMaSach,tblLoaiSach.sMaLoaiSach,sTenLoaiSach
from tblLoaiSach,tblSach
where tblSach.sMaLoaiSach=tblLoaiSach.sMaLoaiSach
and tblSach.sMaSach = @masach
end
exec MaSach_LoaiSach @masach ='MS2'
--7 Cho biết tình trạng sách theo một mã sách nào đó trong phiếu mượn
create proc TinhTrang_Pro(@masach char(10))
as begin
select tblSach.sMaSach,tblSach.sTenSach,sTinhTrangSach
from tblChiTietPhieuMuon,tblSach
where tblChiTietPhieuMuon.sMaSach=tblSach.sMaSach
and tblSach.sMaSach = @masach
end
exec TinhTrang_Pro @masach ='MS2'
--8 Cho biết những cuốn sách được xuất bản trong một năm nào đó 
create proc NamXB_Sach(@namxb int)
as begin
select sMaSach,sTenSach,iNamXB
from tblSach
where iNamXB = @namxb
end
exec NamXB_Sach @namxb = 2001
--9 Cho biết những sinh viên mượn sách trong một tháng nào đó
create proc SinhVien_MuonSach(@month int)
as begin
select dNgayMuon,sTenSach
from tblChiTietPhieuMuon,tblPhieuMuon,tblSach
where tblPhieuMuon.sMaPhieuMuon=tblChiTietPhieuMuon.sMaPhieuMuon
and tblChiTietPhieuMuon.sMaSach=tblSach.sMaSach
and  month(dNgayMuon) =@month
end
exec SinhVien_MuonSach @month = 7
--10 Cho biết tác giả đã viết một cuốn sách nào đó theo mã sách
create proc Sach_TacGia(@masach char(10))
as begin
select tblSach.sMaSach,sTenSach,sTenTG
from tblSach,tblSach_TacGia,tblTacGia
where tblSach.sMaSach = tblSach_TacGia.sMaSach
and tblSach_TacGia.sMaTG = tblTacGia.sMaTG
and tblSach.sMaSach = @masach
end
exec Sach_TacGia @masach = 'MS3'
--11 Cho biết số sách một nhà xuất bản nào đó đã cung cấp
create proc NXB_CungCap (@tennxb char(10))
as begin 
select sTenNXB,sum(iSoLuong) as [So luong]
from tblNhaXuatBan,tblSach
where tblNhaXuatBan.sMaNXB= tblSach.sMaNXB
and sTenNXB = @tennxb
group by sTenNXB
end
exec NXB_CungCap @tennxb = N'Bá Phúc'
--12 Cho biết ngày trả sách dự kiến của một sinh viên nào đó
create proc NgayTra_SV(@masv char(10))
as begin
select tblSinhVien.sMaSinhVien,sTenSV,dNgayTra
from tblSinhVien,tblPhieuMuon	
where tblPhieuMuon.sMaSinhVien = tblSinhVien.sMaSinhVien
and tblPhieuMuon.sMaSinhVien = @masv
end
exec NgayTra_SV @masv  = 'SV1'
--13 Cho biết kho chứa một cuốn sách nào đó
create proc Kho_Sach(@masach char(10))
as begin
select sMaSach,sTenSach,sTenKho
from tblKho,tblSach
where tblSach.sMaKho = tblKho.sMaKho
and tblSach.sMaSach = @masach
end
exec Kho_Sach @masach = 'MS3'
--14 Cho biết số sách của một kho nào đó theo tên
create proc SoSach_TrongKho (@tenkho char(10))
as begin
select sTenKho, sum(iSoLuong) as [Số lượng]
from tblSach,tblKho
where tblKho.sMaKho = tblSach.sMaKho
and sTenKho = @tenkho
group by sTenKho
end
exec SoSach_TrongKho @tenkho = N'Kho 1'
--15 Thực hiện tăng số lượng sách theo mã sách
create proc ThemSach(@masach char(10),@soluong int)
as
begin
update tblSach
set iSoLuong = iSoLuong +@soluong
where tblSach.sMaSach = @masach
end 
exec ThemSach @masach  = 'MS1',@soluong = 4
/*=====================TRIGGER==========================*/
--1 Ngày trả sách phải lớn hơn hoặc bằng ngày mượn
create trigger NgayMuon_NgayTra
on tblPhieuMuon
after insert
as
begin
declare @ngaytra datetime = (select dNgayTra from inserted)
declare @ngaymuon datetime = (select dNgayMuon from tblPhieuMuon)
if(@ngaytra<@ngaymuon)
begin 
print(N'Ngày trả sách phải lớn hơn ngày mượn sách')
rollback tran
end 
end
--2 Số lượng sách khi nhập vào không được nhỏ hơn hoặc bằng 0
create trigger Insert_SoLuong
on tblSach
after insert 
as
begin
declare @soluong int = (select iSoluong from inserted)
if(@soluong<=0)
begin
print(N'Số lượng sách nhập vào không được nhỏ hơn hoặc bằng 0')
rollback tran
end 
end
--3 Tự động tính số ngày trả sách muộn của sinh viên
create trigger Tinh_NgayTraMuon
on tblPhieuTra
for insert
as
begin
declare @ngaytra datetime = (select dNgayTra from inserted)
declare @songaytramuon int = (select(datediff(d,dNgayTra,@ngaytra)) from tblPhieuMuon)
if(@ngaytra>(select dNgayTra from tblPhieuMuon))
	begin 
	update tblPhieuTra
	set iSoNgayTraMuon = @songaytramuon
	end
end
--4 Số điện thoại của thủ thư phải có số 0 ở đầu
create trigger SDT_ThuThu
on tblThuThu
after insert 
as
begin
declare @sdt char(12) = (select sSoDienThoai from inserted)
if(@sdt not like '0%')
begin
print(N'Số điện thoại phải bắt đầu bằng số 0')
rollback tran
end
end 
--5 Mã sách phải bắt đầu bằng ký tự "MS"
create trigger MaSach
on tblSach
after insert 
as
begin
declare @masach char(10) = (select sMaSach from inserted)
if(@masach not like 'MS%')
begin
print(N'Mã sách phải bắt đầu bằng ký tự "MS"')
rollback tran
end
end
--6 Mã Sinh Viên phải bắt đầu băng ký tự "SV"
create trigger MaSV
on tblSinhVien
after insert 
as
begin
declare @masv char(10) = (select sMaSinhVien from inserted)
if(@masv not like 'SV%')
begin
print(N'Mã sinh viên phải bắt đầu bằng ký tự "SV"')
end
end
--7 Mã loại sách phải bắt đầu bằng ký tự "LS"
create trigger MaLoaiSach
on tblLoaiSach
after insert
as
begin
declare @maloaisach char(10) = (select sMaLoaiSach from inserted)
if(@maloaisach not like 'LS%')
begin
print(N'Mã loại sách phải bắt đầu bằng ký tự "LS"')
rollback tran
end
end
--8 Mã Thủ Thư phải bắt đầu bằng ký tự "TT"

create trigger MaThuThu
on tblThuThu
after insert
as
begin
declare @mathuthu char(10) = (select  sMaThuThu from inserted)
if(@mathuthu not like 'TT%')
begin
print(N'Mã thủ thư phải bắt đầu bằng ký tự "TT"')
rollback tran
end
end
--9 Mã kho phải mắt đầu bằng ký tự "MK"
create trigger MaKho
on tblKho
after insert
as 
begin
declare @makho char(10) = (select sMaKho from tblKho)
if(@makho not like 'MK%')
begin
print(N'Mã kho phải bắt đầu bằng ký tự MK')
rollback tran
end
end
--10 Mã Tác giả phải bắt đầu bằng ký tự "TG"
create trigger MaTacGia
on tblTacGia
after insert
as
begin
declare @matacgia char(10) = (select sMaTG from inserted)
if(@matacgia not like 'TG%')
begin
print(N'Mã tác giả phải bắt đầu bằng ký tự "TG"')
rollback tran
end
end
/*============================PHÂN QUYỀN===========================*/
--Tạo login có tên: login100, password: 1
create login login101
with password ='1'
go
--Tạo user có tên: hung24 cho login login100
create user hung24 for login login100
--Tạo quyền cho hung24 có quyền được thêm dữ liệu vào bảng tblKho
grant insert
on tblKho
to hung24
--Tạo tài khoản người dùng.
create login manhhung
with password = '123',
default_database = QLTV;
-- //
create login ngohieu
with password = '123',
default_database = QLTV;
--//
create login ducmanh
with password = '123',
default_database = QLTV;
--//
create login vanhieu
with password = '123',
default_database = QLTV;
--Tạo User cho các login trên
create user hung 
for login manhhung
--//
create user hieu
for login ngohieu
--//
create user manh
for login ducmanh
--// 
create user hieu2
for login vanhieu
--Phân quyền cho người dùng
--Cấp quyền insert, update cho user hung trên bảng tblKho
grant insert,update
on tblKho
to hung;
--Cấp quyền create view, create procedure và được chuyển tiếp quyền cho người dùng khác cho user hung
grant create view, create procedure
to hung
with grant option
--Cấp tất cả các quyền cho user hieu
grant all
to hieu
--Cấp quyền insert, update, delete, select cho user manh
grant insert,update,delete,select
on tblSach
to manh;
--Cấp quyền insert trên bảng tblTacGia và được chuyển tiếp quyền cho người dùng khác cho user hieu2
grant insert
on tblTacGia
to hieu2
with grant option
--Cấp quyền tạo bảng và tạo khung nhìn cho user hung
grant create table,create view
to hung
--Thu hồi quyền insert với user manh
revoke insert
on tblSach
to manh
--Không cho phép người dùng hieu delete trên cơ sở dữ liệu
deny delete
on tblSach
to manh
/*==================================PHÂN TÁN=====================================*/
exec sp_linkedservers
exec sp_addlinkedserver
	 @server  = 'Tram2',
	 @srvproduct ='SQLServer',
	 @provider = 'SQLNCLI',
	 @datasrc = 'WIN-1J0OJ77IVJM'
exec sp_addlinkedsrvlogin
	 @rmtsrvname = 'Phantan',
	 @rmtuser = 'hung2',
	 @rmtpassword = '1'
--//
create database QLTV_PT
select*from QLTV.QLTV_PT.dbo.tlbThuThu
/*========================CƠ SỞ DỮ LIỆU BÊN MÁY THẬT==========================*/

--Phân tán dọc
create table tlbThuThu
(
	sMaThuThu char(10) primary key not null,
	sTenThuThu nvarchar(50) null,
)
create proc Them(@ma char(10), @ten nvarchar(50), @sdt char(10))
as
begin
if exists(select * from tlbThuThu where sMaThuThu = @ma)
begin
print (N'Mã thủ thư đã tồn tại !')
return
end
insert into tlbThuThu values (@ma,@ten)
insert into Tram2.QLTV_PT.dbo.tlbThuThu values(@ma,@sdt)
print N'Thêm thành công !'
end

exec Them 'TT2',N'Mạnh Hùng','0383443681'
select * from thuthu
select * from tlbThuThu
--//
create synonym thuthu
for Tram2.QLTV_PT.dbo.tlbThuThu
create view dstt
as
select tlbThuThu.sMaThuThu,sTenThuThu,sSDT
from tlbThuThu,thuthu
where tlbThuThu.sMaThuThu=thuthu.sMaThuThu
select * from dstt

--Phân tán ngang
create table tblSinhVien
(
	sMaSV char(10) primary key not null,
	sTenSV nvarchar(100),
	sLop varchar(10),
	sGioiTinh nvarchar(10) check(sGioiTinh = N'Nam' or sGioiTinh = N'Nữ'),
)
create proc Themsinhvien(@ma char(10),@ten nvarchar(100), @lop varchar(10),@gt nvarchar(10))
as
begin
	if exists(select * from tblSinhVien where sMaSV = @ma)
		begin
		print(N'Sinh viên đã tồn tại')
		return
		end
	if(@gt like 'Nam')
		begin
		insert into tblSinhVien
		values (@ma,@ten,@lop,@gt)
		end
	if(@gt like N'Nữ')
		begin
		insert into Tram2.QLTV_PT.dbo.tblSinhVien
		values (@ma,@ten,@lop,@gt)
		end
end
exec Themsinhvien 'SV1',N'Hùng Rồng','17A5','Nam'
exec Themsinhvien 'SV2',N'Hùng Phượng','17A5',N'Nữ'
select*from tblSinhVien
union
select*from Tram2.QLTV_PT.dbo.tblSinhVien
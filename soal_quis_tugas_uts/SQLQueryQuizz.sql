create database AKADEMIK_PRO

create table JENJANG(
idjenjang int primary key identity,
nmjenjang  nvarchar (50)
)


create table STATUS_AKADEMIK(
idstatusaka  int primary key identity,
nmstatusaka  nvarchar (50)
) 

create table PENDIDIKAN(
idpendidikan int primary key identity,
nmpendidikan nvarchar (50)
)

create table PRODI(
idprod int primary key identity,
nmprodi nvarchar (50),
akreditasi nvarchar (1),
Thn_berdiri  nvarchar (4),
idjenjang int foreign key references JENJANG 
)

create table MAHASISWA(
idmhs int primary key identity,
npm nvarchar (11),
nama nvarchar (50),
tempat_lhr nvarchar (30),
tanggal_lhr date,
sex  nvarchar (1),
thn_masuk nvarchar (4),
idprodi int foreign key references PRODI,
idstatusaka int foreign key references STATUS_AKADEMIK
)


create table DOSEN (
iddosen int primary key identity,
nmdosen nvarchar (50),
gelar nvarchar (30),
tempat_lhr nvarchar (30),
tanggal_lhr date,
sex  nvarchar (1),
idprodi int foreign key references PRODI,
idpendidikan int foreign key references PENDIDIKAN
)



insert into JENJANG 
(nmjenjang)
values
('D3')
insert into JENJANG 
(nmjenjang)
values
('S1')
insert into JENJANG 
(nmjenjang)
values
('S2')
insert into JENJANG 
(nmjenjang)
values
('S3')


 insert into STATUS_AKADEMIK
 (nmstatusaka)
 values
 ('Aktif')
 insert into STATUS_AKADEMIK
 (nmstatusaka)
 values
 ('Cuti')
 insert into STATUS_AKADEMIK
 (nmstatusaka)
 values
 ('Cuti Sepihak')
 insert into STATUS_AKADEMIK
 (nmstatusaka)
 values
 ('Pindah')
 insert into STATUS_AKADEMIK
 (nmstatusaka)
 values
 ('Drop-Out')
 insert into STATUS_AKADEMIK
 (nmstatusaka)
 values
 ('Lulus')
  insert into STATUS_AKADEMIK
 (nmstatusaka)
 values
 ('Berhenti')
 
 
 insert into PENDIDIKAN
(nmpendidikan)
values
('S1')
insert into PENDIDIKAN
(nmpendidikan)
values
('S2')
insert into PENDIDIKAN
(nmpendidikan)
values
('S3')


insert into PRODI
(nmprodi, akreditasi, Thn_berdiri, idjenjang)
values
('Manajemen Informatika', 'B', '2006', 1)
insert into PRODI
(nmprodi, akreditasi, Thn_berdiri, idjenjang)
values
('Akuntansi', 'A', '2004', 2)
insert into PRODI
(nmprodi, akreditasi, Thn_berdiri, idjenjang)
values
('Akuntansi Perpajakan', 'B', '2018', 2)
insert into PRODI
(nmprodi, akreditasi, Thn_berdiri, idjenjang)
values
('Agribisnis', 'B', '2002', 1)
insert into PRODI
(nmprodi, akreditasi, Thn_berdiri, idjenjang)
values
('Agribisnis Pangan', '-', '2018', 1)


insert into MAHASISWA
(npm,nama, tempat_lhr, tanggal_lhr, sex, thn_masuk, idprodi, idstatusaka)
values
('18750001', 'Ria', 'Metro', '2000-10-10', 'P', '2017', 12,2)
insert into MAHASISWA
(npm,nama, tempat_lhr, tanggal_lhr, sex, thn_masuk, idprodi, idstatusaka)
values
('18760001', 'Agus', 'Kalianda', '2000-10-16 ', 'L', '2017',  13,2)
insert into MAHASISWA
(npm,nama, tempat_lhr, tanggal_lhr, sex, thn_masuk, idprodi, idstatusaka)
values
('18770001', 'Santi', 'Jakarta', '2000-09-19', 'P', '2017',  14,2)
insert into MAHASISWA
(npm,nama, tempat_lhr, tanggal_lhr, sex, thn_masuk, idprodi, idstatusaka)
values
('18780001', 'Riana', 'Bandung', '2002-09-22', 'P', '2017',  15,2)
insert into MAHASISWA
(npm,nama, tempat_lhr, tanggal_lhr, sex, thn_masuk, idprodi, idstatusaka)
values
('18790001', 'Budi', 'Bengkulu', '2001-02-17', 'L', '2017',  16,2)
insert into MAHASISWA
(npm,nama, tempat_lhr, tanggal_lhr, sex, thn_masuk, idprodi, idstatusaka)
values
('18750002', 'Edi', 'Kotabumi', '2001-03-11', 'L', '2017',  12,2)
insert into MAHASISWA
(npm,nama, tempat_lhr, tanggal_lhr, sex, thn_masuk, idprodi, idstatusaka)
values
('18760002', 'Maya', 'Natar', '2000-10-16', 'P', '2017',  13,2)
insert into MAHASISWA
(npm,nama, tempat_lhr, tanggal_lhr, sex, thn_masuk, idprodi, idstatusaka)
values
('18770002', 'Hardi', 'Natar', '2001-03-16', 'L', '2017',  14,2)
insert into MAHASISWA
(npm,nama, tempat_lhr, tanggal_lhr, sex, thn_masuk, idprodi, idstatusaka)
values
('18780002 ', 'Rendi', 'Metro', '2000-01-03', 'L', '2017',  15,2)
insert into MAHASISWA
(npm,nama, tempat_lhr, tanggal_lhr, sex, thn_masuk, idprodi, idstatusaka)
values
('18790002 ', 'Rudi', 'Mesuji', '2000-05-04', 'L', '2017',  16,2)


insert into DOSEN
( nmdosen, gelar, tempat_lhr, tanggal_lhr, sex, idprodi, idpendidikan)
values
('Ebi', 'S.Kom', 'Metro', '1978-10-10', 'L', 16, 2)
insert into DOSEN
( nmdosen, gelar, tempat_lhr, tanggal_lhr, sex, idprodi, idpendidikan)
values
('Slamet', 'S.E., M.M.,', 'Jakarta', '1977-10-11 ', 'L', 15, 2)
insert into DOSEN
( nmdosen, gelar, tempat_lhr, tanggal_lhr, sex, idprodi, idpendidikan)
values
('Heni', 'S.E., M.M.,', 'Bandung', '1980-02-19', 'P', 14, 2)
insert into DOSEN
( nmdosen, gelar, tempat_lhr, tanggal_lhr, sex, idprodi, idpendidikan)
values
('Sekar', 'S.P.', 'Jakarta', '1980-09-22', 'P', 13, 3)
insert into DOSEN
( nmdosen, gelar, tempat_lhr, tanggal_lhr, sex, idprodi, idpendidikan)
values
('Hendro', 'S.P., M.P ', 'Jakarta', '2981-01-17', 'L', 12, 2)



 

 
 
 
SELECT * FROM DOSEN

DELETE FROM PRODI WHERE 


ALTER TABLE PRODI ALTER COLUMN "column_name" "New Data
create database Perpustakaan

use Perpustakaan




create table mahasiswa (
idmhs int primary key identity (1,1),
nama nvarchar(30),
npm  nvarchar(20),
tempat_lahir nvarchar(50),
tanggal_lahir date,
sex nvarchar(1),
tahun_masuk nvarchar (4)
) 

create table buku (
idbuku int primary key identity (1,1),
no_buku  nvarchar(50),
judul_buku nvarchar(50),
nama_pengarang nvarchar(30),
nama_penerbit nvarchar(30),
tahun_terbit date,
idmhs int foreign key references mahasiswa
)

create table kartu_anggota_perpus (
idperpus int primary key identity (1,1),
nama_mahasiswa nvarchar(30),
npm nvarchar(20),
alamat nvarchar(50),
idbuku int foreign key references buku,
idmhs int foreign key references mahasiswa
) 

insert into mahasiswa values
('Haldian', '20753050', 'Belambangan', '2001-03-11', 'L', '2020'),
('Nindi', '20753062', 'Pesawaran', '2002-05-12', 'P', '2020'),
('Wahyu', '20753071', 'Bandar Lampung', '2001-02-3', 'L', '2020'),
('Ridho', '20753065', 'Gunung Madu', '2001-06-2', 'L', '2020'),
('Aldi', '20753060', 'Kalianda', '2002-09-12', 'L', '2020')


insert into buku values 
(1, 'Flutter', 'Haldian', 'erlangga', '2020-03-11', 1),
(12, 'Laravel', 'Al', 'mizan', '2020-03-11', 2),
(2, 'SQL', 'Aldi', 'gramedia', '2021-02-1', 3), 
(33, 'DevOps', 'Hal', 'serambi', '2020-03-11', 4),
(54, 'Node Js', 'an', 'erlangga', '2020-03-11', 5)



insert into kartu_anggota_perpus values 
('Haldian', '20753050', 'Belambangan', 1,1 ),
('Nindi', '20753067', 'pesawaran', 2,2 ),
('Wahyu', '20753071', 'Bandar Lampung', 3,3 ),
('Ridho', '20753065', 'Gunung Madu', 4,4 ),
('Aldi', '20753060', 'Kalianda', 5,5 )



create procedure data_buku
@nama_buku varchar(50)
as
begin
select * from buku
end
go
exec data_buku 'judul_buku'


drop procedure data_mahasiswa

select * from mahasiswa

create procedure data_mahasiswa
@nama_mahasiswa varchar(50)
as
begin
select * from mahasiswa
end
go
exec data_mahasiswa 'nama' 


create procedure data_kartu_anggota_perpus
@kartu_perpus varchar(50)
as
begin
select * from kartu_anggota_perpus
end
go
exec data_mahasiswa 'nama_mahasiswa' 



create procedure data_mahasiswa_anggota_perpus
as
begin
select idperpus, nama_mahasiswa, mahasiswa.npm, mahasiswa.idmhs
from kartu_anggota_perpus
join
mahasiswa on mahasiswa.idmhs = kartu_anggota_perpus.idmhs end
go
exec data_mahasiswa_anggota_perpus



create procedure data_mahasiswa_dengan_buku
as
begin
select idbuku, judul_buku, nama_penerbit, nama_pengarang from buku
where idmhs in (select idbuku from
mahasiswa)
end
go
exec data_mahasiswa_dengan_buku




create procedure add_mahasiswa (@nama
nvarchar(30),@npm nvarchar(20),
@tempat_lahir nvarchar(50), @tanggal_lahir
date,@sex nvarchar(1),@tahun_masuk nvarchar(4))
as
declare @id int
begin
begin try
begin transaction
insert into mahasiswa (nama, npm, tempat_lahir, tanggal_lahir, sex, tahun_masuk)
values (@nama, @npm, @tempat_lahir,
@tanggal_lahir, @sex, @tahun_masuk)
save transaction point1
select @id= count(*) from mahasiswa where nama = @nama
if @id > 1
begin
rollback transaction
print 'NAMA ADMIN SUDAH ADA'
save transaction point2
end
else
begin
commit transaction
print 'DATA ADMIN BERHASIL DITAMBAHKAN'
end
return 0
end try
begin catch
raiserror 13003 'KESALAHAN INPUT, SILAHKAN ULANGI'
if @@trancount > 0
rollback transaction point1
end catch
end
go

exec add_mahasiswa
'fulan bin fulan','20753099','Mesir','2000-03-1', 'L', '2020'




create procedure add_buku (@no_buku
nvarchar(50),@judul_buku nvarchar(50),
@nama_pengarang nvarchar(30), @nama_penerbit nvarchar(30),@tahun_terbit date)
as
declare @id int
begin
begin try
begin transaction
insert into buku (no_buku, judul_buku, nama_pengarang, nama_penerbit, tahun_terbit)
values (@no_buku, @judul_buku, @nama_pengarang,
@nama_penerbit, @tahun_terbit)
save transaction point1
select @id= count(*) from buku where no_buku = @no_buku
if @id > 1
begin
rollback transaction
print 'NAMA ADMIN SUDAH ADA'
save transaction point2
end
else
begin
commit transaction
print 'DATA ADMIN BERHASIL DITAMBAHKAN'
end
return 0
end try
begin catch
raiserror 13003 'KESALAHAN INPUT, SILAHKAN ULANGI'
if @@trancount > 0
rollback transaction point1
end catch
end
go

exec add_buku
23, 'PHP', 'Fulan', 'erlangga', '2019-04-30'





create procedure add_kartu_anggota_perpus (@nama_mahasiswa
nvarchar(30),@npm nvarchar(20),@alamat nvarchar(50), @idbuku int,@idmhs int)
as
declare @id int
begin
begin try
begin transaction
insert into kartu_anggota_perpus (nama_mahasiswa, npm, alamat, idbuku, idmhs)
values (@nama_mahasiswa,@npm, @alamat, @idbuku, @idmhs)
save transaction point1
select @id= count(*) from kartu_anggota_perpus where nama_mahasiswa = @nama_mahasiswa
if @id > 1
begin
rollback transaction
print 'NAMA ADMIN SUDAH ADA'
save transaction point2
end
else
begin
commit transaction
print 'DATA ADMIN BERHASIL DITAMBAHKAN'
end
return 0
end try
begin catch
raiserror 13003 'KESALAHAN INPUT, SILAHKAN ULANGI'
if @@trancount > 0
rollback transaction point1
end catch
end
go

exec add_kartu_anggota_perpus
'fulan bin fulan', '20753099', 'Mesir', 6,6 


create table log
(id_event int identity(1,1)primary key,
nm_event varchar(200) not null,
tgl_event datetime not null)

create trigger insert_mahasiswa on mahasiswa
after insert as
print 'Data Mahasiswa berhasil ditambahkan'
print 'Dimodifikasi : '+convert (varchar,getdate())
print 'Nama Host: '+host_name()
insert into log (nm_event,tgl_event) values ('penambahan
data Mahasiswa pada tabel Mahasiswa', GETDATE())
insert into Mahasiswa values
('fulan bin filin','20753099','Mesir','1999-04-1', 'L', '2020')


create trigger insert_kartu_anggota_perpus on kartu_anggota_perpus
after insert as
print 'Data Kartu_Anggota_Perpus berhasil ditambahkan'
print 'Dimodifikasi : '+convert (varchar,getdate())
print 'Nama Host: '+host_name()
insert into log (nm_event,tgl_event) values ('penambahan
data Kartu_Anggota_Perpus pada tabel Buku', GETDATE())
insert into kartu_anggota_perpus values
('fulan bin fulan', '20753099', 'Mesir', 7,7 )



create login ADMINOPD with password = '1234567'
create User ADMINOPD for login ADMINOPD

create login Haldian with password = '1234567'
create user Haldian_050 for login Haldian


create login Nindi with password = '1234567'
create user Nindi_067 for login Nindi

create login Wahyu with password = '1234567'
create user Wahyu_071 for login Wahyu

create login Ridho with password = '1234567'
create user Ridho_065 for login Ridho




grant select,insert,update,delete on mahasiswa to Haldian_050
grant select,insert,update,delete on buku to  Haldian_050
grant select,insert,update,delete on kartu_anggota_perpus to  Haldian_050


grant select,insert,update,delete on mahasiswa to Nindi_067
grant select,insert,update,delete on buku to Nindi_067
grant select,insert,update,delete on kartu_anggota_perpus to Nindi_067


grant select,insert,update,delete on mahasiswa to Wahyu_071
grant select,insert,update,delete on buku to  Wahyu_071
grant select,insert,update,delete on kartu_anggota_perpus to  Wahyu_071



grant select,insert,update,delete on mahasiswa to Ridho_065
grant select,insert,update,delete on buku to   Ridho_065
grant select,insert,update,delete on kartu_anggota_perpus to   Ridho_065














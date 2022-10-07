CREATE TRIGGER info_insert_prodi
ON PRODI
FOR INSERT
AS
PRINT 'Record program studi baru berhasil ditambahkan ke tabel PRODI...!'
GO

begin transaction 
	insert into dbo.PRODI
	(nmprodi, akreditasi, Thn_berdiri, idjenjang)
	select 'ABC', 'A', '2019', 1
 select * from dbo.PRODI
rollback transaction


CREATE TABLE PRODI_NOTIF (
idprodinotif int primary key identity,
nmprodi nvarchar (50),
dimodifoleh nvarchar (150),
dimodiftanggal datetime,
operasi char (1)
)


CREATE TRIGGER TR_notif_prodi ON dbo.PRODI
 FOR INSERT, UPDATE, DELETE
AS
 DECLARE @login_name VARCHAR(150)
 SELECT @login_name = login_name
 FROM sys.dm_exec_sessions
 WHERE session_id = @@SPID
 
 IF EXISTS ( SELECT 0 FROM Deleted )
	BEGIN
		IF EXISTS ( SELECT 0 FROM Inserted )
			BEGIN
				INSERT INTO dbo.PRODI_NOTIF
				 ( nmprodi , dimodifoleh , dimodiftanggal , operasi )
				 SELECT D.nmprodi, @login_name , GETDATE() , 'U'
				 FROM Deleted D
			END
		ELSE
	 BEGIN
		INSERT INTO dbo.PRODI_NOTIF
		( nmprodi , dimodifoleh , dimodiftanggal , operasi )
		 SELECT D.nmprodi, @login_name, GETDATE() , 'D'
		 FROM Deleted D
		END 
	  END
 ELSE
	BEGIN
		INSERT INTO dbo.PRODI_NOTIF
		 ( nmprodi, dimodifoleh , dimodiftanggal, operasi)
		 SELECT I.nmprodi, @login_name, GETDATE(), 'C'
		 FROM Inserted I
	END
GO


BEGIN TRANSACTION
INSERT INTO dbo.PRODI ( nmprodi , akreditasi , thn_berdiri, idjenjang )
	 SELECT 'ABC' , 'A' , '2019', 1
SELECT * FROM dbo.PRODI WHERE idprod = 6 
UPDATE PRODI SET nmprodi = 'ZZZ' WHERE idprod = 6 
SELECT * FROM dbo.PRODI WHERE idprod = 6
SELECT * FROM dbo.PRODI 
SELECT * FROM dbo.PRODI_NOTIF
ROLLBACK TRANSACTION 




-- CREATE TABLE JENJANG

CREATE TABLE JENJANG_NOTIF (
idprodinotif int primary key identity,
nmjenjang nvarchar (50),
dimodifoleh nvarchar (150),
dimodiftanggal datetime,
operasi char (1)
)


-- CREATE TRIGER NOTIF JENJANG

CREATE TRIGGER TR_notif_jenjang ON dbo.JENJANG
 FOR INSERT, UPDATE, DELETE
AS
 DECLARE @login_name VARCHAR(150)
 SELECT @login_name = login_name
 FROM sys.dm_exec_sessions
 WHERE session_id = @@SPID
 
 IF EXISTS ( SELECT 0 FROM Deleted )
	BEGIN
		IF EXISTS ( SELECT 0 FROM Inserted )
			BEGIN
				INSERT INTO dbo.JENJANG_NOTIF
				 ( nmjenjang , dimodifoleh , dimodiftanggal , operasi )
				 SELECT D.nmjenjang, @login_name , GETDATE() , 'U'
				 FROM Deleted D
			END
		ELSE
	 BEGIN
		INSERT INTO dbo.JENJANG_NOTIF
		( nmjenjang , dimodifoleh , dimodiftanggal , operasi )
		 SELECT D.nmjenjang, @login_name, GETDATE() , 'D'
		 FROM Deleted D
		END 
	  END
 ELSE
	BEGIN
		INSERT INTO dbo.JENJANG_NOTIF
		 ( nmjenjang, dimodifoleh , dimodiftanggal, operasi)
		 SELECT I.nmjenjang, @login_name, GETDATE(), 'C'
		 FROM Inserted I
	END
GO

-- UJI TRIGGER 

BEGIN TRANSACTION
INSERT INTO dbo.JENJANG( nmjenjang)
	 SELECT 'D4'
SELECT * FROM dbo.JENJANG WHERE idjenjang = 1 
UPDATE JENJANG SET nmjenjang = 'D3' WHERE idjenjang = 1 
SELECT * FROM dbo.JENJANG WHERE idjenjang = 4
SELECT * FROM dbo.JENJANG
SELECT * FROM dbo.JENJANG_NOTIF
ROLLBACK TRANSACTION


-- CREATE TABLE STATUS_AKADEMIK_NOTIF

CREATE TABLE STATUS_AKADEMIK_NOTIF (
idstatusaka int primary key identity,
nmstatusaka nvarchar (50),
dimodifoleh nvarchar (150),
dimodiftanggal datetime,
operasi char (1)
)


-- CRETAE TRIGGER NOTIF STATUS_AKADEMIK

CREATE TRIGGER TR_notif_status_akademik ON dbo.STATUS_AKADEMIK
 FOR INSERT, UPDATE, DELETE
AS
 DECLARE @login_name VARCHAR(150)
 SELECT @login_name = login_name
 FROM sys.dm_exec_sessions
 WHERE session_id = @@SPID
 
 IF EXISTS ( SELECT 0 FROM Deleted )
	BEGIN
		IF EXISTS ( SELECT 0 FROM Inserted )
			BEGIN
				INSERT INTO dbo.STATUS_AKADEMIK_NOTIF
				 ( nmstatusaka , dimodifoleh , dimodiftanggal , operasi )
				 SELECT D.nmstatusaka, @login_name , GETDATE() , 'U'
				 FROM Deleted D
			END
		ELSE
	 BEGIN
		INSERT INTO dbo.STATUS_AKADEMIK_NOTIF
		( nmstatusaka , dimodifoleh , dimodiftanggal , operasi )
		 SELECT D.nmstatusaka, @login_name, GETDATE() , 'D'
		 FROM Deleted D
		END 
	  END
 ELSE
	BEGIN
		INSERT INTO dbo.STATUS_AKADEMIK_NOTIF
		 ( nmstatusaka, dimodifoleh , dimodiftanggal, operasi)
		 SELECT I.nmstatusaka, @login_name, GETDATE(), 'C'
		 FROM Inserted I
	END
GO

-- UJI TRIGGER STATUS_AKADEMIK

BEGIN TRANSACTION
INSERT INTO dbo.STATUS_AKADEMIK (nmstatusaka)
	 SELECT 'Berhenti'
SELECT * FROM dbo.STATUS_AKADEMIK WHERE idstatusaka = 1 
UPDATE STATUS_AKADEMIK SET nmstatusaka = 'Keluar' WHERE idstatusaka= 6
SELECT * FROM dbo.STATUS_AKADEMIK WHERE idstatusaka = 1
SELECT * FROM dbo.STATUS_AKADEMIK
SELECT * FROM dbo.STATUS_AKADEMIK_NOTIF
ROLLBACK TRANSACTION 


-- CREATE TABLE PENDIDIKAN_NOTIF

CREATE TABLE PENDIDIKAN_NOTIF (
idpendidikan int primary key identity,
nmpendidikan nvarchar (50),
dimodifoleh nvarchar (150),
dimodiftanggal datetime,
operasi char (1)
)

-- CREATE TRIGGER PENDIDIKAN

CREATE TRIGGER TR_notif_pendidikan ON dbo.PENDIDIKAN
 FOR INSERT, UPDATE, DELETE
AS
 DECLARE @login_name VARCHAR(150)
 SELECT @login_name = login_name
 FROM sys.dm_exec_sessions
 WHERE session_id = @@SPID
 
 IF EXISTS ( SELECT 0 FROM Deleted )
	BEGIN
		IF EXISTS ( SELECT 0 FROM Inserted )
			BEGIN
				INSERT INTO dbo.PENDIDIKAN_NOTIF
				 ( nmpendidikan , dimodifoleh , dimodiftanggal , operasi )
				 SELECT D.nmpendidikan, @login_name , GETDATE() , 'U'
				 FROM Deleted D
			END
		ELSE
	 BEGIN
		INSERT INTO dbo.PENDIDIKAN_NOTIF
		( nmpendidikan , dimodifoleh , dimodiftanggal , operasi )
		 SELECT D.nmpendidikan, @login_name, GETDATE() , 'D'
		 FROM Deleted D
		END 
	  END
 ELSE
	BEGIN
		INSERT INTO dbo.PENDIDIKAN_NOTIF
		 ( nmpendidikan, dimodifoleh , dimodiftanggal, operasi)
		 SELECT I.nmpendidikan, @login_name, GETDATE(), 'C'
		 FROM Inserted I
	END
GO


-- UJI TRIGGER PENDIDIKAN


BEGIN TRANSACTION
INSERT INTO dbo.PENDIDIKAN(nmpendidikan)
	 SELECT 'D4'
SELECT * FROM dbo.PENDIDIKAN WHERE idpendidikan = 3
UPDATE PENDIDIKAN SET nmpendidikan = 'D4' WHERE idpendidikan= 1
SELECT * FROM dbo.PENDIDIKAN WHERE idpendidikan = 2
SELECT * FROM dbo.PENDIDIKAN
SELECT * FROM dbo.PENDIDIKAN_NOTIF
ROLLBACK TRANSACTION 



-- CREATE TABLE MAHASISWA_NOTIF

CREATE TABLE MAHASISWA_NOTIF (
idmhs int primary key identity not null,
npm nvarchar (50) not null,
nama nvarchar (50) not null,
tempat_lahir nvarchar (50) not null,
tanggal_masuk nvarchar (50) not null,
sex nvarchar (1) not null,
thn_masuk nvarchar (4) not null,
idprodi int foreign key references PRODI not null,
idstatusaka int foreign key references STATUS_AKADEMIK not null,
dimodifoleh nvarchar (150),
dimodiftanggal datetime,
operasi char (1)
)

-- CRETAE TRIGGER MAHASISWA_NOTIF

CREATE TRIGGER TR_notif_mahasiswa ON dbo.MAHASISWA_NOTIF
 FOR INSERT, UPDATE, DELETE
AS 
DECLARE @login_name varchar (150)
SELECT @login_name = login_name
FROM sys.dm_exec_sessions
 IF EXISTS ( SELECT 0 FROM Deleted )
	BEGIN
		IF EXISTS ( SELECT 0 FROM Inserted )
			BEGIN
				INSERT INTO dbo.MAHASISWA_NOTIF
				 ( npm, nama, tempat_lahir, tanggal_masuk, sex, thn_masuk, idprodi, idstatusaka, dimodifoleh , dimodiftanggal , operasi )
				 SELECT D.npm, D.nama, D.tempat_lahir, D.tanggal_masuk, D.sex, D.thn_masuk, D.idprodi, D.idstatusaka, @login_name, GETDATE() , 'U'
				 FROM Deleted D
			END
		ELSE
	 BEGIN
		INSERT INTO dbo.MAHASISWA_NOTIF
		( npm, nama, tempat_lahir, tanggal_masuk, sex, thn_masuk, idprodi, idstatusaka, dimodifoleh , dimodiftanggal , operasi )
		 SELECT D.npm, D.nama, D.tempat_lahir, D.tanggal_masuk, D.sex, D.thn_masuk, D.idprodi, D.idstatusaka, @login_name, GETDATE() , 'D'
		 FROM Deleted D
		END 
	  END
 ELSE
 	BEGIN
		INSERT INTO dbo.MAHASISWA_NOTIF
		 ( npm, nama, tempat_lahir, tanggal_masuk, sex, thn_masuk, idprodi, idstatusaka, dimodifoleh , dimodiftanggal, operasi)
		 SELECT I.npm, I.nama, I.tempat_lahir, I.tanggal_masuk, I.sex, I.thn_masuk, I.idprodi, I.idstatusaka, @login_name, GETDATE(), 'C'
		 FROM Inserted I
	END
GO



-- CREATE TABLE DOSEN_NOTIF 

CREATE TABLE DOSEN_NOTIF (
iddosen int primary key identity,
nmdosen nvarchar (50),
dimodifoleh nvarchar (150),
dimodiftanggal datetime,
operasi char (1)
)

-- CREATE TRIGGER DOSEN


CREATE TRIGGER TR_notif_dosen ON dbo.DOSEN
 FOR INSERT, UPDATE, DELETE
AS
 DECLARE @login_name VARCHAR(150)
 SELECT @login_name = login_name
 FROM sys.dm_exec_sessions
 WHERE session_id = @@SPID
 
 IF EXISTS ( SELECT 0 FROM Deleted )
	BEGIN
		IF EXISTS ( SELECT 0 FROM Inserted )
			BEGIN
				INSERT INTO dbo.DOSEN_NOTIF
				 ( nmdosen , dimodifoleh , dimodiftanggal , operasi )
				 SELECT D.nmdosen, @login_name , GETDATE() , 'U'
				 FROM Deleted D
			END
		ELSE
	 BEGIN
		INSERT INTO dbo.MDOSEN_NOTIF
		( nmdosen , dimodifoleh , dimodiftanggal , operasi )
		 SELECT D.nmdosen, @login_name, GETDATE() , 'D'
		 FROM Deleted D
		END 
	  END
 ELSE
	BEGIN
		INSERT INTO dbo.DOSEN_NOTIF
		 ( nmdosen, dimodifoleh , dimodiftanggal, operasi)
		 SELECT I.nmdosen, @login_name, GETDATE(), 'C'
		 FROM Inserted I
	END
GO

-- UJI TRIGGER DOSEN

BEGIN TRANSACTION
INSERT INTO dbo.DOSEN(nmdosen)
	 SELECT 'Haldian'
SELECT * FROM dbo.DOSEN WHERE iddosen = 2
UPDATE DOSEN SET nmdosen = 'Mustofa' WHERE iddosen = 1
SELECT * FROM dbo.DOSEN  WHERE iddosen = 1
SELECT * FROM dbo.DOSEN
SELECT * FROM dbo.DOSEN_NOTIF
ROLLBACK TRANSACTION 
			

			












	
	
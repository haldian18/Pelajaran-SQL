--Menampilkan data mahasiswa berdasarkan program studi dan status akademik

CREATE PROCEDURE data_mahasiswa @idprodi int, @idstatusaka int
AS
BEGIN
SELECT * FROM MAHASISWA WHERE idprodi = @idprodi and idstatusaka =
@idstatusaka
END
GO

EXEC data_mahasiswa 6,1 


CREATE PROCEDURE input_mahasiswa 
@npm nvarchar(11), 
@nama nvarchar(50), 
@tempat_lhr nvarchar(30), 
@tanggal_lhr nvarchar(10), 
@sex varchar(1),
@thn_masuk nvarchar(4), 
@idprod int, 
@idstatusaka int
AS
BEGIN
INSERT INTO MAHASISWA VALUES(@npm, @nama, @tempat_lhr,
@tanggal_lhr, @sex, @thn_masuk, @idprod, @idstatusaka)
END
GO

EXEC input_mahasiswa '20753050', 'Haldian', 'Kalianda', '2001-03-11', 'L', '2020', 6, 1

SELECT * FROM MAHASISWA



--Menampilkan data dosen berdasarkan program studi dan pendidikan

CREATE PROCEDURE data_dosen @idprodi int, @idpendidikan int
AS
BEGIN
SELECT * FROM DOSEN WHERE idprodi = @idprodi and idpendidikan =
@idpendidikan
END
GO

EXEC data_dosen 8,2


-- Menginputkan data dosen

CREATE PROCEDURE input_dosen
@nmdosen nvarchar(50), 
@gelar nvarchar(30), 
@tempat_lhr nvarchar(30), 
@tanggal_lhr date, 
@sex varchar(1),
@idprodi int, 
@idpendidikan int
AS
BEGIN
INSERT INTO DOSEN VALUES(@nmdosen,@gelar, @tempat_lhr, @tanggal_lhr,@sex,@idprodi,@idpendidikan)
END
GO


EXEC input_dosen 'Eko Win Kenali', 'S.Kom, M.Cs', 'Bandar Lampung', '1979-01-19', 'L', 6, 1
EXEC input_dosen 'Dwirgo Sahlinal', ' S.T, M.Eng', 'Bandar Lampung', '1980-02-18', 'L', 6, 1

SELECT * FROM DOSEN


create procedure update_dosen
@iddosen int,
@nmdosen nvarchar(50),
@gelar nvarchar (30),
@tempat_lhr nvarchar(30),
@tanggal_lhr date,
@sex varchar (1),
@idprodi int,
@idpendidikan int
as
update DOSEN set nmdosen = @nmdosen, 
gelar = @gelar, tempat_lhr = @tempat_lhr, 
tanggal_lhr = @tanggal_lhr, sex = @sex,
idprodi = @idprodi, idpendidikan = @idpendidikan 
where iddosen = 1

EXEC update_dosen 1, 'Eko Win Kenali', 'S.Kom, M.Cs', 'Bandar Lampung', '1979-01-19', 'L', 6, 1

select * from DOSEN

drop procedure update_dosen

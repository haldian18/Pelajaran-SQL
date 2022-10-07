
select distinct tempat_lhr from MAHASISWA


select distinct nmstatusaka
from STATUS_AKADEMIK
where idstatusaka in (select idstatusaka from MAHASISWA)


select nmprodi as Prodi,
	(select count(*) from MAHASISWA where idprodi = PRODI.idprod) as Jumlah
from PRODI 


select nmprodi as Prodi,
	(select count(*) from DOSEN where idprodi = PRODI.idprod) as Jumlah
from PRODI 

select count(*) as Jumlah from MAHASISWA 
where idprodi in (select idprodi from PRODI where idjenjang=1)

select * from MAHASISWA 
where idprodi in (select idprodi from PRODI where idjenjang=1)

select count(*) as Jumlah from MAHASISWA 
where idprodi in (select idprodi from PRODI where idjenjang=2)


select * from DOSEN
where idprodi in (select idprodi from PRODI where idjenjang=1)

select * from DOSEN
where idprodi in (select idprodi from PRODI where idjenjang=2)


select * from MAHASISWA 
where DATEDIFF(year, tanggal_lhr, GETDATE()) > 19

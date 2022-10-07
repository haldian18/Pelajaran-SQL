select  count (*) as [Jumlah Mahasiswa],
		cast(avg(cast(DATEDIFF(year, tanggal_lhr, getdate()) 
		as dec(10, 1))) as dec(10,1)) as [Rata-Rata Umur] 
from MAHASISWA


select nmprodi as [Nama Prodi],
	count(DOSEN.gelar) as Jumlah
from PRODI inner join DOSEN on PRODI.idprod = DOSEN.idprodi
group by nmprodi


select COUNT(*) as [Jumlah Mahasiswa],
		MIN(datediff(year, tanggal_lhr, GETDATE())) as [Umur Min]
from MAHASISWA

select COUNT(*) as [Jumlah Prodi],
		SUM(idjenjang) as [Jumlah Jenjang]
from PRODI


select npm, nama, tempat_lhr,
	SUBSTRING(CAST(tanggal_lhr as nvarchar), 1, 4) as [Tahun Lahir]
from MAHASISWA where tempat_lhr='Jakarta'


select nmdosen, gelar,
	LEN(nmdosen) as [Panjang Nama]
from DOSEN where tempat_lhr = 'Bandung'



select COUNT(*) as DOSEN, 5 as Pembagi,
	round(cast(count(*) as dec (5,1))/5,1) as hasil
from DOSEN



select nmdosen, gelar, tanggal_lhr,
	CAST(getdate() as date) as Sekarang,
	DATEDIFF(year, tanggal_lhr, GETDATE()) as Umur
from DOSEN


select UPPER(nmprodi) as prodi, akreditasi, Thn_berdiri 
from PRODI

select LOWER(nmdosen) as NamaDosen, idpendidikan
from DOSEN where idpendidikan=2


select * from PRODI
where idprod not in (select idprod from MAHASISWA where idprodi = PRODI.idprod)


select nmstatusaka  from STATUS_AKADEMIK
where idstatusaka in (select idstatusaka from MAHASISWA)


select * from MAHASISWA 
where thn_masuk between 2015 and 2017


select * from DOSEN 
where tanggal_lhr between '1976-01-01' and '1995-12-31'


select * from DOSEN where tempat_lhr is null

select top 3 * from MAHASISWA
inner join PRODI on MAHASISWA.idprodi = PRODI.idprod
inner join DOSEN on PRODI.idprod = DOSEN.idprodi
where idjenjang = 1 and idpendidikan=2
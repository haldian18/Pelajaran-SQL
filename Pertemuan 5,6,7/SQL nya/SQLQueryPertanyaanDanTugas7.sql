select COUNT (*) as [Jumlah Mahasiswa],
cast(avg(cast(datediff(year, tanggal_lhr, getdate())
as dec(10,1))) as dec (10,1)) as [rata-rata]
from MAHASISWA 



select nmprodi,
(select COUNT (*) from MAHASISWA where idprodi = PRODI.idprod) as Jumlah
from PRODI



select nmpendidikan,
(select COUNT (*) from DOSEN where idpendidikan = PENDIDIKAN.idpendidikan) as Jumlah
from PENDIDIKAN where idpendidikan = 2


select 
	MAX(datediff(year, tanggal_lhr, GETDATE ())) as [Umur Tertua],
	MIN(datediff(year, tanggal_lhr, GETDATE ())) as [Umur Termuda]
from MAHASISWA


select idmhs, npm, nama,len(nama) as [Jumlah Karakter]
from MAHASISWA  where idprodi = 2


select nmdosen,
	datediff(year, tanggal_lhr, GETDATE()) as Umur
from DOSEN



select idmhs, npm, UPPER(nama) as nama, tempat_lhr, tanggal_lhr,
sex, thn_masuk, idprodi, idstatusaka
from MAHASISWA


select iddosen, LOWER(nmdosen) as nmdosen, gelar, tempat_lhr,tanggal_lhr, 
	sex, idprodi, idpendidikan
from DOSEN


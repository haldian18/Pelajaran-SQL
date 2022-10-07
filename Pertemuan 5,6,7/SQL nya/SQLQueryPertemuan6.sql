
select nmdosen, gelar, nmprodi
from DOSEN join PRODI on DOSEN.idprodi = PRODI.idprod
order by nmdosen, gelar


select nama, npm, thn_masuk, idprodi
from MAHASISWA inner join PRODI on MAHASISWA.idprodi = PRODI.idprod
order by nama, npm, thn_masuk


select nmprodi, akreditasi, Thn_berdiri,PRODI.idjenjang
from PRODI left join JENJANG on PRODI.idprod = JENJANG.idjenjang
order by nmprodi, akreditasi, Thn_berdiri



select nama, npm, thn_masuk, PRODI.idprod
from MAHASISWA full join PRODI on MAHASISWA.idprodi =  PRODI.idprod
order by nama, npm, thn_masuk

SELECT 
	nama, MAHASISWA.npm, MAHASISWA.thn_masuk, MAHASISWA.tanggal_lhr, MAHASISWA.tempat_lhr,MAHASISWA.idprodi 
	FROM MAHASISWA
UNION
SELECT 
	nmdosen, DOSEN.gelar, DOSEN.tanggal_lhr, DOSEN.tanggal_lhr, DOSEN.tempat_lhr, DOSEN.idprodi
FROM DOSEN



select  top 3 * from MAHASISWA


select * from DOSEN where idprodi in (6,7,8)


select 
	nama, npm, tanggal_lhr, tempat_lhr, DATEDIFF(year, tanggal_lhr, getdate())as umur
from MAHASISWA
where DATEDIFF(YEAR, tanggal_lhr, GETDATE())
	between 20 and 21


select distinct nmstatusaka,
	case
		when isnull(MAHASISWA.idstatusaka, 0) = 1 then 'Ada'
		when isnull(MAHASISWA.idstatusaka, 0) = 0 then 'Tidak Ada'
	end as [MAHASISWA]
from STATUS_AKADEMIK full join MAHASISWA on STATUS_AKADEMIK.idstatusaka = MAHASISWA.idstatusaka
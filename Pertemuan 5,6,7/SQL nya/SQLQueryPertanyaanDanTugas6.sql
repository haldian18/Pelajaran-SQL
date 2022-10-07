
select nmdosen, gelar, nmprodi, PRODI.idprod
from PRODI inner join DOSEN on PRODI.idprod = DOSEN.idprodi


select nmprodi, PRODI.idjenjang
from PRODI left join JENJANG on PRODI.idjenjang = JENJANG.idjenjang


select nama, npm, nmstatusaka
from MAHASISWA right join STATUS_AKADEMIK 
on MAHASISWA.idstatusaka = STATUS_AKADEMIK.idstatusaka


select nmdosen, gelar, nmprodi, PRODI.idprod
from PRODI full join DOSEN on PRODI.idprod = DOSEN.idprodi



SELECT nmdosen, gelar, nmprodi, PRODI.idprod
FROM DOSEN
FULL OUTER JOIN PRODI ON DOSEN.idprodi=PRODI.idprod


select top 5 * from MAHASISWA
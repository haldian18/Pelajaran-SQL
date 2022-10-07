
SELECT iddosen, nmdosen, gelar FROM DOSEN
WHERE iddosen IN
(SELECT DISTINCT iddosen FROM PRODI)
SELECT iddosen, nmdosen, gelar FROM DOSEN
WHERE iddosen NOT IN
(SELECT DISTINCT iddosen FROM PRODI)


SELECT idmhs, npm, nama FROM MAHASISWA
WHERE idmhs  IN
(SELECT DISTINCT idmhs FROM PRODI)

SELECT idmhs, npm, nama FROM MAHASISWA
WHERE idmhs NOT IN
(SELECT DISTINCT idmhs FROM PRODI)SELECT idmhs, nama, npm FROM MAHASISWA
WHERE idmhs = ALL ( SELECT idmhs FROM MAHASISWA
WHERE idmhs= '23')

SELECT nama, npm, tanggal_lhr,thn_masuk FROM MAHASISWA
FULL JOIN PRODI ON MAHASISWA.idprodi = PRODI.idprodORDER BY nama, npm, tanggal_lhr,thn_masukSELECT nmdosen, gelar, tanggal_lhr FROM DOSENFULL JOIN PRODI ON DOSEN.idprodi = PRODI.idprodORDER BY nmdosen, gelar, tanggal_lhrSELECT * FROM MAHASISWA CROSS JOIN PRODISELECT * FROM DOSEN CROSS JOIN PRODISELECT nama, npm, thn_masuk, idprodi FROM MAHASISWAinner join PRODI on MAHASISWA.idprodi = PRODI.idprodORDER BY nama, npm, thn_masukSELECT nmdosen, gelar,tanggal_lhr FROM DOSENinner join PRODI on DOSEN.idprodi = PRODI.idprodORDER BY nmdosen, gelar,tanggal_lhr-- OUTER JOINSELECT DOSEN.nmdosen,DOSEN.gelar, PRODI.nmprodi, PRODI.akreditasi
FROM DOSEN, PRODI
WHERE DOSEN.idprodi = PRODI.idprodSELECT DOSEN.nmdosen,DOSEN.gelar, MAHASISWA.nama, MAHASISWA.npm, MAHASISWA.tanggal_lhr
FROM DOSEN, MAHASISWA
WHERE DOSEN.idprodi = MAHASISWA.idprodiSELECT npm, nama, nmdosen, gelar FROM MAHASISWA
LEFT OUTER JOIN DOSEN ON DOSEN.idprodi = MAHASISWA.idprodi

SELECT npm, nama, nmprodi, akreditasi FROM MAHASISWA
LEFT OUTER JOIN PRODI ON MAHASISWA.idprodi = PRODI.idprodSELECT npm, nama, nmprodi, akreditasi FROM MAHASISWA
RIGHT OUTER JOIN PRODI ON MAHASISWA.idprodi = PRODI.idprod


SELECT nmdosen, gelar, nmprodi, akreditasi FROM DOSEN
RIGHT OUTER JOIN PRODI ON DOSEN.idprodi = PRODI.idprodSELECT MAHASISWA.nama, MAHASISWA.npm, MAHASISWA.tanggal_lhr, PRODI.nmprodi
FROM PRODI
FULL OUTER JOIN MAHASISWA ON PRODI.idprod = MAHASISWA.idprodi
ORDER BY MAHASISWA.nama, MAHASISWA.npm, PRODI.nmprodi


SELECT DOSEN.nmdosen, DOSEN.gelar, PRODI.nmprodi
FROM PRODI
FULL OUTER JOIN DOSEN ON PRODI.idprod = DOSEN.idprodi
ORDER BY DOSEN.nmdosen, DOSEN.gelar, PRODI.nmprodi-- EQUAL Join
SELECT DOSEN.nmdosen,DOSEN.gelar, MAHASISWA.nama, MAHASISWA.npm, MAHASISWA.tanggal_lhr
FROM DOSEN, MAHASISWA
WHERE DOSEN.idprodi = MAHASISWA.idprodi

-- EQUAL Join

SELECT  MAHASISWA.nama, MAHASISWA.npm, MAHASISWA.tanggal_lhr, PRODI.nmprodi, PRODI.akreditasi
FROM MAHASISWA, PRODI
WHERE PRODI.idprod = MAHASISWA.idprodi
-- SELF JoinSELECT A.nmdosen, A.gelar, B.nmdosen, B.gelar FROM DOSEN as A, DOSEN as B
WHERE A.iddosen ='4' AND B.iddosen ='5' 

-- SELF Join
SELECT A.nama,A.npm, B.nama, B.npm FROM MAHASISWA as A, MAHASISWA as B
WHERE A.idmhs ='23' AND B.idmhs = '38' -- Natural JoinSELECT DOSEN.iddosen, DOSEN.nmdosen, DOSEN.gelar, PRODI.idprod, PRODI.nmprodi 
FROM DOSEN, PRODI
WHERE DOSEN.idprodi = PRODI.idprod 

-- Natural Join
SELECT MAHASISWA.idprodi, MAHASISWA.nama, MAHASISWA.npm, PRODI.idprod, PRODI.nmprodi 
FROM MAHASISWA, PRODI
WHERE MAHASISWA.idprodi = PRODI.idprod 

CREATE DATABASE data_akademik;

USE data_akademik;

-- Membuat tabel matkul
CREATE TABLE matkul
(
	kd_mk CHAR(6) PRIMARY KEY,
    nm_mk VARCHAR(50),
    sks INT,
    semester INT,
    ket TEXT
);

-- Membuat tabel mhs
CREATE TABLE mhs
(
	nim CHAR(9) PRIMARY KEY,
    nama_mhs VARCHAR(50),
    jurusan CHAR(2),
    tgl_lahir DATE
);

-- Membuat tabel nilai
CREATE TABLE nilai
(
	ta CHAR(8),
    nilai_angka INT,
    nilai_huruf CHAR(2),
    nim CHAR(9) ,
    kd_mk CHAR(6) ,
    PRIMARY KEY(ta, nim, kd_mk),
    CONSTRAINT fk_nim_mhs FOREIGN KEY(nim) REFERENCES mhs(nim),
    CONSTRAINT fk_kd_mk_matkul FOREIGN KEY (kd_mk) REFERENCES matkul(kd_mk)
);

-- Input nilai di tabel matkul
INSERT INTO matkul 
VALUES ('IF0001', 'Pemikiran Desain', '2' , '1', 'Selesai'),
('IF0002', 'Pemrograman', '4', '1', 'Tidak Selesai'),
('IF0003', 'Arsitektur Komputer', '2','2', 'Tidak Selesai'),
('IF0004', 'Pengembangan Karakter' , '2', '3', 'Tidak Selesai'),
('IF0005', 'Literasi Digital', '2', '4', 'Selesai'),
('IF0006', 'Pemikiran Komputasi', '4', '4' ,'Tidak Selesai'),
('IF0007', 'Basis Data', '2', '5', 'Selesai'),
('IF0008', 'Web Front-End', '4', '2' ,'Tidak Selesai'),
('IF0009', 'Otomasi Perkantoran', '4', '1', 'Selesai'),
('IF0010', 'Matematika Komputasi', '2', '3' ,'Selesai');

-- Tampilkan data di tabel matkul
SELECT * FROM matkul;

-- Input nilai di tabel mhs
INSERT INTO mhs
VALUES ('231112518', 'Tasya Syafriza', 'TI', '2005-06-26'),
('231111710', 'Delarosa Butar Butar', 'TI', '2003-01-28'),
('231111451', 'Mirawati Hutasoit', 'TI', '2005-11-19'),
('231116530', 'Saskia Anggi', 'TI', '2005-12-29'),
('231118509', 'Harika Sry', 'TI', '2004-03-13'),
('231117201', 'Grace Sibora', 'TI', '2003-07-30'),
('231111314', 'Elia Sari', 'TI', '2005-04-12'),
('231111450', 'Rasidin Harahap', 'TI', '2005-11-13'),
('231119862', 'Raihan Azhari Lubis', 'TI', '2003-12-20'),
('231116501', 'Arya Ghuna Faturrahman', 'TI', '2004-01-15');

-- Tampilkan data di tabel mhs
SELECT * FROM mhs;

-- Input nilai di tabel nilai
INSERT INTO nilai
VALUES ('2024', '85', 'A','231116501' , 'IF0002'),
('2024','70','B','231119862','IF0003'),
('2024','90','A','231111450','IF0001'),
('2023','70','B','231111314','IF0004'),
('2023','70','B','231111451','IF0005'),
('2023','78','B+','231111710','IF0006'),
('2024','90','A','231118509','IF0007'),
('2023','88','A','231112518','IF0008'),
('2024','55','C','231117201','IF0009'),
('2024','68','B-','231116530','IF0010');

-- Input data di tabel nilai
SELECT * FROM nilai;

-- NOMOR 1
-- Tampilkan kode dan nama mata kuliah yang sks-nya berbobot 2 (dua).
SELECT kd_mk, nm_mk , sks
FROM matkul
WHERE sks = 2;

-- NOMOR 2
-- Tampilkan daftar mata kuliah yang kodenya berawalan IF, yang mana mata kuliah tersebut diambil pada semester 5 (lima).
SELECT nm_mk, kd_mk, semester
FROM matkul
WHERE kd_mk LIKE "IF%" AND semester = "5";

-- NOMOR 3
-- Tampilkan daftar mahasiswa yang lahir pada bulan November dan urutkan secara menurun berdasarkan NIM.
SELECT nim ,nama_mhs, tgl_lahir
FROM mhs
WHERE tgl_lahir LIKE "%11%"
ORDER BY nim ASC;

-- NOMOR 4
-- Hitung total sks yang harus diambil mahasiswa jurusan IF (kode mata kuliahnya berawalan IF).
SELECT SUM(sks) as totalSKS
FROM matkul
WHERE kd_mk LIKE "IF%";

-- NOMOR 5
-- Hitung jumlah mahasiswa yang memperoleh nilai B untuk mata kuliah berkode ‘IF0004’.
SELECT COUNT(*) AS jumlahMHS
FROM nilai 
WHERE kd_mk = "IF0004" AND nilai_huruf = "B";

-- NOMOR 6
-- Hitung jumlah mahasiswa jurusan IF yang berumur 21 tahun.
SELECT COUNT(*) AS jumlahMHS
FROM mhs
INNER JOIN nilai ON mhs.nim = nilai.nim
WHERE YEAR(CURRENT_DATE) - YEAR(mhs.tgl_lahir) = 21 AND kd_mk LIKE "IF%";

-- NOMOR 7
-- Hitung total sks dan jumlah mata kuliah per semester.
SELECT semester, SUM(matkul.sks)AS total_sks, COUNT(nm_mk) AS jlh_mk
FROM matkul
GROUP BY semester
ORDER BY semester;

-- NOMOR 8
-- Hitung rata-rata nilai, nilai terendah, dan nilai tertinggi yang diperoleh untuk masing-masing mata kuliah.
SELECT matkul.nm_mk,
AVG(nilai_angka) AS rata_rata,
MIN(nilai_angka) AS nilai_terendah,
MAX(nilai_angka) AS nilai_tertinggi
FROM nilai
INNER JOIN matkul
ON nilai.kd_mk = matkul.kd_mk
GROUP BY matkul.nm_mk, nilai.kd_mk;


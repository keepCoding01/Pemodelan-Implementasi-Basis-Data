CREATE DATABASE jasa_angkut_barang;

USE jasa_angkut_barang;

-- Tabel Pengguna
CREATE TABLE pengguna
(
	kode CHAR(9) PRIMARY KEY,
    nama VARCHAR(50),
    alamat VARCHAR(50),
    nomor_telepon CHAR(12),
    status_pengguna ENUM('pelanggan', 'pemilik', 'supir')
);

SELECT * FROM pengguna;
DROP TABLE pengguna;

-- Tabel Pemilik
CREATE TABLE pemilik 
(
	kode CHAR(9) PRIMARY KEY,
    NPWP CHAR(20),
    CONSTRAINT fk_kode_pengguna_pemilik FOREIGN KEY (kode) REFERENCES pengguna(kode)
);

SELECT * FROM pemilik;
DROP TABLE pemilik;

-- Tabel Pelanggan 
CREATE TABLE pelanggan
(
	kode CHAR(9) PRIMARY KEY,
    no_KTP CHAR(15),
    CONSTRAINT fk_kode_pengguna_pelanggan FOREIGN KEY (kode) REFERENCES pengguna(kode)
);

SELECT * FROM pelanggan;
DROP TABLE pelanggan;

 -- Tabel Supir
 CREATE TABLE supir
 (
	kode CHAR(9) PRIMARY KEY,
    no_SIM CHAR(16),
    CONSTRAINT fk_kode_pengguna_supir FOREIGN KEY (kode) REFERENCES pengguna(kode)
 );
 
 SELECT * FROM supir;
 DROP TABLE supir;
 
 -- Tabel Truk
 CREATE TABLE truk
 (
	kode CHAR(9) PRIMARY KEY,
    kode_pemilik CHAR(9),
    model VARCHAR(20),
    lisensi VARCHAR(10),
    kapasitas INT,
    status_truk ENUM('tersedia', 'dipakai', 'pemeliharaan'),
    lokasi VARCHAR(20),
    deskripsi VARCHAR(50),
    CONSTRAINT fk_kode_pemilik_truk FOREIGN KEY (kode_pemilik) REFERENCES pemilik(kode)
 );
 
 SELECT * FROM truk;
 DROP TABLE truk;
 
 -- Tabel Booking
 CREATE TABLE booking
 (
	kode CHAR(9) PRIMARY KEY,
    kode_pelanggan CHAR(9),
    kode_truk CHAR(9),
    kode_supir CHAR (9),
    tanggal_booking DATE,
    tanggal_angkut DATE,
    status_booking ENUM('pending', 'proses', 'selesai', 'batal'),
    CONSTRAINT fk_kode_pelanggan_booking FOREIGN KEY (kode_pelanggan) REFERENCES pelanggan(kode),
	CONSTRAINT fk_kode_truk_booking FOREIGN KEY (kode_truk) REFERENCES truk(kode),
    CONSTRAINT fk_kode_supir_booking FOREIGN KEY (kode_supir) REFERENCES supir(kode)
 );
 
 SELECT * FROM booking;
 DROP TABLE booking;
 
 -- Tabel Rute
 CREATE TABLE rute 
 (
	kode CHAR(9) PRIMARY KEY,
    kode_booking CHAR(9),
    lokasi_awal VARCHAR(50),
    lokasi_akhir VARCHAR(50),
    jarak_km INT,
    estimasi_waktu_menit TIME,
	CONSTRAINT fk_kode_booking_rute FOREIGN KEY (kode_booking) REFERENCES booking(kode)
 );
 
 SELECT * FROM rute;
 DROP TABLE rute;
 
 -- Tabel Pembayaran 
 CREATE TABLE pembayaran
(
	kode CHAR(9) PRIMARY KEY,
    kode_booking CHAR(9),
    jumlah INT,
    tanggal_pembayaran DATE,
	metode ENUM('QRIS', 'tunai', 'kartu kredit'),
    CONSTRAINT fk_kode_booking_pembayaran FOREIGN KEY (kode_booking) REFERENCES booking(kode)
);

SELECT * FROM pembayaran;
DROP TABLE pembayaran;

-- Tabel Pemeliharaan Truk 
CREATE TABLE pemeliharaan_truk
(
	kode CHAR(9) PRIMARY KEY,
    kode_truk CHAR(9),
    tanggal DATE,
    deskripsi VARCHAR (50),
    biaya INT,
    CONSTRAINT fk_kode_truk_pemeliharaan_truk FOREIGN KEY (kode_truk) REFERENCES truk(kode)
);

SELECT * FROM pemeliharaan_truk;
DROP TABLE pemeliharaan_truk;

-- Tabel Review
CREATE TABLE review
(
	kode CHAR (9) PRIMARY KEY,
    kode_booking CHAR(9),
    kode_pelanggan CHAR(9),
    nilai_rating INT,
	komentar VARCHAR(50),
    tanggal_review DATE,
    CONSTRAINT fk_kode_booking_review FOREIGN KEY (kode_booking) REFERENCES booking(kode),
    CONSTRAINT fk_kode_pelanggan_review FOREIGN KEY (kode_pelanggan) REFERENCES pelanggan(kode)
);

SELECT * FROM review;
DROP TABLE review;

-- Input nilai di tabel pengguna
INSERT INTO pengguna 
VALUES ('231112518', 'Tasya Syafriza', 'Jl.Eka Suka', 085765247899,'pelanggan'),
('231112747', 'M.Dhani Irvansyah', 'Jl.Karya Bakti', 081265340291, 'pemilik'),
('231111254', 'Delarosa Butar Butar', 'Jl.Tanjung', 085287659981, 'supir'),
('231110569', 'Arya Ghuna Faturrahman', 'Jl.Berastagi', 081254809911, 'pelanggan'),
('231111619', 'Raihan Azhari Lubis', 'Jl.Pinang', 081267982543, 'pelanggan');

SELECT * FROM pengguna;

-- Input nilai di tabel pemilik
INSERT INTO pemilik 
VALUES ('231112518','09.123.321.3-407.000'),
('231111254','09.123.231.1-432.000'),
('231112747','09.345.543.2-231.000'),
('231110569','09.456.654.3-333.000'),
('231111619','09.567.765.4-222.000');

SELECT * FROM pemilik;

-- Input nilai di tabel pelanggan
INSERT INTO pelanggan
VALUES ('231112518','127660300041112'),
('231111254','123654234543275'),
('231112747','234765364589654'),
('231110569','986741294856284'),
('231111619','572981537924568');

SELECT * FROM pelanggan;

-- Input nilai di tabel supir 
INSERT INTO supir
VALUES ('231112518','1222-9209-000363'),
('231111254','2111-3243-162534'),
('231112747','6522-8426-136274'),
('231110569','9847-1847-195738'),
('231111619','7364-9137-146893');

SELECT * FROM supir;

-- Input nilai di tabel truk 
INSERT INTO truk
VALUES ('BK2342ABA','231112518','pickup','sim b','4500','dipakai','Jl.Medan','aman'),
('BK432EAA','231111254','fuso','sim b','5000','pemeliharaan','Jl.johor','bagus'),
('BK534AWW','231112747','hino','sim b','7000','tersedia','Jl.Tanjung','aman'),
('BK654EWW','231110569','tronton','sim b','3000','tersedia','Jl.perbaungan','terpercaya'),
('BK769AJR','231111619','wingbox','sim b','2000','tersedia','Jl.pakam','mantap');

SELECT * FROM truk;

-- Input nilai di tabel booking 
INSERT INTO booking
VALUES ('A11045428','231112518','BK2342ABA','231112518','2024-02-12','2024-02-14','pending'),
('B73648290','231111254','BK432EAA','231111254','2024-03-01','2024-03-04','proses'),
('C39485726','231112747','BK534AWW','231112747','2024-10-20','2024-10-30','selesai'),
('D76859432','231110569','BK654EWW','231110569','2024-12-15','2024-12-20','batal'),
('E75849675','231111619','BK769AJR','231111619','2024-04-07','2024-04-20','proses');

SELECT * FROM booking;

-- Input nilai di tabel rute
INSERT INTO rute
VALUES ('JKT488594','A11045428','Medan','Jakarta','10','13:45:39'),
('MDN546372','B73648290','Jakarta','Medan','12','15:31:12'),
('BDG564738','C39485726','Bali','Bandung','14','01:12:32'),
('SBY392093','D76859432','Papua','Surabaya','16','22:45:23'),
('SMG754839','E75849675','Medan','Semarang','18','15:25:56');

SELECT * FROM rute;

-- Input nilai di tabel pembayaran 
INSERT INTO pembayaran
VALUES ('039485279','A11045428','2','2024-02-12','kartu kredit'),
('758493657','B73648290','1','2024-03-01','tunai'),
('574839205','C39485726','2','2024-10-20','Qris'),
('324156245','D76859432','1','2024-12-15','tunai'),
('980786756','E75849675','1','2024-04-07','kartu kredit');

SELECT * FROM pembayaran;

-- Input nilai di tabel pemeliharaan truk
INSERT INTO pemeliharaan_truk
VALUES ('SIBIRU123','BK2342ABA','2024-04-23','Ban bocor','500000'),
('SIHIJAU56','BK432EAA','2024-05-23','Ganti oli','600000'),
('SIMERAH52','BK534AWW','2024-09-21','Servis','850000'),
('SIPUTIH07','BK654EWW','2024-12-09','ganti sepatu rem','250000'),
('SIHITAM12','BK769AJR','2024-11-25','Radiator bocor','675000');

SELECT * FROM pemeliharaan_truk;

-- Input nilai di tabel review
INSERT INTO review
VALUES ('574389275','A11045428','231112518','5','Pelayanannya bagus','2024-02-15'),
('152653647','B73648290','231111254','4','barang cepat sampai','2024-03-05'),
('758690367','C39485726','231112747','5','terpercaya','2024-10-31'),
('275648390','D76859432','231110569','3','lambat','2024-12-21'),
('678308475','E75849675','231111619','2','barang rusak','2024-04-11');

SELECT * FROM review;

-- tampilkan 4 data pelanggan yang paling banyak melakukan booking pada bulan dan tahun tertentu. 
-- urutkan berdasarkan jumlah booking terbanyak. 
-- output : kode, nama pengguna, dan jumlah booking.
SELECT p.kode AS kode_pelanggan, p.nama AS nama_pengguna, COUNT(b.kode) AS jumlah_booking
FROM pengguna p
JOIN booking b ON p.kode = b.kode_pelanggan
GROUP BY p.kode, p.nama
ORDER BY jumlah_booking DESC
LIMIT 4;

-- tampilkan jumlah booking per status dengan menggunakan objek view. 
-- output : status booking dan jumlah.
CREATE VIEW jumlah_booking_per_status AS
SELECT status_booking, COUNT(*) AS jumlah
FROM booking
GROUP BY status_booking;

SELECT * FROM jasa_angkut_barang.jumlah_booking_per_status;

-- tampilkan 4 data booking yang memiliki rute (jumlah km) 
-- paling panjang pada bulan dan tahun tertentu dengan menggunakan objek procedure 
-- yang memiliki 2 (dua) input parameter, yaitu bulan dan tahun. 
-- output : kode booking, kode pelanggan, kode supir.
DELIMITER //
CREATE PROCEDURE rute_paling_panjang (IN p_bulan INT, IN p_tahun INT)
BEGIN
    SELECT b.kode AS kode_booking, b.kode_pelanggan, b.kode_supir
    FROM booking b
    JOIN rute r ON b.kode = r.kode_booking
    WHERE MONTH(b.tanggal_booking) = p_bulan
      AND YEAR(b.tanggal_booking) = p_tahun
    ORDER BY r.jarak_km DESC
    LIMIT 4;
END //
DELIMITER ;

CALL rute_paling_panjang(2,2024);

-- tampilkan data truk yang belum pernah di-maintenance(pemeliharaan). 
-- output : kode truk, model, kode pemilik, nama pemilik. 
SELECT t.kode AS kode_truk, t.model, p.kode AS kode_pemilik, pengguna.nama AS nama_pemilik
FROM truk t
JOIN pemilik p ON t.kode_pemilik = p.kode
JOIN pengguna ON p.kode = pengguna.kode
WHERE t.status_truk != 'pemeliharaan';





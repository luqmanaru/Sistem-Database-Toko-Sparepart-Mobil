-- 1. QUERY DASAR
-- Menampilkan semua data barang
SELECT * FROM barang;

-- Menampilkan semua transaksi dengan informasi lengkap
SELECT t.id_transaksi, c.nama_customer, b.nama_barang, 
       t.harga_total, p.tgl_kirim, t.jatuh_tempo
FROM transaksi t
JOIN customer c ON t.id_customer = c.id_customer
JOIN barang b ON t.kode_barang = b.kode_barang
JOIN pengiriman p ON t.no_faktur = p.no_faktur;

-- 2. QUERY ANALITIK
-- Total penjualan per customer
SELECT c.nama_customer, SUM(t.harga_total) AS total_belanja
FROM transaksi t
JOIN customer c ON t.id_customer = c.id_customer
GROUP BY c.nama_customer
ORDER BY total_belanja DESC;

-- Rata-rata nilai transaksi per supplier
SELECT s.nama_supplier, AVG(t.harga_total) AS rata_rata_transaksi
FROM transaksi t
JOIN supplier s ON t.id_supplier = s.id_supplier
GROUP BY s.nama_supplier;

-- 3. QUERY OPERASIONAL
-- Daftar pengiriman yang jatuh tempo bulan ini
SELECT p.no_faktur, c.nama_customer, b.nama_barang, 
       p.tgl_kirim, t.jatuh_tempo, t.harga_total
FROM transaksi t
JOIN pengiriman p ON t.no_faktur = p.no_faktur
JOIN customer c ON t.id_customer = c.id_customer
JOIN barang b ON t.kode_barang = b.kode_barang
WHERE t.jatuh_tempo BETWEEN CURDATE() AND LAST_DAY(CURDATE());

-- Stok barang yang perlu restock (qty < 15)
SELECT b.kode_barang, b.nama_barang, p.qty_kirim AS stok
FROM barang b
JOIN pengiriman p ON b.kode_barang = p.kode_barang
WHERE p.qty_kirim < 15
ORDER BY p.qty_kirim ASC;

-- 4. QUERY PENCARIAN
-- Cari transaksi berdasarkan nama customer
SELECT t.id_transaksi, t.no_faktur, c.nama_customer, 
       b.nama_barang, t.harga_total
FROM transaksi t
JOIN customer c ON t.id_customer = c.id_customer
JOIN barang b ON t.kode_barang = b.kode_barang
WHERE c.nama_customer LIKE '%Motor%';

-- Cari barang berdasarkan keyword
SELECT * FROM barang
WHERE nama_barang LIKE '%Lampu%' OR nama_barang LIKE '%Handle%';

-- 5. QUERY UPDATE DATA
-- Update harga jual barang
UPDATE pengiriman
SET harga_jual = 900000
WHERE kode_barang = 'H02';

-- Update alamat customer
UPDATE customer
SET alamat_customer = 'Bandung'
WHERE id_customer = '2022310035';

-- 6. QUERY LAPORAN
-- Ringkasan penjualan bulanan
SELECT 
    DATE_FORMAT(p.tgl_kirim, '%Y-%m') AS bulan,
    COUNT(t.id_transaksi) AS jumlah_transaksi,
    SUM(t.harga_total) AS total_penjualan,
    SUM(p.dp) AS total_dp
FROM transaksi t
JOIN pengiriman p ON t.no_faktur = p.no_faktur
GROUP BY DATE_FORMAT(p.tgl_kirim, '%Y-%m')
ORDER BY bulan DESC;

-- 10 Transaksi terbesar
SELECT t.id_transaksi, c.nama_customer, b.nama_barang, 
       t.harga_total, p.tgl_kirim
FROM transaksi t
JOIN customer c ON t.id_customer = c.id_customer
JOIN barang b ON t.kode_barang = b.kode_barang
JOIN pengiriman p ON t.no_faktur = p.no_faktur
ORDER BY t.harga_total DESC
LIMIT 10;

-- 7. QUERY UNTUK DASHBOARD
-- Statistik harian
SELECT 
    DATE(p.tgl_kirim) AS tanggal,
    COUNT(t.id_transaksi) AS transaksi,
    SUM(t.harga_total) AS omset,
    AVG(t.harga_total) AS rata_rata
FROM transaksi t
JOIN pengiriman p ON t.no_faktur = p.no_faktur
GROUP BY DATE(p.tgl_kirim)
ORDER BY tanggal DESC
LIMIT 7;

-- Pelanggan terbaik (top 5)
SELECT c.nama_customer, COUNT(t.id_transaksi) AS jumlah_transaksi,
       SUM(t.harga_total) AS total_belanja
FROM transaksi t
JOIN customer c ON t.id_customer = c.id_customer
GROUP BY c.nama_customer
ORDER BY total_belanja DESC
LIMIT 5;

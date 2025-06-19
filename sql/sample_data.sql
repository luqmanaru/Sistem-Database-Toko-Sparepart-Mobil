-- Data Barang
INSERT INTO barang (kode_barang, nama_barang) VALUES
('H02', 'Handle Pintu Innova'),
('L04', 'Lampu Bagasi Agya'),
('S01', 'Spion Komplit Sigra'),
('W03', 'Wiper Kaca Depan');

-- Data Customer
INSERT INTO customer (id_customer, nama_customer, alamat_customer) VALUES
('2022310035', 'Hanif Motor', 'Bali'),
('2022310041', 'David Motor', 'Palembang'),
('2022310075', 'Ilyas Motor', 'Kebumen'),
('2022310087', 'Imam Motor', 'Aceh'),
('2022330006', 'Ramsa Motor', 'Batam');

-- Data Supplier
INSERT INTO supplier (id_supplier, nama_supplier, alamat_supplier) VALUES
('001', 'Barokah Motor', 'Jakarta'),
('002', 'Ferdi Jaya Motor', 'Bogor');

-- Data Penyedia/Pegawai
INSERT INTO penyedia (id_pegawai, nama_pegawai) VALUES
(101, 'Yusliawati');

-- Data Pengiriman
INSERT INTO pengiriman (no_faktur, tgl_kirim, qty_kirim, harga_jual, dp, tempo_pembayaran) VALUES
(10062923, '2023-05-05', 10, 850000, 2500000, '2023-06-05'),
(14382929, '2023-05-07', 50, 75000, 2000000, '2023-08-05'),
(18062023, '2023-04-06', 25, 325000, 1500000, '2023-07-04');

-- Data Transaksi
INSERT INTO transaksi (no_faktur, id_pegawai, id_customer, kode_barang, id_supplier, harga_total, dp, jatuh_tempo) VALUES
(10062923, 101, '2022310035', 'S01', '001', 8500000, 2500000, '2023-06-05'),
(14382929, 101, '2022310041', 'W03', '002', 3750000, 2000000, '2023-08-05'),
(18062023, 101, '2022310075', 'H02', '001', 8125000, 1500000, '2023-06-04');

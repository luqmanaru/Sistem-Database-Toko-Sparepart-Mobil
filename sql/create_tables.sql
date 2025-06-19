-- Tabel Barang
CREATE TABLE barang (
  kode_barang VARCHAR(20) PRIMARY KEY,
  nama_barang VARCHAR(50) NOT NULL
);

-- Tabel Customer
CREATE TABLE customer (
  id_customer VARCHAR(20) PRIMARY KEY,
  nama_customer VARCHAR(50) NOT NULL,
  alamat_customer VARCHAR(100) NOT NULL
);

-- Tabel Supplier
CREATE TABLE supplier (
  id_supplier VARCHAR(20) PRIMARY KEY,
  nama_supplier VARCHAR(50) NOT NULL,
  alamat_supplier VARCHAR(100) NOT NULL
);

-- Tabel Penyedia/Pegawai
CREATE TABLE penyedia (
  id_pegawai INT PRIMARY KEY,
  nama_pegawai VARCHAR(50) NOT NULL
);

-- Tabel Pengiriman
CREATE TABLE pengiriman (
  no_faktur INT PRIMARY KEY,
  tgl_kirim DATE NOT NULL,
  qty_kirim INT NOT NULL,
  harga_jual DECIMAL(12,2) NOT NULL,
  dp DECIMAL(12,2) NOT NULL,
  tempo_pembayaran DATE NOT NULL
);

-- Tabel Transaksi
CREATE TABLE transaksi (
  id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
  no_faktur INT NOT NULL,
  id_pegawai INT NOT NULL,
  id_customer VARCHAR(20) NOT NULL,
  kode_barang VARCHAR(20) NOT NULL,
  id_supplier VARCHAR(20) NOT NULL,
  harga_total DECIMAL(12,2) NOT NULL,
  dp DECIMAL(12,2) NOT NULL,
  jatuh_tempo DATE NOT NULL,
  FOREIGN KEY (no_faktur) REFERENCES pengiriman(no_faktur),
  FOREIGN KEY (id_pegawai) REFERENCES penyedia(id_pegawai),
  FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
  FOREIGN KEY (kode_barang) REFERENCES barang(kode_barang),
  FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier)
);

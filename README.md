# Sistem-Database-Toko-Sparepart-Mobil
Implementasi database ternormalisasi untuk toko retail sparepart mobil dengan solusi masalah pengiriman dan manajemen inventory.

---

## 📌 Fitur Utama
- Struktur database ternormalisasi (3NF)
- Manajemen data sparepart, supplier, dan customer
- Tracking pengiriman dan transaksi
- Laporan keuangan dasar

---

## 🛠️ Struktur Database
### Tabel Utama
| Tabel | Deskripsi |
|-------|-----------|
| `barang` | Daftar sparepart yang dijual |
| `customer` | Data pelanggan toko |
| `supplier` | Penyedia sparepart |
| `pengiriman` | Data pengiriman barang |
| `transaksi` | Catatan transaksi penjualan |

### Contoh Query
```sql
-- Menghitung total transaksi per customer
SELECT c.nama_customer, SUM(t.harga_total) AS total_belanja
FROM transaksi t
JOIN customer c ON t.id_customer = c.id_customer
GROUP BY c.nama_customer;

-- Melihat stok barang yang perlu dipesan ulang
SELECT b.nama_barang, p.qty_kirim AS stok
FROM barang b
JOIN pengiriman p ON b.kode_barang = p.kode_barang
WHERE p.qty_kirim < 10;
```

---

**luqmanaru**

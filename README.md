# 💳 UTS Pemrograman Mobile 2 – Aplikasi Kasir Flutter + Cubit

**Nama:** Arika Azhar  
**NIM:** 23552011408  

link : https://drive.google.com/file/d/1zLBba_gZjJDnLV2_BfBhZNhn3cHtUJ3s/view?usp=sharinghttps://drive.google.com/file/d/1zLBba_gZjJDnLV2_BfBhZNhn3cHtUJ3s/view?usp=sharing

---

## *1. Jelaskan bagaimana state management dengan Cubit dapat membantu dalam pengelolaan transaksi yang memiliki logika diskon dinamis.

State management dengan Cubit sangat membantu dalam pengelolaan transaksi yang memiliki logika diskon dinamis karena:

## a. Mengatur Perubahan Data Secara Real-Time

Cubit memungkinkan UI langsung memperbarui tampilan setiap kali terjadi perubahan transaksi, seperti:

menambah item,

mengubah jumlah item,

menghapus item.

Semua perubahan memicu state baru sehingga logika diskon ikut ter-update otomatis tanpa perlu setState() berulang kali.

## b. Logika Diskon Tersentralisasi

Seluruh aturan diskon ditempatkan dalam satu tempat, misalnya pada OrderCubit.
Keuntungannya:

kode lebih rapi (separation of concern),

aturan diskon mudah diubah,

UI tidak berisi perhitungan logika sehingga lebih bersih.

## c. Perhitungan Diskon Otomatis

Cubit dapat menghitung secara otomatis:

subtotal,

diskon per item,

diskon total transaksi,

total akhir pembayaran.

Perhitungan dilakukan setiap kali state berubah sehingga hasil selalu konsisten.

## d. Menjamin Konsistensi Data (Single Source of Truth)

Dengan Cubit, UI hanya membaca dari satu sumber data.
Ini memastikan:

tidak ada perbedaan antara data transaksi dan tampilan UI,

risiko salah hitung diskon sangat kecil.

Kesimpulan Singkat

Cubit membuat pengelolaan transaksi dan perhitungan diskon dinamis menjadi otomatis, real-time, terpusat, dan konsisten, karena seluruh logika diproses di dalam Cubit.

## *2. Apa perbedaan antara diskon per item dan diskon total transaksi? Berikan contoh penerapannya dalam aplikasi kasir.
Diskon Per Item

Diskon yang diberikan pada produk tertentu.

* Ciri-ciri:

diterapkan pada setiap item secara individual,

digunakan untuk promo barang tertentu,

besarannya berbeda untuk tiap produk.

* Contoh:
Produk Jagung Manis mendapat diskon 10%.
Harga asli Rp10.000 → setelah diskon menjadi Rp9.000.

Dalam aplikasi kasir:
Perhitungan dilakukan saat item ditambahkan, misalnya melalui method getDiscountedPrice() pada MenuModel.

Diskon Total Transaksi

Diskon yang diberikan berdasarkan jumlah belanja keseluruhan.

 *Ciri-ciri:

berlaku untuk satu transaksi penuh,

biasanya berdasarkan syarat minimal belanja atau promo hari tertentu.

* Contoh:
Total belanja Rp120.000 → memenuhi syarat diskon 10%.
Total setelah diskon: Rp108.000.

Dalam aplikasi kasir:
Dicek di dalam OrderCubit pada fungsi seperti calculateTotals().

## Perbedaan Utama dalam Tabel
Diskon Per Item	Diskon Total Transaksi
Berlaku pada produk tertentu	Berlaku untuk semua item di keranjang
Besaran diskon bisa berbeda per produk	Diskon hanya satu untuk keseluruhan transaksi
Dihitung saat item dimasukkan	Dihitung setelah subtotal terbentuk
Contoh: Buah diskon 20%	Contoh: Belanja > 100k dapat diskon 10%


## *3. Jelaskan manfaat penggunaan widget Stack pada tampilan kategori menu di aplikasi Flutter.

Widget Stack digunakan untuk menumpuk beberapa widget secara bebas dalam satu area.
Dalam aplikasi kasir, Stack memberikan beberapa manfaat:

## a. Tampilan Kategori Lebih Interaktif

Stack memudahkan menempatkan kategori (misalnya daftar tombol kategori) di atas konten menu.
UI tetap terlihat rapi tanpa perlu halaman baru untuk setiap kategori.

## b. Menambahkan Overlay Elemen UI

Stack memungkinkan menempatkan elemen tambahan seperti:

highlight kategori aktif,

badge jumlah item,

tombol filter di pojok,

background dekoratif.

Semua bisa diletakkan posisi bebas menggunakan Positioned().

## c. Mempermudah Animasi dan Efek Visual

Stack sangat cocok untuk:

efek floating tabs,

transisi kategori,

elemen bergerak di atas konten utama.

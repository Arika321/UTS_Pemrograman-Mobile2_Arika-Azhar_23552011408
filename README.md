 ## 💳 UTS Pemrograman Mobile 2 – Aplikasi Kasir Flutter + Cubit
 ## ✨ Sistem Kasir dengan Diskon Dinamis
    **Nama:** Arika Azhar | **NIM:** 23552011408

  ## 📘 Deskripsi Project

Aplikasi ini merupakan simulasi **aplikasi kasir sederhana** berbasis **Flutter** yang menggunakan **Cubit** (dari *flutter_bloc*) sebagai State Management.

Fokus utama aplikasi adalah demonstrasi pengelolaan data transaksi yang kompleks, termasuk:
* Menu makanan & minuman
* Keranjang belanja
* Perhitungan subtotal
* **Logika Diskon Dinamis** (per item & total)
* Update UI secara *realtime*

Tujuan dari proyek ini adalah untuk menunjukkan bagaimana Cubit dapat mengatur seluruh data transaksi dengan **rapi**, **terstruktur**, dan **mudah dikembangkan**.


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 🧠 1. Manfaat State Management Cubit dalam Logika Diskon Dinamis  

State management menggunakan *Cubit* sangat berguna dalam aplikasi kasir karena mampu mengelola data transaksi yang cepat berubah, seperti jumlah item, total harga, hingga diskon.

### ✔ Mengelola Data Secara Konsisten  
Setiap perubahan:
- menambah item  
- mengurangi jumlah  
- menghapus item  
- menghitung ulang total  

semuanya dilakukan melalui Cubit sehingga state selalu akurat dan UI mengikuti secara otomatis.

### ✔ Memusatkan Logika Diskon  
Diskon dapat dihitung dengan mudah di dalam Cubit, contohnya:

//
```dart
int getTotalPrice() {
  int total = 0;
  for (var m in state) {
    total += m.getDiscountedPrice() * m.qty;
  }
  if (total > 100000) total = (total * 0.9).toInt();
  return total;
}

//
##

# Cubit membuat logika diskon tidak bercampur dengan UI → lebih bersih dan mudah di-maintain.

# ✔ Minim Bug
Karena semua perhitungan dilakukan di satu tempat, risiko salah total atau salah diskon sangat kecil.

# ✔ Memisahkan Logika Bisnis & UI
UI → hanya menampilkan data
Cubit → menghitung dan mengelola transaksi

Ini adalah prinsip "clean architecture".


## 💸 2. Perbedaan Diskon Per Item dan Diskon Total Transaksi D

#⭐ Diskon Per Item
Diskon diterapkan pada setiap produk secara individu.
Contoh:

Ayam Geprek diskon 10%

Es Teh potongan Rp 2.000

Digunakan untuk promo per menu.

#⭐ Diskon Total Transaksi
Diterapkan setelah total harga dihitung.
Contoh:

Total pembelian > 100.000 → diskon 10%

Promo akhir bulan: total diskon 5%

## 🧱 3. Manfaat Widget Stack untuk Tampilan Kategori Menu

Widget Stack digunakan untuk menumpuk beberapa elemen dalam satu area.

✔ Elemen Bisa Ditumpuk
Cocok untuk:

Gambar background kategori

Teks kategori

Badge promo

Indikator jumlah item

✔ Penempatan Fleksibel
Dengan Positioned, elemen bisa ditempatkan:

kiri atas
kanan bawah

tengah overlay

✔ Cocok untuk Notifikasi Kecil
Seperti:

Promo 20%

Best Seller

Stok habis

✔ UI Lebih Menarik
Stack memungkinkan tampilan bergaya kartu (card) seperti aplikasi komersial.

🛠 Teknologi yang Digunakan
Flutter 3.x

Dart

Flutter Bloc (Cubit)

Material Design Components

Widget Flutter: Stack, GridView, ListView, Card

## 📁 Struktur Project
css
Copy code
lib/
 ├── cubit/
 │    └── order_cubit.dart
 ├── models/
 │    └── menu_model.dart
 ├── pages/
 │    ├── home_page.dart
 │    └── cart_page.dart
 ├── widgets/
 │    └── menu_card.dart
 └── main.dart

//
##📌 Ringkasan
Diskon Per Item	Diskon Total
Berlaku per menu	Berlaku untuk total keseluruhan
Biasanya promo per produk	Promo global (per toko)
Dihitung sebelum total	Dihitung setelah total
